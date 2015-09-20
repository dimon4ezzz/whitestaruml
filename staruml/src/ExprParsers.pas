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
  Classes, ParserCore_TLB;


type
  // PParseStatus
  PParseStatus = (psNotIntialized, psError, psDefective, psRecovered ,psComplete);


  // PExpressionParser
  PExpressionParser = class
  private
    FParser: IParserCore;
    FInitialized: Boolean;
    FLastErrorMsg: string;
    function PickoutValue(SearchPath: string): string;
  protected
    procedure ClearProperties; virtual; abstract;
    procedure PickoutValues; virtual; abstract;
    //function ReparsePart(Source: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(Source: string): PParseStatus;
    property Initialized: Boolean read FInitialized;
    property LastErrorMsg: string read FLastErrorMsg;
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
  Forms, SysUtils, Dialogs;

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
  //FParser := TPgmr.Create(Application);
  FInitialized := False;
end;

destructor PExpressionParser.Destroy;
begin
  //FParser.Free;
  //FParser := nil;
  inherited;
end;

function PExpressionParser.PickoutValue(SearchPath: string): string;
begin
    Result := FParser.FindNodeValue(SearchPath);
end;


function PExpressionParser.Parse(Source: string): PParseStatus;
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

  Result := psComplete;

  if not FParser.Parse(Source) then begin
    Result := psError;
    //ShowMessage(FParser.GetFailMessage);
    FLastErrorMsg := FParser.GetFailMessage;
  end
  else
    PickoutValues;
end;

// PExpressionParser
////////////////////////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////////////////////////
// PGeneralNameExpressionParser

constructor PGeneralNameExpressionParser.Create;
begin
  inherited;
  try
    FParser := CoNameExprParserCoreImpl.Create;
  except
  end;
  if FParser <> nil then
    FInitialized := True

end;

procedure PGeneralNameExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FVisibility := '';
  FName := '';
end;

procedure PGeneralNameExpressionParser.PickoutValues;
begin
  FName := PickoutValue('name');
  FStereoType := PickoutValue('stereotype_part.stereotype');
  FVisibility := PickoutValue('visibility');

end;

// PGeneralNameExpressionParser
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PAttributeExpressionParser

constructor PAttributeExpressionParser.Create;
begin
  inherited;
  try
    FParser := CoAttrExprParserCoreImpl.Create;
  except
  end;
  if FParser <> nil then
    FInitialized := True
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
begin
  FStereotype := PickoutValue('stereotype_part.stereotype');
  FVisibility := PickoutValue('visibility');
  FName := PickoutValue('attribute_name');
  FTypeExpression := PickoutValue('type_expression_part.type_expression.type_id');
  FMultiplicity := PickoutValue('multiplicity_part.multiplicity_term');
  FOrdering := PickoutValue('multiplicity_part.ordering_term');
  FInitialValue := PickoutValue('initial_value_part.initial_value');
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

  try
    FParser := CoOperExprParserCoreImpl.Create;
  except
  end;
  if FParser <> nil then
    FInitialized := True
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
const
  ParamPrefixInit = 'parameter_list_part.parameter_list';
  ParameterNameSuffix = '.parameter_name';
  ParameterKindSuffix = '.parameter_kind';
  ParameterTypeSuffix = '.parameter_type_expression.type_expression.type_id';
  ParameterDefaultValueSuffix = 'parameter_default_value.parameter_default_value_literal';

var
  DataValue: string;
  DataPath: string;
  ParamPrefix: string;
  ParamCounter: Integer;
  I : Integer;
begin
  FStereotype := PickoutValue('stereotype_part.stereotype');
  FVisibility := PickoutValue('visibility');
  FName := PickoutValue('operation_name');
  FReturnTypeExpression := PickoutValue('return_type_expression_part.return_type_expression.type_expression.type_id');

  ParamPrefix := ParamPrefixInit + '.parameter';
  DataPath := ParamPrefix + ParameterNameSuffix;
  DataValue := PickoutValue(DataPath);
  ParamCounter := 1;
  while DataValue <> '' do
  begin
    FParameterNames.Insert(0,DataValue);

    DataPath := ParamPrefix + ParameterKindSuffix;
    DataValue := PickoutValue(DataPath);
    FParameterKinds.Insert(0,DataValue);

    DataPath := ParamPrefix + ParameterTypeSuffix;
    DataValue := PickoutValue(DataPath);
    FParameterTypeExpressions.Insert(0,DataValue);

    DataPath := ParamPrefix + ParameterDefaultValueSuffix;
    DataValue := PickoutValue(DataPath);
    FParameterDefaultValues.Insert(0,DataValue);

    ParamPrefix := ParamPrefixInit;
    for I := 1 to ParamCounter do
      ParamPrefix := ParamPrefix + '.parameter_list'; // Append .parameter_list for every param
    ParamPrefix := ParamPrefix + '.parameter';
    Inc(ParamCounter);

    DataPath := ParamPrefix + ParameterNameSuffix;
    DataValue := PickoutValue(DataPath);

  end;





end;

// POperationExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PClassifierRoleExpressionParser

constructor PClassifierRoleExpressionParser.Create;
begin
  inherited;
  try
    FParser := CoRoleExprParserCoreImpl.Create;
  except
  end;
  if FParser <> nil then
    FInitialized := True
end;

procedure PClassifierRoleExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FVisibility := '';
  FRoleName := '';
  FClassifierName := '';
end;

procedure PClassifierRoleExpressionParser.PickoutValues;
begin
  FStereotype := PickoutValue('stereotype_part.stereotype');
  FVisibility := PickoutValue('classifier_role_name_part.visibility');
  FRoleName := PickoutValue('classifier_role_name_part.classifier_role_name');
  FClassifierName := PickoutValue('classifier_name_part.classifier_name');
end;

// PClassifierRoleExpressionParser
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PObjectExpressionParser

constructor PObjectExpressionParser.Create;
begin
  inherited;
  try
    FParser := CoObjExprParserCoreImpl.Create;
  except
  end;
  if FParser <> nil then
    FInitialized := True
end;

procedure PObjectExpressionParser.ClearProperties;
begin
  FStereotype := '';
  FVisibility := '';
  FObjectName := '';
  FClassifierName := '';
end;

procedure PObjectExpressionParser.PickoutValues;
begin
  FStereotype := PickoutValue('stereotype_part.stereotype');
  FVisibility := PickoutValue('visibility');
  FObjectName := PickoutValue('object_name');
  FClassifierName := PickoutValue('classifier_name_part.classifier_name.type_id');
end;

// PClassifierRoleExpressionParser
////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////
// PMessageExpressionParser

constructor PMessageExpressionParser.Create;
begin
  inherited;
  try
    FParser := CoMsgExprParserCoreImpl.Create;
  except
  end;
  if FParser <> nil then
    FInitialized := True
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
begin
  FStereotype := PickoutValue('stereotype_part.stereotype');
  FMessageName := PickoutValue('message_name_clause.message_name');
  FArguments := PickoutValue('argument_part.argument_string');
  FIteration := PickoutValue('recurrence_part.iteration_clause_part.iteration_branch_clause');
  FBranch := PickoutValue('recurrence_part.branch_clause_part.iteration_branch_clause');
  FReturn := PickoutValue('message_name_clause.return_id');
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
