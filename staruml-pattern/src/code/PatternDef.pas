unit PatternDef;

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
  WhiteStarUML_TLB,
  Classes, SysUtils, comctrls, Forms, Windows, xmldom, XMLIntf, msxmldom, XMLDoc,
  MSScriptControl_TLB;

type
  PPatternParameter = class;

  // Exception
  EIllegal_XML_DOC = class(Exception);

  // PPatternParameterType
  PPatternParameterType = (ptInteger, ptBoolean, ptString, ptEnumeration, ptElement, ptElementList);

  // PPatternParameterElemKind
  PPatternParameterElemKind = (pkPackage, pkModel, pkSubsystem, pkClass, pkInterface, pkAttribute,
                               pkOperation, pkLiteral, pkParameter);

  // PPatternNode
  PPatternNode = class
  private
    FName: string;
  public
    property Name: string read FName write FName;
  end;

  // PPatternFolder
  PPatternFolder = class(PPatternNode)
  private
    FPathName: string;
    FPatternNodes: TList;
    function GetPatternNodeCount: Integer;
    function GetPatternNode(Index: Integer): PPatternNode;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ClearChildPatternNodes;
    procedure AddPatternNode(APatternNode: PPatternNode);
    procedure RemovePatternNode(APatternNode: PPatternNode);
    function IndexOfPatternNode(APatternNode: PPatternNode): Integer;
    property PathName: string read FPathName;
    property PatternNodeCount: Integer read GetPatternNodeCount;
    property PatternNodes[Index: Integer]: PPatternNode read GetPatternNode;
  end;

  // PPattern
  PPattern = class(PPatternNode)
  private
    FFileName: string;
    FFullPathName: string;
    FHelpFile: string;
    FScriptFile: string;
    FDescription: string;
    FIsLoaded: Boolean;
    FParameters: TList;
    procedure GenerateJScriptCode(Source: TStrings);
    procedure ExecuteJScript(Gen: TStrings);
    function GetParameters(Index: Integer): PPatternParameter;
    function GetPatternParameterCount: Integer; safecall;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadPattern();
    procedure ReadXMLFile();
    procedure ReadParametersElement(PatternParametersElement: IXMLNode);
    procedure AddPatternParameter(APatternParameter: PPatternParameter);
    procedure ApplyPattern();
    property FileName: string read FFileName;
    property HelpFile: string read FHelpFile;
    property ScriptFile: string read FScriptFile;
    property Description: string read FDescription;
    property IsLoaded: Boolean read FIsLoaded;
    property FullPathName: string read FFullPathName;
    property PatternParameterCount: Integer read GetPatternParameterCount;
    property Parameters[Index: Integer]: PPatternParameter read GetParameters;
  end;

  //PPatternParameter
  PPatternParameter = class
  private
    FID: string;
    FCaption: string;
    FDescription: string;
    FParamType: PPatternParameterType;
    FElementKind: PPatternParameterElemKind;
    FDefaultValue: string;
    FEnumerationLiterals: TStrings;
    FValue: string;
    FElementValues: TInterfaceList;
    function GetElementValue(Index: Integer): IUMLElement;
    function GetElementValueCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ClearElementValues();
    procedure AddElementValue(Value: IUMLElement);
    procedure RemoveElementValue(Value: IUMLElement);
    function StrToParamType(Value: string): PPatternParameterType;
    function StrToParamElemKind(Value: string): PPatternParameterElemKind;
    property ID: string read FID;
    property Caption: string read FCaption;
    property Description: string read FDescription;
    property ParamType: PPatternParameterType read FParamType;
    property ElementKind: PPatternParameterElemKind read FElementKind;
    property DefaultValue: string read FDefaultValue;
    property Value: string read FValue write FValue;
    property ElementValues[Index: Integer]: IUMLElement read GetElementValue;
    property ElementValueCount: Integer read GetElementValueCount;
    property EnumerationLiterals: TStrings read FEnumerationLiterals;
  end;

  //PPatternManager
  PPatternManager = class
  private
    FPatternRepository: PPatternFolder;
    function GetPathName: string;
  public
    StarUMLApp: IStarUMLApplication;
    constructor Create;
    destructor Destroy; override;
    procedure ScanPatternRepository(Pathname: string);
    property PathName: string read GetPathName;
    property PatternRepository: PPatternFolder read FPatternRepository;
  end;

var
  PatternManager: PPatternManager;

procedure SeparateStringByComma(Value: string; SL: TStringList);

implementation

uses
  Dialogs,
  Symbols, NLS_PatternAddIn;

////////////////////////////////////////////////////////////////////////////////
// PPatternFolder

constructor PPatternFolder.Create;
begin
  inherited;
  FPathName := '';
  FPatternNodes := TList.Create;
end;

destructor PPatternFolder.Destroy;
begin
  ClearChildPatternNodes;
  FPatternNodes.Free;
  inherited;
end;

function PPatternFolder.GetPatternNodeCount: Integer;
begin
  Result := FPatternNodes.Count;
end;

function PPatternFolder.GetPatternNode(Index: Integer): PPatternNode;
begin
  Result := FPatternNodes.Items[Index];
end;

procedure PPatternFolder.ClearChildPatternNodes;
var
  I: Integer;
  N: PPatternNode;
begin
  for I := FPatternNodes.Count - 1 downto 0 do begin
    N := FPatternNodes.Items[I];
    N.Free;
  end;
  FPatternNodes.Clear;
end;

procedure PPatternFolder.AddPatternNode(APatternNode: PPatternNode);
begin
   FPatternNodes.Add(APatternNode);
end;

procedure PPatternFolder.RemovePatternNode(APatternNode: PPatternNode);
begin
  FPatternNodes.Remove(APatternNode);
end;

function PPatternFolder.IndexOfPatternNode(APatternNode: PPatternNode): Integer;
begin
  Result := FPatternNodes.IndexOf(APatternNode);
end;

// PPatternFolder
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PPattern

constructor PPattern.Create;
begin
  inherited;
  FFileName := '';
  FHelpFile := '';
  FScriptFile := '';
  FDescription := '';
  FIsLoaded := False;
  FFullPathName := '';
  FParameters := TList.Create;
end;

destructor PPattern.Destroy;
var
  I: Integer;
  P: PPatternParameter;
begin
  for I := FParameters.Count - 1 downto 0 do begin
    P := FParameters.Items[I];
    P.Free;
  end;
  FParameters.Free;
  inherited;
end;

procedure PPattern.GenerateJScriptCode(Source: TStrings);
var
  I, J: Integer;
  PP: PPatternParameter;
  Str, StrParam: string;
  Elem: IUMLElement;
  JScript: TStringList;
  SL: TStringList;
  C: Integer;
begin
  if not FileExists(FFullPathName + FScriptFile) then
    raise Exception.Create(ERR_JSCRIPT_NOT_FOUND);

  JScript := TStringList.Create;
  try
    JScript.LoadFromFile(FFullPathName + FScriptFile);

    Source.Add(JSCRIPT_HEADER);
    for I := 0 to Self.PatternParameterCount - 1 do begin
      PP := Self.Parameters[I];
      case PP.ParamType of
        ptInteger:
          begin
            Source.Add(Format(JSCRIPT_NEW_INTEGER_VAL, [PP.ID, PP.Value]));
          end;
        ptBoolean:
          begin
            if LowerCase(PP.Value) = 'true' then
              Source.Add(Format(JSCRIPT_NEW_BOOLEAN_VAL, [PP.ID, 'true']))
            else
              Source.Add(Format(JSCRIPT_NEW_BOOLEAN_VAL, [PP.ID, 'false']));
          end;
        ptString:
          begin
            Source.Add(Format(JSCRIPT_NEW_STRING_VAL, [PP.ID, PP.Value]));
          end;
        ptEnumeration:
          begin
            Source.Add(Format(JSCRIPT_NEW_STRING_VAL, [PP.ID, PP.Value]));
          end;
        ptElement:
          begin
            if PP.FElementValues.Count = 0 then begin
               case PP.ElementKind of
                 pkPackage:
                   begin
                     Str := Format(JSCRIPT_NEW_ELEM_VAL, [PP.ID, 'Package', PP.ID, PP.Value]);
                     StrParam := Format(MSG_ELEM_CREATE, ['UMLPackage', PP.Value]);
                     Str := Str + Format(JSCRIPT_ADD_MESSAGE, [StrParam, PP.ID]);
                   end;
                 pkModel:
                   begin
                     Str := Format(JSCRIPT_NEW_ELEM_VAL, [PP.ID, 'Model', PP.ID, PP.Value, 'UMLModel', PP.Value]);
                     StrParam := Format(MSG_ELEM_CREATE, ['UMLModel', PP.Value]);
                     Str := Str + Format(JSCRIPT_ADD_MESSAGE, [StrParam, PP.ID]);
                   end;
                 pkSubsystem:
                   begin
                     Str := Format(JSCRIPT_NEW_ELEM_VAL, [PP.ID, 'Subsystem', PP.ID, PP.Value, 'UMLSubsystem']);
                     StrParam := Format(MSG_ELEM_CREATE, ['UMLSubsystem', PP.Value]);
                     Str := Str + Format(JSCRIPT_ADD_MESSAGE, [StrParam, PP.ID]);
                   end;
                 pkClass:
                   begin
                     Str := Format(JSCRIPT_NEW_ELEM_VAL, [PP.ID, 'Class', PP.ID, PP.Value, 'UMLClass', PP.Value]);
                     StrParam := Format(MSG_ELEM_CREATE, ['UMLClass', PP.Value]);
                     Str := Str + Format(JSCRIPT_ADD_MESSAGE, [StrParam, PP.ID]);
                   end;
                 pkInterface:
                   begin
                     Str := Format(JSCRIPT_NEW_ELEM_VAL, [PP.ID, 'Interface', PP.ID, PP.Value, 'UMLInterface', PP.Value]);
                     StrParam := Format(MSG_ELEM_CREATE, ['UMLInterface', PP.Value]);
                     Str := Str + Format(JSCRIPT_ADD_MESSAGE, [StrParam, PP.ID]);
                   end;
                 pkAttribute: { Error } ;
                 pkOperation: { Error } ;
                 pkLiteral: { Error } ;
                 pkParameter: { Error } ;
               end;
               Source.Add(Str);
            end
            else begin
              Elem := PP.GetElementValue(0);
              Source.Add(Format(JSCRIPT_EXIST_ELEM_VAL, [PP.ID, Elem.GetGuid]));
            end;
          end;
        ptElementList:
          begin
            if (PP.ElementValueCount = 0) and (PP.Value = '') then
              Source.Add(Format(JSCRIPT_ELEM_LIST_NULL, [PP.ID]))
            else begin
              SL := TStringList.Create;
              try
                SeparateStringByComma(PP.Value, SL);
                C := PP.ElementValueCount + SL.Count;
                Source.Add(Format(JSCRIPT_NEW_LIST_VAL, [PP.ID, IntToStr(C)]));
                for J := 0 to PP.ElementValueCount - 1 do begin
                  Elem := PP.ElementValues[J];
                  Source.Add(Format(JSCRIPT_EXIST_LIST_ITEM_VAL, [PP.ID, IntToStr(J), Elem.GetGuid]));
                end;
                C := PP.ElementValueCount;
                for J := 0 to SL.Count - 1 do begin
                 case PP.ElementKind of
                   pkPackage:
                     begin
                       Str := Format(JSCRIPT_NEW_LIST_ITEM_VAL, [PP.ID, IntToStr(J + C), 'Package', PP.ID, IntToStr(J + C), SL.Strings[J]]);
                       StrParam := Format(MSG_ELEM_CREATE, ['UMLPackage', SL.Strings[J]]);
                       Str := Str + Format(JSCRIPT_ADD_MESSAGE2, [StrParam, PP.ID, IntToStr(J + C)]);
                     end;
                   pkModel:
                     begin
                       Str := Format(JSCRIPT_NEW_LIST_ITEM_VAL, [PP.ID, IntToStr(J + C), 'Model', PP.ID, IntToStr(J + C), SL.Strings[J]]);
                       StrParam := Format(MSG_ELEM_CREATE, ['UMLModel', SL.Strings[J]]);
                       Str := Str + Format(JSCRIPT_ADD_MESSAGE2, [StrParam, PP.ID, IntToStr(J + C)]);
                     end;
                   pkSubsystem:
                     begin
                       Str := Format(JSCRIPT_NEW_LIST_ITEM_VAL, [PP.ID, IntToStr(J + C), 'Subsystem', PP.ID, IntToStr(J + C), SL.Strings[J]]);
                       StrParam := Format(MSG_ELEM_CREATE, ['UMLSubsystem', SL.Strings[J]]);
                       Str := Str + Format(JSCRIPT_ADD_MESSAGE2, [StrParam, PP.ID, IntToStr(J + C)]);
                     end;
                   pkClass:
                     begin
                       Str := Format(JSCRIPT_NEW_LIST_ITEM_VAL, [PP.ID, IntToStr(J + C), 'Class', PP.ID, IntToStr(J + C), SL.Strings[J]]);
                       StrParam := Format(MSG_ELEM_CREATE, ['UMLClass', SL.Strings[J]]);
                       Str := Str + Format(JSCRIPT_ADD_MESSAGE2, [StrParam, PP.ID, IntToStr(J + C)]);
                     end;
                   pkInterface:
                     begin
                       Str := Format(JSCRIPT_NEW_LIST_ITEM_VAL, [PP.ID, IntToStr(J + C), 'Interface', PP.ID, IntToStr(J + C), SL.Strings[J]]);
                       StrParam := Format(MSG_ELEM_CREATE, ['UMLInterface', SL.Strings[J]]);
                       Str := Str + Format(JSCRIPT_ADD_MESSAGE2, [StrParam, PP.ID, IntToStr(J + C)]);
                     end;
                   pkAttribute: { Error } ;
                   pkOperation: { Error } ;
                   pkLiteral: { Error } ;
                   pkParameter: { Error } ;
                 end;
                  Source.Add(Str);
                end;
              finally
                SL.Free;
              end;
            end;
          end;
      end;
    end;

    Source.Add(JScript.Text);
    Source.Add(JSCRIPT_TAIL);
  finally
    JScript.Free;
  end;
end;

procedure PPattern.ExecuteJScript(Gen: TStrings);
var
  SC: TScriptControl;
begin
  SC := TScriptControl.Create(nil);
  try
    SC.Language := 'JScript';
    SC.Reset;
    SC.AddCode(Gen.Text);
  finally
    SC.Free;
  end;
end;

function PPattern.GetParameters(Index: Integer): PPatternParameter;
begin
  Result := FParameters.Items[Index];
end;

function PPattern.GetPatternParameterCount: Integer;
begin
 Result := FParameters.Count;
end;

procedure PPattern.LoadPattern();
begin
  if Self.FIsLoaded then
  else begin
    try
      ReadXMLFile;
      FIsLoaded := True;
    except
      raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
    end;
  end;
end;

procedure PPattern.ReadXMLFile;
var
  Doc: TXMLDocument;
  PatternNode: IXMLNode;
  PatternDescription: IXMLNode;
  PatternParametersElement: IXMLNode;
begin
  Doc := TXMLDocument.Create(Application);
  try
    Doc.LoadFromFile(FFullPathName + FFileName);
    Doc.Active := True;
    PatternNode := Doc.DocumentElement;
    if PatternNode.NodeName = XOD_ELEMENT_PATTERN then begin
      FHelpFile := PatternNode.Attributes[XOD_ATTRIBUTE_HELP];
      FScriptFile := PatternNode.Attributes[XOD_ATTRIBUTE_SCRIPT];
      PatternDescription := PatternNode.ChildNodes[XOD_ELEMENT_DESCRIPTION];
      FDescription := PatternDescription.Text;
      PatternParametersElement := PatternNode.ChildNodes[XOD_ELEMENT_PARAMETERS];
      ReadParametersElement(PatternParametersElement);
    end else
      raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
  finally
    Doc.Free;
  end;
end;

procedure PPattern.ReadParametersElement(PatternParametersElement: IXMLNode);
var
  Parameter, PDescription, PDefaultValue, LiteralsNode, LiteralNode: IXMLNode;
  NewPatternParameter: PPatternParameter;
  I, J: Integer;
  B: Boolean;
  V, Code: Integer;
begin
  for I := 0 to PatternParametersElement.ChildNodes.Count -1 do begin
    // PPatternParameter 타입 생성
    NewPatternParameter := PPatternParameter.Create;

    try
      Parameter := PatternParametersElement.ChildNodes[I];
      // id: REQUIRED
      NewPatternParameter.FID := Trim(Parameter.Attributes[XOD_ATTRIBUTE_ID]);
      if NewPatternParameter.FID = '' then raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
      // caption: REQUIRED
      NewPatternParameter.FCaption := Trim(Parameter.Attributes[XOD_ATTRIBUTE_CAPTION]);
      if NewPatternParameter.FCaption = '' then raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
      // type: REQUIRED
      NewPatternParameter.FParamType := NewPatternParameter.StrToParamType(Trim(Parameter.Attributes[XOD_ATTRIBUTE_TYPE]));
      // elementKind: REQUIRED only if Element, ElementList type
      if (NewPatternParameter.FParamType = ptElement) or (NewPatternParameter.FParamType = ptElementList) then
        NewPatternParameter.FElementKind := NewPatternParameter.StrToParamElemKind(Trim(Parameter.Attributes[XOD_ATTRIBUTE_ELEMENTKIND]));
      // DESCRIPTION: REQUIRED
      PDescription := Parameter.ChildNodes[XOD_ELEMENT_DESCRIPTION];
      NewPatternParameter.FDescription := PDescription.Text;
      // DEFAULTVALUE: REQUIRED except on ElementList, Element(일부) type
      if Parameter.ChildNodes.FindNode(XOD_ELEMENT_DEFAULTVALUE) <> nil then begin
        PDefaultValue := Parameter.ChildNodes[XOD_ELEMENT_DEFAULTVALUE];
        NewPatternParameter.FDefaultValue := Trim(PDefaultValue.Text);
        if NewPatternParameter.FDefaultValue = '' then begin
          if (NewPatternParameter.FParamType <> ptElementList) and
             (NewPatternParameter.FParamType <> ptElement)
          then
            raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
          // ElementKind가 Model, Subsystem, Package, Class, Interface인 경우 값이 반드시 있어야 한다
          if (NewPatternParameter.FParamType = ptElement) and
             (
             (NewPatternParameter.ElementKind = pkModel) or
             (NewPatternParameter.ElementKind = pkSubsystem) or
             (NewPatternParameter.ElementKind = pkPackage) or
             (NewPatternParameter.ElementKind = pkClass) or
             (NewPatternParameter.ElementKind = pkInterface)
             )
          then
            raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
        end;
      end else begin
        // ElementList 타입 전체와 Element 타입 중 일부(Attribute, Operation, Literal, Parameter)의 경우
        // 디폴트 값이 없어도 된다
        if not ((NewPatternParameter.FParamType = ptElementList) or
                (
                   (NewPatternParameter.FParamType = ptElement) and
                   (
                     (NewPatternParameter.ElementKind = pkAttribute) or
                     (NewPatternParameter.ElementKind = pkOperation) or
                     (NewPatternParameter.ElementKind = pkLiteral) or
                     (NewPatternParameter.ElementKind = pkParameter)
                   )
                )
               )
        then
          raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
      end;
      if NewPatternParameter.DefaultValue <> '' then begin
        case NewPatternParameter.ParamType of
          ptInteger:
            begin
              Val(NewPatternParameter.DefaultValue, V, Code);
              if Code <> 0 then
                raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
            end;
          ptBoolean:
            begin
              if (LowerCase(NewPatternParameter.DefaultValue) <> 'true') and
                 (LowerCase(NewPatternParameter.DefaultValue) <> 'false')
              then raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
            end;
        end;
      end;
      // LITERALS: REQUIRED only if Enumeration type
      NewPatternParameter.EnumerationLiterals.Clear;
      if NewPatternParameter.FParamType = ptEnumeration then begin
        if Parameter.ChildNodes.FindNode(XOD_ELEMENT_LITERALS) <> nil then begin
          LiteralsNode := Parameter.ChildNodes[XOD_ELEMENT_LITERALS];
          B := False;
          for J := 0 to LiteralsNode.ChildNodes.Count - 1 do begin
            if LiteralsNode.ChildNodes.Nodes[J].NodeName = XOD_ELEMENT_LITERAL then begin
              LiteralNode := LiteralsNode.ChildNodes.Nodes[J];
              NewPatternParameter.EnumerationLiterals.Add(Trim(LiteralNode.Text));
              if NewPatternParameter.FDefaultValue = Trim(LiteralNode.Text) then
                B := True;
            end;
          end;
          if NewPatternParameter.EnumerationLiterals.Count <= 0 then
            raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
          if not B then
            raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
        end else
          raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
      end;

      AddPatternParameter(NewPatternParameter);
    except
      begin
        if NewPatternParameter <> nil then NewPatternParameter.Free;
        raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
      end;
    end;

  end;
end;

procedure PPattern.ApplyPattern();
var
  ExeCode: TStringList;
  Msg: string;
begin
  ExeCode := TStringList.Create;
  try
    GenerateJScriptCode(ExeCode);

    PatternManager.StarUMLApp.BeginUpdate;
    try
      try
        //ExeCode.SaveToFile('C:\Temp\Pattern_Executed.js');
        PatternManager.StarUMLApp.Log(Format(MSG_PATTERN_APPLY_START, [Self.Name]));
        ExecuteJScript(ExeCode);
        PatternManager.StarUMLApp.Log(MSG_PATTERN_APPLY_SUCCEED);
      except on E: Exception do
        begin
          Msg := Format(ERR_APPLY_PATTERN_FAIL, [E.Message]);
          PatternManager.StarUMLApp.Log(MSG_PATTERN_APPLY_FAIL);
          Application.MessageBox(PChar(Msg), PChar(Application.Title),
            MB_OK + MB_ICONERROR);
        end;
      end;
    finally
      PatternManager.StarUMLApp.EndUpdate2(True, True);
    end;

  finally
    ExeCode.Free;
  end;
end;

procedure PPattern.AddPatternParameter(APatternParameter: PPatternParameter);
begin
  FParameters.Add(APatternParameter);
end;

// PPattern
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PPatternManager

constructor PPatternManager.Create;
begin
  inherited;
  FPatternRepository := PPatternFolder.Create;
end;

destructor PPatternManager.Destroy;
begin
  FPatternRepository.Free;
  inherited;
end;

function PPatternManager.GetPathName: string;
begin
  Result := FPatternRepository.PathName;
end;

procedure PPatternManager.ScanPatternRepository(Pathname: string);

  procedure SearchRepo(Path: string; PatternFolder: PPatternFolder; IsRoot: Boolean = False);
  var
    SearchRec: 	TSearchRec;
    NewPatternFolder: PPatternFolder;
    NewPattern: PPattern;
    ExtStr: string;
  begin
    ZeroMemory(@SearchRec,SizeOf(SearchRec));
    if FindFirst(Path + '*', faAnyFile, SearchRec) = 0 then
    begin
      repeat
        if (SearchRec.Attr and faDirectory = faDirectory) and (SearchRec.Name <> '.')  and (SearchRec.Name <> '..') then
        begin
          // Folder
          if IsRoot then begin
            NewPatternFolder := PPatternFolder.Create;
            NewPatternFolder.FName := SearchRec.Name;
            NewPatternFolder.FPathName := Path + SearchRec.Name + '\';
            PatternFolder.AddPatternNode(NewPatternFolder);
            SearchRepo(NewPatternFolder.PathName, NewPatternFolder);
          end else begin
            SearchRepo(Path + SearchRec.Name + '\', PatternFolder);
          end;
        end
        else if (SearchRec.Attr and faArchive = faArchive) and (SearchRec.Name <> '.')  and (SearchRec.Name <> '..') then
        begin
          // File
          if (UpperCase(ExtractFileExt(SearchRec.Name)) = '.PAT') and (Path <> '.\') then
          begin
            NewPattern := PPattern.Create;
            NewPattern.FFullPathName := Path;
            NewPattern.FFileName := SearchRec.Name;
            ExtStr := ExtractFileExt(SearchRec.Name);
            NewPattern.FName :=  Copy(SearchRec.Name, 0, Length(SearchRec.Name) - Length(ExtStr));
            PatternFolder.AddPatternNode(NewPattern);
          end;
        end;
      until FindNext(SearchRec) <> 0;
      SysUtils.FindClose(SearchRec);
    end;
  end;
var
  ExtendedPathname: string;
begin
  FPatternRepository.ClearChildPatternNodes;

  ExtendedPathname := PathName + PATTERN_REP_FOLDER_NAME;
  if not DirectoryExists(ExtendedPathname) then
    ExtendedPathname := PathName + 'modules\staruml-pattern\' + PATTERN_REP_FOLDER_NAME;
  if DirectoryExists(ExtendedPathname) then begin
    FPatternRepository.FPathName := ExtendedPathname;
    FPatternRepository.FName := PATTERN_REP_FOLDER_NAME;
    SearchRepo(ExtendedPathname + '\', FPatternRepository, True);
  end else begin
    Application.MessageBox(PChar(ERR_PATTERN_REPO_NOT_FOUND), PChar(Application.Title),
          MB_OK + MB_ICONERROR)
  end;
end;

// PPatternManager
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PPatternParameter

constructor PPatternParameter.Create;
begin
  inherited;
  FID := '';
  FCaption := '';
  FDescription := '';
  FParamType := ptInteger;
  FElementKind := pkClass;
  FDefaultValue := '';
  FValue := '';
  FEnumerationLiterals := TStringList.Create;
  FElementValues := TInterfaceList.Create;
end;

destructor PPatternParameter.Destroy;
begin
  FEnumerationLiterals.Free;
  FElementValues.Free;
  inherited;
end;

function PPatternParameter.GetElementValue(Index: Integer): IUMLElement;
begin
  Result := FElementValues.Items[Index] as IUMLElement;
end;

function PPatternParameter.GetElementValueCount: Integer;
begin
  Result := FElementValues.Count;
end;

procedure PPatternParameter.ClearElementValues();
begin
  FElementValues.Clear;
end;

procedure PPatternParameter.AddElementValue(Value: IUMLElement);
begin
  FElementValues.Add(Value);
end;

procedure PPatternParameter.RemoveElementValue(Value: IUMLElement);
begin
  FElementValues.Remove(Value);
end;

function PPatternParameter.StrToParamType(Value: string): PPatternParameterType;
begin
  if Value = 'Integer' then Result := ptInteger
  else if Value = 'Boolean' then Result := ptBoolean
  else if Value = 'String' then Result := ptString
  else if Value = 'Enumeration' then Result := ptEnumeration
  else if Value = 'Element' then Result := ptElement
  else if Value = 'ElementList' then Result := ptElementList
  else raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
end;

function PPatternParameter.StrToParamElemKind(Value: string): PPatternParameterElemKind;
begin
  if Value = 'Package' then Result := pkPackage
  else if Value = 'Model' then Result := pkModel
  else if Value = 'Subsystem' then Result := pkSubsystem
  else if Value = 'Class' then Result := pkClass
  else if Value = 'Interface' then Result := pkInterface
  else if Value = 'Attribute' then Result := pkAttribute
  else if Value = 'Operation' then Result := pkOperation
  else if Value = 'Literal' then Result := pkLiteral
  else if Value = 'Parameter' then Result := pkParameter
  else raise EIllegal_XML_DOC.Create(ERR_INVALID_FORMED_XML);
end;

// PPatternParameter
////////////////////////////////////////////////////////////////////////////////

procedure SeparateStringByComma(Value: string; SL: TStringList);
var
  I: Integer;
  TempStr, Str: string;
begin
  if (Value <> '') and (SL <> nil) then begin
    SL.Clear;
    Str := '';
    for I := 1 to Length(Value) do begin
      TempStr := Copy(Value, i, 1);
      if TempStr <> ',' then begin
        Str := Str + TempStr;
      end else begin
        SL.Add(Trim(Str));
        Str := '';
      end;
    end;
    if Str <> '' then SL.Add(Trim(Str));
  end;
end;

end.
