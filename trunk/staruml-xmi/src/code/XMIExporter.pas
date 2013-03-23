unit XMIExporter;

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
  Classes, WhiteStarUML_TLB;

const
  INDENT_SIZE = 2;

type
  // forward declaration
  PXMIAttribute = class;
  PXMIElement = class;

  // PElementProc
  PElementProc = procedure(Element: IElement) of object;

  // PXMIEnumConvFunc
  PXMIEnumConvFunc = function(EnumItem: string): string of object;

  // PProgressEvent
  PProgressEvent = procedure(Pos: Integer; Max: Integer; Msg: string) of object;

  // PXMIElement
  PXMIElement = class
  private
    FXMIElementName: string;
    FXMIId: string;
    FTargetElement: IElement;     // can be nil
    FParent: PXMIElement;
    FChildren: TList;
    FAttributes: TList;
    function GetChildCount: Integer;
    function GetChild(Index: Integer): PXMIElement;
    function GetAttributeCount: Integer;
    function GetAttribute(Index: Integer): PXMIAttribute;
  public
    constructor Create(AXMIElementName: string; ATargetElement: IElement; AXMIId: string = ''); virtual;
    destructor Destroy; override;
    procedure AddChild(Value: PXMIElement);
    procedure RemoveChild(Value: PXMIElement);
    procedure AddAttribute(Value: PXMIAttribute);
    procedure RemoveAttribute(Value: PXMIAttribute);
    function ToString(Indent: Integer): string; virtual;
    function FindXMIAttribute(Key: string): PXMIAttribute;
    function FindXMIElementByElement(Element: IElement): PXMIElement; virtual;
    function FindChild(XMIElementName: string): PXMIElement;
    function FindAncestorByXMIElementName(XMIElementName: string): PXMIElement;
    function FindAncestorByUMLElementKind(UMLElementKind: string): PXMIElement;
    property XMIElementName: string read FXMIElementName;
    property XMIId: string read FXMIId;
    property TargetElement: IElement read FTargetElement;
    property Parent: PXMIElement read FParent;
    property ChildCount: Integer read GetChildCount;
    property Children[Index: Integer]: PXMIElement read GetChild;
    property AttributeCount: Integer read GetAttributeCount;
    property Attributes[Index: Integer]: PXMIAttribute read GetAttribute;
  end;

  // PXMIElementExt
  PXMIElementExt = class(PXMIElement)
  private
    FAssociatedElements: TInterfaceList;
    FAdditionalObj: IDispatch;
    function GetAssociatedElementCount: Integer;
    function GetAssociatedElement(Index: Integer): IElement;
    procedure SetAdditionalObj(Value: IDispatch);
  public
    constructor Create(AXMIElementName: string; ATargetElement: IElement; AXMIId: string = ''); override;
    destructor Destroy; override;
    procedure AddAssociatedElement(Value: IElement);
    procedure RemoveAssociatedElement(Value: IElement);
    function FindXMIElementByElement(Element: IElement): PXMIElement; override;
    property AssociatedElementCount: Integer read GetAssociatedElementCount;
    property AssociatedElements[Index: Integer]: IElement read GetAssociatedElement;
    property AdditionalObj: IDispatch read FAdditionalObj write SetAdditionalObj;
  end;

  // PXMIAttribute
  PXMIAttribute = class
  private
    FKey: string;
    FValues: TStringList;
    function GetValueCount: Integer;
    function GetValue(Index: Integer): string;
  public
    constructor Create(AKey: string);
    destructor Destroy; override;
    procedure ClearValue;
    procedure AddValue(Value: string);
    procedure RemoveValue(Value: string);
    function ToString: string;
    property Key: string read FKey;
    property ValueCount: Integer read GetValueCount;
    property Values[Index: Integer]: string read GetValue;
  end;

  // PXMIExporter
  PXMIExporter = class
  private
    FOnProgress: PProgressEvent;
  protected
    FStarUMLApp: IStarUMLApplication;
    FContents: TList;
    XMIIdNumber: Integer;
    // built-in properties (must be defined in constructor)
    FXMIVersion: string;
    FUMLVersion: string;
    FUMLNamespace: string;
    // options
    FCreateUUID: Boolean;
    FCreateTimeStamp: Boolean;
    function IssueXMIId(E: IElement): string;
    function IssueXMIUUId(E: IElement): string;
    function GetContentCount: Integer;
    function GetContent(Index: Integer): PXMIElement;

    procedure VisitStarUMLModels(Element: IElement; Proc: PElementProc);

    function FindXMIElementByElement(Element: IElement): PXMIElement;
    function CreateXMIElement(XMIElemName: string; Element: IElement; ParentXMIElem: PXMIElement; CreateId: Boolean = True): PXMIElement;
    function CreateXMIElementExt(XMIElemName: string; Element: IElement; ParentXMIElem: PXMIElement; CreateId: Boolean = True): PXMIElementExt;
    function AcquireXMIElement(XMIElem: PXMIElement; XMIElemName: string; Element: IElement; CreateId: Boolean = True): PXMIElement;
    function AcquireXMIAttribute(XMIElem: PXMIElement; XMIAttrName: string): PXMIAttribute;
    procedure SetXMIAttributeValue(XMIElem: PXMIElement; XMIAttrName: string; Value: string);
    procedure AddXMIAttributeValue(XMIElem: PXMIElement; XMIAttrName: string; Value: string);

    procedure SetXMIAttrAttribute(XMIElem: PXMIElement; Element: IElement; AttrName: string; XMIAttrName: string);
    procedure SetXMIAttrEnumAttribute(XMIElem: PXMIElement; Element: IElement; AttrName: string; XMIAttrName: string; ConvFunc: PXMIEnumConvFunc);
    procedure SetXMIAttrReference(XMIElem: PXMIElement; Element: IElement; AttrName: string; XMIAttrName: string);
    procedure SetXMIAttrAggregation(XMIElem: PXMIElement; Element: IElement; AttrName: string; XMIAttrName: string);

    procedure BuildXMIElements; virtual; abstract;
    function GetCurrentTimeStamp: string; virtual;
    procedure WriteHeader(Writer: TStringList); virtual;
    procedure WriteContents(Writer: TStringList); virtual;
    procedure WriteXMI(Writer: TStringList); virtual;
    procedure StimulateProgressEvent(Pos: Integer; Max: Integer; Msg: string); virtual;
    procedure Log(Text: string);
    procedure Report(Msg: string; TargetElement: IElement);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Clear;
    procedure ExportToFile(FileName: string); virtual;
    property StarUMLApp: IStarUMLApplication read FStarUMLApp write FStarUMLApp;
    property ContentCount: Integer read GetContentCount;
    property Contents[Index: Integer]: PXMIElement read GetContent;
    // built-in properties
    property XMIVersion: string read FXMIVersion;
    property UMLVersion: string read FUMLVersion;
    property UMLNamespace: string read FUMLNamespace;
    // options
    property CreateUUID: Boolean read FCreateUUID write FCreateUUID;
    property CreateTimeStamp: Boolean read FCreateTimeStamp write FCreateTimeStamp;
    property OnProgress: PProgressEvent read FOnProgress write FOnProgress;
  end;

implementation

uses
  Utilities, NLS_XMIAddIn, Symbols,
  SysUtils;

////////////////////////////////////////////////////////////////////////////////
// PXMIElement

constructor PXMIElement.Create(AXMIElementName: string; ATargetElement: IElement; AXMIId: string = '');
begin
  FChildren := TList.Create;
  FAttributes := TList.Create;
  FXMIElementName := AXMIElementName;
  FTargetElement := ATargetElement;
  FXMIId := AXMIId;
end;

destructor PXMIElement.Destroy;
var
  I: Integer;
begin
  for I := FChildren.Count - 1 downto 0 do begin
    PXMIElement(FChildren.Items[I]).Free;
    FChildren.Delete(I);
  end;
  FChildren.Free;
  for I := FAttributes.Count - 1 downto 0 do begin
    PXMIAttribute(FAttributes.Items[I]).Free;
    FAttributes.Delete(I);
  end;
  FAttributes.Free;
  inherited;
end;

function PXMIElement.GetChildCount: Integer;
begin
  Result := FChildren.Count;
end;

function PXMIElement.GetChild(Index: Integer): PXMIElement;
begin
  Result := PXMIElement(FChildren.Items[Index]);
end;

function PXMIElement.GetAttributeCount: Integer;
begin
  Result := FAttributes.Count;
end;

function PXMIElement.GetAttribute(Index: Integer): PXMIAttribute;
begin
  Result := PXMIAttribute(FAttributes.Items[Index]);
end;

procedure PXMIElement.AddChild(Value: PXMIElement);
begin
  if FChildren.IndexOf(Value) = -1 then begin
    FChildren.Add(Value);
    Value.FParent := Self;
  end;
end;

procedure PXMIElement.RemoveChild(Value: PXMIElement);
begin
  if FChildren.IndexOf(Value) <> -1 then begin
    FChildren.Remove(Value);
    Value.FParent := nil;
  end;
end;

procedure PXMIElement.AddAttribute(Value: PXMIAttribute);
begin
  if FAttributes.IndexOf(Value) = -1 then
    FAttributes.Add(Value);
end;

procedure PXMIElement.RemoveAttribute(Value: PXMIAttribute);
begin
  if FAttributes.IndexOf(Value) <> -1 then
    FAttributes.Remove(Value);
end;

function PXMIElement.ToString(Indent: Integer): string;
var
  S, SA: string;
  I: Integer;
begin
  SA := '';
  if FXMIId <> '' then
    SA := Format(' xmi.id="%s"', [FXMIId]);
  for I := 0 to AttributeCount - 1 do begin
    if Attributes[I].ToString <> '' then
      SA := SA + ' ' + Attributes[I].ToString;
  end;
  if ChildCount = 0 then
    S := Format('%s<%s%s/>', [StringOfChar(#32, Indent * 2), FXMIElementName, SA])
  else begin
    S := Format('%s<%s%s>', [StringOfChar(#32, Indent * 2), FXMIElementName, SA]);
    for I := 0 to ChildCount - 1 do begin
      S := S + #13#10 + Children[I].ToString(Indent + 1);
    end;
    S := S + #13#10 + Format('%s</%s>', [StringOfChar(#32, Indent * INDENT_SIZE), FXMIElementName]);
  end;
  Result := S;
end;

function PXMIElement.FindXMIAttribute(Key: string): PXMIAttribute;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to AttributeCount - 1 do
    if Attributes[I].Key = Key then begin
      Result := Attributes[I];
      Exit;
    end;
end;

function PXMIElement.FindXMIElementByElement(Element: IElement): PXMIElement;
var
  XE: PXMIElement;
  I: Integer;
begin
  Result := nil;
  if (FTargetElement <> nil) and (FTargetElement.GetGuid = Element.GetGuid) then
    Result := Self
  else
    for I := 0 to ChildCount - 1 do begin
      XE := Children[I].FindXMIElementByElement(Element);
      if XE <> nil then begin
        Result := XE;
        Exit;
      end;
    end;
end;

function PXMIElement.FindChild(XMIElementName: string): PXMIElement;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ChildCount - 1 do begin
    if (Children[I].FXMIElementName = XMIElementName) then begin
      Result := Children[I];
      Exit;
    end;
  end;
end;

function PXMIElement.FindAncestorByXMIElementName(XMIElementName: string): PXMIElement;
begin
  if FParent = nil then
    Result := nil
  else if FParent.XMIElementName = XMIElementName then
    Result := FParent
  else
    Result := FParent.FindAncestorByXMIElementName(XMIElementName);
end;

function PXMIElement.FindAncestorByUMLElementKind(UMLElementKind: string): PXMIElement;
begin
  Result := nil;
  if FParent = nil then Exit;
  if (FParent.TargetElement <> nil) and FParent.TargetElement.IsKindOf(UMLElementKind) then
    Result := FParent
  else
    Result := FParent.FindAncestorByUMLElementKind(UMLElementKind);
end;

// PXMIElement
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PXMIElementExt

constructor PXMIElementExt.Create(AXMIElementName: string; ATargetElement: IElement; AXMIId: string);
begin
  inherited Create(AXMIElementName, ATargetElement, AXMIId);
  FAssociatedElements := TInterfaceList.Create;
end;

destructor PXMIElementExt.Destroy;
begin
  FAssociatedElements.Free;
  inherited;
end;

function PXMIElementExt.GetAssociatedElementCount: Integer;
begin
  Result := FAssociatedElements.Count;
end;

function PXMIElementExt.GetAssociatedElement(Index: Integer): IElement;
var
  E: IElement;
begin
  Result := nil;
  if FAssociatedElements.Items[Index].QueryInterface(IElement, E) = S_OK then
    Result := E;
end;

procedure PXMIElementExt.SetAdditionalObj(Value: IDispatch);
begin
  FAdditionalObj := Value;
end;

procedure PXMIElementExt.AddAssociatedElement(Value: IElement);
begin
  if FAssociatedElements.IndexOf(Value) = -1 then
    FAssociatedElements.Add(Value);
end;

procedure PXMIElementExt.RemoveAssociatedElement(Value: IElement);
begin
  if FAssociatedElements.IndexOf(Value) <> -1 then
    FAssociatedElements.Add(Value);
end;

function PXMIElementExt.FindXMIElementByElement(Element: IElement): PXMIElement;
var
  XE: PXMIElement;
  I: Integer;
begin
  Result := nil;
  XE := inherited FindXMIElementByElement(Element);
  if XE <> nil then begin
    Result := XE;
    Exit;
  end;
  for I := 0 to FAssociatedElements.Count - 1 do begin
    if AssociatedElements[I].GetGuid = Element.GetGuid then begin
      Result := Self;
      Exit;
    end;
  end;
end;

// PXMIElementExt
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PXMIAttribute

constructor PXMIAttribute.Create(AKey: string);
begin
  FKey := AKey;
  FValues := TStringList.Create;
end;

destructor PXMIAttribute.Destroy;
begin
  FValues.Free;
  inherited;
end;

procedure PXMIAttribute.ClearValue;
begin
  FValues.Clear;
end;

function PXMIAttribute.GetValueCount: Integer;
begin
  Result := FValues.Count;
end;

function PXMIAttribute.GetValue(Index: Integer): string;
begin
  Result := FValues[Index];
end;

procedure PXMIAttribute.AddValue(Value: string);
begin
  if FValues.IndexOf(Value) = -1 then
    FValues.Add(Value);
end;

procedure PXMIAttribute.RemoveValue(Value: string);
var
  Idx: Integer;
begin
  Idx := FValues.IndexOf(Value);
  if Idx <> -1 then
    FValues.Delete(Idx);
end;

function PXMIAttribute.ToString: string;
var
  S: string;
  I: Integer;
begin
  Result := '';
  if ValueCount > 0 then begin
    S := Values[0];
    for I := 1 to ValueCount - 1 do begin
      S := S + ' ' + Values[I];
    end;
    Result := Format('%s="%s"', [Key, PUtility.EncodeXMLAttributeValue(S)]);
  end;
end;

// PXMIAttribute
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PXMIExporter

constructor PXMIExporter.Create;
begin
  FContents := TList.Create;
end;

destructor PXMIExporter.Destroy;
begin
  Clear;
  FContents.Free;
  inherited;
end;

function PXMIExporter.IssueXMIId(E: IElement): string;
begin
  XMIIdNumber := XMIIdNumber + 1;
  if E <> nil then
    Result := E.GetClassName + '.' + IntToStr(XMIIdNumber)
  else
    Result := 'X.' + IntToStr(XMIIdNumber);
end;

function PXMIExporter.IssueXMIUUId(E: IElement): string;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := UUID_NAMESPACE_PREFIX + Copy(GUIDToString(Guid), 2, 36);
end;

function PXMIExporter.GetContentCount: Integer;
begin
  Result := FContents.Count;
end;

function PXMIExporter.GetContent(Index: Integer): PXMIElement;
begin
  Result := PXMIElement(FContents.Items[Index]);
end;

procedure PXMIExporter.VisitStarUMLModels(Element: IElement; Proc: PElementProc);
var
  MClass: IMetaClass;
  MCollection: IMetaCollection;
  MReference: IMetaReference;
  SubElem, RefElem: IElement;
  I, J: Integer;
begin
  Proc(Element);
  MClass := Element.GetMetaClass;
  for I := 0 to MClass.GetMetaReferenceCount - 1 do begin
    MReference := MClass.GetMetaReferenceAt(I);
    if MReference.Aggregate = makComposite then begin
      RefElem := Element.MOF_GetReference(MReference.Name);
      if RefElem <> nil then
        VisitStarUMLModels(RefElem, Proc);
    end;
  end;
  for I := 0 to MClass.GetMetaCollectionCount - 1 do begin
    MCollection := MClass.GetMetaCollectionAt(I);
    if MCollection.Aggregate = makComposite then
      for J := 0 to Element.MOF_GetCollectionCount(MCollection.Name) - 1 do begin
        SubElem := Element.MOF_GetCollectionItem(MCollection.Name, J);
        if SubElem <> nil then
          VisitStarUMLModels(SubElem, Proc);
      end;
  end;
end;

function PXMIExporter.FindXMIElementByElement(Element: IElement): PXMIElement;
var
  XE: PXMIElement;
  I: Integer;
begin
  Result := nil;
  for I := 0 to ContentCount - 1 do begin
    XE := Contents[I].FindXMIElementByElement(Element);
    if XE <> nil then begin
      Result := XE;
      Exit;
    end;
  end;
end;

function PXMIExporter.CreateXMIElement(XMIElemName: string; Element: IElement; ParentXMIElem: PXMIElement; CreateId: Boolean = True): PXMIElement;
var
  XE: PXMIElement;
begin
  // (warning)
  // Be ware that parameter 'Element' must be nil when XMI element does not correspond to Element directly
  if CreateId then begin
    XE := PXMIElement.Create(XMIElemName, Element, IssueXMIId(Element));
    if FCreateUUID then
      SetXMIAttributeValue(XE, 'xmi.uuid', IssueXMIUUId(Element));
  end
  else
    XE := PXMIElement.Create(XMIElemName, Element);
  if ParentXMIElem = nil then
    FContents.Add(XE)
  else
    ParentXMIElem.AddChild(XE);
  Result := XE;
end;

function PXMIExporter.CreateXMIElementExt(XMIElemName: string; Element: IElement; ParentXMIElem: PXMIElement; CreateId: Boolean = True): PXMIElementExt;
var
  XE: PXMIElementExt;
begin
  // (warning)
  // Be ware that parameter 'Element' must be nil when XMI element does not correspond to Element directly
  if CreateId then begin
    XE := PXMIElementExt.Create(XMIElemName, Element, IssueXMIId(Element));
    if FCreateUUID then
      SetXMIAttributeValue(XE, 'xmi.uuid', IssueXMIUUId(Element));
  end
  else
    XE := PXMIElementExt.Create(XMIElemName, Element);
  if ParentXMIElem = nil then
    FContents.Add(XE)
  else
    ParentXMIElem.AddChild(XE);
  Result := XE;
end;

function PXMIExporter.AcquireXMIElement(XMIElem: PXMIElement; XMIElemName: string; Element: IElement; CreateId: Boolean = True): PXMIElement;
var
  XE: PXMIElement;
begin
  XE := XMIElem.FindChild(XMIElemName);
  if XE = nil then
    XE := CreateXMIElement(XMIElemName, Element, XMIElem, CreateId);
  Result := XE;
end;

function PXMIExporter.AcquireXMIAttribute(XMIElem: PXMIElement; XMIAttrName: string): PXMIAttribute;
var
  XA: PXMIAttribute;
begin
  XA := XMIElem.FindXMIAttribute(XMIAttrName);
  if XA = nil then begin
    XA := PXMIAttribute.Create(XMIAttrName);
    XMIElem.AddAttribute(XA);
  end;
  Result := XA;
end;

procedure PXMIExporter.SetXMIAttributeValue(XMIElem: PXMIElement; XMIAttrName: string; Value: string);
var
  XA: PXMIAttribute;
begin
  XA := AcquireXMIAttribute(XMIElem, XMIAttrName);
  XA.ClearValue;
  XA.AddValue(Value);
end;

procedure PXMIExporter.AddXMIAttributeValue(XMIElem: PXMIElement; XMIAttrName: string; Value: string);
var
  XA: PXMIAttribute;
begin
  XA := AcquireXMIAttribute(XMIElem, XMIAttrName);
  XA.AddValue(Value);
end;

procedure PXMIExporter.SetXMIAttrAttribute(XMIElem: PXMIElement; Element: IElement; AttrName: string; XMIAttrName: string);
var
  AttrType: string;
begin
  AttrType := Element.GetMetaClass.GetAttributeByName(AttrName).TypeRef.Name;
  if AttrType = 'Boolean' then
    SetXMIAttributeValue(XMIElem, XMIAttrName, LowerCase(Element.MOF_GetAttribute(AttrName)))
  else
    SetXMIAttributeValue(XMIElem, XMIAttrName, Element.MOF_GetAttribute(AttrName));
end;

procedure PXMIExporter.SetXMIAttrEnumAttribute(XMIElem: PXMIElement; Element: IElement; AttrName: string; XMIAttrName: string; ConvFunc: PXMIEnumConvFunc);
begin
  SetXMIAttributeValue(XMIElem, XMIAttrName, ConvFunc(Element.MOF_GetAttribute(AttrName)));
end;

procedure PXMIExporter.SetXMIAttrReference(XMIElem: PXMIElement; Element: IElement; AttrName: string; XMIAttrName: string);
var
  XE: PXMIElement;
  E: IElement;
begin
  E := Element.MOF_GetReference(AttrName);
  if (E <> nil) then begin
    XE := FindXMIElementByElement(E);
    // Assert(XE <> nil); replaced with following
    if XE <> nil then
      SetXMIAttributeValue(XMIElem, XMIAttrName, XE.XMIId);
  end;
end;

procedure PXMIExporter.SetXMIAttrAggregation(XMIElem: PXMIElement; Element: IElement; AttrName: string; XMIAttrName: string);
var
  XA: PXMIAttribute;
  XE: PXMIElement;
  E: IElement;
  I: Integer;
begin
  if Element.MOF_GetCollectionCount(AttrName) > 0 then begin
    XA := AcquireXMIAttribute(XMIElem, XMIAttrName);
    for I := 0 to Element.MOF_GetCollectionCount(AttrName) - 1 do begin
      E := Element.MOF_GetCollectionItem(AttrName, I);
      Assert(E <> nil);
      XE := FindXMIElementByElement(E);
      Assert(XE <> nil);
      XA.AddValue(XE.XMIId);
    end;
  end;
end;

function PXMIExporter.GetCurrentTimeStamp: string;
begin
  Result := Format('%s %s %s', [PUtility.GetDayOfWeekName(Now), PUtility.GetMonthName(Now), FormatDateTime('dd h:n:s yyyy', Now)]);
end;

procedure PXMIExporter.WriteHeader(Writer: TStringList);
begin
  Writer.Add('<XMI.header>');
  Writer.Add('  <XMI.documentation>');
  Writer.Add(Format('    <XMI.owner>%s</XMI.owner>', [StarUMLApp.GetProject.Company]));
  Writer.Add(Format('    <XMI.contact>%s</XMI.contact>', [StarUMLApp.GetProject.Author]));
  Writer.Add(Format('    <XMI.exporter>%s</XMI.exporter>', [TOOL_NAME]));
  Writer.Add(Format('    <XMI.exporterVersion>%s</XMI.exporterVersion>', [TOOL_VERSION]));
  Writer.Add(Format('    <XMI.notice>%s</XMI.notice>', [StarUMLApp.GetProject.Copyright]));
  Writer.Add('  </XMI.documentation>');
  Writer.Add(Format('  <XMI.metamodel xmi.name = "UML" xmi.version = "%s"/>', [FUMLVersion]));
  Writer.Add(' </XMI.header>');
end;

procedure PXMIExporter.WriteContents(Writer: TStringList);
var
  I: Integer;
begin
  Writer.Add('<XMI.content>');
  for I := 0 to ContentCount - 1 do
    Writer.Add(Contents[I].ToString(0));
  Writer.Add('</XMI.content>');
end;

procedure PXMIExporter.WriteXMI(Writer: TStringList);
begin
  Writer.Add('<?xml version = "1.0" encoding = "UTF-8"?>');
  if FCreateTimeStamp then
    Writer.Add(Format('<XMI xmi.version = "%s" xmlns:UML="%s" timestamp = "%s">', [FXMIVersion, FUMLNamespace, GetCurrentTimeStamp]))
  else
    Writer.Add(Format('<XMI xmi.version = "%s" xmlns:UML="%s">', [FXMIVersion, FUMLNamespace]));
  WriteHeader(Writer);
  WriteContents(Writer);
  Writer.Add('</XMI>');
end;

procedure PXMIExporter.StimulateProgressEvent(Pos: Integer; Max: Integer; Msg: string);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Pos, Max, Msg);
end;

procedure PXMIExporter.Log(Text: string);
begin
  StarUMLApp.Log(Text);
end;

procedure PXMIExporter.Report(Msg: string; TargetElement: IElement);
begin
  StarUMLApp.AddMessageItem(mkGeneral, Msg, TargetElement);
end;

procedure PXMIExporter.Clear;
var
  I: Integer;
begin
  for I := FContents.Count - 1 downto 0 do begin
    PXMIElement(FContents.Items[I]).Free;
    FContents.Delete(I);
  end;
  XMIIdNumber := 0;
end;

procedure PXMIExporter.ExportToFile(FileName: string);
var
  Writer: TStringList;
begin
  Assert(FStarUMLApp <> nil);
  Log(Format(MSG_EXPORT_START, [FileName]));
  try
    Clear;
    BuildXMIElements;
    Writer := TStringList.Create;
    try
      WriteXMI(Writer);
      Writer.SaveToFile(FileName);
    finally
      Writer.Free;
    end;
    Log(MSG_EXPORT_SUCCEEDE);
  except
    on E: Exception do begin
      Log(MSG_EXPORT_FAILED);
      raise Exception.Create(E.Message);
    end;
  end;
end;

// PXMIExporter
////////////////////////////////////////////////////////////////////////////////

end.
