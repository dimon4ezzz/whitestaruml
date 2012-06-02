unit CoreAuto;

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

{$HINTS OFF}

uses
  BasicClasses, Core, WhiteStarUML_TLB,
  Graphics, SysUtils;

type
  // Forward Declaration
  PElementAuto = class;
  PViewAuto = class;
  PDiagramViewAuto = class;
  PModelAuto = class;
  PDiagramAuto = class;

  // PMetaElementAuto
  PMetaElementAuto = class(PAutoObject, IMetaElement)
  protected
    function Get_Name: WideString; safecall;
    function GetGuid: WideString; safecall;
  end;

  // PMetaLiteralAuto
  PMetaLiteralAuto = class(PMetaElementAuto, IMetaLiteral)
  end;

  // PMetaSlotAuto
  PMetaSlotAuto = class(PMetaElementAuto, IMetaSlot)
  protected
    function Get_IsReadOnly: WordBool; safecall;
    function Get_IsDerived: WordBool; safecall;
    function Get_TypeRef: IMetaClassifier; safecall;
  end;

  // PMetaClassifierAuto
  PMetaClassifierAuto = class(PMetaElementAuto, IMetaClassifier)
  end;

  // PMetaDataTypeAuto
  PMetaDataTypeAuto = class(PMetaClassifierAuto, IMetaDataType)
  end;

  // PMetaPrimitiveTypeAuto
  PMetaPrimitiveTypeAuto = class(PMetaClassifierAuto, IMetaPrimitiveType)
  end;

  // PMetaEnumerationAuto
  PMetaEnumerationAuto = class(PMetaClassifierAuto, IMetaEnumeration)
  protected
    function GetMetaLiteralCount: Integer; safecall;
    function GetMetaLiteralAt(Index: Integer): IMetaLiteral; safecall;
  end;

  // PMetaClassAuto
  PMetaClassAuto = class(PMetaClassifierAuto, IMetaClass)
  protected
    function Get_IsAbstract: WordBool; safecall;
    function GetMetaAttributeCount: Integer; safecall;
    function GetMetaAttributeAt(Index: Integer): IMetaAttribute; safecall;
    function GetMetaReferenceCount: Integer; safecall;
    function GetMetaReferenceAt(Index: Integer): IMetaReference; safecall;
    function GetMetaCollectionCount: Integer; safecall;
    function GetMetaCollectionAt(Index: Integer): IMetaCollection; safecall;
    function GetSubclassCount: Integer; safecall;
    function GetSubclassAt(Index: Integer): IMetaClass; safecall;
    function Get_Superclass: IMetaClass; safecall;
    function FindInstanceByGuid(const Guid: WideString): IElement; safecall;
    function FindInstanceByGuidRecurse(const Guid: WideString): IElement; safecall;
    function IsKindOf(const ClassName: WideString): WordBool; safecall;
    function ExistsAttribute(const Name: WideString): WordBool; safecall;
    function ExistsReference(const Name: WideString): WordBool; safecall;
    function ExistsCollection(const Name: WideString): WordBool; safecall;
    function GetAttributeByName(const Name: WideString): IMetaAttribute; safecall;
    function GetReferenceByName(const Name: WideString): IMetaReference; safecall;
    function GetCollectionByName(const Name: WideString): IMetaCollection; safecall;
    function GetContainerRelation(const Container: WideString): IMetaReference; safecall;
    function GetInstanceAt(Index: Integer): IElement; safecall;
    function GetInstanceCount: Integer; safecall;
    function GetInclusiveInstanceAt(Index: Integer): IElement; safecall;
    function GetInclusiveInstanceCount: Integer; safecall;
  end;


  // PMetaAttributeAuto
  PMetaAttributeAuto = class(PMetaSlotAuto, IMetaAttribute)
  protected
    function Get_DefaultValue: WideString; safecall;
  end;

  // PMetaAssociationEndAuto
  PMetaAssociationEndAuto = class(PMetaSlotAuto, IMetaAssociationEnd)
  protected
    function Get_Kind: MetaAssociationEndKind; safecall;
    function Get_Aggregate: MetaAggregateKind; safecall;
    function Get_OtherSide: WideString; safecall;
    function Get_OtherSideKind: MetaAssociationEndKind; safecall;
    function GetOtherSideEnd: IMetaAssociationEnd; safecall;
  end;

  // PMetaReferenceAuto
  PMetaReferenceAuto = class(PMetaAssociationEndAuto, IMetaReference)
  end;

  // PMetaCollectionAuto
  PMetaCollectionAuto = class(PMetaAssociationEndAuto, IMetaCollection)
  end;

  // PMetaModelAuto
  PMetaModelAuto = class(PMetaElementAuto, IMetaModel)
  protected
    function GetMetaClassCount: Integer; safecall;
    function GetMetaClassAt(Index: Integer): IMetaClass; safecall;
    function GetMetaEnumerationCount: Integer; safecall;
    function GetMetaEnumerationAt(Index: Integer): IMetaEnumeration; safecall;
    function GetMetaDataTypeCount: Integer; safecall;
    function GetMetaDataTypeAt(Index: Integer): IMetaDataType; safecall;
    function GetMetaPrimitiveTypeCount: Integer; safecall;
    function GetMetaPrimitiveTypeAt(Index: Integer): IMetaPrimitiveType; safecall;
    function FindInstanceByGuid(const Guid: WideString): IElement; safecall;
    function FindMetaClassifier(const Name: WideString): IMetaClassifier; safecall;
    function FindMetaClass(const Name: WideString): IMetaClass; safecall;
    function FindMetaEnumeration(const Name: WideString): IMetaEnumeration; safecall;
    function FindMetaDataType(const Name: WideString): IMetaDataType; safecall;
    function FindPrimitiveType(const Name: WideString): IMetaPrimitiveType; safecall;
  end;

  // PDocumentAuto
  PDocumentAuto = class(PAutoObject, IDocument)
  protected
    function Get_FileName: WideString; safecall;
    function Get_Version: WideString; safecall;
    function Get_Modified: WordBool; safecall;
    function Get_ReadOnly: WordBool; safecall;
    function GetDocumentSymbol: WideString; safecall;
    function GetDocumentElement: IElement; safecall;
    procedure Save; safecall;
    procedure SaveAs(const FileName: WideString); safecall;
  end;

  // PElementAuto
  PElementAuto = class(PAutoObject, IElement)
  protected
    function Get_Tag: WideString; safecall;
    procedure Set_Tag(const Value: WideString); safecall;
    function GetGuid: WideString; safecall;
    function GetMetaClass: IMetaClass; safecall;
    function GetContainingDocument: IDocument; safecall;
    function IsDocumentElement: WordBool; safecall;
    function IsReadOnly: WordBool; safecall;
    function GetClassName: WideString; safecall;
    function IsKindOf(const ClassName: WideString): WordBool; safecall;
    function MOF_GetAttribute(const Name: WideString): WideString; safecall;
    function MOF_GetReference(const Name: WideString): IElement; safecall;
    function MOF_GetCollectionItem(const Name: WideString; Index: Integer): IElement; safecall;
    function MOF_GetCollectionCount(const Name: WideString): Integer; safecall;
  end;

  // PViewAuto
  PViewAuto = class(PElementAuto, IView)
  protected
    function Get_LineColor: WideString; safecall;
    procedure Set_LineColor(const Value: WideString); safecall;
    function Get_FillColor: WideString; safecall;
    procedure Set_FillColor(const Value: WideString); safecall;
    function Get_FontFace: WideString; safecall;
    procedure Set_FontFace(const Value: WideString); safecall;
    function Get_FontColor: WideString; safecall;
    procedure Set_FontColor(const Value: WideString); safecall;
    function Get_FontSize: Integer; safecall;
    procedure Set_FontSize(Value: Integer); safecall;
    function Get_FontStyle: Integer; safecall;
    procedure Set_FontStyle(Value: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Selected: WordBool; safecall;
    function Get_Model: IModel; safecall;
    function Get_ContainerView: IView; safecall;
    function GetContainedViewAt(Index: Integer): IView; safecall;
    function GetContainedViewCount: Integer; safecall;
    function Get_OwnerDiagramView: IDiagramView; safecall;
    procedure BringToFront; safecall;
    procedure SendToBack; safecall;
    procedure Update; safecall;
    function GetDiagramView: IDiagramView; safecall;
    function CanContainView(const AView: IView): WordBool; safecall;
    function CanContainViewKind(const Kind: WideString): WordBool; safecall;
    procedure Move(DX: Integer; DY: Integer); safecall;
    procedure MoveInto(const AContainerView: IView); safecall;
  end;

  // PDiagramViewAuto
  PDiagramViewAuto = class(PViewAuto, IDiagramView)
  protected
    function GetSelectedViewAt(Index: Integer): IView; safecall;
    function GetSelectedViewCount: Integer; safecall;
    function Get_Diagram: IDiagram; safecall;
    function GetOwnedViewAt(Index: Integer): IView; safecall;
    function GetOwnedViewCount: Integer; safecall;
    function CanOwnView(const AView: IView): WordBool; safecall;
    function CanOwnViewKind(const Kind: WideString): WordBool; safecall;
    function CanCopyViews: WordBool; safecall;
    function CanDeleteViews: WordBool; safecall;
    function CreateViewOf(const AModel: IModel; X: Integer; Y: Integer): IView; safecall;
    procedure LayoutDiagram; safecall;
    procedure CopyDiagram; safecall;
    procedure ExportDiagramAsBitmap(const FileName: WideString); safecall;
    procedure ExportDiagramAsMetafile(const FileName: WideString); safecall;
    procedure ExportDiagramAsJPEG(const FileName: WideString); safecall;
  end;

  // PModelAuto
  PModelAuto = class(PElementAuto, IModel)
  protected
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Documentation: WideString; safecall;
    procedure Set_Documentation(const Value: WideString); safecall;
    function Get_Attachments: WideString; safecall;
    function Get_Pathname: WideString; safecall;
    function GetViewAt(Index: Integer): IView; safecall;
    function GetViewCount: Integer; safecall;
    function GetOwnedDiagramAt(Index: Integer): IDiagram; safecall;
    function GetOwnedDiagramCount: Integer; safecall;
    function FindByName(const AName: WideString): IModel; safecall;
    function FindByRelativePathname(const RelPath: WideString): IModel; safecall;
    function ContainsName(const AName: WideString): WordBool; safecall;
    function CanContain(const AModel: IModel): WordBool; safecall;
    function CanContainKind(const Kind: WideString): WordBool; safecall;
    function CanContainDiagram(const ADiagram: IDiagram): WordBool; safecall;
    function CanContainDiagramKind(const Kind: WideString): WordBool; safecall;
    function CanRelocateTo(const AModel: IModel): WordBool; safecall;
    function CanDelete: WordBool; safecall;
    procedure RelocateTo(const AOwner: IModel); safecall;
    procedure ClearAttachments; safecall;
    procedure AddAttachment(const Attach: WideString); safecall;
    procedure InsertAttachment(Index: Integer; const Attach: WideString); safecall;
    procedure DeleteAttachment(Index: Integer); safecall;
    function GetAttachmentAt(Index: Integer): WideString; safecall;
    function GetAttachmentCount: Integer; safecall;
  end;

  // PDiagramAuto
  PDiagramAuto = class(PModelAuto, IDiagram)
  protected
    function Get_DefaultDiagram: WordBool; safecall;
    procedure Set_DefaultDiagram(Value: WordBool); safecall;
    function Get_DiagramOwner: IModel; safecall;
    function Get_DiagramView: IDiagramView; safecall;
  end;

  // Utilities
  function FontStylesToInteger(F: TFontStyles): Integer;
  function IntegerToFontStyles(I: Integer): TFontStyles;
  function ColorToStr(C: TColor): string;

implementation

uses
  UMLAux, UMLModels, StarUMLApp;


////////////////////////////////////////////////////////////////////////////////
// PMetaElementAuto

function PMetaElementAuto.Get_Name: WideString;
begin
  Result := (TheObject as PMetaElement).Name;
end;

function PMetaElementAuto.GetGuid: WideString;
begin
  Result := (TheObject as PMetaElement).GUID;
end;

// PMetaElementAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMetaSlotAuto

function PMetaSlotAuto.Get_IsReadOnly: WordBool;
begin
  Result := (TheObject as PMetaSlot).IsReadOnly;
end;

function PMetaSlotAuto.Get_IsDerived: WordBool;
begin
  Result := (TheObject as PMetaSlot).IsDerived;
end;

function PMetaSlotAuto.Get_TypeRef: IMetaClassifier;
begin
  with TheObject as PMetaSlot do
    if TypeRef <> nil then
      Result := TypeRef.GetAutomationObject as IMetaClassifier
    else
      Result := nil;
end;

// PMetaSlotAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMetaEnumerationAuto

function PMetaEnumerationAuto.GetMetaLiteralCount: Integer;
begin
  Result := (TheObject as PMetaEnumeration).MetaLiteralCount;
end;

function PMetaEnumerationAuto.GetMetaLiteralAt(Index: Integer): IMetaLiteral;
begin
  Result := (TheObject as PMetaEnumeration).MetaLiterals[Index].GetAutomationObject as IMetaLiteral;
end;

// PMetaEnumerationAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMetaClassAuto

function PMetaClassAuto.Get_IsAbstract: WordBool;
begin
  Result := (TheObject as PMetaClass).IsAbstract;
end;

function PMetaClassAuto.GetMetaAttributeCount: Integer;
begin
  Result := (TheObject as PMetaClass).MetaAttributeCount;
end;

function PMetaClassAuto.GetMetaAttributeAt(Index: Integer): IMetaAttribute;
begin
  Result := (TheObject as PMetaClass).MetaAttributes[Index].GetAutomationObject as IMetaAttribute;
end;

function PMetaClassAuto.GetMetaReferenceCount: Integer;
begin
  Result := (TheObject as PMetaClass).MetaReferenceCount;
end;

function PMetaClassAuto.GetMetaReferenceAt(Index: Integer): IMetaReference;
begin
  Result := (TheObject as PMetaClass).MetaReferences[Index].GetAutomationObject as IMetaReference;
end;

function PMetaClassAuto.GetMetaCollectionCount: Integer;
begin
  Result := (TheObject as PMetaClass).MetaCollectionCount;
end;

function PMetaClassAuto.GetMetaCollectionAt(Index: Integer): IMetaCollection;
begin
  Result := (TheObject as PMetaClass).MetaCollections[Index].GetAutomationObject as IMetaCollection;
end;

function PMetaClassAuto.GetSubclassCount: Integer;
begin
  Result := (TheObject as PMetaClass).SubclassCount;
end;

function PMetaClassAuto.GetSubclassAt(Index: Integer): IMetaClass;
begin
  Result := (TheObject as PMetaClass).Subclasses[Index].GetAutomationObject as IMetaClass;
end;

function PMetaClassAuto.Get_Superclass: IMetaClass;
begin
  Result := (TheObject as PMetaClass).Superclass.GetAutomationObject as IMetaClass;
end;

function PMetaClassAuto.FindInstanceByGuid(const Guid: WideString): IElement;
var
  E: PElement;
begin
  E := (TheObject as PMetaClass).FindInstanceByGuid(Guid);
  if E <> nil then
    Result := E.GetAutomationObject as IElement
  else
    Result := nil;
end;

function PMetaClassAuto.FindInstanceByGuidRecurse(const Guid: WideString): IElement;
var
  E: PElement;
begin
  E := (TheObject as PMetaClass).FindInstanceByGuidRecurse(Guid);
  if E <> nil then
    Result := E.GetAutomationObject as IElement
  else
    Result := nil;
end;

function PMetaClassAuto.IsKindOf(const ClassName: WideString): WordBool;
begin
  Result := (TheObject as PMetaClass).IsKindOf(ClassName);
end;

function PMetaClassAuto.ExistsAttribute(const Name: WideString): WordBool;
begin
  Result := (TheObject as PMetaClass).ExistsAttribute(Name);
end;

function PMetaClassAuto.ExistsReference(const Name: WideString): WordBool;
begin
  Result := (TheObject as PMetaClass).ExistsReference(Name);
end;

function PMetaClassAuto.ExistsCollection(const Name: WideString): WordBool;
begin
  Result := (TheObject as PMetaClass).ExistsCollection(Name);
end;

function PMetaClassAuto.GetAttributeByName(const Name: WideString): IMetaAttribute;
var
  A: PMetaAttribute;
begin
  A := (TheObject as PMetaClass).GetAttributeByName(Name);
  if A <> nil then
    Result := A.GetAutomationObject as IMetaAttribute
  else
    Result := nil;
end;

function PMetaClassAuto.GetReferenceByName(const Name: WideString): IMetaReference;
var
  A: PMetaReference;
begin
  A := (TheObject as PMetaClass).GetReferenceByName(Name);
  if A <> nil then
    Result := A.GetAutomationObject as IMetaReference
  else
    Result := nil;
end;

function PMetaClassAuto.GetCollectionByName(const Name: WideString): IMetaCollection;
var
  A: PMetaCollection;
begin
  A := (TheObject as PMetaClass).GetCollectionByName(Name);
  if A <> nil then
    Result := A.GetAutomationObject as IMetaCollection
  else
    Result := nil;
end;

function PMetaClassAuto.GetContainerRelation(const Container: WideString): IMetaReference;
var
  MC: PMetaClass;
  R: PMetaReference;
begin
  R := nil;
  MC := MetaModel.FindMetaClass(Container);
  if MC <> nil then
    R := (TheObject as PMetaClass).GetContainerRelation(MC);
  if R <> nil then
    Result := R.GetAutomationObject as IMetaReference
  else
    Result := nil;
end;

function PMetaClassAuto.GetInstanceAt(Index: Integer): IElement;
begin
  Result := (TheObject as PMetaClass).Instances[Index].GetAutomationObject as IElement;
end;

function PMetaClassAuto.GetInstanceCount: Integer;
begin
  Result := (TheObject as PMetaClass).InstanceCount;
end;

function PMetaClassAuto.GetInclusiveInstanceAt(Index: Integer): IElement;
begin
  Result := (TheObject as PMetaClass).InclusiveInstances[Index].GetAutomationObject as IElement;
end;

function PMetaClassAuto.GetInclusiveInstanceCount: Integer;
begin
  Result := (TheObject as PMetaClass).InclusiveInstanceCount;
end;

// PMetaClassAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMetaAttributeAuto

function PMetaAttributeAuto.Get_DefaultValue: WideString;
begin
  Result := (TheObject as PMetaAttribute).DefaultValue;
end;

// PMetaAttributeAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMetaAssociationEndAuto

function PMetaAssociationEndAuto.Get_Kind: MetaAssociationEndKind;
begin
  Result := MetaAssociationEndKind((TheObject as PMetaAssociationEnd).Kind);
end;

function PMetaAssociationEndAuto.Get_Aggregate: MetaAggregateKind;
begin
  Result := MetaAggregateKind((TheObject as PMetaAssociationEnd).Aggregate);
end;

function PMetaAssociationEndAuto.Get_OtherSide: WideString;
begin
  Result := (TheObject as PMetaAssociationEnd).OtherSide;
end;

function PMetaAssociationEndAuto.Get_OtherSideKind: MetaAssociationEndKind;
begin
  Result := MetaAssociationEndKind((TheObject as PMetaAssociationEnd).OtherSideKind);
end;

function PMetaAssociationEndAuto.GetOtherSideEnd: IMetaAssociationEnd;
var
  E: PMetaAssociationEnd;
begin
  E := (TheObject as PMetaAssociationEnd).GetOtherSideEnd;
  if E <> nil then
    Result := E.GetAutomationObject as IMetaAssociationEnd
  else
    Result := nil;
end;

// PMetaAssociationEndAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PMetaModelAuto

function PMetaModelAuto.GetMetaClassCount: Integer;
begin
  Result := (TheObject as PMetaModel).MetaClassCount;
end;

function PMetaModelAuto.GetMetaClassAt(Index: Integer): IMetaClass;
begin
  Result := (TheObject as PMetaModel).MetaClasses[Index].GetAutomationObject as IMetaClass;
end;

function PMetaModelAuto.GetMetaEnumerationCount: Integer;
begin
  Result := (TheObject as PMetaModel).MetaEnumerationCount;
end;

function PMetaModelAuto.GetMetaEnumerationAt(Index: Integer): IMetaEnumeration;
begin
  Result := (TheObject as PMetaModel).MetaEnumerations[Index].GetAutomationObject as IMetaEnumeration;
end;

function PMetaModelAuto.GetMetaDataTypeCount: Integer;
begin
  Result := (TheObject as PMetaModel).MetaDataTypeCount;
end;

function PMetaModelAuto.GetMetaDataTypeAt(Index: Integer): IMetaDataType;
begin
  Result := (TheObject as PMetaModel).MetaDataTypes[Index].GetAutomationObject as IMetaDataType;
end;

function PMetaModelAuto.GetMetaPrimitiveTypeCount: Integer;
begin
  Result := (TheObject as PMetaModel).MetaPrimitiveTypeCount;
end;

function PMetaModelAuto.GetMetaPrimitiveTypeAt(Index: Integer): IMetaPrimitiveType;
begin
  Result := (TheObject as PMetaModel).MetaPrimitiveTypes[Index].GetAutomationObject as IMetaPrimitiveType;
end;

function PMetaModelAuto.FindInstanceByGuid(const Guid: WideString): IElement;
var
  E: PElement;
begin
  E := (TheObject as PMetaModel).FindInstanceByGuid(Guid);
  if E <> nil then
    Result := E.GetAutomationObject as IElement
  else
    Result := nil;
end;

function PMetaModelAuto.FindMetaClassifier(const Name: WideString): IMetaClassifier;
var
  M: PMetaClassifier;
begin
  M := (TheObject as PMetaModel).FindMetaClassifier(Name);
  if M <> nil then
    Result := M.GetAutomationObject as IMetaClassifier
  else
    Result := nil;
end;

function PMetaModelAuto.FindMetaClass(const Name: WideString): IMetaClass;
var
  M: PMetaClass;
begin
  M := (TheObject as PMetaModel).FindMetaClass(Name);
  if M <> nil then
    Result := M.GetAutomationObject as IMetaClass
  else
    Result := nil;
end;

function PMetaModelAuto.FindMetaEnumeration(const Name: WideString): IMetaEnumeration;
var
  M: PMetaEnumeration;
begin
  M := (TheObject as PMetaModel).FindMetaEnumeration(Name);
  if M <> nil then
    Result := M.GetAutomationObject as IMetaEnumeration
  else
    Result := nil;
end;

function PMetaModelAuto.FindMetaDataType(const Name: WideString): IMetaDataType;
var
  M: PMetaDataType;
begin
  M := (TheObject as PMetaModel).FindMetaDataType(Name);
  if M <> nil then
    Result := M.GetAutomationObject as IMetaDataType
  else
    Result := nil;
end;

function PMetaModelAuto.FindPrimitiveType(const Name: WideString): IMetaPrimitiveType;
var
  M: PMetaPrimitiveType;
begin
  M := (TheObject as PMetaModel).FindMetaPrimitiveType(Name);
  if M <> nil then
    Result := M.GetAutomationObject as IMetaPrimitiveType
  else
    Result := nil;
end;

// PMetaModelAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDocumentAuto

function PDocumentAuto.Get_FileName: WideString;
begin
  Result := (TheObject as PDocument).FileName;
end;

function PDocumentAuto.Get_Version: WideString;
begin
  Result := (TheObject as PDocument).Version;
end;

function PDocumentAuto.Get_Modified: WordBool;
begin
  Result := (TheObject as PDocument).Modified;
end;

function PDocumentAuto.Get_ReadOnly: WordBool;
begin
  Result := (TheObject as PDocument).ReadOnly;
end;

function PDocumentAuto.GetDocumentSymbol: WideString;
begin
  Result := (TheObject as PDocument).GetDocumentSymbol;
end;

function PDocumentAuto.GetDocumentElement: IElement;
begin
  Result := (TheObject as PDocument).DocumentElement.GetAutomationObject as IElement;
end;

procedure PDocumentAuto.Save;
var
  Pkg: PUMLPackage;
begin
  Pkg := (TheObject as PDocument).DocumentElement as PUMLPackage;
  StarUMLApplication.SaveUnit(Pkg);
end;

procedure PDocumentAuto.SaveAs(const FileName: WideString);
var
  Pkg: PUMLPackage;
begin
  Pkg := (TheObject as PDocument).DocumentElement as PUMLPackage;
  StarUMLApplication.SaveUnitAs(Pkg, FileName);
end;

// PDocumentAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PElementAuto

function PElementAuto.Get_Tag: WideString;
begin
  Result := (TheObject as PElement).Tag;
end;

procedure PElementAuto.Set_Tag(const Value: WideString);
begin
  (TheObject as PElement).Tag := Value;
end;

function PElementAuto.GetGuid: WideString;
begin
  Result := (TheObject as PElement).GUID;
end;

function PElementAuto.IsDocumentElement: WordBool;
begin
  Result := (TheObject as PElement).IsDocumentElement;
end;

function PElementAuto.GetMetaClass: IMetaClass;
begin
  Result := (TheObject as PElement).MetaClass.GetAutomationObject as IMetaClass;
end;

function PElementAuto.GetContainingDocument: IDocument;
var
  D: PDocument;
begin
  D := (TheObject as PElement).GetContainingDocument;
  if D <> nil then
    Result := D.GetAutomationObject as IDocument
  else
    Result := nil;
end;

function PElementAuto.IsReadOnly: WordBool;
begin
  Result := (TheObject as PElement).ReadOnly;
end;

function PElementAuto.GetClassName: WideString;
begin
  Result := (TheObject as PElement).MetaClass.Name;
end;

function PElementAuto.IsKindOf(const ClassName: WideString): WordBool;
begin
  Result := (TheObject as PElement).MetaClass.IsKindOf(ClassName);
end;

function PElementAuto.MOF_GetAttribute(const Name: WideString): WideString;
begin
  Result := (TheObject as PElement).MOF_GetAttribute(Name);
end;

function PElementAuto.MOF_GetReference(const Name: WideString): IElement;
var
  E: PElement;
begin
  E := (TheObject as PElement).MOF_GetReference(Name);
  if E <> nil then
    Result := E.GetAutomationObject as IElement
  else
    Result := nil;
end;

function PElementAuto.MOF_GetCollectionItem(const Name: WideString; Index: Integer): IElement;
var
  E: PElement;
begin
  E := (TheObject as PElement).MOF_GetCollectionItem(Name, Index);
  if E <> nil then
    Result := E.GetAutomationObject as IElement
  else
    Result := nil;
end;

function PElementAuto.MOF_GetCollectionCount(const Name: WideString): Integer;
begin
  Result := (TheObject as PElement).MOF_GetCollectionCount(Name);
end;

// PElementAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PViewAuto

function PViewAuto.Get_LineColor: WideString;
begin
  Result := ColorToStr((TheObject as PView).LineColor);
end;

procedure PViewAuto.Set_LineColor(const Value: WideString);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'LineColor', Value);
end;

function PViewAuto.Get_FillColor: WideString;
begin
  Result := ColorToStr((TheObject as PView).FillColor);
end;

procedure PViewAuto.Set_FillColor(const Value: WideString);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'FillColor', Value);
end;

function PViewAuto.Get_FontFace: WideString;
begin
  Result := (TheObject as PView).FontFace;
end;

procedure PViewAuto.Set_FontFace(const Value: WideString);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'FontFace', Value);
end;

function PViewAuto.Get_FontColor: WideString;
begin
  Result := ColorToStr((TheObject as PView).FontColor);
end;

procedure PViewAuto.Set_FontColor(const Value: WideString);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'FontColor', Value);
end;

function PViewAuto.Get_FontSize: Integer;
begin
  Result := (TheObject as PView).FontSize;
end;

procedure PViewAuto.Set_FontSize(Value: Integer);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'FontSize', IntegerToString(Value));
end;

function PViewAuto.Get_FontStyle: Integer;
begin
  Result := FontStylesToInteger((TheObject as PView).FontStyle);
end;

procedure PViewAuto.Set_FontStyle(Value: Integer);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'FontStyle', IntegerToString(Value));
end;

function PViewAuto.Get_Visible: WordBool;
begin
  Result := (TheObject as PView).Visible;
end;

function PViewAuto.Get_Enabled: WordBool;
begin
  Result := (TheObject as PView).Enabled;
end;

function PViewAuto.Get_Selected: WordBool;
begin
  Result := (TheObject as PView).Selected;
end;

function PViewAuto.Get_Model: IModel;
var
  E: PModel;
begin
  E := (TheObject as PView).Model;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PModelAuto;
end;

function PViewAuto.Get_ContainerView: IView;
var
  E: PView;
begin
  E := (TheObject as PView).ContainerView;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PViewAuto;
end;

function PViewAuto.GetContainedViewAt(Index: Integer): IView;
var
  E: PView;
begin
  E := (TheObject as PView).ContainedViews[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PViewAuto;
end;

function PViewAuto.GetContainedViewCount: Integer;
begin
  Result := (TheObject as PView).ContainedViewCount;
end;

function PViewAuto.Get_OwnerDiagramView: IDiagramView;
var
  E: PDiagramView;
begin
  E := (TheObject as PView).OwnerDiagramView;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PDiagramViewAuto;
end;

procedure PViewAuto.BringToFront;
begin
  (TheObject as PView).BringToFront;
end;

procedure PViewAuto.SendToBack;
begin
  (TheObject as PView).SendToBack;
end;

procedure PViewAuto.Update;
begin
  (TheObject as PView).Update;
end;

function PViewAuto.GetDiagramView: IDiagramView;
begin
  Result := (TheObject as PView).GetDiagramView.GetAutomationObject as PDiagramViewAuto;
end;

function PViewAuto.CanContainView(const AView: IView): WordBool;
var
  V: PView;
begin
  V := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(AView.GetGuid) as PView;
  Result := (TheObject as PView).CanContainView(V);
end;

function PViewAuto.CanContainViewKind(const Kind: WideString): WordBool;
begin
  Result := (TheObject as PView).CanContainViewKind(Kind);
end;

procedure PViewAuto.Move(DX: Integer; DY: Integer);
begin
  StarUMLApplication.MoveView(TheObject as PView, DX, DY);
end;

procedure PViewAuto.MoveInto(const AContainerView: IView);
var
  V: PView;
begin
  V := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(AContainerView.GetGuid) as PView;
  StarUMLApplication.MoveViewChangingContainerView(TheObject as PView, 0, 0, V);
end;

// PViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDiagramViewAuto

function PDiagramViewAuto.GetSelectedViewAt(Index: Integer): IView;
var
  E: PView;
begin
  E := (TheObject as PDiagramView).SelectedViews[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PViewAuto;
end;

function PDiagramViewAuto.GetSelectedViewCount: Integer;
begin
  Result := (TheObject as PDiagramView).SelectedViewCount;
end;

function PDiagramViewAuto.Get_Diagram: IDiagram;
var
  E: PDiagram;
begin
  E := (TheObject as PDiagramView).Diagram;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PDiagramAuto;
end;

function PDiagramViewAuto.GetOwnedViewAt(Index: Integer): IView;
var
  E: PView;
begin
  E := (TheObject as PDiagramView).OwnedViews[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PViewAuto;
end;

function PDiagramViewAuto.GetOwnedViewCount: Integer;
begin
  Result := (TheObject as PDiagramView).OwnedViewCount;
end;

function PDiagramViewAuto.CanOwnView(const AView: IView): WordBool;
var
  V: PView;
begin
  V := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(AView.GetGuid) as PView;
  Result := (TheObject as PDiagramView).CanOwnView(V);
end;

function PDiagramViewAuto.CanOwnViewKind(const Kind: WideString): WordBool;
begin
  Result := (TheObject as PDiagramView).CanOwnViewKind(Kind);
end;

function PDiagramViewAuto.CanCopyViews: WordBool;
begin
  Result := (TheObject as PDiagramView).CanCopyViews;
end;

function PDiagramViewAuto.CanDeleteViews: WordBool;
begin
  Result := (TheObject as PDiagramView).CanDeleteViews;
end;

function PDiagramViewAuto.CreateViewOf(const AModel: IModel; X: Integer; Y: Integer): IView;
var
  M: PModel;
  V: PView;
begin
  M := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid) as PModel;
  V := StarUMLApplication.NewViewByDragDrop(TheObject as PDiagramView, M, X, Y);
  if V <> nil then
    Result := V.GetAutomationObject as IView
  else
    Result := nil;
end;

procedure PDiagramViewAuto.LayoutDiagram;
begin
  StarUMLApplication.LayoutDiagram(TheObject as PDiagramView);
end;

procedure PDiagramViewAuto.CopyDiagram;
begin
  StarUMLApplication.CopyDiagram(TheObject as PDiagramView);
end;

procedure PDiagramViewAuto.ExportDiagramAsBitmap(const FileName: WideString);
begin
  StarUMLApplication.SaveDiagramImageToBitmap(TheObject as PDiagramView, FileName);
end;

procedure PDiagramViewAuto.ExportDiagramAsMetafile(const FileName: WideString);
begin
  StarUMLApplication.SaveDiagramImageToMetafile(TheObject as PDiagramView, FileName);
end;

procedure PDiagramViewAuto.ExportDiagramAsJPEG(const FileName: WideString);
begin
  StarUMLApplication.SaveDiagramImageToJPEG(TheObject as PDiagramView, FileName);
end;

// PDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PModelAuto

function PModelAuto.Get_Name: WideString;
begin
  Result := (TheObject as PModel).Name;
end;

procedure PModelAuto.Set_Name(const Value: WideString);
begin
  StarUMLApplication.ChangeModelName(TheObject as PModel, Value);
end;

function PModelAuto.Get_Documentation: WideString;
begin
  Result := (TheObject as PModel).Documentation;
end;

procedure PModelAuto.Set_Documentation(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Documentation', Value);
end;

function PModelAuto.Get_Attachments: WideString;
begin
  Result := (TheObject as PModel).Attachments.Text;
end;

function PModelAuto.Get_Pathname: WideString;
begin
  Result := (TheObject as PModel).Pathname;
end;

function PModelAuto.GetViewAt(Index: Integer): IView;
var
  E: PView;
begin
  E := (TheObject as PModel).View[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PViewAuto;
end;

function PModelAuto.GetViewCount: Integer;
begin
  Result := (TheObject as PModel).ViewCount;
end;

function PModelAuto.GetOwnedDiagramAt(Index: Integer): IDiagram;
var
  E: PDiagram;
begin
  E := (TheObject as PModel).OwnedDiagrams[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PDiagramAuto;
end;

function PModelAuto.GetOwnedDiagramCount: Integer;
begin
  Result := (TheObject as PModel).OwnedDiagramCount;
end;

function PModelAuto.FindByName(const AName: WideString): IModel;
var
  E: PModel;
begin
  E := (TheObject as PModel).FindByName(AName);
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PModelAuto;
end;

function PModelAuto.FindByRelativePathname(const RelPath: WideString): IModel;
var
  E: PModel;
begin
  E := (TheObject as PModel).FindByRelativePathname(RelPath);
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PModelAuto;
end;

function PModelAuto.ContainsName(const AName: WideString): WordBool;
begin
  Result := (TheObject as PModel).ContainsName(AName);
end;

function PModelAuto.CanContain(const AModel: IModel): WordBool;
var
  M: PModel;
begin
  M := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid) as PModel;
  Result := (TheObject as PModel).CanContain(M);
end;

function PModelAuto.CanContainKind(const Kind: WideString): WordBool;
begin
  Result := (TheObject as PModel).CanContainKind(Kind);
end;

function PModelAuto.CanContainDiagram(const ADiagram: IDiagram): WordBool;
var
  D: PDiagram;
begin
  D := MetaModel.FindMetaClass('Diagram').FindInstanceByGuidRecurse(ADiagram.GetGuid) as PDiagram;
  Result := (TheObject as PModel).CanContainDiagram(D);
end;

function PModelAuto.CanContainDiagramKind(const Kind: WideString): WordBool;
begin
  Result := (TheObject as PModel).CanContainDiagramKind(Kind);
end;

function PModelAuto.CanRelocateTo(const AModel: IModel): WordBool;
var
  M: PModel;
begin
  M := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid) as PModel;
  Result := (TheObject as PModel).CanRelocateTo(M);
end;

function PModelAuto.CanDelete: WordBool;
begin
  Result := (TheObject as PModel).CanDelete;
end;

procedure PModelAuto.RelocateTo(const AOwner: IModel);
var
  M: PModel;
begin
  M := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AOwner.GetGuid) as PModel;
  StarUMLApplication.RelocateModel(TheObject as PModel, M);
end;

procedure PModelAuto.ClearAttachments;
begin
  StarUMLApplication.ClearAttachments(TheObject as PModel);
end;

procedure PModelAuto.AddAttachment(const Attach: WideString);
begin
  StarUMLApplication.AddAttachment(TheObject as PModel, Attach);
end;

procedure PModelAuto.InsertAttachment(Index:Integer; const Attach: WideString);
begin
  StarUMLApplication.InsertAttachment(TheObject as PModel, Attach, Index);
end;

procedure PModelAuto.DeleteAttachment(Index: Integer);
begin
  StarUMLApplication.DeleteAttachment(TheObject as PModel, Index);
end;

function PModelAuto.GetAttachmentAt(Index: Integer): WideString;
begin
  Result := (TheObject as PModel).GetAttachmentAt(Index);
end;

function PModelAuto.GetAttachmentCount: Integer;
begin
  Result := (TheObject as PModel).GetAttachmentCount;
end;

// PModelAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PDiagramAuto

function PDiagramAuto.Get_DefaultDiagram: WordBool;
begin
  Result := (TheObject as PDiagram).DefaultDiagram;
end;

procedure PDiagramAuto.Set_DefaultDiagram(Value: WordBool);
begin
  (TheObject as PDiagram).DefaultDiagram := Value;
end;

function PDiagramAuto.Get_DiagramOwner: IModel;
var
  E: PModel;
begin
  E := (TheObject as PDiagram).DiagramOwner;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PModelAuto;
end;

function PDiagramAuto.Get_DiagramView: IDiagramView;
var
  E: PDiagramView;
begin
  E := (TheObject as PDiagram).DiagramView;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PDiagramViewAuto;
end;

// PDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilities

function FontStylesToInteger(F: TFontStyles): Integer;
var
  Sty: Integer;
begin
  Sty := 0;
  if fsBold in F then Sty := Sty + 1;
  if fsItalic in F then Sty := Sty + 2;
  if fsUnderline in F then Sty := Sty + 4;
  if fsStrikeOut in F then Sty := Sty + 8;
  Result := Sty;
end;

function IntegerToFontStyles(I: Integer): TFontStyles;
var
  Sty: TFontStyles;
begin
  Sty := [];
  if (I and 1 = 1) then Sty := Sty + [fsBold];
  if (I and 2 = 2) then Sty := Sty + [fsItalic];
  if (I and 4 = 4) then Sty := Sty + [fsUnderline];
  if (I and 8 = 8) then Sty := Sty + [fsStrikeOut];
  Result := Sty;
end;

function ColorToStr(C: TColor): string;
begin
  Result := '$' + IntToHex(C, 8);
end;

// Utilities
////////////////////////////////////////////////////////////////////////////////

procedure RegisterAutomationClasses;
begin
  ClassRegistry.RegisterAutomationClass(PMetaElement, PMetaElementAuto, IID_IMetaElement);
  ClassRegistry.RegisterAutomationClass(PMetaLiteral, PMetaLiteralAuto, IID_IMetaLiteral);
  ClassRegistry.RegisterAutomationClass(PMetaSlot, PMetaSlotAuto, IID_IMetaSlot);
  ClassRegistry.RegisterAutomationClass(PMetaClassifier, PMetaClassifierAuto, IID_IMetaClassifier);
  ClassRegistry.RegisterAutomationClass(PMetaDataType, PMetaDataTypeAuto, IID_IMetaDataType);
  ClassRegistry.RegisterAutomationClass(PMetaPrimitiveType, PMetaPrimitiveTypeAuto, IID_IMetaPrimitiveType);
  ClassRegistry.RegisterAutomationClass(PMetaEnumeration, PMetaEnumerationAuto, IID_IMetaEnumeration);
  ClassRegistry.RegisterAutomationClass(PMetaClass, PMetaClassAuto, IID_IMetaClass);
  ClassRegistry.RegisterAutomationClass(PMetaAttribute, PMetaAttributeAuto, IID_IMetaAttribute);
  ClassRegistry.RegisterAutomationClass(PMetaAssociationEnd, PMetaAssociationEndAuto, IID_IMetaAssociationEnd);
  ClassRegistry.RegisterAutomationClass(PMetaReference, PMetaReferenceAuto, IID_IMetaReference);
  ClassRegistry.RegisterAutomationClass(PMetaCollection, PMetaCollectionAuto, IID_IMetaCollection);
  ClassRegistry.RegisterAutomationClass(PMetaModel, PMetaModelAuto, IID_IMetaModel);
  ClassRegistry.RegisterAutomationClass(PElement, PElementAuto, IID_IElement);
  ClassRegistry.RegisterAutomationClass(PModel, PModelAuto, IID_IModel);
  ClassRegistry.RegisterAutomationClass(PView, PViewAuto, IID_IView);
  ClassRegistry.RegisterAutomationClass(PDiagram, PDiagramAuto, IID_IDiagram);
  ClassRegistry.RegisterAutomationClass(PDiagramView, PDiagramViewAuto, IID_IDiagramView);
end;

initialization
  RegisterAutomationClasses;
end.

