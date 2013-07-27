unit JavaParserObj;

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
{
  DATE: July 31, 2011
  AUTHOR: FRANK E. HERNANDEZ
  A.K.A: CODE MINION
  
  MODIFICATIONS:
  PJavaParserObj.AnalyzeJavaFieldDeclararion - Added check so that if
  it does not find a type, it then checks for 'enum_type' to see if the
  field is an enum. I had to modify the grammar and add this extra tag
  to handle enums. This meant that the old parser could not recognize
  enums as a type. Now, if it does not find the 'type' tag it will try
  to find the 'enum_type' tag.
}
interface

uses
  RevCore, JavaElements,
  Classes, SysUtils, PGMR101Lib_TLB;

const
  MSG_INVALID_BASENODE = 'Invalid base node';
  MSG_NODE_NOT_FOUND = 'Node not found';
  MSG_ANLYSIS_FAILED = 'Analysis failed';

  NOT_EXISTS = 0;   // node not exists

type
  // exceptions
  EAnalysisFailed = class(Exception);
  EInvalidBaseNode = class(Exception);
  ENodeNotFound = class(Exception);

  // PJavaParserObj
  PJavaParserObj = class
  private
    Pgmr: TPgmr;
    FPackages: TList;
    FCompilationUnits: TList;
    FErrorLine: Integer;
    FErrorLinePos: Integer;
    FErrorNumChars: Integer;
    FErrorDescription: string;
    function GetPackageCount: Integer;
    function GetPackage(Index: Integer): PJavaPackage;
    function GetCompilationUnitCount: Integer;
    function GetCompilationUnit(Index: Integer): PJavaCompilationUnit;
    function FindPackage(Path: string): PJavaPackage; overload;
    function FindPackage(Package: PJavaPackage; Path: string): PJavaPackage; overload;
    function FindDefaultPackage: PJavaPackage;
    function ParseJavaFile(FileName: string): Boolean;
    // source analyzing functions
    procedure AnalyzeJavaCompilationUnit(BaseNodeID: Integer; FileName: string);
    function AnalyzeJavaPackageDeclaration(BaseNodeID: Integer; ACompilationUnit: PJavaCompilationUnit): PJavaPackage;
    procedure AnalyzeJavaImportDeclaration(BaseNodeID: Integer; ACompilationUnit: PJavaCompilationUnit);
    procedure AnalyzeJavaTypeDeclaration(BaseNodeID: Integer; APackage: PJavaPackage; ACompilationUnit: PJavaCompilationUnit); overload;
    procedure AnalyzeJavaTypeDeclaration(BaseNodeID: Integer; AType: PJavaType; ACompilationUnit: PJavaCompilationUnit); overload;
    procedure FillOutClassAttributes(BaseNodeID: Integer; AClass: PJavaType);
    procedure AnalyzeJavaClassDeclaration(BaseNodeID: Integer; APackage: PJavaPackage; ACompilationUnit: PJavaCompilationUnit); overload;
    procedure AnalyzeJavaClassDeclaration(BaseNodeID: Integer; AType: PJavaType; ACompilationUnit: PJavaCompilationUnit); overload;
    procedure FillOutInterfaceAttributes(BaseNodeID: Integer; AInterface: PJavaType);
    // CODE MINION
    procedure AnalyzeJavaEnumDeclaration(BaseNodeID: Integer; APackage: PJavaPackage; ACompilationUnit: PJavaCompilationUnit); overload;
    procedure AnalyzeJavaEnumDeclaration(BaseNodeID: Integer; AType: PJavaType; ACompilationUnit: PJavaCompilationUnit); overload;
    procedure FillOutEnumAttributes(BaseNodeID: Integer; AClass: PJavaType);
    procedure AnalyzeJavaEnumMembersDeclaration(BaseNodeID: Integer; ADeclaringType: PJavaType);
    procedure AnalyzeJavaEnumFieldDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
    // CODE MINION
    procedure AnalyzeJavaInterfaceDeclaration(BaseNodeID: Integer; APackage: PJavaPackage; ACompilationUnit: PJavaCompilationUnit); overload;
    procedure AnalyzeJavaInterfaceDeclaration(BaseNodeID: Integer; AType: PJavaType; ACompilationUnit: PJavaCompilationUnit); overload;
    procedure AnalyzeJavaMembersDeclaration(BaseNodeID: Integer; ADeclaringType: PJavaType);
    procedure AnalyzeJavaFieldDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
    procedure AnalyzeJavaInitializerDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
    procedure AnalyzeJavaConstructorDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
    procedure AnalyzeJavaMethodDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
    procedure AnalyzeJavaParameterDeclaration(BaseNodeID: Integer; AMethod: PJavaMethod);
    function BuildPackageStructure(BaseNodeID: Integer): PJavaPackage;
    // assistant function
    procedure SetJavaMemberVisibilityAsDefault(AMember: PJavaMember);
    procedure SetJavaMemberVisibility(AMember: PJavaMember; NodeID: Integer);
    procedure SetJavaMemberPropertiesAsDefault(AMember: PJavaMember);
    procedure SetJavaMemberProperties(AMember: PJavaMember; NodeID: Integer); overload;
    procedure SetJavaElementRangeInfo(AElement: PJavaElement; NodeID: Integer);
    // utility functions
    function GetNodeSymbolName(NodeID: Integer): string;
    function GetNodeValue(BaseNodeID: Integer; Path: string): string;
    function ValueExists(BaseNodeID: Integer; SearchPattern: string; Value: string): Boolean;
    function GetNodeCount(BaseNodeID: Integer; SearchPattern: string): Integer;
    function GetPrevAdjacentNode(NodeID: Integer): Integer;
    function GetDllPath: string;
    function SetQualifiedFileName(var FileName: string): Boolean;
    // error check functions
    procedure CheckBaseNode(NodeID: Integer; SymbolName: string);
 
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function Parse(FileName: string): Boolean;
    property ErrorLine: Integer read FErrorLine;
    property ErrorLinePos: Integer read FErrorLinePos;
    property ErrorNumChars: Integer read FErrorNumChars;
    property ErrorDescription: string read FErrorDescription;
    property PackageCount: Integer read GetPackageCount;
    property Packages[Index: Integer]: PJavaPackage read GetPackage;
    property CompilationUnitCount: Integer read GetCompilationUnitCount;
    property CompilationUnits[Index: Integer]: PJavaCompilationUnit read GetCompilationUnit;
  end;

implementation

uses
  Windows, Forms;

/////////////////////////////////////////////////////////////////////////////
// PJavaParserObj

constructor PJavaParserObj.Create;
const
  JAVA_GRAMMAR_FILE_NAME = 'java.gmr';
  C_ERR_FILE_NOT_FOUND = ' file not found.';
var
  GrammarFileName: string;
begin
  inherited;
  GrammarFileName := JAVA_GRAMMAR_FILE_NAME;
  if not SetQualifiedFileName(GrammarFileName) then
    raise Exception.Create(JAVA_GRAMMAR_FILE_NAME + C_ERR_FILE_NOT_FOUND);
  Pgmr := TPgmr.Create(Application);
  Pgmr.SetGrammar(GrammarFileName);
  FPackages := TList.Create;
  FCompilationUnits := TList.Create;
  FErrorLine := -1;
  FErrorLinePos := -1;
  FErrorNumChars := 0;
  FErrorDescription := '';
end;

destructor PJavaParserObj.Destroy;
begin
  Clear;
  Pgmr.Free;
  FPackages.Free;
  FCompilationUnits.Free;
  inherited;
end;

function PJavaParserObj.GetPackageCount: Integer;
begin
  Result := FPackages.Count;
end;

function PJavaParserObj.GetPackage(Index: Integer): PJavaPackage;
begin
  Result := FPackages.Items[Index];
end;

function PJavaParserObj.GetCompilationUnitCount: Integer;
begin
  Result := FCompilationUnits.Count;
end;

function PJavaParserObj.GetCompilationUnit(Index: Integer): PJavaCompilationUnit;
begin
  Result := FCompilationUnits.Items[Index];
end;

function PJavaParserObj.FindPackage(Package: PJavaPackage; Path: string): PJavaPackage;
var
  P: PJavaPackage;
  I: Integer;
begin
  Result := nil;
  if Package.Path = Path then
    Result := Package
  else
    for I := 0 to Package.SubPackageCount - 1 do begin
      P := FindPackage(Package.SubPackages[I], Path);
      if P <> nil then begin
        Result := P;
        Exit;
      end;
    end;
end;

function PJavaParserObj.FindPackage(Path: string): PJavaPackage;
var
  P: PJavaPackage;
  I: Integer;
begin
  Result := nil;
  for I := 0 to PackageCount - 1 do begin
    P := FindPackage(Packages[I], Path);
    if P <> nil then begin
      Result := P;
      Exit;
    end;
  end;
end;

function PJavaParserObj.FindDefaultPackage: PJavaPackage;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to PackageCount - 1 do
    if Packages[I].IsDefaultPackage then begin
      Result := Packages[I];
      Exit;
    end;
end;

function PJavaParserObj.ParseJavaFile(FileName: string): Boolean;
var
  N: Integer;
  P: Integer;
  Success: Boolean;
begin
  Pgmr.SetInputFilename(FileName);
  Pgmr.Parse;

  Success := (Pgmr.Status = pgStatusComplete) and (Pgmr.GetNumErrors = 0);
  if Success then begin
    FErrorLine := -1;
    FErrorLinePos := -1;
    FErrorNumChars := 0;
    FErrorDescription := '';

    N := Pgmr.Find('compilation_unit', Pgmr.GetRoot);
    Assert(N <> NOT_EXISTS);
    AnalyzeJavaCompilationUnit(N, FileName);
  end
  else begin
    if Pgmr.Status = pgStatusError then begin
      FErrorLine := -1;
      FErrorLinePos := -1;
      FErrorNumChars := 0;
    end
    else begin
      P := StrToIntDef(Pgmr.GetErrorDetail(0, 'StartPos'), -1);
      FErrorLine := Pgmr.GetInputLineNumber(P);
      FErrorLinePos := P - Pgmr.GetInputLinePos(FErrorLine);
      FErrorNumChars := StrToIntDef(Pgmr.GetErrorDetail(0, 'NumChars'), 0);
    end;
    FErrorDescription := Pgmr.GetErrorDescription(0);
  end;
  Result := Success;
  Pgmr.SetInputFilename('');
end;

procedure PJavaParserObj.AnalyzeJavaCompilationUnit(BaseNodeID: Integer; FileName: string);
var
  JCompilationUnit: PJavaCompilationUnit;
  JPackage, DefaultPackage: PJavaPackage;
  SearchID: Integer;
  N, NT, NI: Integer;
begin
  CheckBaseNode(BaseNodeID, 'compilation_unit');

  JCompilationUnit := PJavaCompilationUnit.Create;
  FCompilationUnits.Add(JCompilationUnit);
  JCompilationUnit.FileName := FileName;

  // if default package (package not declared)
  N := Pgmr.Find('package_statement', BaseNodeID);
  if N = NOT_EXISTS then begin
    DefaultPackage := FindDefaultPackage;
    if DefaultPackage = nil then begin
      DefaultPackage := PJavaPackage.Create;
      DefaultPackage.Name := '';
      DefaultPackage.Path := '';
      DefaultPackage.IsDefaultPackage := True;
      FPackages.Add(DefaultPackage);
    end;
    DefaultPackage.AddCompilationUnit(JCompilationUnit);

    // types
    SearchID := Pgmr.StartSearch('type_declaration', BaseNodeID);
    NT := Pgmr.FindNext(SearchID);
    while NT <> NOT_EXISTS do begin
      AnalyzeJavaTypeDeclaration(NT, DefaultPackage, JCompilationUnit);
      NT := Pgmr.FindNext(SearchID);
    end;
    Pgmr.EndSearch(SearchID);
  end

  // if package declared
  else begin
    JPackage := AnalyzeJavaPackageDeclaration(N, JCompilationUnit);
    JPackage.AddCompilationUnit(JCompilationUnit);

    // types
    SearchID := Pgmr.StartSearch('type_declaration', BaseNodeID);
    NT := Pgmr.FindNext(SearchID);
    while NT <> NOT_EXISTS do begin
      AnalyzeJavaTypeDeclaration(NT, JPackage, JCompilationUnit);
      NT := Pgmr.FindNext(SearchID);
    end;
    Pgmr.EndSearch(SearchID);
  end;

  // imports
  SearchID := Pgmr.StartSearch('import_statement', BaseNodeID);
  NI := Pgmr.FindNext(SearchID);
  while NI <> NOT_EXISTS do begin
    AnalyzeJavaImportDeclaration(NI, JCompilationUnit);
    NI := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
end;

function PJavaParserObj.AnalyzeJavaPackageDeclaration(BaseNodeID: Integer; ACompilationUnit: PJavaCompilationUnit): PJavaPackage;
var
  JPackage: PJavaPackage;
  JPackageDeclaration: PJavaPackageDeclaration;
  N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'package_statement');

  JPackageDeclaration := PJavaPackageDeclaration.Create;
  SetJavaElementRangeInfo(JPackageDeclaration, BaseNodeID);
  JPackageDeclaration.Name := GetNodeValue(BaseNodeID, 'package_name');
  ACompilationUnit.PackageDeclaration := JPackageDeclaration;

  N := Pgmr.Find('package_name', BaseNodeID);
  Assert(N <> NOT_EXISTS);
  JPackage := BuildPackageStructure(N);
  Result := JPackage;
end;

procedure PJavaParserObj.AnalyzeJavaImportDeclaration(BaseNodeID: Integer; ACompilationUnit: PJavaCompilationUnit);
var
  JImport: PJavaImport;
  SearchID: Integer;
  NP, NQ, N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'import_statement');

  JImport := PJavaImport.Create;
  ACompilationUnit.AddImport(JImport);
  SetJavaElementRangeInfo(JImport, BaseNodeID);
  // if import package
  NP := Pgmr.Find('package_name', BaseNodeID);
  if NP <> NOT_EXISTS then begin
    JImport.Name := Pgmr.GetValue(NP) + '.*';
    JImport.IsOnDemand := True;
    // collect path fragments
    SearchID := Pgmr.StartSearch('qualified_name.ident', NP);
    N := Pgmr.FindNext(SearchID);
    while N <> NOT_EXISTS do begin
      JImport.AddPathFragment(Pgmr.GetValue(N));
      N := Pgmr.FindNext(SearchID);
    end;
    Pgmr.EndSearch(SearchID);
  end
  // if import qualified name
  else begin
    NQ := Pgmr.Find('qualified_name', BaseNodeID);
    Assert(NQ <> NOT_EXISTS);
    JImport.Name := Pgmr.GetValue(NQ);
    JImport.IsOnDemand := False;
    // collect path fragments
    SearchID := Pgmr.StartSearch('ident', NQ);
    N := Pgmr.FindNext(SearchID);
    while N <> NOT_EXISTS do begin
      JImport.AddPathFragment(Pgmr.GetValue(N));
      N := Pgmr.FindNext(SearchID);
    end;
    Pgmr.EndSearch(SearchID);
  end;
end;

procedure PJavaParserObj.AnalyzeJavaTypeDeclaration(BaseNodeID: Integer; APackage: PJavaPackage; ACompilationUnit: PJavaCompilationUnit);
var
  NC, NI: Integer;
begin
  CheckBaseNode(BaseNodeID, 'type_declaration');

  // classes
  NC := Pgmr.Find('class_declaration', BaseNodeID);
  if NC <> NOT_EXISTS then
    AnalyzeJavaClassDeclaration(NC, APackage, ACompilationUnit)

  else begin
    NC := Pgmr.Find('enum_declaration', BaseNodeID);
    if NC <> NOT_EXISTS then
      AnalyzeJavaEnumDeclaration(NC, APackage, ACompilationUnit)

    // interfaces
    else begin
      NI := Pgmr.Find('interface_declaration', BaseNodeID);
      Assert(NI <> NOT_EXISTS);
      AnalyzeJavaInterfaceDeclaration(NI, APackage, ACompilationUnit);
      end;
  end;
end;

procedure PJavaParserObj.AnalyzeJavaTypeDeclaration(BaseNodeID: Integer; AType: PJavaType; ACompilationUnit: PJavaCompilationUnit);
var
  NC, NI: Integer;
begin
  CheckBaseNode(BaseNodeID, 'type_declaration');

  // classes
  NC := Pgmr.Find('class_declaration', BaseNodeID);
  if NC <> NOT_EXISTS then
    AnalyzeJavaClassDeclaration(NC, AType, ACompilationUnit)
  // Enums
  else begin
    NC := Pgmr.Find('enum_declaration', BaseNodeID);
    if NC <> NOT_EXISTS then
      AnalyzeJavaEnumDeclaration(NC, AType, ACompilationUnit)
     // interfaces
    else begin
      NI := Pgmr.Find('interface_declaration', BaseNodeID);
      Assert(NI <> NOT_EXISTS);
      AnalyzeJavaInterfaceDeclaration(NI, AType, ACompilationUnit);
    end;
  end;
end;


//CODE MINION

procedure PJavaParserObj.FillOutEnumAttributes(BaseNodeID: Integer; AClass: PJavaType);
var
  NM, NP, N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'enum_declaration');

  // basic attributes
  SetJavaElementRangeInfo(AClass, BaseNodeID);
  AClass.Name := 'enum ' + GetNodeValue(BaseNodeID, 'class_name');
  AClass.IsClass := True;
  AClass.IsInterface := False;

  // comment
  NP := GetPrevAdjacentNode(BaseNodeID);
  if (NP <> NOT_EXISTS) and (GetNodeSymbolName(NP) = 'block_comment') then
    AClass.Documentation := Pgmr.GetValue(NP);

  // visibility & modifiers
  N := Pgmr.Find('modifiers', BaseNodeID);
  if N = NOT_EXISTS then begin
    SetJavaMemberVisibilityAsDefault(AClass);
    SetJavaMemberPropertiesAsDefault(AClass);
  end
  else begin
    SetJavaMemberVisibility(AClass, N);
    SetJavaMemberProperties(AClass, N);
  end;


  // members
  NM := Pgmr.Find('enum_field_declarations', BaseNodeID);
  if NM <> NOT_EXISTS then begin
    AnalyzeJavaEnumMembersDeclaration(NM, AClass);
  end;
end;

//CODE MINION
procedure PJavaParserObj.FillOutClassAttributes(BaseNodeID: Integer; AClass: PJavaType);
var
  SearchID: Integer;
  NE, NI, NM, NP, N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'class_declaration');

  // basic attributes
  SetJavaElementRangeInfo(AClass, BaseNodeID);
  AClass.Name := GetNodeValue(BaseNodeID, 'class_name');
  AClass.IsClass := True;
  AClass.IsInterface := False;

  // comment
  NP := GetPrevAdjacentNode(BaseNodeID);
  if (NP <> NOT_EXISTS) and (GetNodeSymbolName(NP) = 'block_comment') then
    AClass.Documentation := Pgmr.GetValue(NP);

  // visibility & modifiers
  N := Pgmr.Find('modifiers', BaseNodeID);
  if N = NOT_EXISTS then begin
    SetJavaMemberVisibilityAsDefault(AClass);
    SetJavaMemberPropertiesAsDefault(AClass);
  end
  else begin
    SetJavaMemberVisibility(AClass, N);
    SetJavaMemberProperties(AClass, N);
  end;

  // extends
  NE := Pgmr.Find('class_extends_clause.qualified_name', BaseNodeID);
  if NE <> NOT_EXISTS then
    AClass.SuperClass := Pgmr.GetValue(NE);

  // implements
  SearchID := Pgmr.StartSearch('class_implements_clause.qualified_name', BaseNodeID);
  NI := Pgmr.FindNext(SearchID);
  while NI <> NOT_EXISTS do begin
    AClass.AddSuperInterface(Pgmr.GetValue(NI));
    NI := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // members
  NM := Pgmr.Find('field_declarations', BaseNodeID);
  if NM <> NOT_EXISTS then begin
    AnalyzeJavaMembersDeclaration(NM, AClass);
  end;
end;

procedure PJavaParserObj.AnalyzeJavaClassDeclaration(BaseNodeID: Integer; APackage: PJavaPackage; ACompilationUnit: PJavaCompilationUnit);
var
  JType: PJavaType;
begin
  CheckBaseNode(BaseNodeID, 'class_declaration');

  JType := PJavaType.Create;
  APackage.AddType(JType);
  JType.IsLocal := False;
  JType.IsMember := False;
  JType.CompilationUnit := ACompilationUnit;
  FillOutClassAttributes(BaseNodeID, JType);
end;

procedure PJavaParserObj.AnalyzeJavaClassDeclaration(BaseNodeID: Integer; AType: PJavaType; ACompilationUnit: PJavaCompilationUnit);
var
  JType: PJavaType;
begin
  CheckBaseNode(BaseNodeID, 'class_declaration');

  JType := PJavaType.Create;
  AType.AddType(JType);
  JType.IsLocal := False;
  JType.IsMember := True;
  JType.CompilationUnit := ACompilationUnit;
  FillOutClassAttributes(BaseNodeID, JType);
end;

//CODE MINION
procedure PJavaParserObj.AnalyzeJavaEnumDeclaration(BaseNodeID: Integer; APackage: PJavaPackage; ACompilationUnit: PJavaCompilationUnit);
var
  JType: PJavaType;
begin
  CheckBaseNode(BaseNodeID, 'enum_declaration');

  JType := PJavaType.Create;
  //JType.Name := 'Test';
  APackage.AddType(JType);
  JType.IsLocal := False;
  JType.IsMember := False;
  JType.CompilationUnit := ACompilationUnit;
  FillOutEnumAttributes(BaseNodeID, JType);
end;

procedure PJavaParserObj.AnalyzeJavaEnumDeclaration(BaseNodeID: Integer; AType: PJavaType; ACompilationUnit: PJavaCompilationUnit);
var
  JType: PJavaType;
begin
  CheckBaseNode(BaseNodeID, 'enum_declaration');

  JType := PJavaType.Create;
  //JType.Name := 'Test';
  AType.AddType(JType);
  JType.IsLocal := False;
  JType.IsMember := True;
  JType.CompilationUnit := ACompilationUnit;
  FillOutEnumAttributes(BaseNodeID, JType);
end;
// CODE MINION
procedure PJavaParserObj.FillOutInterfaceAttributes(BaseNodeID: Integer; AInterface: PJavaType);
var
  SearchID: Integer;
  NI, NM, NP, N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'interface_declaration');

  // basic attributes
  SetJavaElementRangeInfo(AInterface, BaseNodeID);
  AInterface.Name := GetNodeValue(BaseNodeID, 'interface_name');
  AInterface.IsClass := False;
  AInterface.IsInterface := True;

  // comment
  NP := GetPrevAdjacentNode(BaseNodeID);
  if (NP <> NOT_EXISTS) and (GetNodeSymbolName(NP) = 'block_comment') then
    AInterface.Documentation := Pgmr.GetValue(NP);

  // visibility & modifiers
  N := Pgmr.Find('modifiers', BaseNodeID);
  if N = NOT_EXISTS then begin
    SetJavaMemberVisibilityAsDefault(AInterface);
    SetJavaMemberPropertiesAsDefault(AInterface);
  end
  else begin
    SetJavaMemberVisibility(AInterface, N);
    SetJavaMemberProperties(AInterface, N);
  end;

  // extends
  SearchID := Pgmr.StartSearch('interface_extends_clause.qualified_name', BaseNodeID);
  NI := Pgmr.FindNext(SearchID);
  while NI <> NOT_EXISTS do begin
    AInterface.AddSuperInterface(Pgmr.GetValue(NI));
    NI := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // members
  NM := Pgmr.Find('field_declarations', BaseNodeID);
  if NM <> NOT_EXISTS then begin
    AnalyzeJavaMembersDeclaration(NM, AInterface);
  end;
end;

procedure PJavaParserObj.AnalyzeJavaInterfaceDeclaration(BaseNodeID: Integer; APackage: PJavaPackage; ACompilationUnit: PJavaCompilationUnit);
var
  JType: PJavaType;
begin
  CheckBaseNode(BaseNodeID, 'interface_declaration');
  JType := PJavaType.Create;
  APackage.AddType(JType);
  JType.IsLocal := False;
  JType.IsMember := False;
  JType.CompilationUnit := ACompilationUnit;
  FillOutInterfaceAttributes(BaseNodeID, JType);
end;

procedure PJavaParserObj.AnalyzeJavaInterfaceDeclaration(BaseNodeID: Integer; AType: PJavaType; ACompilationUnit: PJavaCompilationUnit);
var
  JType: PJavaType;
begin
  CheckBaseNode(BaseNodeID, 'interface_declaration');
  JType := PJavaType.Create;
  AType.AddType(JType);
  JType.IsLocal := False;
  JType.IsMember := True;
  JType.CompilationUnit := ACompilationUnit;
  FillOutInterfaceAttributes(BaseNodeID, JType);
end;
//CODE MINION
procedure PJavaParserObj.AnalyzeJavaEnumMembersDeclaration(BaseNodeID: Integer; ADeclaringType: PJavaType);
var
  SearchID: Integer;
  N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'enum_field_declarations');


  // variables
  SearchID := Pgmr.StartSearch('enum_field_declaration.enum_variable_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaEnumFieldDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // variables
  SearchID := Pgmr.StartSearch('enum_field_declaration.variable_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaFieldDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // constructors
  SearchID := Pgmr.StartSearch('enum_field_declaration.constructor_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaConstructorDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // static initializers
  SearchID := Pgmr.StartSearch('enum_field_declaration.static_initializer', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaInitializerDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // methods
  SearchID := Pgmr.StartSearch('enum_field_declaration.method_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaMethodDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // types
  SearchID := Pgmr.StartSearch('enum_field_declaration.type_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaTypeDeclaration(N, ADeclaringType, ADeclaringType.CompilationUnit);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
end;
//CODE MINION
procedure PJavaParserObj.AnalyzeJavaMembersDeclaration(BaseNodeID: Integer; ADeclaringType: PJavaType);
var
  SearchID: Integer;
  N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'field_declarations');

  // CODE Minion:
  // In order to add more support for the enum I modified the
  // parser a bit further. Now, enums are treated like nested
  // classes.
  // Enum types
 {SearchID := Pgmr.StartSearch('field_declaration.enum_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaEnumTypeDeclaration(N, ADeclaringType, ADeclaringType.CompilationUnit);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
  }

  // variables
  SearchID := Pgmr.StartSearch('field_declaration.variable_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaFieldDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // constructors
  SearchID := Pgmr.StartSearch('field_declaration.constructor_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaConstructorDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // static initializers
  SearchID := Pgmr.StartSearch('field_declaration.static_initializer', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaInitializerDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // methods
  SearchID := Pgmr.StartSearch('field_declaration.method_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaMethodDeclararion(N, ADeclaringType);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // types
  SearchID := Pgmr.StartSearch('field_declaration.type_declaration', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaTypeDeclaration(N, ADeclaringType, ADeclaringType.CompilationUnit);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
end;

//CODE MINION
procedure PJavaParserObj.AnalyzeJavaEnumFieldDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
var
  JField: PJavaField;
  SearchID: Integer;
  FieldType, ContentType: string;
  TypeDim: Integer;
  Comment: string;
  NF, NM, NC: Integer;

begin
  CheckBaseNode(BaseNodeID, 'enum_variable_declaration');

  FieldType := '';//GetNodeValue(BaseNodeID, 'type.type_specifier');


  TypeDim := GetNodeCount(BaseNodeID, 'type.empty_subscripts');
  NM := Pgmr.Find('modifiers', BaseNodeID);

  // comment
  NC := GetPrevAdjacentNode(BaseNodeID);
  if (NC <> NOT_EXISTS) and (GetNodeSymbolName(NC) = 'block_comment') then
    Comment := Pgmr.GetValue(NC);

  SearchID := Pgmr.StartSearch('enum_variable_declarators.enum_variable_declarator', BaseNodeID);
  NF := Pgmr.FindNext(SearchID);
  while NF <> NOT_EXISTS do begin
    JField := PJavaField.Create;
    ADeclaringType.AddField(JField);
    SetJavaElementRangeInfo(JField, BaseNodeID);

    //ContentID := Pgmr.StartSearch('enum_variable_declarators.enum_variable_declarator.enum_conts', BaseNodeID);
    //NE := Pgmr.FindNext(ContentID);

    ContentType := GetNodeValue(NF, 'enum_conts');
    if ContentType<> '' then
       ContentType:= '('+ContentType+')';

    JField.Name := GetNodeValue(NF, 'ident') + ContentType;
    JField.Documentation := Comment;
    JField.Type_ := FieldType;
    JField.TypeDimension := TypeDim + GetNodeCount(NF, 'empty_subscripts');
    //JField.InitializerExpression := GetNodeValue(NF, 'enum_conts');
    if NM = NOT_EXISTS then begin
      SetJavaMemberVisibilityAsDefault(JField);
      SetJavaMemberPropertiesAsDefault(JField);
    end
    else begin
      SetJavaMemberVisibility(JField, NM);
      SetJavaMemberProperties(JField, NM);
    end;
    NF := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
end;
//CODE MINION
procedure PJavaParserObj.AnalyzeJavaFieldDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
var
  JField: PJavaField;
  SearchID: Integer;
  FieldType: string;
  TypeDim: Integer;
  Comment: string;
  NF, NM, NC: Integer;
begin
  CheckBaseNode(BaseNodeID, 'variable_declaration');

  // This section seems to be the one which gets the
  // name of the type. If so, I need to add a section of
  // code to check if a type is not found, then check for
  // enum_type, this way I can get the enums as types on the
  // final starUML diagram
  //
  // Comments By: Code Minion
  //
  FieldType := GetNodeValue(BaseNodeID, 'type.type_specifier');

  // Perhaps do something of the sort...
  // This should look for the enum_type, in my modification of the
  // grammar I have separated enums from the regular types, mainly
  // because then can be terminated by ";" like variable declarations
  // or not be terminated by ";" at all. GetNodeValue returns '' if
  // it does not find the node.
  //
  // Comments By: Code Minion
  //
  if(AnsiCompareStr(FieldType, '') = 0) then
	  FieldType := GetNodeValue(BaseNodeID, 'enum_type');

  TypeDim := GetNodeCount(BaseNodeID, 'type.empty_subscripts');
  NM := Pgmr.Find('modifiers', BaseNodeID);

  // comment
  NC := GetPrevAdjacentNode(BaseNodeID);
  if (NC <> NOT_EXISTS) and (GetNodeSymbolName(NC) = 'block_comment') then
    Comment := Pgmr.GetValue(NC);

  SearchID := Pgmr.StartSearch('variable_declarators.variable_declarator', BaseNodeID);
  NF := Pgmr.FindNext(SearchID);
  while NF <> NOT_EXISTS do begin
    JField := PJavaField.Create;
    ADeclaringType.AddField(JField);
    SetJavaElementRangeInfo(JField, BaseNodeID);
    JField.Name := GetNodeValue(NF, 'ident');
    JField.Documentation := Comment;
    JField.Type_ := FieldType;
    JField.TypeDimension := TypeDim + GetNodeCount(NF, 'empty_subscripts');
    JField.InitializerExpression := GetNodeValue(NF, 'variable_initializer');
    if NM = NOT_EXISTS then begin
      SetJavaMemberVisibilityAsDefault(JField);
      SetJavaMemberPropertiesAsDefault(JField);
    end
    else begin
      SetJavaMemberVisibility(JField, NM);
      SetJavaMemberProperties(JField, NM);
    end;
    NF := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
end;

procedure PJavaParserObj.AnalyzeJavaInitializerDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
var
  JInitializer: PJavaInitializer;
begin
  CheckBaseNode(BaseNodeID, 'static_initializer');
  JInitializer := PJavaInitializer.Create;
  ADeclaringType.AddInitializer(JInitializer);
  JInitializer.Name := '';
  SetJavaElementRangeInfo(JInitializer, BaseNodeID);
  SetJavaMemberVisibilityAsDefault(JInitializer);
  SetJavaMemberPropertiesAsDefault(JInitializer);
  JInitializer.IsStatic := True;
  JInitializer.Body := GetNodeValue(BaseNodeID, 'statement_block');
end;

procedure PJavaParserObj.AnalyzeJavaConstructorDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
var
  JMethod: PJavaMethod;
  SearchID: Integer;
  NE, NP, NC, N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'constructor_declaration');

  JMethod := PJavaMethod.Create;
  ADeclaringType.AddMethod(JMethod);
  SetJavaElementRangeInfo(JMethod, BaseNodeID);
  JMethod.Name := GetNodeValue(BaseNodeID, 'ident');
  JMethod.IsConstructor := True;
  JMethod.ReturnType := '';
  JMethod.ReturnTypeDimension := 0;
  JMethod.Body := GetNodeValue(BaseNodeID, 'statement_block');

  // comment
  NC := GetPrevAdjacentNode(BaseNodeID);
  if (NC <> NOT_EXISTS) and (GetNodeSymbolName(NC) = 'block_comment') then
    JMethod.Documentation := Pgmr.GetValue(NC);

  // visibility & modifiers
  N := Pgmr.Find('modifiers', BaseNodeID);
  if N = NOT_EXISTS then begin
    SetJavaMemberVisibilityAsDefault(JMethod);
    SetJavaMemberPropertiesAsDefault(JMethod);
  end
  else begin
    SetJavaMemberVisibility(JMethod, N);
    SetJavaMemberProperties(JMethod, N);
  end;

  // exceptions
  SearchID := Pgmr.StartSearch('throws_clause.exception_name', BaseNodeID);
  NE := Pgmr.FindNext(SearchID);
  while NE <> NOT_EXISTS do begin
    JMethod.AddException(Pgmr.GetValue(NE));
    NE := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // parameters
  SearchID := Pgmr.StartSearch('parameter_list.parameter', BaseNodeID);
  NP := Pgmr.FindNext(SearchID);
  while NP <> NOT_EXISTS do begin
    AnalyzeJavaParameterDeclaration(NP, JMethod);
    NP := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
end;

procedure PJavaParserObj.AnalyzeJavaMethodDeclararion(BaseNodeID: Integer; ADeclaringType: PJavaType);
var
  JMethod: PJavaMethod;
  SearchID: Integer;
  NE, NC, N: Integer;
begin
  CheckBaseNode(BaseNodeID, 'method_declaration');

  JMethod := PJavaMethod.Create;
  ADeclaringType.AddMethod(JMethod);
  SetJavaElementRangeInfo(JMethod, BaseNodeID);
  JMethod.Name := GetNodeValue(BaseNodeID, 'method_name');
  JMethod.IsConstructor := False;
  JMethod.ReturnType := GetNodeValue(BaseNodeID, 'type.type_specifier');
  JMethod.ReturnTypeDimension := GetNodeCount(BaseNodeID, 'type.empty_subscripts');
  JMethod.Body := GetNodeValue(BaseNodeID, 'statement_block');

  // comment
  NC := GetPrevAdjacentNode(BaseNodeID);
  if (NC <> NOT_EXISTS) and (GetNodeSymbolName(NC) = 'block_comment') then
    JMethod.Documentation := Pgmr.GetValue(NC);

  // visibility & modifiers
  N := Pgmr.Find('modifiers', BaseNodeID);
  if N = NOT_EXISTS then begin
    SetJavaMemberVisibilityAsDefault(JMethod);
    SetJavaMemberPropertiesAsDefault(JMethod);
  end
  else begin
    SetJavaMemberVisibility(JMethod, N);
    SetJavaMemberProperties(JMethod, N);
  end;

  // exceptions
  SearchID := Pgmr.StartSearch('throws_clause.exception_name', BaseNodeID);
  NE := Pgmr.FindNext(SearchID);
  while NE <> NOT_EXISTS do begin
    JMethod.AddException(Pgmr.GetValue(NE));
    NE := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);

  // parameters
  SearchID := Pgmr.StartSearch('parameter_list.parameter', BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    AnalyzeJavaParameterDeclaration(N, JMethod);
    N := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
end;

procedure PJavaParserObj.AnalyzeJavaParameterDeclaration(BaseNodeID: Integer; AMethod: PJavaMethod);
var
  JParameter: PJavaParameter;
begin
  CheckBaseNode(BaseNodeID, 'parameter');

  JParameter := PJavaParameter.Create;
  AMethod.AddParameter(JParameter);
  SetJavaElementRangeInfo(JParameter, BaseNodeID);
  JParameter.Name := GetNodeValue(BaseNodeID, 'ident');
  JParameter.Type_ := GetNodeValue(BaseNodeID, 'type.type_specifier');
  JParameter.TypeDimension := GetNodeCount(BaseNodeID, 'type.empty_subscripts');
end;

function PJavaParserObj.BuildPackageStructure(BaseNodeID: Integer): PJavaPackage;
var
  JPackage, ParentPackage: PJavaPackage;
  Path: string;
  IsFirst: Boolean;
  SearchID: Integer;
  NQ, NI: Integer;
begin
  CheckBaseNode(BaseNodeID, 'package_name');

  NQ := Pgmr.Find('qualified_name', BaseNodeID);
  Assert(NQ <> NOT_EXISTS);

  Path := '';
  IsFirst := True;
  JPackage := nil;
  ParentPackage := nil;

  SearchID := Pgmr.StartSearch('ident', NQ);
  NI := Pgmr.FindNext(SearchID);
  while NI <> NOT_EXISTS do begin
    if IsFirst then Path := Pgmr.GetValue(NI)
    else Path := Path + '.' + Pgmr.GetValue(NI);

    JPackage := FindPackage(Path);
    if JPackage = nil then begin
      JPackage := PJavaPackage.Create;
      JPackage.Name := Pgmr.GetValue(NI);
      JPackage.Line := -1;
      JPackage.Offset := -1;
      JPackage.Length := -1;
      JPackage.Path := Path;
      JPackage.IsDefaultPackage := False;
      if ParentPackage = nil then
        FPackages.Add(JPackage)
      else
        ParentPackage.AddSubPackage(JPackage);
    end;

    ParentPackage := JPackage;
    IsFirst := False;
    NI := Pgmr.FindNext(SearchID);
  end;
  Pgmr.EndSearch(SearchID);
  Result := JPackage;
end;

procedure PJavaParserObj.SetJavaMemberVisibilityAsDefault(AMember: PJavaMember);
begin
  AMember.Visibility := vkPackage;
end;

procedure PJavaParserObj.SetJavaMemberVisibility(AMember: PJavaMember; NodeID: Integer);
begin
  CheckBaseNode(NodeID, 'modifiers');

  if ValueExists(NodeID, 'modifier', 'public') then
    AMember.Visibility := vkPublic
  else if ValueExists(NodeID, 'modifier', 'protected') then
    AMember.Visibility := vkProtected
  else if ValueExists(NodeID, 'modifier', 'private') then
    AMember.Visibility := vkPrivate
  else
    AMember.Visibility := vkPackage;
end;

procedure PJavaParserObj.SetJavaMemberPropertiesAsDefault(AMember: PJavaMember);
begin
  AMember.IsAbstract := False;
  AMember.IsFinal := False;
  AMember.IsNative := False;
  AMember.IsStatic := False;
  AMember.IsStrictfp := False;
  AMember.IsSynchronized := False;
  AMember.IsTransient := False;
  AMember.IsVolatile := False;
end;

procedure PJavaParserObj.SetJavaMemberProperties(AMember: PJavaMember; NodeID: Integer);
begin
  CheckBaseNode(NodeID, 'modifiers');

  AMember.IsAbstract := ValueExists(NodeID, 'modifier', 'abstract');
  AMember.IsFinal := ValueExists(NodeID, 'modifier', 'final');
  AMember.IsNative := ValueExists(NodeID, 'modifier', 'native');
  AMember.IsStatic := ValueExists(NodeID, 'modifier', 'static');
  AMember.IsStrictfp := ValueExists(NodeID, 'modifier', 'strictfp');
  AMember.IsSynchronized := ValueExists(NodeID, 'modifier', 'synchronized');
  AMember.IsTransient := ValueExists(NodeID, 'modifier', 'transient');
  AMember.IsVolatile := ValueExists(NodeID, 'modifier', 'volatile');
end;

procedure PJavaParserObj.SetJavaElementRangeInfo(AElement: PJavaElement; NodeID: Integer);
begin
  AElement.Offset := Pgmr.GetValuePos(NodeID);
  AElement.Length := Pgmr.GetValueSize(NodeID);
  AElement.Line := Pgmr.GetInputLineNumber(AElement.Offset);
end;

function PJavaParserObj.GetNodeSymbolName(NodeID: Integer): string;
begin
  Result := Pgmr.GetSymbolName(Pgmr.GetNodeSymbolID(NodeID));
end;

function PJavaParserObj.GetNodeValue(BaseNodeID: Integer; Path: string): string;
var
  N: Integer;
begin
  N := Pgmr.Find(Path, BaseNodeID);
  if N = NOT_EXISTS then
    Result := ''
  else
    Result := Pgmr.GetValue(N);
end;

function PJavaParserObj.ValueExists(BaseNodeID: Integer; SearchPattern: string; Value: string): Boolean;
var
  SearchID: Integer;
  N: Integer;
begin
  Result := False;
  SearchID := Pgmr.StartSearch(SearchPattern, BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    if Pgmr.GetValue(N) = Value then begin
      Result := True;
      Exit;
    end;
    N := Pgmr.FindNext(SearchID);
  end;
end;

function PJavaParserObj.GetNodeCount(BaseNodeID: Integer; SearchPattern: string): Integer;
var
  SearchID: Integer;
  Count: Integer;
  N: Integer;
begin
  Count := 0;
  SearchID := Pgmr.StartSearch(SearchPattern, BaseNodeID);
  N := Pgmr.FindNext(SearchID);
  while N <> NOT_EXISTS do begin
    Count := Count + 1;
    N := Pgmr.FindNext(SearchID);
  end;
  Result := Count;
end;

function PJavaParserObj.GetPrevAdjacentNode(NodeID: Integer): Integer;
var
  N: Integer;
  Idx: Integer;
begin
  Result := NOT_EXISTS;
  N := NodeID;
  while (N <> NOT_EXISTS) do begin
    Idx := Pgmr.GetNodeIndex(N);
    if Idx <> 0 then begin
      Result := Pgmr.GetPrevSibling(N);
      Exit;
    end;
    N := Pgmr.GetParent(N);
  end;
end;

function PJavaParserObj.GetDllPath: string;
var
  ModuleName : array[0..1023] of char;
  Path: string;
begin
  FillChar(ModuleName, Sizeof(ModuleName), #10);
  GetModuleFileName(HInstance, ModuleName, Sizeof(ModuleName));
  Path := ExtractFileDir(ModuleName);
  Result := Path;
end;

function PJavaParserObj.SetQualifiedFileName(var FileName: string): Boolean;
const
  JAVA_GRAMMAR_FILE_LOCATION = 'modules\staruml-java15';
var
  QualifiedFileName: string;
begin
  Result := False;

  QualifiedFileName := GetDllPath + '\' + JAVA_GRAMMAR_FILE_LOCATION
    + '\' + FileName;
  if not FileExists(QualifiedFileName) then begin
    QualifiedFileName := GetDllPath + '\' + FileName;
    if not FileExists(QualifiedFileName) then
      Exit;
  end;

  FileName := QualifiedFileName;
  Result := True;
 end;


procedure PJavaParserObj.CheckBaseNode(NodeID: Integer; SymbolName: string);
begin
  if GetNodeSymbolName(NodeID) <> SymbolName then
    raise EInvalidBaseNode.Create(MSG_INVALID_BASENODE + '(' + SymbolName + ')');
end;

procedure PJavaParserObj.Clear;
var
  I: Integer;
begin
  for I := FPackages.Count - 1 downto 0 do begin
    PJavaPackage(FPackages.Items[I]).Free;
    FPackages.Delete(I);
  end;
  for I := FCompilationUnits.Count - 1 downto 0 do begin
    PJavaCompilationUnit(FCompilationUnits.Items[I]).Free;
    FCompilationUnits.Delete(I);
  end;
end;

function PJavaParserObj.Parse(FileName: string): Boolean;
begin
  Result := ParseJavaFile(FileName);
end;


// PJavaParserObj
/////////////////////////////////////////////////////////////////////////////

end.
