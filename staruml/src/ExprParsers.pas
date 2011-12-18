unit ExprParsers;

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
  PGMR101Lib_TLB,
  Classes;

const
  // Grammar file path
  // Grammar directory must be assigned as value specified in registry
  GMR_FILE_NAME = 'NameExpr.GMR';
  GMR_FILE_ATTR = 'AttrExpr.GMR';
  GMR_FILE_OPER = 'OperExpr.GMR';
  GMR_FILE_OBJ = 'ObjExpr.GMR';
  GMR_FILE_ROLE = 'RoleExpr.GMR';
  GMR_FILE_MSG = 'MsgExpr.GMR';

type
  // PParseStatus
  PParseStatus = (psNotIntialized, psError, psDefective, psRecovered ,psComplete);

  // PExpressionParser
  PExpressionParser = class
  private
    FParser: TPgmr;
    FInitialized: Boolean;
    function PickoutValue(StartingNode: Integer; SearchPath: string): string;
  protected
    procedure ClearProperties; virtual; abstract;
    procedure PickoutValues; virtual; abstract;
    function ReparsePart(Source: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(Source: string): PParseStatus;
    property Initialzied: Boolean read FInitialized;
  end;

  // PGeneralNameExpressionParser
  PGeneralNameExpressionParser = class(PExpressionParser)
  private
    FStereotype: string;
    FVisibility: string;
    FName: string;
  protected
    procedure ClearProperties; override;
    procedure PickoutValues; override;
  public
    constructor Create;
    property Stereotype: string read FStereoType;
    property Visibility: string read FVisibility;
    property Name: string read FName;
  end;

  // PAttributeExpressionParser
  PAttributeExpressionParser = class(PExpressionParser)
  private
    FStereotype: string;
    FVisibility: string;
    FName: string;
    FTypeExpression: string;
    FMultiplicity: string;
    FOrdering: string;
    FInitialValue: string;
  protected
    procedure ClearProperties; override;
    procedure PickoutValues; override;
  public
    constructor Create;
    property Stereotype: string read FStereotype;
    property Visibility: string read FVisibility;
    property Name: string read FName;
    property TypeExpression: string read FTypeExpression;
    property Multiplicity: string read FMultiplicity;
    property Ordering: string read FOrdering;
    property InitialValue: string read FInitialValue;
  end;

  // POperationExpressionParser
  POperationExpressionParser = class(PExpressionParser)
  private
    FStereotype: string;
    FVisibility: string;
    FName: string;
    FParameterKinds: TStringList;
    FParameterNames: TStringList;
    FParameterTypeExpressions: TStringList;
    FParameterDefaultValues: TStringList;
    FReturnTypeExpression: string;
    function GetParameterCount: Integer;
    function GetParameterKind(Index: Integer): string;
    function GetParameterName(Index: Integer): string;
    function GetParameterTypeExpression(Index: Integer): string;
    function GetParameterDefaultValue(Index: Integer): string;
  protected
    procedure ClearProperties; override;
    procedure PickoutValues; override;
  public
    constructor Create;
    destructor Destroy; override;
    property Stereotype: string read FStereotype;
    property Visibility: string read FVisibility;
    property Name: string read FName;
    property ParameterCount: Integer read GetParameterCount;
    property ParameterKinds[Index: Integer]: string read GetParameterKind;
    property ParameterNames[Index: Integer]: string read GetParameterName;
    property ParameterTypeExpressions[Index: Integer]: string read GetParameterTypeExpression;
    property ParameterDefaultValues[Index: Integer]: string read GetParameterDefaultValue;
    property ReturnTypeExpression: string read FReturnTypeExpression;
  end;

  // PClassifierRoleExpressionParser
  PClassifierRoleExpressionParser = class(PExpressionParser)
  private
    FStereotype: string;
    FVisibility: string;
    FRoleName: string;
    FClassifierName: string;
  protected
    procedure ClearProperties; override;
    procedure PickoutValues; override;
  public
    constructor Create;
    property Stereotype: string read FStereoType;
    property Visibility: string read FVisibility;
    property RoleName: string read FRoleName;
    property ClassifierName: string read FClassifierName;
  end;

  // PObjectExpressionParser
  PObjectExpressionParser = class(PExpressionParser)
  private
    FStereotype: string;
    FVisibility: string;
    FObjectName: string;
    FClassifierName: string;
  protected
    procedure ClearProperties; override;
    procedure PickoutValues; override;
  public
    constructor Create;
    property Stereotype: string read FStereoType;
    property Visibility: string read FVisibility;
    property ObjectName: string read FObjectName;
    property ClassifierName: string read FClassifierName;
  end;

  // PMessageExpressionParser
  PMessageExpressionParser = class(PExpressionParser)
  private
    FStereotype: string;
    FMessageName: string;
    FArguments: string;
    FIteration: string;
    FBranch: string;
    FReturn: string;
  protected
    procedure ClearProperties; override;
    procedure PickoutValues; override;
  public
    constructor Create;
    property Stereotype: string read FStereotype;
    property MessageName: string read FMessageName;
    property Arguments: string read FArguments;
    property Iteration: string read FIteration;
    property Branch: string read FBranch;
    property Return: string read FReturn;
  end;

  // Utilities
  function GetAppDir: string;

implementation

uses
  Forms, SysUtils;

const
  // Error detail name
  ED_NAME = 'AttrName';
  ED_DESCRIPTION = 'Description';
  ED_EXPECTING = 'Expecting';
  ED_LINENUM = 'LineNumber';
  ED_NODEID = 'NodeID';
  ED_NUMCHARS = 'NumChars';
  ED_PATHNAME = 'PathName';
  ED_SEVERITY = 'Severity';
  ED_START_POS = 'StartPos';
  ED_SYMBOL_ID = 'SymbolID';
  ED_SYMBOL_NAME = 'SymbolName';

  // Error severity code
  ES_FATAL = '0';
  ES_SEVERE = '1';
  ES_UNRECOVERABLE = '2';
  ES_RECOVERABLE = '3';

////////////////////////////////////////////////////////////////////////////////
// PExpressionParser

constructor PExpressionParser.Create;
begin
  inherited;
  FParser := TPgmr.Create(Application);
  FInitialized := False;
end;

destructor PExpressionParser.Destroy;
begin
  FParser.Free;
  FParser := nil;
  inherited;
end;

function PExpressionParser.PickoutValue(StartingNode: Integer; SearchPath: string): string;
var
  SearchID: Integer;
  NodeID: Integer;
begin
  Result := '';
  SearchID := FParser.StartSearch(SearchPath, StartingNode);
  NodeID := FParser.FindNext(SearchID);
  if NodeID <> 0 then
    Result := Trim(FParser.GetValue(NodeID));
  FParser.EndSearch(SearchID);
end;

function PExpressionParser.ReparsePart(Source: string): Boolean;
var
  DefRemoved: Boolean;
  P: Integer;
  S: string;
  I: Integer;
begin
  Result := False;
  P := StrToIntDef(FParser.GetErrorDetail(0, ED_START_POS), -1);
  if P > 0 then begin
    S := Copy(Source, 1, P - 1);
    FParser.SetInputString(S);

    if FPArser.Parse <> pgStatusComplete then begin
      Result := False;
      Exit;
    end;

    DefRemoved := True;
    for I := 0 to FParser.GetNumErrors - 1 do begin
      if FParser.GetErrorDetail(I, ED_SEVERITY) <> ES_RECOVERABLE then
        DefRemoved := False;
    end;
    Result := DefRemoved;
  end;
end;

function PExpressionParser.Parse(Source: string): PParseStatus;
var
  I: Integer;
  Recoverable: Boolean;
begin
  ClearProperties;

  if not FInitialized then begin
    Result := psNotIntialized;
    Exit;
  end;

  if Source = '' then begin
    Result := psComplete;
    Exit;
  end;

  FParser.SetInputString(Source);
  Result := psComplete;

  if FParser.Parse <> pgStatusComplete then begin
    Result := psError;
    Exit;
  end
  else if FParser.GetNumErrors > 0 then begin
    Recoverable := True;
    for I := 0 to FParser.GetNumErrors - 1 do begin
      if FParser.GetErrorDetail(I, ED_SEVERITY) <> ES_RECOVERABLE then
        Recoverable := False;
    end;

    if Recoverable then
      Result := psRecovered
    else begin
      if ReparsePart(Source) then
        Result := psDefective
      else begin
        Result := psError;
        Exit;
      end;
    end;

  end;
  PickoutValues;
end;

// PExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PGeneralNameExpressionParser

constructor PGeneralNameExpressionParser.Create;
begin
  inherited;
  FInitialized := FParser.SetGrammar(GetAppDir + GMR_FILE_NAME);
  FParser.SetStartSymbol(FParser.GetSymbolID('general_name_expression'));
end;

procedure PGeneralNameExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FVisibility := '';
  FName := '';
end;

procedure PGeneralNameExpressionParser.PickoutValues;
var
  RootNode: Integer;
begin
  RootNode := FParser.GetChild(FParser.GetRoot, 0);
  FStereoType := PickoutValue(RootNode, '.stereotype_part.stereotype');
  FVisibility := PickoutValue(RootNode, '.visibility');
  FName := PickoutValue(RootNode, '.name');
end;

// PGeneralNameExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PAttributeExpressionParser

constructor PAttributeExpressionParser.Create;
begin
  inherited;
  FInitialized := FParser.SetGrammar(GetAppDir + GMR_FILE_ATTR);
  FParser.SetStartSymbol(FParser.GetSymbolID('attribute_expression'));
end;

procedure PAttributeExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FVisibility := '';
  FName := '';
  FTypeExpression := '';
  FMultiplicity := '';
  FOrdering := '';
  FInitialValue := '';
end;

procedure PAttributeExpressionParser.PickoutValues;
var
  RootNode: Integer;
begin
  RootNode := FParser.GetChild(FParser.GetRoot, 0);
  FStereotype := PickoutValue(RootNode, '.stereotype_part.stereotype');
  FVisibility := PickoutValue(RootNode, '.visibility');
  FName := PickoutValue(RootNode, '.attribute_name');
  FTypeExpression := PickoutValue(RootNode, '.type_expression_part.type_expression');
  FMultiplicity := PickoutValue(RootNode, '.multiplicity_part.multiplicity_term');
  FOrdering := PickoutValue(RootNode, '.multiplicity_part.ordering_term');
  FInitialValue := PickoutValue(RootNode, '.initial_value_part.initial_value');
end;

// PAttributeExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// POperationExpressionParser

constructor POperationExpressionParser.Create;
begin
  inherited;
  FParameterKinds := TStringList.Create;
  FParameterNames := TStringList.Create;
  FParameterTypeExpressions := TStringList.Create;
  FParameterDefaultValues := TStringList.Create;
  FInitialized := FParser.SetGrammar(GetAppDir + GMR_FILE_OPER);
  FParser.SetStartSymbol(FParser.GetSymbolID('operation_expression'));
end;

destructor POperationExpressionParser.Destroy;
begin
  FParameterKinds.Free;
  FParameterNames.Free;
  FParameterTypeExpressions.Free;
  FParameterDefaultValues.Free;
  inherited;
end;

function POperationExpressionParser.GetParameterCount: Integer;
begin
  Result := FParameterNames.Count;
end;

function POperationExpressionParser.GetParameterKind(Index: Integer): string;
begin
  // PRECONDITIONS
  Assert((Index >= 0) and (Index <= FParameterKinds.Count - 1), 'Index must be wothin range of Parametercount');
  // PRECONDITIONS
  Result := FParameterKinds[Index];
end;

function POperationExpressionParser.GetParameterName(Index: Integer): string;
begin
  // PRECONDITIONS
  Assert((Index >= 0) and (Index <= FParameterKinds.Count - 1), 'Index must be wothin range of Parametercount');
  // PRECONDITIONS
  Result := FParameterNames[Index];
end;

function POperationExpressionParser.GetParameterTypeExpression(Index: Integer): string;
begin
  // PRECONDITIONS
  Assert((Index >= 0) and (Index <= FParameterKinds.Count - 1), 'Index must be wothin range of Parametercount');
  // PRECONDITIONS
  Result := FParameterTypeExpressions[Index];
end;

function POperationExpressionParser.GetParameterDefaultValue(Index: Integer): string;
begin
  // PRECONDITIONS
  Assert((Index >= 0) and (Index <= FParameterKinds.Count - 1), 'Index must be wothin range of Parametercount');
  // PRECONDITIONS
  Result := FParameterDefaultValues[Index];
end;

procedure POperationExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FVisibility := '';
  FName := '';
  FReturnTypeExpression := '';
  FParameterKinds.Clear;
  FParameterNames.Clear;
  FParameterTypeExpressions.Clear;
  FParameterDefaultValues.Clear;
end;

procedure POperationExpressionParser.PickoutValues;
var
  RootNode: Integer;
  SearchID: Integer;
  NodeID: Integer;
begin
  RootNode := FParser.GetChild(FParser.GetRoot, 0);

  FStereotype := PickoutValue(RootNode, '.stereotype_part.stereotype');
  FVisibility := PickoutValue(RootNode, '.visibility');
  FName := PickoutValue(RootNode, '.operation_name');
  FReturnTypeExpression := PickoutValue(RootNode, '.return_type_expression_part.return_type_expression');
  // Extract Parameters
  SearchID := FParser.StartSearch('.parameter_list_part.*parameter', RootNode);
  NodeID := FParser.FindNext(SearchID);
  while (NodeID <> 0) do begin
    FParameterKinds.Add(PickoutValue(NodeID, '.parameter_kind'));
    FParameterNames.Add(PickoutValue(NodeID, '.parameter_name'));
    FParameterTypeExpressions.Add(PickoutValue(NodeID, '.parameter_type_expression'));
    FParameterDefaultValues.Add(PickoutValue(NodeID, '.parameter_default_value'));
    NodeID := FParser.FindNext(SearchID);
  end;
  FParser.EndSearch(SearchID);
end;

// POperationExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PClassifierRoleExpressionParser

constructor PClassifierRoleExpressionParser.Create;
begin
  inherited;
  FInitialized := FParser.SetGrammar(GetAppDir + GMR_FILE_ROLE);
  FParser.SetStartSymbol(FParser.GetSymbolID('classifier_role_expression'));
end;

procedure PClassifierRoleExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FVisibility := '';
  FRoleName := '';
  FClassifierName := '';
end;

procedure PClassifierRoleExpressionParser.PickoutValues;
var
  RootNode: Integer;
begin
  RootNode := FParser.GetChild(FParser.GetRoot, 0);
  FStereotype := PickoutValue(RootNode, '.stereotype_part.stereotype');
  FVisibility := PickoutValue(RootNode, '.classifier_role_name_part.visibility');
  FRoleName := PickoutValue(RootNode, '.classifier_role_name_part.classifier_role_name');
  FClassifierName := PickoutValue(RootNode, '.classifier_name_part.classifier_name');
end;

// PClassifierRoleExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PObjectExpressionParser

constructor PObjectExpressionParser.Create;
begin
  inherited;
  FInitialized := FParser.SetGrammar(GetAppDir + GMR_FILE_OBJ);
  FParser.SetStartSymbol(FParser.GetSymbolID('object_expression'));
end;

procedure PObjectExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FVisibility := '';
  FObjectName := '';
  FClassifierName := '';
end;

procedure PObjectExpressionParser.PickoutValues;
var
  RootNode: Integer;
begin
  RootNode := FParser.GetChild(FParser.GetRoot, 0);
  FStereotype := PickoutValue(RootNode, '.stereotype_part.stereotype');
  FVisibility := PickoutValue(RootNode, '.visibility');
  FObjectName := PickoutValue(RootNode, '.object_name');
  FClassifierName := PickoutValue(RootNode, '.classifier_name_part.classifier_name');
end;

// PClassifierRoleExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMessageExpressionParser

constructor PMessageExpressionParser.Create;
begin
  inherited;
  FInitialized := FParser.SetGrammar(GetAppDir + GMR_FILE_MSG);
  FParser.SetStartSymbol(FParser.GetSymbolID('message_expression'));
end;

procedure PMessageExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FMessageName := '';
  FArguments := '';
  FIteration := '';
  FBranch := '';
  FReturn := '';
end;

procedure PMessageExpressionParser.PickoutValues;
var
  RootNode: Integer;
begin
  RootNode := FParser.GetChild(FParser.GetRoot, 0);
  FStereotype := PickoutValue(RootNode, '.stereotype_part.stereotype');
  FMessageName := PickoutValue(RootNode, '.message_name');
  FArguments := PickoutValue(RootNode, '.argument_part.argument_string');
  FIteration := PickoutValue(RootNode, '.recurrence_part.iteration_clause_part.iteration_clause');
  FBranch := PickoutValue(RootNode, '.recurrence_part.branch_clause_part.branch_clause');
  FReturn := PickoutValue(RootNode, '.return_part.return_id');
end;

// PMessageExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilites

function GetAppDir: string;
begin
  Result := ExtractFileDir(Application.ExeName) + '\';
end;

// Utilites
////////////////////////////////////////////////////////////////////////////////

end.
