unit Serializers;

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
  DirectMDAObjects, Symbols, Utilities,
  SysUtils, XMLDoc, XMLIntf;

const
  ERR_EMPTY_DOCUMENT = 'It''s a empty document.';
  ERR_CANNOT_READ_FILE = 'The file can''t be read normally.'
    + #13#10 + 'Filename : %s'
    + #13#10 + 'Reason : %s';
  ERR_CANNOT_WRITE_FILE = 'The file can''t be written normally.'
    + #13#10 + 'Filename : %s'
    + #13#10 + 'Reason : %s';

type
  // events
  PObjectRequestEvent = procedure(Sender: TObject; Parameter: string; var Obj: TObject) of object;

  // exceptions
  EDocumentException = class(Exception);

  // PGenerationUnitSerializer
  PGenerationUnitSerializer = class
  private
    function ReadChildValue(Node: IXMLNode; Name: string; DefaultValue: string = ''): string;
    procedure ReadProfiles(AGenerationUnit: PGenerationUnit; ProfilesNode: IXMLNode);
    procedure ReadPreviews(AGenerationUnit: PGenerationUnit; PreviewsNode: IXMLNode);
    procedure ReadParameter(AParameter: PParameter; ParameterNode: IXMLNode);
    procedure ReadParameters(AGenerationUnit: PGenerationUnit; ParametersNode: IXMLNode);
    procedure ReadAttachFiles(AGenerationUnit: PGenerationUnit; AttachFilesNode: IXMLNode);
    procedure ReadGenerationUnitProperties(AGenerationUnit: PGenerationUnit; RootNode: IXMLNode);
    procedure WriteProfiles(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
    procedure WritePreviews(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
    procedure WriteParameter(Writer: PStringWriter; AParameter: PParameter);
    procedure WriteParameters(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
    procedure WriteAttachFiles(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
    procedure WriteGenerationUnitProperties(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
  public
    procedure ReadGenerationUnit(AGenerationUnit: PGenerationUnit; Path: string);
    procedure WriteGenerationUnit(AGenerationUnit: PGenerationUnit; Path: string; DirectoryCreation: Boolean = True);
  end;

  // PBatchSerializer
  PBatchSerializer = class
  private
    FOnRequestGenerationUnit: PObjectRequestEvent;
    function RequestGenerationUnit(Path: string): PGenerationUnit;
    function ReadChildValue(Node: IXMLNode; Name: string; DefaultValue: string = ''): string;
    procedure ReadParameter(AParameter: PParameter; ParamNode: IXMLNode);
    procedure ReadParameters(ATask: PTask; ParamsNode: IXMLNode);
    procedure ReadTask(ATask: PTask; TaskNode: IXMLNode);
    procedure ReadTasks(ABatch: PBatch; TasksNode: IXMLNode);
    procedure ReadBatchProperties(ABatch: PBatch; RootNode: IXMLNode);
    procedure WriteParameter(Writer: PStringWriter; AParameter: PParameter);
    procedure WriteParameters(Writer: PStringWriter; ATask: PTask);
    procedure WriteTask(Writer: PStringWriter; ATask: PTask);
    procedure WriteTasks(Writer: PStringWriter; ABatch: PBatch);
    procedure WriteBatchProperties(Writer: PStringWriter; ABatch: PBatch);
  public
    procedure ReadBatch(ABatch: PBatch; Path: string);
    procedure WriteBatch(ABatch: PBatch; Path: string);
    property OnRequestGenerationUnit: PObjectRequestEvent read FOnRequestGenerationUnit write FOnRequestGenerationUnit;
  end;

implementation

uses
  Forms, Variants, Dialogs;

////////////////////////////////////////////////////////////////////////////////
// PGenerationUnitSerializer

function PGenerationUnitSerializer.ReadChildValue(Node: IXMLNode; Name: string; DefaultValue: string = ''): string;
var
  V: Variant;
begin
  V := Node.ChildValues[Name];
  if VarIsNull(V) then
    Result := DefaultValue
  else
    Result := V;
end;

procedure PGenerationUnitSerializer.ReadProfiles(AGenerationUnit: PGenerationUnit; ProfilesNode: IXMLNode);
var
  ProfileNode: IXMLNode;
  I: Integer;
begin
  for I := 0 to ProfilesNode.ChildNodes.Count - 1 do begin
    ProfileNode := ProfilesNode.ChildNodes.Nodes[I];
    if ProfileNode.NodeName = NODE_PROFILE then
      AGenerationUnit.AddProfile(ProfileNode.NodeValue);
  end;
end;

procedure PGenerationUnitSerializer.ReadPreviews(AGenerationUnit: PGenerationUnit; PreviewsNode: IXMLNode);
var
  PreviewNode: IXMLNode;
  I: Integer;
begin
  for I := 0 to PreviewsNode.ChildNodes.Count - 1 do begin
    PreviewNode := PreviewsNode.ChildNodes.Nodes[I];
    if PreviewNode.NodeName = NODE_PREVIEW then
      AGenerationUnit.AddPreview(PreviewNode.NodeValue);
  end;
end;

procedure PGenerationUnitSerializer.ReadParameter(AParameter: PParameter; ParameterNode: IXMLNode);
begin
  AParameter.Name := ReadChildValue(ParameterNode, NODE_NAME);
  AParameter.Type_ := StringToParameterTypeKind(ReadChildValue(ParameterNode, NODE_TYPE));
  AParameter.Value := ReadChildValue(ParameterNode, NODE_VALUE);
end;

procedure PGenerationUnitSerializer.ReadParameters(AGenerationUnit: PGenerationUnit; ParametersNode: IXMLNode);
var
  ParameterNode: IXMLNode;
  Param: PParameter;
  I: Integer;
begin
  for I := 0 to ParametersNode.ChildNodes.Count - 1 do begin
    ParameterNode := ParametersNode.ChildNodes.Nodes[I];
    if ParameterNode.NodeName = NODE_PARAMETER then begin
      Param := PParameter.Create;
      AGenerationUnit.AddParameter(Param);
      ReadParameter(Param, ParameterNode);
    end;
  end;
end;

procedure PGenerationUnitSerializer.ReadAttachFiles(AGenerationUnit: PGenerationUnit; AttachFilesNode: IXMLNode);
var
  AttachFileNode: IXMLNode;
  I: Integer;
begin
  for I := 0 to AttachFilesNode.ChildNodes.Count - 1 do begin
    AttachFileNode := AttachFilesNode.ChildNodes.Nodes[I];
    if AttachFileNode.NodeName = NODE_ATTACHFILE then
      AGenerationUnit.AddAttachFile(AttachFileNode.NodeValue);
  end;
end;

procedure PGenerationUnitSerializer.ReadGenerationUnitProperties(AGenerationUnit: PGenerationUnit;
  RootNode: IXMLNode);
var
  ProfilesNode, PreviewsNode, ParametersNode, AttachFilesNode: IXMLNode;
begin
  AGenerationUnit.Group := ReadChildValue(RootNode, NODE_GROUP);
  AGenerationUnit.Category := ReadChildValue(RootNode, NODE_CATEGORY);
  AGenerationUnit.Name := ReadChildValue(RootNode, NODE_NAME);
  AGenerationUnit.Description := ReadChildValue(RootNode, NODE_DESCRIPTION);
  AGenerationUnit.DocumentType := StringToDocumentTypeKind(ReadChildValue(RootNode, NODE_DOCUMENTTYPE));
  AGenerationUnit.Format := ReadChildValue(RootNode, NODE_FORMAT);
  AGenerationUnit.Date := ReadChildValue(RootNode, NODE_DATE);
  AGenerationUnit.Version := ReadChildValue(RootNode, NODE_VERSION);
  ProfilesNode := RootNode.ChildNodes.FindNode(NODE_PROFILES);
  if ProfilesNode <> nil then
    ReadProfiles(AGenerationUnit, ProfilesNode);
  AGenerationUnit.Approach := ReadChildValue(RootNode, NODE_APPROACH);
  AGenerationUnit.TranslatorType := StringToTranslatorTypeKind(ReadChildValue(RootNode, NODE_TRANSLATORTYPE));
  AGenerationUnit.TranslatorName := ReadChildValue(RootNode, NODE_TRANSLATORNAME);
  AGenerationUnit.Sample := ReadChildValue(RootNode, NODE_SAMPLE);
  AGenerationUnit.Tutorial := ReadChildValue(RootNode, NODE_TUTORIAL);
  PreviewsNode := RootNode.ChildNodes.FindNode(NODE_PREVIEWS);
  if PreviewsNode <> nil then
    ReadPreviews(AGenerationUnit, PreviewsNode);
  AGenerationUnit.Validator := ReadChildValue(RootNode, NODE_VALIDATOR);
  ParametersNode := RootNode.ChildNodes.FindNode(NODE_PARAMETERS);
  if ParametersNode <> nil then
    ReadParameters(AGenerationUnit, ParametersNode);
  AttachFilesNode := RootNode.ChildNodes.FindNode(NODE_ATTACHFILES);
  if AttachFilesNode <> nil then
    ReadAttachFiles(AGenerationUnit, AttachFilesNode);
end;

procedure PGenerationUnitSerializer.WriteProfiles(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
var
  I: Integer;
begin
  if AGenerationUnit.ProfileCount > 0 then begin
    Writer.WriteLine('<PROFILES>');
    Writer.Indent;
    for I := 0 to AGenerationUnit.ProfileCount - 1 do
      Writer.WriteLine('<PROFILE>%s</PROFILE>', [XMLEncoding(AGenerationUnit.Profiles[I])]);
    Writer.Outdent;
    Writer.WriteLine('</PROFILES>');
  end;
end;

procedure PGenerationUnitSerializer.WritePreviews(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
var
  I: Integer;
begin
  if AGenerationUnit.PreviewCount > 0 then begin
    Writer.WriteLine('<PREVIEWS>');
    Writer.Indent;
    for I := 0 to AGenerationUnit.PreviewCount - 1 do
      Writer.WriteLine('<PREVIEW>%s</PREVIEW>', [XMLEncoding(AGenerationUnit.Previews[I])]);
    Writer.Outdent;
    Writer.WriteLine('</PREVIEWS>');
  end;
end;

procedure PGenerationUnitSerializer.WriteParameter(Writer: PStringWriter; AParameter: PParameter);
begin
  Writer.WriteLine('<PARAMETER>');
  Writer.Indent;
  Writer.WriteLine('<NAME>%s</NAME>', [XMLEncoding(AParameter.Name)]);
  Writer.WriteLine('<TYPE>%s</TYPE>', [ParameterTypeKindToString(AParameter.Type_)]);
  Writer.WriteLine('<VALUE>%s</VALUE>', [XMLEncoding(AParameter.Value)]);
  Writer.Outdent;
  Writer.WriteLine('</PARAMETER>');
end;

procedure PGenerationUnitSerializer.WriteParameters(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
var
  I: Integer;
begin
  if AGenerationUnit.ParameterCount > 0 then begin
    Writer.WriteLine('<PARAMETERS>');
    Writer.Indent;
    for I := 0 to AGenerationUnit.ParameterCount - 1 do
      WriteParameter(Writer, AGenerationUnit.Parameters[I]);
    Writer.Outdent;
    Writer.WriteLine('</PARAMETERS>');
  end;
end;

procedure PGenerationUnitSerializer.WriteAttachFiles(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
var
  I: Integer;
begin
  if AGenerationUnit.AttachFileCount > 0 then begin
    Writer.WriteLine('<ATTACHFILES>');
    for I := 0 to AGenerationUnit.AttachFileCount - 1 do
      Writer.WriteLine('<ATTACHFILE>%s</ATTACHFILE>', [XMLEncoding(AGenerationUnit.AttachFiles[I])]);
    Writer.WriteLine('</ATTACHFILES>');
  end;
end;

procedure PGenerationUnitSerializer.WriteGenerationUnitProperties(Writer: PStringWriter; AGenerationUnit: PGenerationUnit);
begin
  Writer.WriteLine('<GROUP>%s</GROUP>', [XMLEncoding(AGenerationUnit.Group)]);
  Writer.WriteLine('<CATEGORY>%s</CATEGORY>', [XMLEncoding(AGenerationUnit.Category)]);
  Writer.WriteLine('<NAME>%s</NAME>', [XMLEncoding(AGenerationUnit.Name)]);
  Writer.WriteLine('<DESCRIPTION>%s</DESCRIPTION>', [XMLEncoding(AGenerationUnit.Description)]);
  Writer.WriteLine('<DOCUMENTTYPE>%s</DOCUMENTTYPE>',
    [DocumentTypeKindToString(AGenerationUnit.DocumentType)]);
  Writer.WriteLine('<FORMAT>%s</FORMAT>', [XMLEncoding(AGenerationUnit.Format)]);
  Writer.WriteLine('<DATE>%s</DATE>', [XMLEncoding(AGenerationUnit.Date)]);
  Writer.WriteLine('<VERSION>%s</VERSION>', [XMLEncoding(AGenerationUnit.Version)]);
  WriteProfiles(Writer, AGenerationUnit);
  Writer.WriteLine('<APPROACH>%s</APPROACH>', [XMLEncoding(AGenerationUnit.Approach)]);
  Writer.WriteLine('<TRANSLATORTYPE>%s</TRANSLATORTYPE>',
    [TranslatorTypeKindToString(AGenerationUnit.TranslatorType)]);
  Writer.WriteLine('<TRANSLATORNAME>%s</TRANSLATORNAME>', [XMLEncoding(AGenerationUnit.TranslatorName)]);
  Writer.WriteLine('<SAMPLE>%s</SAMPLE>', [XMLEncoding(AGenerationUnit.Sample)]);
  Writer.WriteLine('<TUTORIAL>%s</TUTORIAL>', [XMLEncoding(AGenerationUnit.Tutorial)]);
  WritePreviews(Writer, AGenerationUnit);
  Writer.WriteLine('<VALIDATOR>%s</VALIDATOR>', [XMLEncoding(AGenerationUnit.Validator)]);
  WriteParameters(Writer, AGenerationUnit);
  WriteAttachFiles(Writer, AGenerationUnit);
end;

procedure PGenerationUnitSerializer.ReadGenerationUnit(AGenerationUnit: PGenerationUnit; Path: string);
var
  XMLDoc: TXMLDocument;
  RootNode: IXMLNode;
begin
  XMLDoc := TXMLDocument.Create(Application);
  XMLDoc.LoadFromFile(Path);
  XMLDoc.Active := True;
  if XMLDoc.IsEmptyDoc then
    raise EDocumentException.Create(ERR_EMPTY_DOCUMENT);
  RootNode := XMLDoc.DocumentElement;
  ReadGenerationUnitProperties(AGenerationUnit, RootNode);
  AGenerationUnit.Path := Path;
end;

procedure PGenerationUnitSerializer.WriteGenerationUnit(AGenerationUnit: PGenerationUnit; Path: string; DirectoryCreation: Boolean = True);
var
  Writer: PStringWriter;
begin
  Writer := PStringWriter.Create;
  try
    Writer.WriteLine('<?xml version="1.0" encoding="%s" ?>', [ENCODING_EUC_KR]);
    Writer.WriteLine('<DIRECTMDAGENERATIONUNIT version="%s">', [VER_GENERATION_UNIT]);
    Writer.Indent;
    WriteGenerationUnitProperties(Writer, AGenerationUnit);
    Writer.Outdent;
    Writer.WriteLine('</DIRECTMDAGENERATIONUNIT>');
    Writer.SaveToFile(Path, DirectoryCreation);
  finally
    Writer.Free;
  end;
end;

// PGenerationUnitSerializer
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PBatchSerializer

function PBatchSerializer.RequestGenerationUnit(Path: string): PGenerationUnit;
var
  Obj: TObject;
begin
  Result := nil;
  if Assigned(FOnRequestGenerationUnit) then begin
    Obj := nil;
    FOnRequestGenerationUnit(Self, Path, Obj);
    if (Obj <> nil) and (Obj is PGenerationUnit) then
      Result := Obj as PGenerationUnit;
  end;
end;

function PBatchSerializer.ReadChildValue(Node: IXMLNode; Name: string; DefaultValue: string = ''): string;
var
  V: Variant;
begin
  V := Node.ChildValues[Name];
  if VarIsNull(V) then
    Result := DefaultValue
  else
    Result := V;
end;

procedure PBatchSerializer.ReadParameter(AParameter: PParameter; ParamNode: IXMLNode);
begin
  AParameter.Name := ReadChildValue(ParamNode, NODE_NAME);
  AParameter.Type_ := StringToParameterTypeKind(ReadChildValue(ParamNode, NODE_TYPE));
  AParameter.Value := ReadChildValue(ParamNode, NODE_VALUE);
end;

procedure PBatchSerializer.ReadParameters(ATask: PTask; ParamsNode: IXMLNode);
var
  ParamNode: IXMLNode;
  P: PParameter;
  I: Integer;
begin
  for I := 0 to ParamsNode.ChildNodes.Count - 1 do begin
    ParamNode := ParamsNode.ChildNodes.Nodes[I];
    if ParamNode.NodeName = NODE_PARAMETER then begin
      P := PParameter.Create;
      ATask.AddParameter(P);
      ReadParameter(P, ParamNode);
    end;
  end;
end;

procedure PBatchSerializer.ReadTask(ATask: PTask; TaskNode: IXMLNode);
var
  ParamsNode: IXMLNode;
begin
  ATask.GenerationUnit := RequestGenerationUnit(ReadChildValue(TaskNode, NODE_GENERATIONUNIT));
  ParamsNode := TaskNode.ChildNodes.FindNode(NODE_PARAMETERS);
  if ParamsNode <> nil then
    ReadParameters(ATask, ParamsNode);
  ATask.Selected := True;    
end;

procedure PBatchSerializer.ReadTasks(ABatch: PBatch; TasksNode: IXMLNode);
var
  T: PTask;
  Child: IXMLNode;
  I: Integer;
begin
  for I := 0 to TasksNode.ChildNodes.Count - 1 do begin
    Child := TasksNode.ChildNodes.Nodes[I];
    if Child.NodeName = NODE_TASK then begin
      T := PTask.Create;
      ABatch.AddTask(T);
      ReadTask(T, Child);
    end;
  end;
end;

procedure PBatchSerializer.ReadBatchProperties(ABatch: PBatch; RootNode: IXMLNode);
var
  TasksNode: IXMLNode;
begin
  ABatch.Name := ReadChildValue(RootNode, NODE_NAME);
  ABatch.Description := ReadChildValue(RootNode, NODE_DESCRIPTION);
  TasksNode := RootNode.ChildNodes.FindNode(NODE_TASKS);
  if TasksNode <> nil then
    ReadTasks(ABatch, TasksNode);
end;

procedure PBatchSerializer.WriteParameter(Writer: PStringWriter; AParameter: PParameter);
begin
  Writer.WriteLine('<PARAMETER>');
  Writer.Indent;
  Writer.WriteLine('<NAME>%s</NAME>', [XMLEncoding(AParameter.Name)]);
  Writer.WriteLine('<TYPE>%s</TYPE>', [ParameterTypeKindToString(AParameter.Type_)]);
  Writer.WriteLine('<VALUE>%s</VALUE>', [XMLEncoding(AParameter.Value)]);
  Writer.Outdent;
  Writer.WriteLine('</PARAMETER>');
end;

procedure PBatchSerializer.WriteParameters(Writer: PStringWriter; ATask: PTask);
var
  I: Integer;
begin
  if ATask.ParameterCount > 0 then begin
    Writer.WriteLine('<PARAMETERS>');
    Writer.Indent;
    for I := 0 to ATask.ParameterCount - 1 do
      WriteParameter(Writer, ATask.Parameters[I]);
    Writer.Outdent;
    Writer.WriteLine('</PARAMETERS>');
  end;
end;

procedure PBatchSerializer.WriteTask(Writer: PStringWriter; ATask: PTask);
begin
  Writer.WriteLine('<TASK>');
  Writer.Indent;
  Writer.WriteLine('<TEMPLATE>%s</TEMPLATE>', [XMLEncoding(ATask.GenerationUnit.Path)]);
  WriteParameters(Writer, ATask);
  Writer.Outdent;
  Writer.WriteLine('</TASK>');
end;

procedure PBatchSerializer.WriteTasks(Writer: PStringWriter; ABatch: PBatch);
var
  I: Integer;
begin
  if ABatch.TaskCount > 0 then begin
    Writer.WriteLine('<TASKS>');
    Writer.Indent;
    for I := 0 to ABatch.TaskCount - 1 do
      WriteTask(Writer, ABatch.Tasks[I]);
    Writer.Outdent;
    Writer.WriteLine('</TASKS>');
  end;
end;

procedure PBatchSerializer.WriteBatchProperties(Writer: PStringWriter; ABatch: PBatch);
begin
  Writer.WriteLine('<NAME>%s</NAME>', [XMLEncoding(ABatch.Name)]);
  Writer.WriteLine('<DESCRIPTION>%s</DESCRIPTION>', [XMLEncoding(ABatch.Description)]);
  WriteTasks(Writer, ABatch);
end;

procedure PBatchSerializer.ReadBatch(ABatch: PBatch; Path: string);
var
  XMLDoc: TXMLDocument;
  RootNode: IXMLNode;
begin
  XMLDoc := TXMLDocument.Create(Application);
  XMLDoc.LoadFromFile(Path);
  XMLDoc.Active := True;
  if XMLDoc.IsEmptyDoc then
    raise EDocumentException.Create(ERR_EMPTY_DOCUMENT);
  RootNode := XMLDoc.DocumentElement;
  ReadBatchProperties(ABatch, RootNode);
  ABatch.Path := Path;
end;

procedure PBatchSerializer.WriteBatch(ABatch: PBatch; Path: string);
var
  Writer: PStringWriter;
begin
  Writer := PStringWriter.Create;
  try
    Writer.WriteLine('<?xml version="1.0" encoding="%s" ?>', [ENCODING_EUC_KR]);
    Writer.WriteLine('<BATCH version="%s">', [VER_BATCH]);
    Writer.Indent;
    WriteBatchProperties(Writer, ABatch);
    Writer.Outdent;
    Writer.WriteLine('</BATCH>');
    Writer.SaveToFile(Path);
  finally
    Writer.Free;
  end;
end;

// PBatchSerializer
////////////////////////////////////////////////////////////////////////////////

end.
