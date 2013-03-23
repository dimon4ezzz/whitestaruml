(*******************************
 * IEUTILS 1.4 (Oct. 16 2001) *
 *******************************)

unit IEUtils;

interface

uses

{$IFDEF VER140}Variants,{$ENDIF}
 IEConst, dialogs,Inifiles, Registry, Sysutils, ShellApi, Windows, Activex, Shlobj;


function IE5_Installed: Boolean;
function GetIEVersion: string;
function StringToVarArray(const S: string): Variant;
function VarArrayToString(const V: Variant): string;
function Encode(const S: string): string;
function IsFolder(ShellFolder: IShellFolder; ID: PItemIDList): Boolean;
function IsFolderEx(ChannelShortcut: String; ShellFolder: IShellFolder; ID: PItemIDList): Boolean;
function IsChannel(ChannelShortcut: String; ShellFolder: IShellFolder; ID: PItemIDList): Boolean;
function GetDisplayName(Folder: IShellFolder; pidl: PItemIDList): string;
function GetImageIndex(pidl: PItemIDList): integer;
function ExtractUrl(ShellFolder: IShellFolder; pidl: PItemIDList): string;
function ResolveChannel(pFolder: IShellFolder; pidl: PItemIDList; var lpszURL: string): HRESULT;
function ResolveLink(const path: string): string;
function GetFileName(Folder: IShellFolder; pidl: PItemIDList): string;
function ResolveUrlIni(Filename: string): string;
function ResolveUrlIntShCut(Filename: string): string;
procedure DisposePIDL(ID: PItemIDList);
function CopyITEMID(Malloc: IMalloc; ID: PItemIDList): PItemIDList;
function NextPIDL(IDList: PItemIDList): PItemIDList;
function GetPIDLSize(IDList: PItemIDList): Integer;
procedure StripLastID(IDList: PItemIDList);
function CreatePIDL(Size: Integer): PItemIDList;
function CopyPIDL(IDList: PItemIDList): PItemIDList;
function ConcatPIDLs(IDList1, IDList2: PItemIDList): PItemIDList;



implementation

uses comobj;


function StringToVarArray(const S: string): Variant;
begin
  Result := Unassigned;
  if S <> '' then
  begin
    Result := VarArrayCreate([0, Length(S) - 1], varByte);
    Move(Pointer(S)^, VarArrayLock(Result)^, Length(S));
    VarArrayUnlock(Result);
  end;
end;


function VarArrayToString(const V: Variant): string;
var
  i, j: Integer;
begin
  if VarIsArray(V) then
    for I := 0 to VarArrayHighBound(V, 1) do
    begin
      j := V[i];
      result := result + chr(j);
    end;
end;

function Encode(const S: string): string;
var
  I: Integer;
  Hex: string;
begin
  for I := 1 to Length(S) do

    case S[i] of
      ' ': result := Result + '+';
      'A'..'Z', 'a'..'z', '*', '@', '.', '_', '-',
        '0'..'9', '$', '!', '''', '(', ')':
        result := Result + s[i];
    else
      begin
        Hex := IntToHex(ord(S[i]), 2);
        if Length(Hex) = 2 then Result := Result + '%' + Hex else
          Result := Result + '%0' + hex;
      end;
    end;
end;

function IE5_Installed: Boolean;
var
  Reg: TRegistry;
  S: string;
begin
  Reg := TRegistry.Create;
  with Reg do begin
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('Software\Microsoft\Internet Explorer', False);
    if ValueExists('Version') then S := ReadString('Version')
    else S := '0';
    CloseKey;
    Free;
  end;
  Result := (StrToInt(S[1]) > 4);
end;


function GetIEVersion: string;
var
  SysDir: PChar;
  Info: Pointer;
  InfoData: Pointer;
  InfoSize: LongInt;
  Len: DWORD;
  FName: Pchar;
  SystemDir, Infotype: string;
  LangPtr: Pointer;
begin
  Len := MAX_PATH + 1;
  GetMem(SysDir, Len);
  try
    if Windows.GetSystemDirectory(SysDir, Len) <> 0 then
      SystemDir := SysDir;
  finally
    FreeMem(SysDir);
  end;
  result := '';
  InfoType := 'FileVersion';
  FName := Pchar(SystemDir + '\shdocvw.dll');
  InfoSize := GetFileVersionInfoSize(Fname, Len);
  if (InfoSize > 0) then
  begin
    GetMem(Info, InfoSize);
    try
      if GetFileVersionInfo(FName, Len, InfoSize, Info) then
      begin
        Len := 255;
        if VerQueryValue(Info, '\VarFileInfo\Translation', LangPtr, Len) then
          InfoType := Format('\StringFileInfo\%0.4x%0.4x\%s'#0, [LoWord(LongInt(LangPtr^)),
            HiWord(LongInt(LangPtr^)), InfoType]);
        if VerQueryValue(Info, Pchar(InfoType), InfoData, len) then
          Result := strPas(InfoData);
      end;
    finally
      FreeMem(Info, InfoSize);
    end;
  end;
end;


function ResolveUrlIni(Filename: string): string;
var
  ini: TiniFile;
begin
  result := '';
  ini := TIniFile.create(fileName);
  try
    result := ini.ReadString('InternetShortcut', 'URL', '');
  finally
    ini.free;
  end;
end;

function ResolveUrlIntShCut(Filename: string): string;
var
  IURL: IUniformResourceLocator;
  PersistFile: IPersistfile;
  FName: array[0..MAX_PATH] of WideChar;
  p: Pchar;
begin
  if Succeeded(CoCreateInstance(CLSID_InternetShortcut, nil, CLSCTX_INPROC_SERVER,
    IID_IUniformResourceLocator, IURL))
    then begin
    Persistfile := IUrl as IPersistFile;
    StringToWideChar(FileName, FName, MAX_PATH);
    PersistFile.Load(Fname, STGM_READ);
    IUrl.geturl(@P);
    Result := P;
  end;
end;

function ResolveChannel(pFolder: IShellFolder; pidl: PItemIDList; var lpszURL: string): HRESULT;
var
  pidlChannel: PItemIDList;
  psfDesktop: IShellFolder;
  pShellLink: IShellLink;
begin
  Result := S_FALSE;
  if Succeeded(pFolder.GetUIObjectOf(0, 1, pidl, IShellLink, nil, Pointer(pShellLink)))
    then
    if Succeeded(pShellLink.GetIDList(pidlChannel)) then
      if Succeeded(SHGetDesktopFolder(psfDesktop))
        then
      begin
        lpszURL := getDisplayName(psfDesktop, PidlChannel);
        Result := S_OK;
      end;
  DisposePidl(PidlChannel);
end;

function ResolveLink(const path: string): string;
var
  link: IShellLink;
  storage: IPersistFile;
  filedata: TWin32FindData;
  buf: array[0..MAX_PATH] of Char;
  widepath: WideString;
begin
  OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER, IShellLink, link));
  OleCheck(link.QueryInterface(IPersistFile, storage));
  widepath := path;
  Result := '';
  if Succeeded(storage.Load(@widepath[1], STGM_READ)) then
    if Succeeded(link.Resolve(GetActiveWindow, SLR_NOUPDATE)) then
      if Succeeded(link.GetPath(buf, sizeof(buf), filedata, SLGP_UNCPRIORITY)) then
        Result := buf;
  storage := nil;
  link := nil;
end;

function ExtractUrl(ShellFolder: IShellFolder; pidl: PItemIDList): string;
var
  Handle: THandle;
  Info: IQueryInfo;
  W: PWideChar;
begin
  Handle := 0;
  Info := nil;
  ShellFolder.GetUIObjectOf(Handle, 1, pidl, IID_IQUERYINFO, nil, Pointer(Info));
  if assigned(Info) then
  begin
    Info.GetInfoTip(0, w);
    Result := W;
  end else result := '';
  Result := Trim(Copy(Result, Pos(#10, Result) + 1, length(Result)));
end;

function IsFolder(ShellFolder: IShellFolder; ID: PItemIDList): Boolean;
var
  Flags: UINT;
begin
  Flags := SFGAO_FOLDER;
  ShellFolder.GetAttributesOf(1, ID, Flags);
  Result := SFGAO_FOLDER and Flags <> 0;
end;

function IsChannel(ChannelShortcut: String; ShellFolder: IShellFolder; ID: PItemIDList): Boolean;
var
  FileInfo: TShFileInfo;
begin
SHGetFileInfo(Pchar(ID), 0, FileInfo, SizeOf(TSHFileInfo), SHGFI_PIDL or SHGFI_TYPENAME);
Result:=BOOL(fileinfo.szTypeName = ChannelShortcut);
end;


function IsFolderEx(ChannelShortcut: String; ShellFolder: IShellFolder; ID: PItemIDList): Boolean;
var
  Flags: UINT;
begin
  Flags := SFGAO_FOLDER;
  ShellFolder.GetAttributesOf(1, ID, Flags);
If SFGAO_FOLDER and Flags <> 0 then
result:=not isChannel(ChannelShortcut, Shellfolder, id)
else Result:=False;
end;

function GetImageIndex(pidl: PItemIDList): integer;
var
  Flags: UINT;
  FileInfo: TSHFileInfo;
begin
  Flags := SHGFI_PIDL or SHGFI_SYSICONINDEX or SHGFI_ICON or SHGFI_SMALLICON;
  if SHGetFileInfo(PChar(pidl), 0, FileInfo, SizeOf(TSHFileInfo), Flags) = 0 then
    Result := -1
  else
    Result := FileInfo.iIcon;
end;

function GetDisplayName(Folder: IShellFolder; pidl: PItemIDList): string;
var
  StrRet: TStrRet;
begin
  Folder.GetDisplayNameOf(pidl, SHGDN_NORMAL, StrRet);
  case StrRet.uType of
    STRRET_CSTR:
      SetString(Result, StrRet.cStr, lStrLen(StrRet.cStr));
    STRRET_OFFSET:
        Result := Pchar(@pidl.mkid.abID[StrRet.uOffset - SizeOf(pidl.mkid.cb)]);
    STRRET_WSTR:
      Result := StrRet.pOleStr;
  end;
end;

function GetFileName(Folder: IShellFolder; pidl: PItemIDList): string;
var
  StrRet: TStrRet;
begin
  Folder.GetDisplayNameOf(pidl, SHGDN_FORPARSING, StrRet);
  case StrRet.uType of
    STRRET_CSTR:
      SetString(Result, StrRet.cStr, lStrLen(StrRet.cStr));
    STRRET_OFFSET:
        Result:= Pchar(@pidl.mkid.abID[StrRet.uOffset - SizeOf(pidl.mkid.cb)]);
    STRRET_WSTR:
      Result := StrRet.pOleStr;
  end;
end;

procedure DisposePIDL(ID: PItemIDList);
var
  Malloc: IMalloc;
begin
  if ID = nil then Exit;
  OLECheck(SHGetMalloc(Malloc));
  Malloc.Free(ID);
end;

function CopyITEMID(Malloc: IMalloc; ID: PItemIDList): PItemIDList;
begin
  Result := Malloc.Alloc(ID^.mkid.cb + SizeOf(ID^.mkid.cb));
  CopyMemory(Result, ID, ID^.mkid.cb + SizeOf(ID^.mkid.cb));
end;

function NextPIDL(IDList: PItemIDList): PItemIDList;
begin
  Result := IDList;
  Inc(PChar(Result), IDList^.mkid.cb);
end;

function GetPIDLSize(IDList: PItemIDList): Integer;
begin
  Result := 0;
  if Assigned(IDList) then
  begin
    Result := SizeOf(IDList^.mkid.cb);
    while IDList^.mkid.cb <> 0 do
    begin
      Result := Result + IDList^.mkid.cb;
      IDList := NextPIDL(IDList);
    end;
  end;
end;

procedure StripLastID(IDList: PItemIDList);
var
  MarkerID: PItemIDList;
begin
  MarkerID := IDList;
  if Assigned(IDList) then
  begin
    while IDList.mkid.cb <> 0 do
    begin
      MarkerID := IDList;
      IDList := NextPIDL(IDList);
    end;
    MarkerID.mkid.cb := 0;
  end;
end;

function CreatePIDL(Size: Integer): PItemIDList;
var
  Malloc: IMalloc;
  HR: HResult;
begin
  Result := nil;
  HR := SHGetMalloc(Malloc);
  if Failed(HR) then
    Exit;
  try
    Result := Malloc.Alloc(Size);
    if Assigned(Result) then
      FillChar(Result^, Size, 0);
  finally
  end;
end;

function CopyPIDL(IDList: PItemIDList): PItemIDList;
var
  Size: Integer;
begin
  Size := GetPIDLSize(IDList);
  Result := CreatePIDL(Size);
  if Assigned(Result) then
    CopyMemory(Result, IDList, Size);
end;

function ConcatPIDLs(IDList1, IDList2: PItemIDList): PItemIDList;
var
  cb1, cb2: Integer;
begin
  if Assigned(IDList1) then
    cb1 := GetPIDLSize(IDList1) - SizeOf(IDList1^.mkid.cb)
  else
    cb1 := 0;
  cb2 := GetPIDLSize(IDList2);
  Result := CreatePIDL(cb1 + cb2);
  if Assigned(Result) then
  begin
    if Assigned(IDList1) then
      CopyMemory(Result, IDList1, cb1);
    CopyMemory(PChar(Result) + cb1, IDList2, cb2);
  end;
end;

end.

