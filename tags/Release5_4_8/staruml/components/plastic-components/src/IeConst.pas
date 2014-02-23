(*******************************
 * IECONST 1.4 (Oct 16, 2001)  *
 *******************************)

unit IeConst;

interface

uses Sysutils, ShlObj, Activex, Windows, Urlmon;


const



  STATURL_QUERYFLAG_ISCACHED = $00010000;
  STATURL_QUERYFLAG_NOURL = $00020000;
  STATURL_QUERYFLAG_NOTITLE = $00040000;
  STATURL_QUERYFLAG_TOPLEVEL = $00080000;

  STATURLFLAG_ISCACHED = $00000001;
  STATURLFLAG_ISTOPLEVEL = $00000002;



  IID_IDownloadManager: TGUID =
  (D1: $988934A4; D2: $064B; D3: $11D3; D4: ($BB, $80, $0, $10, $4B, $35, $E7, $F9));

  SID_SDownloadManager = '{988934A4-064B-11D3-BB80-00104B35E7F9}';


  IID_IEnumStatUrl: TGUID = (D1: $3C374A42; D2: $BAE4; D3: $11CF; D4: ($BF, $7D, $00, $AA, $00, $69, $46, $EE));
  IID_IUrlHistoryStg: TGUID = (D1: $3C374A41; D2: $BAE4; D3: $11CF; D4: ($BF, $7D, $00, $AA, $00, $69, $46, $EE));
  IID_IUrlHistoryStg2: TGUID = (D1: $AFA0DC11; D2: $C313; D3: $831A; D4: ($83, $1A, $00, $C0, $4F, $D5, $AE, $38));
  IID_IUrlHistoryNotify: TGUID = (D1: $BC40BEC1; D2: $C493; D3: $11D0; D4: ($83, $1B, $00, $C0, $4F, $D5, $AE, $38));

  SID_IEnumStatUrl = '{3C374A42-BAE4-11CF-BF7D-00AA006946EE}';
  SID_IUrlHistoryStg = '{3C374A41-BAE4-11CF-BF7D-00AA006946EE}';
  SID_IUrlHistoryStg2 = '{AFA0DC11-C313-11d0-831A-00C04FD5AE38}';
  SID_IURLHistoryNotify = '{BC40BEC1-C493-11d0-831B-00C04FD5AE38}';
  CLSID_CUrlHistory: TGUID = '{3C374A40-BAE4-11CF-BF7D-00AA006946EE}';


  IID_IDocHostUIHandler: TGUID = '{bd3f23c0-d43e-11cf-893b-00aa00bdce1a}';
  IID_IDocHostUIHandler2: TGUID = '{3050f6d0-98b5-11cf-bb82-00aa00bdce0b}';
  IID_IDocHostShowUI: TGUID = '{c4d244b0-d43e-11cf-893b-00aa00bdce1a}';
  GUID_TriEditCommandGroup: TGUID = '{2582F1C0-084E-11d1-9A0E-006097C9B344}';
  CMDSETID_Forms3: TGUID = '{DE4BA900-59CA-11CF-9592-444553540000}';

  IID_IQueryInfo: TGUID = (D1: $00021500; D2: $0000; D3: $0000; D4: ($C0, $00, $00, $00, $00, $00, $00, $46));
  CGID_DocHostCommandHandler: TGUID = (D1: $F38BC242; D2: $B950; D3: $11D1; D4: ($89, $18, $00, $C0, $4F, $C2, $C8, $36));



  MSOCMDF_SUPPORTED = OLECMDF_SUPPORTED;
  MSOCMDF_ENABLED = OLECMDF_ENABLED;

  MSOCMDEXECOPT_PROMPTUSER = OLECMDEXECOPT_PROMPTUSER;
  MSOCMDEXECOPT_DONTPROMPTUSER = OLECMDEXECOPT_DONTPROMPTUSER;

  InchToMetric = 25.4;

  NO_COMMAND = 0;
  VIEW_COMMAND = 1;
  EXPLORE_COMMAND = 2;
  FIND_COMMAND = 3;

  ISDigit = ['0'..'9', '-', '+'];

  CONTEXT_MENU_DEFAULT = 0;
  CONTEXT_MENU_IMAGE = 1;
  CONTEXT_MENU_CONTROL = 2;
  CONTEXT_MENU_TABLE = 3;
// in browse mode
  CONTEXT_MENU_TEXTSELECT = 4;
  CONTEXT_MENU_ANCHOR = 5;
  CONTEXT_MENU_UNKNOWN = 6;
// These 2 are mapped to IMAGE for the public")
  CONTEXT_MENU_IMGDYNSRC = 7;
  CONTEXT_MENU_IMGART = 8;
  CONTEXT_MENU_DEBUG = 9;
  CONTEXT_MENU_VSCROLL = 10;
  CONTEXT_MENU_HSCROLL = 11;

  DISPID_AMBIENT_DLCONTROL = (-5512);
  DISPID_AMBIENT_USERAGENT = (-5513);

  HTMLID_FIND = 1;
  HTMLID_VIEWSOURCE = 2;
  HTMLID_OPTIONS = 3;

  DOCHOSTUITYPE_BROWSE = 0;
  DOCHOSTUITYPE_AUTHOR = 1;

  DOCHOSTUIDBLCLK_DEFAULT = 0;
  DOCHOSTUIDBLCLK_SHOWPROPERTIES = 1;
  DOCHOSTUIDBLCLK_SHOWCODE = 2;

  DOCHOSTUIFLAG_DIALOG = $0001;
  DOCHOSTUIFLAG_DISABLE_HELP_MENU = $0002;
  DOCHOSTUIFLAG_NO3DBORDER = $0004;
  DOCHOSTUIFLAG_SCROLL_NO = $0008;
  DOCHOSTUIFLAG_DISABLE_SCRIPT_INACTIVE = $0010;
  DOCHOSTUIFLAG_OPENNEWWIN = $0020;
  DOCHOSTUIFLAG_DISABLE_OFFSCREEN = $0040;
  DOCHOSTUIFLAG_FLAT_SCROLLBAR = $0080;
  DOCHOSTUIFLAG_DIV_BLOCKDEFAULT = $0100;
  DOCHOSTUIFLAG_ACTIVATE_CLIENTHIT_ONLY = $0200;
  DOCHOSTUIFLAG_OVERRIDEBEHAVIORFACTORY = $0400;
  DOCHOSTUIFLAG_CODEPAGELINKEDFONTS = $0800;
  DOCHOSTUIFLAG_URL_ENCODING_DISABLE_UTF8 = $1000;
  DOCHOSTUIFLAG_URL_ENCODING_ENABLE_UTF8 = $2000;
  DOCHOSTUIFLAG_ENABLE_FORMS_AUTOCOMPLETE = $4000;
  DOCHOSTUIFLAG_ENABLE_INPLACE_NAVIGATION = $10000;
  DOCHOSTUIFLAG_IME_ENABLE_RECONVERSION = $20000;

  IDM_UNKNOWN = 0;
  IDM_ALIGNBOTTOM = 1;
  IDM_ALIGNHORIZONTALCENTERS = 2;
  IDM_ALIGNLEFT = 3;
  IDM_ALIGNRIGHT = 4;
  IDM_ALIGNTOGRID = 5;
  IDM_ALIGNTOP = 6;
  IDM_ALIGNVERTICALCENTERS = 7;
  IDM_ARRANGEBOTTOM = 8;
  IDM_ARRANGERIGHT = 9;
  IDM_BRINGFORWARD = 10;
  IDM_BRINGTOFRONT = 11;
  IDM_CENTERHORIZONTALLY = 12;
  IDM_CENTERVERTICALLY = 13;
  IDM_CODE = 14;
  IDM_DELETE = 17;
  IDM_FONTNAME = 18;
  IDM_FONTSIZE = 19;
  IDM_GROUP = 20;
  IDM_HORIZSPACECONCATENATE = 21;
  IDM_HORIZSPACEDECREASE = 22;
  IDM_HORIZSPACEINCREASE = 23;
  IDM_HORIZSPACEMAKEEQUAL = 24;
  IDM_INSERTOBJECT = 25;
  IDM_MULTILEVELREDO = 30;
  IDM_SENDBACKWARD = 32;
  IDM_SENDTOBACK = 33;
  IDM_SHOWTABLE = 34;
  IDM_SIZETOCONTROL = 35;
  IDM_SIZETOCONTROLHEIGHT = 36;
  IDM_SIZETOCONTROLWIDTH = 37;
  IDM_SIZETOFIT = 38;
  IDM_SIZETOGRID = 39;
  IDM_SNAPTOGRID = 40;
  IDM_TABORDER = 41;
  IDM_TOOLBOX = 42;
  IDM_MULTILEVELUNDO = 44;
  IDM_UNGROUP = 45;
  IDM_VERTSPACECONCATENATE = 46;
  IDM_VERTSPACEDECREASE = 47;
  IDM_VERTSPACEINCREASE = 48;
  IDM_VERTSPACEMAKEEQUAL = 49;
  IDM_JUSTIFYFULL = 50;
  IDM_BACKCOLOR = 51;
  IDM_BOLD = 52;
  IDM_BORDERCOLOR = 53;
  IDM_FLAT = 54;
  IDM_FORECOLOR = 55;
  IDM_ITALIC = 56;
  IDM_JUSTIFYCENTER = 57;
  IDM_JUSTIFYGENERAL = 58;
  IDM_JUSTIFYLEFT = 59;
  IDM_JUSTIFYRIGHT = 60;
  IDM_RAISED = 61;
  IDM_SUNKEN = 62;
  IDM_UNDERLINE = 63;
  IDM_CHISELED = 64;
  IDM_ETCHED = 65;
  IDM_SHADOWED = 66;
  IDM_FIND = 67;
  IDM_SHOWGRID = 69;
  IDM_OBJECTVERBLIST0 = 72;
  IDM_OBJECTVERBLIST1 = 73;
  IDM_OBJECTVERBLIST2 = 74;
  IDM_OBJECTVERBLIST3 = 75;
  IDM_OBJECTVERBLIST4 = 76;
  IDM_OBJECTVERBLIST5 = 77;
  IDM_OBJECTVERBLIST6 = 78;
  IDM_OBJECTVERBLIST7 = 79;
  IDM_OBJECTVERBLIST8 = 80;
  IDM_OBJECTVERBLIST9 = 81;
  IDM_CONVERTOBJECT = 82;
  IDM_CUSTOMCONTROL = 83;
  IDM_CUSTOMIZEITEM = 84;
  IDM_RENAME = 85;
  IDM_IMPORT = 86;
  IDM_NEWPAGE = 87;
  IDM_MOVE = 88;
  IDM_CANCEL = 89;
  IDM_FONT = 90;
  IDM_STRIKETHROUGH = 91;
  IDM_DELETEWORD = 92;

  IDM_FOLLOW_ANCHOR = 2008;

  IDM_INSINPUTIMAGE = 2114;
  IDM_INSINPUTBUTTON = 2115;
  IDM_INSINPUTRESET = 2116;
  IDM_INSINPUTSUBMIT = 2117;
  IDM_INSINPUTUPLOAD = 2118;
  IDM_INSFIELDSET = 2119;

  IDM_PASTEINSERT = 2120;
  IDM_REPLACE = 2121;
  IDM_EDITSOURCE = 2122;
  IDM_BOOKMARK = 2123;
  IDM_HYPERLINK = 2124;
  IDM_UNLINK = 2125;
  IDM_BROWSEMODE = 2126;
  IDM_EDITMODE = 2127;
  IDM_UNBOOKMARK = 2128;

  IDM_TOOLBARS = 2130;
  IDM_STATUSBAR = 2131;
  IDM_FORMATMARK = 2132;
  IDM_TEXTONLY = 2133;
  IDM_OPTIONS = 2135;
  IDM_FOLLOWLINKC = 2136;
  IDM_FOLLOWLINKN = 2137;
  IDM_VIEWSOURCE = 2139;
  IDM_ZOOMPOPUP = 2140;

  // IDM_BASELINEFONT1, IDM_BASELINEFONT2, IDM_BASELINEFONT3, IDM_BASELINEFONT4,
  // and IDM_BASELINEFONT5 should be consecutive integers;
  //
  IDM_BASELINEFONT1 = 2141;
  IDM_BASELINEFONT2 = 2142;
  IDM_BASELINEFONT3 = 2143;
  IDM_BASELINEFONT4 = 2144;
  IDM_BASELINEFONT5 = 2145;

  IDM_HORIZONTALLINE = 2150;
  IDM_LINEBREAKNORMAL = 2151;
  IDM_LINEBREAKLEFT = 2152;
  IDM_LINEBREAKRIGHT = 2153;
  IDM_LINEBREAKBOTH = 2154;
  IDM_NONBREAK = 2155;
  IDM_SPECIALCHAR = 2156;
  IDM_HTMLSOURCE = 2157;
  IDM_IFRAME = 2158;
  IDM_HTMLCONTAIN = 2159;
  IDM_TEXTBOX = 2161;
  IDM_TEXTAREA = 2162;
  IDM_CHECKBOX = 2163;
  IDM_RADIOBUTTON = 2164;
  IDM_DROPDOWNBOX = 2165;
  IDM_LISTBOX = 2166;
  IDM_BUTTON = 2167;
  IDM_IMAGE = 2168;
  IDM_OBJECT = 2169;
  IDM_1D = 2170;
  IDM_IMAGEMAP = 2171;
  IDM_FILE = 2172;
  IDM_COMMENT = 2173;
  IDM_SCRIPT = 2174;
  IDM_JAVAAPPLET = 2175;
  IDM_PLUGIN = 2176;
  IDM_PAGEBREAK = 2177;

  IDM_PARAGRAPH = 2180;
  IDM_FORM = 2181;
  IDM_MARQUEE = 2182;
  IDM_LIST = 2183;
  IDM_ORDERLIST = 2184;
  IDM_UNORDERLIST = 2185;
  IDM_INDENT = 2186;
  IDM_OUTDENT = 2187;
  IDM_PREFORMATTED = 2188;
  IDM_ADDRESS = 2189;
  IDM_BLINK = 2190;
  IDM_DIV = 2191;

  IDM_TABLEINSERT = 2200;
  IDM_RCINSERT = 2201;
  IDM_CELLINSERT = 2202;
  IDM_CAPTIONINSERT = 2203;
  IDM_CELLMERGE = 2204;
  IDM_CELLSPLIT = 2205;
  IDM_CELLSELECT = 2206;
  IDM_ROWSELECT = 2207;
  IDM_COLUMNSELECT = 2208;
  IDM_TABLESELECT = 2209;
  IDM_TABLEPROPERTIES = 2210;
  IDM_CELLPROPERTIES = 2211;
  IDM_ROWINSERT = 2212;
  IDM_COLUMNINSERT = 2213;

  IDM_HELP_CONTENT = 2220;
  IDM_HELP_ABOUT = 2221;
  IDM_HELP_README = 2222;

  IDM_REMOVEFORMAT = 2230;
  IDM_PAGEINFO = 2231;
  IDM_TELETYPE = 2232;
  IDM_GETBLOCKFMTS = 2233;
  IDM_BLOCKFMT = 2234;
  IDM_SHOWHIDE_CODE = 2235;
  IDM_TABLE = 2236;

  IDM_COPYFORMAT = 2237;
  IDM_PASTEFORMAT = 2238;
  IDM_GOTO = 2239;

  IDM_CHANGEFONT = 2240;
  IDM_CHANGEFONTSIZE = 2241;
  IDM_INCFONTSIZE = 2242;
  IDM_DECFONTSIZE = 2243;
  IDM_INCFONTSIZE1PT = 2244;
  IDM_DECFONTSIZE1PT = 2245;
  IDM_CHANGECASE = 2246;
  IDM_SUBSCRIPT = 2247;
  IDM_SUPERSCRIPT = 2248;
  IDM_SHOWSPECIALCHAR = 2249;

  IDM_CENTERALIGNPARA = 2250;
  IDM_LEFTALIGNPARA = 2251;
  IDM_RIGHTALIGNPARA = 2252;
  IDM_REMOVEPARAFORMAT = 2253;
  IDM_APPLYNORMAL = 2254;
  IDM_APPLYHEADING1 = 2255;
  IDM_APPLYHEADING2 = 2256;
  IDM_APPLYHEADING3 = 2257;

  IDM_DOCPROPERTIES = 2260;
  IDM_ADDFAVORITES = 2261;
  IDM_COPYSHORTCUT = 2262;
  IDM_SAVEBACKGROUND = 2263;
  IDM_SETWALLPAPER = 2264;
  IDM_COPYBACKGROUND = 2265;
  IDM_CREATESHORTCUT = 2266;
  IDM_PAGE = 2267;
  IDM_SAVETARGET = 2268;
  IDM_SHOWPICTURE = 2269;
  IDM_SAVEPICTURE = 2270;
  IDM_DYNSRCPLAY = 2271;
  IDM_DYNSRCSTOP = 2272;
  IDM_PRINTTARGET = 2273;
  IDM_IMGARTPLAY = 2274;
  IDM_IMGARTSTOP = 2275;
  IDM_IMGARTREWIND = 2276;
  IDM_PRINTQUERYJOBSPENDING = 2277;

  IDM_CONTEXTMENU = 2280;
  IDM_GOBACKWARD = 2282;
  IDM_GOFORWARD = 2283;
  IDM_PRESTOP = 2284;

  IDM_CREATELINK = 2290;
  IDM_COPYCONTENT = 2291;

  IDM_LANGUAGE = 2292;

  IDM_REFRESH = 2300;
  IDM_STOPDOWNLOAD = 2301;

  IDM_ENABLE_INTERACTION = 2302;

  IDM_LAUNCHDEBUGGER = 2310;
  IDM_BREAKATNEXT = 2311;

  IDM_INSINPUTHIDDEN = 2312;
  IDM_INSINPUTPASSWORD = 2313;

  IDM_OVERWRITE = 2314;

  IDM_PARSECOMPLETE = 2315;

  IDM_HTMLEDITMODE = 2316;

  IDM_REGISTRYREFRESH = 2317;
  IDM_COMPOSESETTINGS = 2318;

  IDM_SHOWALLTAGS = 2320;
  IDM_SHOWALIGNEDSITETAGS = 2321;
  IDM_SHOWSCRIPTTAGS = 2322;
  IDM_SHOWSTYLETAGS = 2323;
  IDM_SHOWCOMMENTTAGS = 2324;
  IDM_SHOWAREATAGS = 2325;
  IDM_SHOWUNKNOWNTAGS = 2326;
  IDM_SHOWMISCTAGS = 2327;
  IDM_SHOWZEROBORDERATDESIGNTIME = 2328;

  IDM_AUTODETECT = 2329;

  IDM_SCRIPTDEBUGGER = 2330;

  IDM_GETBYTESDOWNLOADED = 2331;

  IDM_NOACTIVATENORMALOLECONTROLS = 2332;
  IDM_NOACTIVATEDESIGNTIMECONTROLS = 2333;
  IDM_NOACTIVATEJAVAAPPLETS = 2334;

  IDM_SHOWWBRTAGS = 2340;

  IDM_PERSISTSTREAMSYNC = 2341;
  IDM_SETDIRTY = 2342;


  IDM_MIMECSET__FIRST__ = 3609;
  IDM_MIMECSET__LAST__ = 3640;

  IDM_MENUEXT_FIRST__ = 3700;
  IDM_MENUEXT_LAST__ = 3732;
  IDM_MENUEXT_COUNT = 3733;

  ID_EDITMODE = 32801;

  IDM_OPEN = 2000;
  IDM_NEW = 2001;
  IDM_SAVE = 70;
  IDM_SAVEAS = 71;
  IDM_SAVECOPYAS = 2002;
  IDM_PRINTPREVIEW = 2003;
  IDM_PRINT = 27;
  IDM_PAGESETUP = 2004;
  IDM_SPELL = 2005;
  IDM_PASTESPECIAL = 2006;
  IDM_CLEARSELECTION = 2007;
  IDM_PROPERTIES = 28;
  IDM_REDO = 29;
  IDM_UNDO = 43;
  IDM_SELECTALL = 31;
  IDM_ZOOMPERCENT = 50;
  IDM_GETZOOM = 68;
  IDM_STOP = 2138;
  IDM_COPY = 15;
  IDM_CUT = 16;
  IDM_PASTE = 26;

  IDM_TRIED_IS_1D_ELEMENT = 0; //[out,VT_BOOL]
  IDM_TRIED_IS_2D_ELEMENT = 1; //[out,VT_BOOL]
  IDM_TRIED_NUDGE_ELEMENT = 2; //[in,VT_BYREF VARIANT.byref=LPPOINT]
  IDM_TRIED_SET_ALIGNMENT = 3; //[in,VT_BYREF VARIANT.byref=LPPOINT]
  IDM_TRIED_MAKE_ABSOLUTE = 4;
  IDM_TRIED_LOCK_ELEMENT = 5;
  IDM_TRIED_SEND_TO_BACK = 6;
  IDM_TRIED_SEND_TO_FRONT = 7;
  IDM_TRIED_SEND_BACKWARD = 8;
  IDM_TRIED_SEND_FORWARD = 9;
  IDM_TRIED_SEND_BEHIND_1D = 10;
  IDM_TRIED_SEND_FRONT_1D = 11;
  IDM_TRIED_CONSTRAIN = 12; //[in,VT_BOOL]
  IDM_TRIED_SET_2D_DROP_MODE = 13; //[in,VT_BOOL]
  IDM_TRIED_INSERTROW = 14;
  IDM_TRIED_INSERTCOL = 15;
  IDM_TRIED_DELETEROWS = 16;
  IDM_TRIED_DELETECOLS = 17;
  IDM_TRIED_MERGECELLS = 18;
  IDM_TRIED_SPLITCELL = 19;
  IDM_TRIED_INSERTCELL = 20;
  IDM_TRIED_DELETECELLS = 21;
  IDM_TRIED_INSERTTABLE = 22; //[in, VT_ARRAY]

//WARNING WARNING WARNING!!! Don't forget to modify IDM_TRIED_LAST_CID
//when you add new Command IDs

  IDM_TRIED_LAST_CID = IDM_TRIED_INSERTTABLE;




  CLSID_WebBrowser: TGUID = '{ED016940-BD5B-11cf-BA4E-00C04FD70816}';

type

  STATURL = record
    cbSize: DWORD;
    pwcsUrl: DWORD;
    pwcsTitle: DWORD;
    ftLastVisited: FILETIME;
    ftLastUpdated: FILETIME;
    ftExpires: FILETIME;
    dwFlags: DWORD;
  end;


  IDownloadManager = interface(IUnknown)
    ['{988934A4-064B-11D3-BB80-00104B35E7F9}']
    function Download(
      pmk: IMoniker; // Identifies the object to be downloaded
      pbc: IBindCtx; // Stores information used by the moniker to bind
      dwBindVerb: DWORD; // The action to be performed during the bind
      grfBINDF: DWORD; // Determines the use of URL encoding during the bind
      pBindInfo: PBindInfo; // Used to implement IBindStatusCallback::GetBindInfo
      pszHeaders: PWidechar; // Additional headers to use with IHttpNegotiate
      pszRedir: PWidechar; // The URL that the moniker is redirected to
      uiCP: UINT // The code page of the object's display name
      ): HRESULT; stdcall;
  end;



  IEnumSTATURL = interface(IUnknown)
    ['{3C374A42-BAE4-11CF-BF7D-00AA006946EE}']
    function Next(celt: Integer; out elt; pceltFetched: PLongint): HRESULT; stdcall;
    function Skip(celt: Longint): HRESULT; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumSTATURL): HResult; stdcall;
    function SetFilter(poszFilter: PWideChar; dwFlags: DWORD): HResult; stdcall;
  end;

  IUrlHistoryStg = interface(IUnknown)
    ['{3C374A41-BAE4-11CF-BF7D-00AA006946EE}']
    function AddUrl(pocsUrl: PWideChar; pocsTitle: PWideChar; dwFlags: Integer): HResult; stdcall;
    function DeleteUrl(pocsUrl: PWideChar; dwFlags: Integer): HResult; stdcall;
    function QueryUrl(pocsUrl: PWideChar; dwFlags: Integer; var lpSTATURL: STATURL): HResult; stdcall;
    function BindToObject(pocsUrl: PWideChar; var riid: TIID; out ppvOut: Pointer): HResult; stdcall;
    function EnumUrls(out ppenum: IEnumSTATURL): HResult; stdcall;
  end;

  IUrlHistoryStg2 = interface(IUrlHistoryStg)
    ['{AFA0DC11-C313-11D0-831A-00C04FD5AE38}']
    function AddUrlAndNotify(pocsUrl: PWideChar; pocsTitle: PWideChar; dwFlags: Integer;
      fWriteHistory: Integer; var poctNotify: Pointer;
      const punkISFolder: IUnknown): HResult; stdcall;
    function ClearHistory: HResult; stdcall;
  end;

  IUrlHistoryNotify = interface(IOleCommandTarget)
    ['{BC40BEC1-C493-11d0-831B-00C04FD5AE38}']
  end;

  PDOCHOSTUIINFO = ^TDOCHOSTUIINFO;
  TDOCHOSTUIINFO = record
    cbSize: ULONG;
    dwFlags: DWORD;
    dwDoubleClick: DWORD;
    chHostCss: POLESTR;
    chHostNS: POLESTR;
  end;


  IDocHostShowUI = interface(IUnknown)
    ['{c4d244b0-d43e-11cf-893b-00aa00bdce1a}']
    function ShowMessage(hwnd: THandle; lpstrText: POLESTR; lpstrCaption: POLESTR;
      dwType: longint; lpstrHelpFile: POLESTR; dwHelpContext: longint;
      var plResult: LRESULT): HRESULT; stdcall;
    function ShowHelp(hwnd: THandle; pszHelpFile: POLESTR; uCommand: integer;
      dwData: longint; ptMouse: TPoint;
      var pDispatchObjectHit: IDispatch): HRESULT; stdcall;
  end; // IDocHostShowUI


  IDocHostUIHandler = interface(IUnknown)
    ['{bd3f23c0-d43e-11cf-893b-00aa00bdce1a}']
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
      const fRameWindow: BOOL): HRESULT; stdcall;
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
  end; // IDocHostUIHandler


  IDocHostUIHandler2 = interface(IDocHostUIHandler)
    ['{3050f6d0-98b5-11cf-bb82-00aa00bdce0b}']
    function GetOverrideKeyPath(pchKey: POLESTR; dw: DWORD): HRESULT; stdcall;
  end;

const
  IID_IUniformResourceLocatorA: TGUID = (
    D1: $FBF23B80; D2: $E3F0; D3: $101B; D4: ($84, $88, $00, $AA, $00, $3E, $56, $F8));

  IID_IUniformResourceLocatorW: TGUID = (
    D1: $CABB0DA0; D2: $DA57; D3: $11CF; D4: ($99, $74, $00, $20, $AF, $D7, $97, $62));


{$IFDEF UNICODE}
  IID_IUniformResourceLocator: TGUID = (
    D1: $CABB0DA0; D2: $DA57; D3: $11CF; D4: ($99, $74, $00, $20, $AF, $D7, $97, $62));
{$ELSE}
  IID_IUniformResourceLocator: TGUID = (
    D1: $FBF23B80; D2: $E3F0; D3: $101B; D4: ($84, $88, $00, $AA, $00, $3E, $56, $F8));
{$ENDIF}


const
  CLSID_InternetShortCut: TGUID = (
    d1: $FBF23B40; D2: $E3F0; D3: $101B; D4: ($84, $88, $00, $AA, $00, $3E, $56, $F8));

  SID_IUniformResourceLocatorA = '{FBF23B80-E3F0-101B-8488-00AA003E56F8}';
  SID_IUniformResourceLocatorW = '{CABB0DA0-DA57-11CF-9974-0020AFD79762}';
{$IFDEF UNICODE}
  SID_IUniformResourceLocator = SID_IUniformResourceLocatorW;
{$ELSE}
  SID_IUniformResourceLocator = SID_IUniformResourceLocatorA;
{$ENDIF}



  IURL_SETURL_FL_GUESS_PROTOCOL = $0001; // Guess protocol if missing
  IURL_SETURL_FL_USE_DEFAULT_PROTOCOL = $0002; // Use default protocol if missing

  IURL_INVOKECOMMAND_FL_ALLOW_UI = $0001;
  IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB = $0002; // Ignore pcszVerb
  IURL_INVOKECOMMAND_FL_DDEWAIT = $0004; // pass DDEWAIT to ShellExec

  TRANSLATEURL_FL_GUESS_PROTOCOL = $0001; // Guess protocol if missing
  TRANSLATEURL_FL_USE_DEFAULT_PROTOCOL = $0002; // Use default protocol if missing

  URLASSOCDLG_FL_USE_DEFAULT_NAME = $0001;
  URLASSOCDLG_FL_REGISTER_ASSOC = $0002;

  MIMEASSOCDLG_FL_REGISTER_ASSOC = $0001;

type

  PUrlInvokeCommandInfoA = ^TUrlInvokeCommandInfoA;

  TUrlInvokeCommandInfoA = record
    dwcbSize: DWORD; // Size of structure
    dwFlags: DWORD; // Bit field of IURL_INVOKECOMMAND_FLAGS
    hwndParent: HWND; // Parent window.  Valid only if IURL_INVOKECOMMAND_FL_ALLOW_UI is set.
    pcszVerb: LPCSTR; // Verb to invoke.  Ignored if IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB is set.
  end;



  PUrlInvokeCommandInfoW = ^TUrlInvokeCommandInfoW;
  TUrlInvokeCommandInfoW = record
    dwcbSize: DWORD; // Size of structure
    dwFlags: DWORD; // Bit field of IURL_INVOKECOMMAND_FLAGS
    hwndParent: HWND; // Parent window.  Valid only if IURL_INVOKECOMMAND_FL_ALLOW_UI is set.
    pcszVerb: LPCWSTR; // Verb to invoke.  Ignored if IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB is set.
  end;

{$IFDEF UNICODE}
  PURLInvokeCommandInfo = ^TUrlInvokeCommandInfoW;
  TUrlInvokeCommandInfo = TUrlInvokeCOmmandInfoW;
{$ELSE}
  PURLInvokeCommandInfo = ^TUrlInvokeCommandInfoA;
  TUrlInvokeCommandInfo = TUrlInvokeCOmmandInfoA;
{$ENDIF}




  IUniformResourceLocatorA = interface(IUnknown)
    [SID_IUniformResourceLocatorA]
    function SetURL(pcszURL: LpcStr; dwInFlags: DWORD): HRESULT; stdcall;
    function GetURL(ppszURL: LpStr): HRESULT; stdcall;
    function InvokeCommand(purlici: PURLINVOKECOMMANDINFOA): HRESULT; stdcall;

  end;



  IUniformResourceLocatorW = interface(IUnknown)
    [SID_IUniformResourceLocatorW]
    function SetURL(pcszURL: LpcWStr; dwInFlags: DWORD): HRESULT; stdcall;
    function GetURL(ppszURL: LpWStr): HRESULT; stdcall;
    function InvokeCommand(purlici: PURLINVOKECOMMANDINFOW): HRESULT; stdcall;
  end;


{$IFDEF UNICODE}
  IUniformResourceLocator = IUniformResourceLocatorW;
{$ELSE}
  IUniformResourceLocator = IUniformResourceLocatorA;
{$ENDIF}

function TranslateURLA(pcszURL: LPCSTR;
  dwInFlags: DWORD;
  ppszTranslatedURL: LPSTR): HRESULT; stdcall;


function TranslateURLW(pcszURL: LPCWSTR;
  dwInFlags: DWORD;
  ppszTranslatedURL: LPWSTR): HRESULT; stdcall;

{$IFDEF UNICODE}
function TranslateURL(pcszURL: LPCWSTR;
  dwInFlags: DWORD;
  ppszTranslatedURL: LPWSTR): HRESULT; stdcall;
{$ELSE}
function TranslateURL(pcszURL: LPCSTR;
  dwInFlags: DWORD;
  ppszTranslatedURL: LPSTR): HRESULT; stdcall;
{$ENDIF}


function URLAssociationDialogA(hwndParent: HWND;
  dwInFlags: DWORD;
  pcszFile: LPCSTR;
  pcszURL: LPCSTR;
  pszAppBuf: LPSTR;
  ucAppBufLen: UINT): HRESULT; stdcall;

function URLAssociationDialogW(hwndParent: HWND;
  dwInFlags: DWORD;
  pcszFile: LPCWSTR;
  pcszURL: LPCWSTR;
  pszAppBuf: LPWSTR;
  ucAppBufLen: UINT): HRESULT; stdcall;

{$IFDEF UNICODE}
function URLAssociationDialog(hwndParent: HWND;
  dwInFlags: DWORD;
  pcszFile: LPCWSTR;
  pcszURL: LPCWSTR;
  pszAppBuf: LPWSTR;
  ucAppBufLen: UINT): HRESULT; stdcall;
{$ELSE}
function URLAssociationDialog(hwndParent: HWND;
  dwInFlags: DWORD;
  pcszFile: LPCSTR;
  pcszURL: LPCSTR;
  pszAppBuf: LPSTR;
  ucAppBufLen: UINT): HRESULT; stdcall;
{$ENDIF}



function MIMEAssociationDialogA(hwndParent: HWND;
  dwInFlags: DWORD;
  pcszFile: LPCSTR;
  pcszMIMEContentType: LPCSTR;
  pszAppBuf: LPSTR;
  ucAppBufLen: UINT): HRESULT; stdcall;


function MIMEAssociationDialogW(hwndParent: HWND;
  dwInFlags: DWORD;
  pcszFile: LPCWSTR;
  pcszMIMEContentType: LPCWSTR;
  pszAppBuf: LPWSTR;
  ucAppBufLen: UINT): HRESULT; stdcall;

{$IFDEF UNICODE}
function MIMEAssociationDialog(hwndParent: HWND;
  dwInFlags: DWORD;
  pcszFile: LPCWSTR;
  pcszMIMEContentType: LPCWSTR;
  pszAppBuf: LPWSTR;
  ucAppBufLen: UINT): HRESULT; stdcall;
{$ELSE}
function MIMEAssociationDialog(hwndParent: HWND;
  dwInFlags: DWORD;
  pcszFile: LPCSTR;
  pcszMIMEContentType: LPCSTR;
  pszAppBuf: LPSTR;
  ucAppBufLen: UINT): HRESULT; stdcall;
{$ENDIF}

function InetIsOffline(dwFlags: DWORD): BOOL; stdcall;


{$IFDEF VER120}

const
  IID_IInternetSession: TGUID = '{79eac9e7-baf9-11ce-8c82-00aa004ba90b}';
  IID_IInternetSecurityMgrSite: TGUID = '{79eac9ed-baf9-11ce-8c82-00aa004ba90b}';
  IID_IInternetSecurityManager: TGUID = '{79eac9ee-baf9-11ce-8c82-00aa004ba90b}';
  IID_IInternetHostSecurityManager: TGUID = '{3af280b6-cb3f-11d0-891e-00c04fb6bfc4}';
  SID_IInternetSecurityManager: TGUID = '{79eac9ee-baf9-11ce-8c82-00aa004ba90b}';
  SID_IInternetHostSecurityManager: TGUID = '{3af280b6-cb3f-11d0-891e-00c04fb6bfc4}';
  IID_IInternetZoneManager: TGUID = '{79eac9ef-baf9-11ce-8c82-00aa004ba90b}';


type
  TUrlZoneReg = ULONG;

  PBindInfo = ^TBindInfo;
  _tagBINDINFO = packed record
    cbSize: ULONG;
    szExtraInfo: LPWSTR;
    stgmedData: TStgMedium;
    grfBindInfoF: DWORD;
    dwBindVerb: DWORD;
    szCustomVerb: LPWSTR;
    cbstgmedData: DWORD;
    dwOptions: DWORD;
    dwOptionsFlags: DWORD;
    dwCodePage: DWORD;
    securityAttributes: TSecurityAttributes;
    iid: TGUID;
    pUnk: IUnknown;
    dwReserved: DWORD;
  end;
  TBindInfo = _tagBINDINFO;
  BINDINFO = _tagBINDINFO;


{$NODEFINE POLEStrArray}
  POLEStrArray = ^TOLESTRArray;
{$NODEFINE TOLEStrArray}
  TOLEStrArray = array[0..MaxLongint div SizeOf(POLEStr) - 1] of POLEStr;

{$EXTERNALSYM IInternetBindInfo}
  IInternetBindInfo = interface
    ['{79eac9e1-baf9-11ce-8c82-00aa004ba90b}']
    function GetBindInfo(out grfBINDF: DWORD; var bindinfo: TBindInfo): HResult; stdcall;
    function GetBindString(ulStringType: ULONG; wzStr: POLEStrArray; cEl: ULONG;
      var cElFetched: ULONG): HResult; stdcall;
  end;

  PProtocolData = ^TProtocolData;
{$EXTERNALSYM _tagPROTOCOLDATA}
  _tagPROTOCOLDATA = packed record
    grfFlags: DWORD;
    dwState: DWORD;
    pData: Pointer;
    cbData: ULONG;
  end;
  TProtocolData = _tagPROTOCOLDATA;
{$EXTERNALSYM _tagPROTOCOLDATA}
  PROTOCOLDATA = _tagPROTOCOLDATA;

{$EXTERNALSYM IInternetProtocolSink}
  IInternetProtocolSink = interface; // forward

{$EXTERNALSYM IInternetProtocolRoot}
  IInternetProtocolRoot = interface
    ['{79eac9e3-baf9-11ce-8c82-00aa004ba90b}']
    function Start(szUrl: LPCWSTR; OIProtSink: IInternetProtocolSink;
      OIBindInfo: IInternetBindInfo; grfPI, dwReserved: DWORD): HResult; stdcall;
    function Continue(const ProtocolData: TProtocolData): HResult; stdcall;
    function Abort(hrReason: HResult; dwOptions: DWORD): HResult; stdcall;
    function Terminate(dwOptions: DWORD): HResult; stdcall;
    function Suspend: HResult; stdcall;
    function Resume: HResult; stdcall;
  end;

{$EXTERNALSYM IInternetProtocol}
  IInternetProtocol = interface(IInternetProtocolRoot)
    ['{79eac9e4-baf9-11ce-8c82-00aa004ba90b}']
    function Read(pv: Pointer; cb: ULONG; out cbRead: ULONG): HResult; stdcall;
    function Seek(dlibMove: LARGE_INTEGER; dwOrigin: DWORD; out libNewPosition: ULARGE_INTEGER): HResult; stdcall;
    function LockRequest(dwOptions: DWORD): HResult; stdcall;
    function UnlockRequest: HResult; stdcall;
  end;

{$EXTERNALSYM IInternetProtocolSink}
  IInternetProtocolSink = interface
    ['{79eac9e5-baf9-11ce-8c82-00aa004ba90b}']
    function Switch(const ProtocolData: TProtocolData): HResult; stdcall;
    function ReportProgress(ulStatusCode: ULONG; szStatusText: LPCWSTR): HResult; stdcall;
    function ReportData(grfBSCF: DWORD; ulProgress, ulProgressMax: ULONG): HResult; stdcall;
    function ReportResult(hrResult: HResult; dwError: DWORD; szResult: LPCWSTR): HResult; stdcall;
  end;

{$NODEFINE TLPCWSTRArray}
  TLPCWSTRArray = array[0..MaxLongInt div SizeOf(LPCWSTR) - 1] of LPCWSTR;
{$NODEFINE PLPCWSTRArray}
  PLPCWSTRArray = ^TLPCWSTRArray;

{$EXTERNALSYM IInternetSession}
  IInternetSession = interface
    ['{79eac9e7-baf9-11ce-8c82-00aa004ba90b}']
    function RegisterNameSpace(CF: IClassFactory; const clsid: TCLSID; pwzProtocol: LPCWSTR;
      cPatterns: ULONG; const pwzPatterns: PLPCWSTRArray; dwReserved: DWORD): HResult; stdcall;
    function UnregisterNameSpace(CF: IClassFactory; pszProtocol: LPCWSTR): HResult; stdcall;
    function RegisterMimeFilter(CF: IClassFactory; const rclsid: TCLSID;
      pwzType: LPCWSTR): HResult; stdcall;
    function UnregisterMimeFilter(CF: IClassFactory; pwzType: LPCWSTR): HResult; stdcall;
    function CreateBinding(BC: IBindCtx; szUrl: LPCWSTR; UnkOuter: IUnknown; out Unk: IUnknown;
      out OINetProt: IInternetProtocol; dwOption: DWORD): HResult; stdcall;
    function SetSessionOption(dwOption: DWORD; pBuffer: Pointer; dwBufferLength: DWORD;
      dwReserved: DWORD): HResult; stdcall;
    function GetSessionOption(dwOption: DWORD; pBuffer: Pointer; var dwBufferLength: DWORD;
      dwReserved: DWORD): HResult; stdcall;
  end; // IInternetSession

{$EXTERNALSYM CoInternetGetSession}
function CoInternetGetSession(dwSessionMode: DWORD; var pIInternetSession: IInternetSession;
  dwReserved: DWORD): HResult; stdcall;



type
{$EXTERNALSYM IInternetSecurityMgrSite}
  IInternetSecurityMgrSite = interface
    ['{79eac9ed-baf9-11ce-8c82-00aa004ba90b}']
    function GetWindow(out hwnd: HWnd): HResult; stdcall;
    function EnableModeless(fEnable: BOOL): HResult; stdcall;
  end;

const
{$EXTERNALSYM MAX_SIZE_SECURITY_ID}
  MAX_SIZE_SECURITY_ID = 512; // bytes;

  // MapUrlToZone returns the zone index given a URL
{$EXTERNALSYM PUAF_DEFAULT}
  PUAF_DEFAULT = $00000000;
{$EXTERNALSYM PUAF_NOUI}
  PUAF_NOUI = $00000001;
{$EXTERNALSYM PUAF_ISFILE}
  PUAF_ISFILE = $00000002;
{$EXTERNALSYM PUAF_WARN_IF_DENIED}
  PUAF_WARN_IF_DENIED = $00000004;
{$EXTERNALSYM PUAF_FORCEUI_FOREGROUND}
  PUAF_FORCEUI_FOREGROUND = $00000008;
{$EXTERNALSYM PUAF_CHECK_TIFS}
  PUAF_CHECK_TIFS = $00000010;

// This is the wrapper function that most clients will use.
// It figures out the current Policy for the passed in Action,
// and puts up UI if the current Policy indicates that the user
// should be queried. It returns back the Policy which the caller
// will use to determine if the action should be allowed
// This is the wrapper function to conveniently read a custom policy.

// SetZoneMapping
//    lpszPattern: string denoting a URL pattern
//        Examples of valid patterns:
//            *://*.msn.com
//            http://*.sony.co.jp
//            *://et.msn.com
//            ftp://157.54.23.41/
//            https://localsvr
//            file:\localsvr\share
//            *://157.54.100-200.*
//        Examples of invalid patterns:
//            http://*.lcs.mit.edu
//            ftp://*
//    dwFlags: SZM_FLAGS values

{$EXTERNALSYM SZM_CREATE}
  SZM_CREATE = $00000000;
{$EXTERNALSYM SZM_DELETE}
  SZM_DELETE = $00000001;

type
{$EXTERNALSYM IInternetSecurityManager}
  IInternetSecurityManager = interface
    ['{79eac9ee-baf9-11ce-8c82-00aa004ba90b}']
    function SetSecuritySite(Site: IInternetSecurityMgrSite): HResult; stdcall;
    function GetSecuritySite(out Site: IInternetSecurityMgrSite): HResult; stdcall;
    function MapUrlToZone(pwszUrl: LPCWSTR; out dwZone: DWORD;
      dwFlags: DWORD): HResult; stdcall;
    function GetSecurityId(pwszUrl: LPCWSTR; pbSecurityId: Pointer;
      var cbSecurityId: DWORD; dwReserved: DWORD): HResult; stdcall;
    function ProcessUrlAction(pwszUrl: LPCWSTR; dwAction: DWORD;
      pPolicy: Pointer; cbPolicy: DWORD; pContext: Pointer; cbContext: DWORD;
      dwFlags, dwReserved: DWORD): HResult; stdcall;
    function QueryCustomPolicy(pwszUrl: LPCWSTR; const guidKey: TGUID;
      out pPolicy: Pointer; out cbPolicy: DWORD; pContext: Pointer; cbContext: DWORD;
      dwReserved: DWORD): HResult; stdcall;
    function SetZoneMapping(dwZone: DWORD; lpszPattern: LPCWSTR;
      dwFlags: DWORD): HResult; stdcall;
    function GetZoneMappings(dwZone: DWORD; out enumString: IEnumString;
      dwFlags: DWORD): HResult; stdcall;
  end;

{$EXTERNALSYM IInternetHostSecurityManager}
  IInternetHostSecurityManager = interface
    ['{3af280b6-cb3f-11d0-891e-00c04fb6bfc4}']
    function GetSecurityId(pbSecurityId: Pointer; var cbSecurityId: DWORD;
      dwReserved: DWORD): HResult; stdcall;
    function ProcessUrlAction(dwAction: DWORD; pPolicy: Pointer; cbPolicy: DWORD;
      pContext: Pointer; cbContext, dwFlags, dwReserved: DWORD): HResult; stdcall;
    function QueryCustomPolicy(const guidKey: TGUID; out pPolicy: Pointer; out cbPolicy: DWORD;
      pContext: Pointer; cbContext, dwReserved: DWORD): HResult; stdcall;
  end;

const
{$EXTERNALSYM URLACTION_MIN}
  URLACTION_MIN = $00001000;

{$EXTERNALSYM URLACTION_DOWNLOAD_MIN}
  URLACTION_DOWNLOAD_MIN = $00001000;
{$EXTERNALSYM URLACTION_DOWNLOAD_SIGNED_ACTIVEX}
  URLACTION_DOWNLOAD_SIGNED_ACTIVEX = $00001001;
{$EXTERNALSYM URLACTION_DOWNLOAD_UNSIGNED_ACTIVEX}
  URLACTION_DOWNLOAD_UNSIGNED_ACTIVEX = $00001004;
{$EXTERNALSYM URLACTION_DOWNLOAD_CURR_MAX}
  URLACTION_DOWNLOAD_CURR_MAX = $00001004;
{$EXTERNALSYM URLACTION_DOWNLOAD_MAX}
  URLACTION_DOWNLOAD_MAX = $000011FF;

{$EXTERNALSYM URLACTION_ACTIVEX_MIN}
  URLACTION_ACTIVEX_MIN = $00001200;
{$EXTERNALSYM URLACTION_ACTIVEX_RUN}
  URLACTION_ACTIVEX_RUN = $00001200;
{$EXTERNALSYM URLACTION_ACTIVEX_OVERRIDE_OBJECT_SAFETY}
  URLACTION_ACTIVEX_OVERRIDE_OBJECT_SAFETY = $00001201; // aggregate next four
{$EXTERNALSYM URLACTION_ACTIVEX_OVERRIDE_DATA_SAFETY}
  URLACTION_ACTIVEX_OVERRIDE_DATA_SAFETY = $00001202; //
{$EXTERNALSYM URLACTION_ACTIVEX_OVERRIDE_SCRIPT_SAFETY}
  URLACTION_ACTIVEX_OVERRIDE_SCRIPT_SAFETY = $00001203; //
{$EXTERNALSYM URLACTION_SCRIPT_OVERRIDE_SAFETY}
  URLACTION_SCRIPT_OVERRIDE_SAFETY = $00001401; //
{$EXTERNALSYM URLACTION_ACTIVEX_CONFIRM_NOOBJECTSAFETY}
  URLACTION_ACTIVEX_CONFIRM_NOOBJECTSAFETY = $00001204; //
{$EXTERNALSYM URLACTION_ACTIVEX_TREATASUNTRUSTED}
  URLACTION_ACTIVEX_TREATASUNTRUSTED = $00001205;
{$EXTERNALSYM URLACTION_ACTIVEX_CURR_MAX}
  URLACTION_ACTIVEX_CURR_MAX = $00001205;
{$EXTERNALSYM URLACTION_ACTIVEX_MAX}
  URLACTION_ACTIVEX_MAX = $000013FF;

{$EXTERNALSYM URLACTION_SCRIPT_MIN}
  URLACTION_SCRIPT_MIN = $00001400;
{$EXTERNALSYM URLACTION_SCRIPT_RUN}
  URLACTION_SCRIPT_RUN = $00001400;
{$EXTERNALSYM URLACTION_SCRIPT_JAVA_USE}
  URLACTION_SCRIPT_JAVA_USE = $00001402;
{$EXTERNALSYM URLACTION_SCRIPT_SAFE_ACTIVEX}
  URLACTION_SCRIPT_SAFE_ACTIVEX = $00001405;
{$EXTERNALSYM URLACTION_SCRIPT_CURR_MAX}
  URLACTION_SCRIPT_CURR_MAX = $00001405;
{$EXTERNALSYM URLACTION_SCRIPT_MAX}
  URLACTION_SCRIPT_MAX = $000015FF;

{$EXTERNALSYM URLACTION_HTML_MIN}
  URLACTION_HTML_MIN = $00001600;
{$EXTERNALSYM URLACTION_HTML_SUBMIT_FORMS}
  URLACTION_HTML_SUBMIT_FORMS = $00001601; // aggregate next two
{$EXTERNALSYM URLACTION_HTML_SUBMIT_FORMS_FROM}
  URLACTION_HTML_SUBMIT_FORMS_FROM = $00001602; //
{$EXTERNALSYM URLACTION_HTML_SUBMIT_FORMS_TO}
  URLACTION_HTML_SUBMIT_FORMS_TO = $00001603; //
{$EXTERNALSYM URLACTION_HTML_FONT_DOWNLOAD}
  URLACTION_HTML_FONT_DOWNLOAD = $00001604;
{$EXTERNALSYM URLACTION_HTML_JAVA_RUN}
  URLACTION_HTML_JAVA_RUN = $00001605; // derive from Java custom policy;
{$EXTERNALSYM URLACTION_HTML_CURR_MAX}
  URLACTION_HTML_CURR_MAX = $00001605;
{$EXTERNALSYM URLACTION_HTML_MAX}
  URLACTION_HTML_MAX = $000017FF;

{$EXTERNALSYM URLACTION_SHELL_MIN}
  URLACTION_SHELL_MIN = $00001800;
{$EXTERNALSYM URLACTION_SHELL_INSTALL_DTITEMS}
  URLACTION_SHELL_INSTALL_DTITEMS = $00001800;
{$EXTERNALSYM URLACTION_SHELL_MOVE_OR_COPY}
  URLACTION_SHELL_MOVE_OR_COPY = $00001802;
{$EXTERNALSYM URLACTION_SHELL_FILE_DOWNLOAD}
  URLACTION_SHELL_FILE_DOWNLOAD = $00001803;
{$EXTERNALSYM URLACTION_SHELL_VERB}
  URLACTION_SHELL_VERB = $00001804;
{$EXTERNALSYM URLACTION_SHELL_WEBVIEW_VERB}
  URLACTION_SHELL_WEBVIEW_VERB = $00001805;
{$EXTERNALSYM URLACTION_SHELL_CURR_MAX}
  URLACTION_SHELL_CURR_MAX = $00001805;
{$EXTERNALSYM URLACTION_SHELL_MAX}
  URLACTION_SHELL_MAX = $000019FF;

{$EXTERNALSYM URLACTION_NETWORK_MIN}
  URLACTION_NETWORK_MIN = $00001A00;

{$EXTERNALSYM URLACTION_CREDENTIALS_USE}
  URLACTION_CREDENTIALS_USE = $00001A00;
{$EXTERNALSYM URLPOLICY_CREDENTIALS_SILENT_LOGON_OK}
  URLPOLICY_CREDENTIALS_SILENT_LOGON_OK = $00000000;
{$EXTERNALSYM URLPOLICY_CREDENTIALS_MUST_PROMPT_USER}
  URLPOLICY_CREDENTIALS_MUST_PROMPT_USER = $00010000;
{$EXTERNALSYM URLPOLICY_CREDENTIALS_CONDITIONAL_PROMPT}
  URLPOLICY_CREDENTIALS_CONDITIONAL_PROMPT = $00020000;
{$EXTERNALSYM URLPOLICY_CREDENTIALS_ANONYMOUS_ONLY}
  URLPOLICY_CREDENTIALS_ANONYMOUS_ONLY = $00030000;

{$EXTERNALSYM URLACTION_AUTHENTICATE_CLIENT}
  URLACTION_AUTHENTICATE_CLIENT = $00001A01;
{$EXTERNALSYM URLPOLICY_AUTHENTICATE_CLEARTEXT_OK}
  URLPOLICY_AUTHENTICATE_CLEARTEXT_OK = $00000000;
{$EXTERNALSYM URLPOLICY_AUTHENTICATE_CHALLENGE_RESPONSE}
  URLPOLICY_AUTHENTICATE_CHALLENGE_RESPONSE = $00010000;
{$EXTERNALSYM URLPOLICY_AUTHENTICATE_MUTUAL_ONLY}
  URLPOLICY_AUTHENTICATE_MUTUAL_ONLY = $00030000;

{$EXTERNALSYM URLACTION_NETWORK_CURR_MAX}
  URLACTION_NETWORK_CURR_MAX = $00001A01;
{$EXTERNALSYM URLACTION_NETWORK_MAX}
  URLACTION_NETWORK_MAX = $00001BFF;

{$EXTERNALSYM URLACTION_JAVA_MIN}
  URLACTION_JAVA_MIN = $00001C00;
{$EXTERNALSYM URLACTION_JAVA_PERMISSIONS}
  URLACTION_JAVA_PERMISSIONS = $00001C00;
{$EXTERNALSYM URLPOLICY_JAVA_PROHIBIT}
  URLPOLICY_JAVA_PROHIBIT = $00000000;
{$EXTERNALSYM URLPOLICY_JAVA_HIGH}
  URLPOLICY_JAVA_HIGH = $00010000;
{$EXTERNALSYM URLPOLICY_JAVA_MEDIUM}
  URLPOLICY_JAVA_MEDIUM = $00020000;
{$EXTERNALSYM URLPOLICY_JAVA_LOW}
  URLPOLICY_JAVA_LOW = $00030000;
{$EXTERNALSYM URLPOLICY_JAVA_CUSTOM}
  URLPOLICY_JAVA_CUSTOM = $00800000;
{$EXTERNALSYM URLACTION_JAVA_CURR_MAX}
  URLACTION_JAVA_CURR_MAX = $00001C00;
{$EXTERNALSYM URLACTION_JAVA_MAX}
  URLACTION_JAVA_MAX = $00001CFF;

// The following Infodelivery actions should have no default policies
// in the registry.  They assume that no default policy means fall
// back to the global restriction.  If an admin sets a policy per
// zone, then it overrides the global restriction.

{$EXTERNALSYM URLACTION_INFODELIVERY_MIN}
  URLACTION_INFODELIVERY_MIN = $00001D00;
{$EXTERNALSYM URLACTION_INFODELIVERY_NO_ADDING_CHANNELS}
  URLACTION_INFODELIVERY_NO_ADDING_CHANNELS = $00001D00;
{$EXTERNALSYM URLACTION_INFODELIVERY_NO_EDITING_CHANNELS}
  URLACTION_INFODELIVERY_NO_EDITING_CHANNELS = $00001D01;
{$EXTERNALSYM URLACTION_INFODELIVERY_NO_REMOVING_CHANNELS}
  URLACTION_INFODELIVERY_NO_REMOVING_CHANNELS = $00001D02;
{$EXTERNALSYM URLACTION_INFODELIVERY_NO_ADDING_SUBSCRIPTIONS}
  URLACTION_INFODELIVERY_NO_ADDING_SUBSCRIPTIONS = $00001D03;
{$EXTERNALSYM URLACTION_INFODELIVERY_NO_EDITING_SUBSCRIPTIONS}
  URLACTION_INFODELIVERY_NO_EDITING_SUBSCRIPTIONS = $00001D04;
{$EXTERNALSYM URLACTION_INFODELIVERY_NO_REMOVING_SUBSCRIPTIONS}
  URLACTION_INFODELIVERY_NO_REMOVING_SUBSCRIPTIONS = $00001D05;
{$EXTERNALSYM URLACTION_INFODELIVERY_NO_CHANNEL_LOGGING}
  URLACTION_INFODELIVERY_NO_CHANNEL_LOGGING = $00001D06;
{$EXTERNALSYM URLACTION_INFODELIVERY_CURR_MAX}
  URLACTION_INFODELIVERY_CURR_MAX = $00001D06;
{$EXTERNALSYM URLACTION_INFODELIVERY_MAX}
  URLACTION_INFODELIVERY_MAX = $00001DFF;
{$EXTERNALSYM URLACTION_CHANNEL_SOFTDIST_MIN}
  URLACTION_CHANNEL_SOFTDIST_MIN = $00001E00;
{$EXTERNALSYM URLACTION_CHANNEL_SOFTDIST_PERMISSIONS}
  URLACTION_CHANNEL_SOFTDIST_PERMISSIONS = $00001E05;
{$EXTERNALSYM URLPOLICY_CHANNEL_SOFTDIST_PROHIBIT}
  URLPOLICY_CHANNEL_SOFTDIST_PROHIBIT = $00010000;
{$EXTERNALSYM URLPOLICY_CHANNEL_SOFTDIST_PRECACHE}
  URLPOLICY_CHANNEL_SOFTDIST_PRECACHE = $00020000;
{$EXTERNALSYM URLPOLICY_CHANNEL_SOFTDIST_AUTOINSTALL}
  URLPOLICY_CHANNEL_SOFTDIST_AUTOINSTALL = $00030000;
{$EXTERNALSYM URLACTION_CHANNEL_SOFTDIST_MAX}
  URLACTION_CHANNEL_SOFTDIST_MAX = $00001EFF;

// For each action specified above the system maintains
// a set of policies for the action.
// The only policies supported currently are permissions (i.e. is something allowed)
// and logging status.
// IMPORTANT: If you are defining your own policies don't overload the meaning of the
// loword of the policy. You can use the hiword to store any policy bits which are only
// meaningful to your action.
// For an example of how to do this look at the URLPOLICY_JAVA above

// Permissions
{$EXTERNALSYM URLPOLICY_ALLOW}
  URLPOLICY_ALLOW = $00;
{$EXTERNALSYM URLPOLICY_QUERY}
  URLPOLICY_QUERY = $01;
{$EXTERNALSYM URLPOLICY_DISALLOW}
  URLPOLICY_DISALLOW = $03;

// Notifications are not done when user already queried.
{$EXTERNALSYM URLPOLICY_NOTIFY_ON_ALLOW}
  URLPOLICY_NOTIFY_ON_ALLOW = $10;
{$EXTERNALSYM URLPOLICY_NOTIFY_ON_DISALLOW}
  URLPOLICY_NOTIFY_ON_DISALLOW = $20;

// Logging is done regardless of whether user was queried.
{$EXTERNALSYM URLPOLICY_LOG_ON_ALLOW}
  URLPOLICY_LOG_ON_ALLOW = $40;
{$EXTERNALSYM URLPOLICY_LOG_ON_DISALLOW}
  URLPOLICY_LOG_ON_DISALLOW = $80;

{$EXTERNALSYM URLPOLICY_MASK_PERMISSIONS}
  URLPOLICY_MASK_PERMISSIONS = $0F;


// The ordinal #'s that define the predefined zones internet explorer knows about.
// When we support user-defined zones their zone numbers should be between
// URLZONE_USER_MIN and URLZONE_USER_MAX

const
{$EXTERNALSYM URLZONE_PREDEFINED_MIN}
  URLZONE_PREDEFINED_MIN = 0;
{$EXTERNALSYM URLZONE_LOCAL_MACHINE}
  URLZONE_LOCAL_MACHINE = 0;
{$EXTERNALSYM URLZONE_INTRANET}
  URLZONE_INTRANET = URLZONE_LOCAL_MACHINE + 1;
{$EXTERNALSYM URLZONE_TRUSTED}
  URLZONE_TRUSTED = URLZONE_INTRANET + 1;
{$EXTERNALSYM URLZONE_INTERNET}
  URLZONE_INTERNET = URLZONE_TRUSTED + 1;
{$EXTERNALSYM URLZONE_UNTRUSTED}
  URLZONE_UNTRUSTED = URLZONE_INTERNET + 1;
{$EXTERNALSYM URLZONE_PREDEFINED_MAX}
  URLZONE_PREDEFINED_MAX = 999;
{$EXTERNALSYM URLZONE_USER_MIN}
  URLZONE_USER_MIN = 1000;
{$EXTERNALSYM URLZONE_USER_MAX}
  URLZONE_USER_MAX = 10000;

{$EXTERNALSYM URLTEMPLATE_CUSTOM}
  URLTEMPLATE_CUSTOM = $00000000;
{$EXTERNALSYM URLTEMPLATE_PREDEFINED_MIN}
  URLTEMPLATE_PREDEFINED_MIN = $00010000;
{$EXTERNALSYM URLTEMPLATE_LOW}
  URLTEMPLATE_LOW = $00010000;
{$EXTERNALSYM URLTEMPLATE_MEDIUM}
  URLTEMPLATE_MEDIUM = $00011000;
{$EXTERNALSYM URLTEMPLATE_HIGH}
  URLTEMPLATE_HIGH = $00012000;
{$EXTERNALSYM URLTEMPLATE_PREDEFINED_MAX}
  URLTEMPLATE_PREDEFINED_MAX = $00020000;

{$EXTERNALSYM MAX_ZONE_PATH}
  MAX_ZONE_PATH = 260;
{$EXTERNALSYM MAX_ZONE_DESCRIPTION}
  MAX_ZONE_DESCRIPTION = 200;

{$EXTERNALSYM ZAFLAGS_CUSTOM_EDIT}
  ZAFLAGS_CUSTOM_EDIT = $00000001;
{$EXTERNALSYM ZAFLAGS_ADD_SITES}
  ZAFLAGS_ADD_SITES = $00000002;
{$EXTERNALSYM ZAFLAGS_REQUIRE_VERIFICATION}
  ZAFLAGS_REQUIRE_VERIFICATION = $00000004;
{$EXTERNALSYM ZAFLAGS_INCLUDE_PROXY_OVERRIDE}
  ZAFLAGS_INCLUDE_PROXY_OVERRIDE = $00000008;
{$EXTERNALSYM ZAFLAGS_INCLUDE_INTRANET_SITES}
  ZAFLAGS_INCLUDE_INTRANET_SITES = $00000010;
{$EXTERNALSYM ZAFLAGS_NO_UI}
  ZAFLAGS_NO_UI = $00000020;
{$EXTERNALSYM ZAFLAGS_SUPPORTS_VERIFICATION}
  ZAFLAGS_SUPPORTS_VERIFICATION = $00000040;
{$EXTERNALSYM ZAFLAGS_UNC_AS_INTRANET}
  ZAFLAGS_UNC_AS_INTRANET = $00000080;

type
  PZoneAttributes = ^TZoneAttributes;
{$EXTERNALSYM _ZONEATTRIBUTES}
  _ZONEATTRIBUTES = packed record
    cbSize: ULONG;
    szDisplayName: array[0..260 - 1] of WideChar;
    szDescription: array[0..200 - 1] of WideChar;
    szIconPath: array[0..260 - 1] of WideChar;
    dwTemplateMinLevel: DWORD;
    dwTemplateRecommended: DWORD;
    dwTemplateCurrentLevel: DWORD;
    dwFlags: DWORD;
  end;
  TZoneAttributes = _ZONEATTRIBUTES;
{$EXTERNALSYM ZONEATTRIBUTES}
  ZONEATTRIBUTES = _ZONEATTRIBUTES;

// Gets the zone attributes (information in registry other than actual security
// policies associated with the zone).  Zone attributes are fixed as:
// Sets the zone attributes (information in registry other than actual security
// policies associated with the zone).  Zone attributes as above.
// Returns S_OK or ??? if failed to write the zone attributes.
{  Registry Flags

    When reading, default behavior is:
        If HKLM allows override and HKCU value exists
            Then use HKCU value
            Else use HKLM value
    When writing, default behavior is same as HKCU
        If HKLM allows override
           Then Write to HKCU
           Else Fail
}

const
{$EXTERNALSYM URLZONEREG_DEFAULT}
  URLZONEREG_DEFAULT = 0;
{$EXTERNALSYM URLZONEREG_HKLM}
  URLZONEREG_HKLM = URLZONEREG_DEFAULT + 1;
{$EXTERNALSYM URLZONEREG_HKCU}
  URLZONEREG_HKCU = URLZONEREG_HKLM + 1;

// Gets a named custom policy associated with a zone;
// e.g. the Java VM settings can be defined with a unique key such as 'Java'.
// Custom policy support is intended to allow extensibility from the predefined
// set of policies that IE4 has built in.
//
// pwszKey is the string name designating the custom policy.  Components are
//   responsible for having unique names.
// ppPolicy is the callee allocated buffer for the policy byte blob; caller is
//   responsible for freeing this buffer eventually.
// pcbPolicy is the size of the byte blob returned.
// dwRegFlags determines how registry is accessed (see above).
// Returns S_OK if key is found and buffer allocated; ??? if key is not found (no buffer alloced).
// Sets a named custom policy associated with a zone;
// e.g. the Java VM settings can be defined with a unique key such as 'Java'.
// Custom policy support is intended to allow extensibility from the predefined
// set of policies that IE4 has built in.
//
// pwszKey is the string name designating the custom policy.  Components are
//   responsible for having unique names.
// ppPolicy is the caller allocated buffer for the policy byte blob.
// pcbPolicy is the size of the byte blob to be set.
// dwRegFlags determines if HTCU or HKLM is set.
// Returns S_OK or ??? if failed to write the zone custom policy.
// Gets action policy associated with a zone, the builtin, fixed-length policies info.

// dwAction is the action code for the action as defined above.
// pPolicy is the caller allocated buffer for the policy data.
// cbPolicy is the size of the caller allocated buffer.
// dwRegFlags determines how registry is accessed (see above).
// Returns S_OK if action is valid; ??? if action is not valid.

type
{$EXTERNALSYM IInternetZoneManager}
  IInternetZoneManager = interface
    ['{79eac9ef-baf9-11ce-8c82-00aa004ba90b}']

    // Gets the zone attributes (information in registry other than actual security
    // policies associated with the zone).  Zone attributes are fixed as:
    function GetZoneAttributes(dwZone: DWORD;
      var ZoneAttributes: TZoneAttributes): HResult; stdcall;

    // Sets the zone attributes (information in registry other than actual security
    // policies associated with the zone).  Zone attributes as above.
    // Returns S_OK or ??? if failed to write the zone attributes.
    function SetZoneAttributes(dwZone: DWORD;
      const ZoneAttributes: TZoneAttributes): HResult; stdcall;
    function GetZoneCustomPolicy(dwZone: DWORD; const guidKey: TGUID; out pPolicy: Pointer;
      out cbPolicy: DWORD; urlZoneReg: TUrlZoneReg): HResult; stdcall;
    function SetZoneCustomPolicy(dwZone: DWORD; const guidKey: TGUID; pPolicy: Pointer;
      cbPolicy: DWORD; urlZoneReg: TUrlZoneReg): HResult; stdcall;
    function GetZoneActionPolicy(dwZone, dwAction: DWORD; pPolicy: Pointer;
      cbPolicy: DWORD; urlZoneReg: TUrlZoneReg): HResult; stdcall;
    function SetZoneActionPolicy(dwZone, dwAction: DWORD; pPolicy: Pointer;
      cbPolicy: DWORD; urlZoneReg: TUrlZoneReg): HResult; stdcall;
    function PromptAction(dwAction: DWORD; hwndParent: HWnd; pwszUrl, pwszText: LPCWSTR;
      dwPromptFlags: DWORD): HResult; stdcall;
    function LogAction(dwAction: DWORD; pwszUrl, pwszText: LPCWSTR;
      dwLogFlags: DWORD): HResult; stdcall;
    function CreateZoneEnumerator(out dwEnum, dwCount: DWORD;
      dwFlags: DWORD): HResult; stdcall;
    function GetZoneAt(dwEnum, dwIndex: DWORD; out dwZone: DWORD): HResult; stdcall;
    function DestroyZoneEnumerator(dwEnum: DWORD): HResult; stdcall;
    function CopyTemplatePoliciesToZone(dwTemplate, dwZone, dwReserved: DWORD): HResult; stdcall;
  end;

// Creates the security manager object. The first argument is the Service provider
// to allow for delegation
{$EXTERNALSYM CoInternetCreateSecurityManager}
function CoInternetCreateSecurityManager(SP: IServiceProvider; var SM: IInternetSecurityManager;
  dwReserved: DWORD): HResult; stdcall;
{$EXTERNALSYM CoInternetCreateZoneManager}
function CoInternetCreateZoneManager(SP: IServiceProvider; var ZM: IInternetZoneManager;
  dwReserved: DWORD): HResult; stdcall;



{$ENDIF}

var
  ShellModule: THandle;
  ComCtlModule : THandle;
  HHCtrlModule : THandle;


function SHLockShared(Handle: THandle; DW: DWORD): Pointer; stdcall;
function SHUnlockShared(Pnt: Pointer): BOOL; stdcall;
function SHFreeShared(Handle: THandle; DW: DWORD): Pointer; stdcall;
function _Free(Pidl: PItemIDList): BOOL; stdcall;
function HtmlHelp(hwndCaller: HWND; pszFile: PChar; uCommand: Integer;
  dwData: DWORD): HWND; stdcall;


implementation

const
  urldll = 'url.dll';

function InetIsOffline; external urldll name 'InetIsOffline';

function MIMEAssociationDialogW; external urldll name 'MIMEAssociationDialogW';
function MIMEAssociationDialogA; external urldll name 'MIMEAssociationDialogA';
{$IFDEF UNICODE}
function MIMEAssociationDialog; external urldll name 'MIMEAssociationDialogW';
{$ELSE}
function MIMEAssociationDialog; external urldll name 'MIMEAssociationDialogA';
{$ENDIF}

function URLAssociationDialogW; external urldll name 'URLAssociationDialogW';
function URLAssociationDialogA; external urldll name 'URLAssociationDialogA';
{$IFDEF UNICODE}
function URLAssociationDialog; external urldll name 'URLAssociationDialogW';
{$ELSE}
function URLAssociationDialog; external urldll name 'URLAssociationDialogA';
{$ENDIF}

function TranslateURLA; external urldll name 'TranslateURLA';
function TranslateURLW; external urldll name 'TranslateURLW';
{$IFDEF UNICODE}
function TranslateURL; external urldll name 'TranslateURLW';
{$ELSE}
function TranslateURL; external urldll name 'TranslateURLA';
{$ENDIF}



{$IFDEF VER120}
const
  UrlMonLib = 'URLMON.DLL';
function CoInternetGetSession; external UrlMonLib name 'CoInternetGetSession';
function CoInternetCreateSecurityManager; external UrlMonLib name 'CoInternetCreateSecurityManager';
function CoInternetCreateZoneManager; external UrlMonLib name 'CoInternetCreateZoneManager';
{$ENDIF}





const
  Shell32 = 'shell32.dll';
  comctl32 = 'comctl32.dll';
  hhctrl = 'hhctrl.ocx';


  SHLockShared_Index = 521;
  SHUnlockShared_Index = 522;
  SHFreeShared_Index = 523;
  Free_Index = 73;


function GetShellModule: THandle;
begin
  if ShellModule = 0 then
  begin
    ShellModule := {$IFDEF VER120} LoadLibrary(Shell32){$ELSE}SafeLoadLibrary(Shell32){$ENDIF};
    if ShellModule <= HINSTANCE_ERROR then
      ShellModule := 0;
  end;
  Result := ShellModule;
end;

function GetHHctrlModule: THandle;
begin
  if HHCtrlModule = 0 then
  begin
    HHCtrlModule :={$IFDEF VER120} LoadLibrary(HHCtrl){$ELSE} SafeLoadLibrary(HHCtrl){$ENDIF};
    if HHCtrlModule <= HINSTANCE_ERROR then
      HHCtrlModule := 0;
  end;
  Result := HHCtrlModule;
end;


function GetComctlModule: THandle;
begin
  if ComctlModule = 0 then
  begin
    ComctlModule := {$IFDEF VER120}LoadLibrary(comctl32) {$ELSE} SafeLoadLibrary(comctl32){$ENDIF};
    if ComctlModule <= HINSTANCE_ERROR then
      ComctlModule := 0;
  end;
  Result := ComctlModule;
end;


function HtmlHelp(hwndCaller: HWND; pszFile: PChar; uCommand: Integer;
  dwData: DWORD): HWND; stdcall;
type
  TheFunctionType = function(hwndCaller: HWND; pszFile: PChar; uCommand: Integer;
  dwData: DWORD): HWND; stdcall;
var
  TheFunction: TheFunctionType;
begin
  Result := 0;
  if HHCtrlModule = 0 then HHCtrlModule := GetHHCtrlModule;
  if HHCtrlModule <> 0 then begin
    TheFunction := GetProcAddress(HHCtrlModule, PChar('HtlmHelpA'));
    if (Assigned(TheFunction)) then Result := TheFunction(hwndCaller, pszFile, uCommand, dwdata);
  end;
end;







function _Free(Pidl: PItemIDList): BOOL; stdcall;
type
  TheFunctionType = function(Pidl: PItemIDList): BOOL; stdcall;
var
  TheFunction: TheFunctionType;
begin
  Result := False;
  if ComctlModule = 0 then ComctlModule := GetComctlModule;
  if ComctlModule <> 0 then begin
    TheFunction := GetProcAddress(ComctlModule, PChar(Free_Index));
    if (Assigned(TheFunction)) then Result := TheFunction(Pidl);
  end;
end;



function SHLockShared(Handle: THandle; DW: DWORD): Pointer; stdcall;
type
  TheFunctionType = function(Handle: THandle; DW: DWORD): Pointer; stdcall;
var
  TheFunction: TheFunctionType;
begin
  Result := nil;
  if ShellModule = 0 then ShellModule := GetShellModule;
  if ShellModule <> 0 then begin
    TheFunction := GetProcAddress(ShellModule, PChar(SHLockShared_Index));
    if (Assigned(TheFunction)) then Result := TheFunction(Handle, DW);
  end;
end;

function SHUnLockShared(pnt: Pointer): BOOL; stdcall;
type
  TheFunctionType = function(pnt: Pointer): BOOL; stdcall;
var
  TheFunction: TheFunctionType;
begin
  Result := FALSE;
  if ShellModule = 0 then ShellModule := GetShellModule;
  if ShellModule <> 0 then begin
    TheFunction := GetProcAddress(ShellModule, PChar(SHUnLockShared_Index));
    if (Assigned(TheFunction)) then Result := TheFunction(pnt);
  end;
end;

function SHFreeShared(Handle: THandle; DW: DWORD): Pointer; stdcall;
type
  TheFunctionType = function(Handle: THandle; DW: DWORD): Pointer; stdcall;
var
  TheFunction: TheFunctionType;
begin
  Result := nil;
  if ShellModule = 0 then ShellModule := GetShellModule;
  if ShellModule <> 0 then begin
    TheFunction := GetProcAddress(ShellModule, PChar(SHFreeShared_Index));
    if (Assigned(TheFunction)) then Result := TheFunction(Handle, DW);
  end;
end;


initialization

finalization
  if ShellModule <> 0 then FreeLibrary(ShellModule);
  if ComctlModule <> 0 then FreeLibrary(ComctlModule);
  if HHCtrlModule <> 0 then FreeLibrary(HHCtrlModule);

end.

