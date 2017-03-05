unit ExtCoreAuto;

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
  BasicClasses, Core, ExtCore, CoreAuto, WhiteStarUML_TLB;

type
  // PExtensibleModelAuto
  PExtensibleModelAuto = class(PModelAuto, IExtensibleModel)
  protected
    function Get_StereotypeProfile: WideString; safecall;
    function Get_StereotypeName: WideString; safecall;
    function IndexOfConstraint(const AConstraint: IConstraint): Integer; safecall;
    function GetConstraintCount: Integer; safecall;
    function GetConstraintAt(Index: Integer): IConstraint; safecall;
    function GetTaggedValueCount: Integer; safecall;
    function GetTaggedValueAt(Index: Integer): ITaggedValue; safecall;
    function GetReferencingTagCount: Integer; safecall;
    function GetReferencingTagAt(Index: Integer): ITaggedValue; safecall;
    function GetStereotype: IStereotype; safecall;
    procedure SetStereotype(const Name: WideString); safecall;
    procedure SetStereotype2(const Profile: WideString; const Name: WideString); safecall;
    function AddConstraint(const Name: WideString; const Body: WideString): IConstraint; safecall;
    procedure DeleteConstraint(Index: Integer); safecall;
    procedure MoveConstraint(const AConstraint: IConstraint; NewIndex: Integer); safecall;
    function GetTaggedValueAsInteger(const Profile: WideString; const TagDefinitionSet: WideString;
                                     const Name: WideString): Integer; safecall;
    procedure SetTaggedValueAsInteger(const Profile: WideString;
                                      const TagDefinitionSet: WideString; const Name: WideString;
                                      Value: Integer); safecall;
    function GetTaggedValueAsBoolean(const Profile: WideString; const TagDefinitionSet: WideString;
                                     const Name: WideString): WordBool; safecall;
    procedure SetTaggedValueAsBoolean(const Profile: WideString;
                                      const TagDefinitionSet: WideString; const Name: WideString;
                                      Value: WordBool); safecall;
    function GetTaggedValueAsReal(const Profile: WideString; const TagDefinitionSet: WideString;
                                  const Name: WideString): Double; safecall;
    procedure SetTaggedValueAsReal(const Profile: WideString; const TagDefinitionSet: WideString;
                                   const Name: WideString; Value: Double); safecall;
    function GetTaggedValueAsString(const Profile: WideString; const TagDefinitionSet: WideString;
                                    const Name: WideString): WideString; safecall;
    procedure SetTaggedValueAsString(const Profile: WideString; const TagDefinitionSet: WideString;
                                     const Name: WideString; const Value: WideString); safecall;
    function GetTaggedValueAsEnum(const Profile: WideString; const TagDefinitionSet: WideString;
                                  const Name: WideString): WideString; safecall;
    procedure SetTaggedValueAsEnum(const Profile: WideString; const TagDefinitionSet: WideString;
                                   const Name: WideString; const Value: WideString); safecall;
    function GetTaggedValueAsReference(const Profile: WideString;
                                       const TagDefinitionSet: WideString; const Name: WideString): IExtensibleModel; safecall;
    function GetTaggedValueAsReferenceAt(const Profile: WideString;
                                         const TagDefinitionSet: WideString;
                                         const Name: WideString; Index: Integer): IExtensibleModel; safecall;
    function GetTaggedValueAsReferenceCount(const Profile: WideString;
                                            const TagDefinitionSet: WideString;
                                            const Name: WideString): Integer; safecall;
    procedure SetTaggedValueAsReference(const Profile: WideString;
                                        const TagDefinitionSet: WideString; const Name: WideString;
                                        const Value: IExtensibleModel); safecall;
    procedure AddReferenceToTaggedValue(const Profile: WideString;
                                        const TagDefinitionSet: WideString; const Name: WideString;
                                        const Value: IExtensibleModel); safecall;
    procedure RemoveReferenceFromTaggedValue(const Profile: WideString;
                                             const TagDefinitionSet: WideString;
                                             const Name: WideString; const Value: IExtensibleModel); safecall;
    procedure InsertReferenceToTaggedValue(const Profile: WideString;
                                           const TagDefinitionSet: WideString;
                                           const Name: WideString; Index: Integer;
                                           const Value: IExtensibleModel); safecall;
    procedure DeleteReferenceFromTaggedValue(const Profile: WideString;
                                             const TagDefinitionSet: WideString;
                                             const Name: WideString; Index: Integer); safecall;
    function IndexOfReferenceFromTaggedValue(const Profile: WideString;
                                             const TagDefinitionSet: WideString;
                                             const Name: WideString; const Value: IExtensibleModel): Integer; safecall;
    procedure SetTaggedValueAsDefault(const Profile: WideString;
                                      const TagDefinitionSet: WideString; const Name: WideString); safecall;
    function GetTaggedValue(const Profile: WideString; const TagDefinitionSet: WideString;
                             const Name: WideString): OleVariant; safecall;
  end;

  // PConstraintAuto
  PConstraintAuto = class(PElementAuto, IConstraint)
  protected
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Body: WideString; safecall;
    procedure Set_Body(const Value: WideString); safecall;
    function Get_ConstrainedModel: IExtensibleModel; safecall;
  end;

  // PTaggedValueAuto
  PTaggedValueAuto = class(PElementAuto, ITaggedValue)
  protected
    function Get_ProfileName: WideString; safecall;
    function Get_TagDefinitionSetName: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_DataValue: WideString; safecall;
    function Get_TaggedModel: IExtensibleModel; safecall;
    function GetReferenceValueCount: Integer; safecall;
    function GetReferenceValueAt(Index: Integer): IExtensibleModel; safecall;
    function GetTagDefinition: ITagDefinition; safecall;
    function GetTagDefinitionSet: ITagDefinitionSet; safecall;
    function GetProfile: IProfile; safecall;
  end;

  // PProfileAuto
  PProfileAuto = class(PAutoObject, IProfile)
  protected
    function Get_Name: WideString; safecall;
    function Get_Description: WideString; safecall;
    function Get_Path: WideString; safecall;
    function Get_FileName: WideString; safecall;
    function Get_IconFile: WideString; safecall;
    function GetDataTypeCount: Integer; safecall;
    function GetDataTypeAt(Index: Integer): IDataType; safecall;
    function GetStereotypeCount: Integer; safecall;
    function GetStereotypeAt(Index: Integer): IStereotype; safecall;
    function GetTagDefinitionSetCount: Integer; safecall;
    function GetTagDefinitionSetAt(Index: Integer): ITagDefinitionSet; safecall;
    function FindTagDefinition(const TagDefinitionSet: WideString; const Name: WideString): ITagDefinition; safecall;
    function FindTagDefinitionSet(const Name: WideString): ITagDefinitionSet; safecall;
    function FindStereotype(const Name: WideString; const BaseClass: WideString): IStereotype; safecall;
    function FindDataType(const Name: WideString): IDataType; safecall;
  end;

  // PStereotypeAuto
  PStereotypeAuto = class(PAutoObject, IStereotype)
  protected
    function Get_Name: WideString; safecall;
    function Get_IconFile: WideString; safecall;
    function Get_IconMinWidth: Integer; safecall;
    function Get_IconMinHeight: Integer; safecall;
    function Get_Description: WideString; safecall;
    function Get_Profile: IProfile; safecall;
    function GetChildCount: Integer; safecall;
    function GetChildAt(Index: Integer): IStereotype; safecall;
    function Get_Parent: IStereotype; safecall;
    function Get_TagDefinitionSet: ITagDefinitionSet; safecall;
    function GetBaseClassAt(Index: Integer): WideString; safecall;
    function GetBaseClassCount: Integer; safecall;
    function CanApplyTo(const ClassName: WideString): WordBool; safecall;
  end;

  // PDataTypeAuto
  PDataTypeAuto = class(PAutoObject, IDataType)
  protected
    function Get_Name: WideString; safecall;
    function Get_Profile: IProfile; safecall;
  end;

  // PTagDefinitionAuto
  PTagDefinitionAuto = class(PAutoObject, ITagDefinition)
  protected
    function Get_Name: WideString; safecall;
    function Get_TagType: TagTypeKind; safecall;
    function Get_ReferenceType: WideString; safecall;
    function Get_DefaultValue: WideString; safecall;
    function Get_TagDefinitionSet: ITagDefinitionSet; safecall;
    function IndexOfLiteral(const ALiteral: WideString): Integer; safecall;
    function GetLiteralAt(Index: Integer): WideString; safecall;
    function GetLiteralCount: Integer; safecall;
  end;

  // PTagDefinitionSetAuto
  PTagDefinitionSetAuto = class(PAutoObject, ITagDefinitionSet)
  protected
    function Get_Name: WideString; safecall;
    function Get_Profile: IProfile; safecall;
    function GetTagDefinitionCount: Integer; safecall;
    function GetTagDefinitionAt(Index: Integer): ITagDefinition; safecall;
    function Get_Stereotype: IStereotype; safecall;
    function GetBaseClassAt(Index: Integer): WideString; safecall;
    function GetBaseClassCount: Integer; safecall;
    function FindTagDefinition(const Name: WideString): ITagDefinition; safecall;
    function CanApplyTo(const ClassName: WideString): WordBool; safecall;
  end;

  // PExtensionManagerAuto
  PExtensionManagerAuto = class(PAutoObject, IExtensionManager)
  protected
    function GetIncludedProfileCount: Integer; safecall;
    function GetIncludedProfileAt(Index: Integer): IProfile; safecall;
    function GetAvailableProfileCount: Integer; safecall;
    function GetAvailableProfileAt(Index: Integer): IProfile; safecall;
    function FindIncludedProfile(const Name: WideString): IProfile; safecall;
    procedure IncludeProfile(const Profile: WideString); safecall;
    procedure ExcludeProfile(const Profile: WideString); safecall;
    procedure ClearIncludedProfiles; safecall;
    function FindAvailableProfile(const Name: WideString): IProfile; safecall;
    function FindStereotype(const Profile: WideString; const Name: WideString; const BaseClass: WideString): IStereotype; safecall;
    function FindFirstStereotype(const Name: WideString; const BaseClass: WideString): IStereotype; safecall;
    function FindTagDefinition(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): ITagDefinition; safecall;
    function FindTagDefinitionSet(const Profile: WideString; const Name: WideString): ITagDefinitionSet; safecall;
  end;

implementation

uses
  StarUMLApp,
  Variants;

////////////////////////////////////////////////////////////////////////////////
// PExtensibleModelAuto

function PExtensibleModelAuto.Get_StereotypeProfile: WideString;
begin
  Result := (TheObject as PExtensibleModel).StereotypeProfile;
end;

function PExtensibleModelAuto.Get_StereotypeName: WideString;
begin
  Result := (TheObject as PExtensibleModel).StereotypeName;
end;

function PExtensibleModelAuto.IndexOfConstraint(const AConstraint: IConstraint): Integer;
var
  C: PConstraint;
begin
  Result := -1;
  with TheObject as PExtensibleModel do
  begin
    C := GetConstraintByGuid(AConstraint.GetGuid);
    if C <> nil then Result := IndexOfConstraint(C);
  end;
end;

function PExtensibleModelAuto.GetConstraintCount: Integer;
begin
  Result := (TheObject as PExtensibleModel).ConstraintCount;
end;

function PExtensibleModelAuto.GetConstraintAt(Index: Integer): IConstraint;
begin
  Result := (TheObject as PExtensibleModel).Constraint[Index].GetAutomationObject as IConstraint;
end;

function PExtensibleModelAuto.GetTaggedValueCount: Integer;
begin
  Result := (TheObject as PExtensibleModel).TaggedValueCount;
end;

function PExtensibleModelAuto.GetTaggedValueAt(Index: Integer): ITaggedValue;
begin
  Result := (TheObject as PExtensibleModel).TaggedValue[Index].GetAutomationObject as ITaggedValue;
end;

function PExtensibleModelAuto.GetReferencingTagCount: Integer;
begin
  Result := (TheObject as PExtensibleModel).ReferencingTagCount;
end;

function PExtensibleModelAuto.GetReferencingTagAt(Index: Integer): ITaggedValue;
begin
  Result := (TheObject as PExtensibleModel).ReferencingTags[Index].GetAutomationObject as ITaggedValue;
end;

function PExtensibleModelAuto.GetStereotype: IStereotype;
var
  S: PStereotype;
begin
  with TheObject as PExtensibleModel do
    S := ExtensionManager.FindStereotype(StereotypeProfile, StereotypeName, (TheObject as PExtensibleModel).MetaClass.Name);
  if S <> nil then
    Result := S.GetAutomationObject as IStereotype
  else
    Result := nil;
end;

procedure PExtensibleModelAuto.SetStereotype(const Name: WideString);
begin
  StarUMLApplication.ChangeModelStereotype(TheObject as PExtensibleModel, '', Name);
end;

procedure PExtensibleModelAuto.SetStereotype2(const Profile: WideString; const Name: WideString);
begin
  StarUMLApplication.ChangeModelStereotype(TheObject as PExtensibleModel, Profile, Name);
end;

function PExtensibleModelAuto.AddConstraint(const Name: WideString; const Body: WideString): IConstraint;
var
  C: PConstraint;
begin
  C := StarUMLApplication.AddConstraint((TheObject as PExtensibleModel), Name, Body);
  Result := C.GetAutomationObject as IConstraint;
end;

procedure PExtensibleModelAuto.DeleteConstraint(Index: Integer);
var
  M: PExtensibleModel;
begin
  M := TheObject as PExtensibleModel;
  StarUMLApplication.DeleteConstraint(M, M.Constraint[Index]);
end;

procedure PExtensibleModelAuto.MoveConstraint(const AConstraint: IConstraint; NewIndex: Integer);
var
  M: PExtensibleModel;
  C: PConstraint;
begin
  M := TheObject as PExtensibleModel;
  C := M.GetConstraintByGuid(AConstraint.GetGuid);
  StarUMLApplication.ChangeCollectionItemOrder(M, C, 'Constraints', NewIndex);
end;

function PExtensibleModelAuto.GetTaggedValueAsInteger(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): Integer;
begin
  Result := StringToInteger((TheObject as PExtensibleModel).QueryDataTaggedValue(Profile, TagDefinitionSet, Name));
end;

procedure PExtensibleModelAuto.SetTaggedValueAsInteger(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; Value: Integer);
begin
  StarUMLApplication.SetDataTaggedValue((TheObject as PExtensibleModel), Profile, TagDefinitionSet, Name, IntegerToString(Value));
end;

function PExtensibleModelAuto.GetTaggedValueAsBoolean(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): WordBool;
begin
  Result := StringToBoolean((TheObject as PExtensibleModel).QueryDataTaggedValue(Profile, TagDefinitionSet, Name));
end;

procedure PExtensibleModelAuto.SetTaggedValueAsBoolean(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; Value: WordBool);
begin
  StarUMLApplication.SetDataTaggedValue((TheObject as PExtensibleModel), Profile, TagDefinitionSet, Name, BooleanToString(Value));
end;

function PExtensibleModelAuto.GetTaggedValueAsReal(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): Double;
begin
  Result := StringToReal((TheObject as PExtensibleModel).QueryDataTaggedValue(Profile, TagDefinitionSet, Name));
end;

procedure PExtensibleModelAuto.SetTaggedValueAsReal(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; Value: Double);
begin
  StarUMLApplication.SetDataTaggedValue((TheObject as PExtensibleModel), Profile, TagDefinitionSet, Name, RealToString(Value));
end;

function PExtensibleModelAuto.GetTaggedValueAsString(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): WideString;
begin
  Result := (TheObject as PExtensibleModel).QueryDataTaggedValue(Profile, TagDefinitionSet, Name);
end;

procedure PExtensibleModelAuto.SetTaggedValueAsString(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; const Value: WideString);
begin
  StarUMLApplication.SetDataTaggedValue((TheObject as PExtensibleModel), Profile, TagDefinitionSet, Name, Value);
end;

function PExtensibleModelAuto.GetTaggedValueAsEnum(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): WideString;
begin
  Result := (TheObject as PExtensibleModel).QueryDataTaggedValue(Profile, TagDefinitionSet, Name);
end;

procedure PExtensibleModelAuto.SetTaggedValueAsEnum(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; const Value: WideString);
begin
  StarUMLApplication.SetDataTaggedValue((TheObject as PExtensibleModel), Profile, TagDefinitionSet, Name, Value);
end;

function PExtensibleModelAuto.GetTaggedValueAsReference(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): IExtensibleModel;
var
  E: PExtensibleModel;
begin
  E := (TheObject as PExtensibleModel).QueryReferenceTaggedValue(Profile, TagDefinitionSet, Name);
  if E <> nil then
    Result := E.GetAutomationObject as IExtensibleModel
  else
    Result := nil;
end;

function PExtensibleModelAuto.GetTaggedValueAsReferenceAt(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; Index: Integer): IExtensibleModel;
var
  T: PTaggedValue;
  E: PExtensibleModel;
begin
  T := (TheObject as PExtensibleModel).FindTaggedValue(Profile, TagDefinitionSet, Name);
  E := T.ReferenceValue[Index];
  if E <> nil then
    Result := E.GetAutomationObject as IExtensibleModel
  else
    Result := nil;
end;

function PExtensibleModelAuto.GetTaggedValueAsReferenceCount(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): Integer;
var
  T: PTaggedValue;
begin
  T := (TheObject as PExtensibleModel).FindTaggedValue(Profile, TagDefinitionSet, Name);
  if T <> nil then
    Result := T.ReferenceValueCount
  else
    Result := 0;
end;

procedure PExtensibleModelAuto.SetTaggedValueAsReference(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; const Value: IExtensibleModel);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('ExtensibleModel').FindInstanceByGuidRecurse(Value.GetGuid);
  StarUMLApplication.SetReferenceTaggedValue(TheObject as PExtensibleModel, Profile, TagDefinitionSet, Name, E as PExtensibleModel);
end;

procedure PExtensibleModelAuto.AddReferenceToTaggedValue(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; const Value: IExtensibleModel);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('ExtensibleModel').FindInstanceByGuidRecurse(Value.GetGuid);
  StarUMLApplication.AddCollectionTaggedValue(TheObject as PExtensibleModel, Profile, TagDefinitionSet, Name, E as PExtensibleModel);
end;

procedure PExtensibleModelAuto.RemoveReferenceFromTaggedValue(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; const Value: IExtensibleModel);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('ExtensibleModel').FindInstanceByGuidRecurse(Value.GetGuid);
  StarUMLApplication.RemoveCollectionTaggedValue(TheObject as PExtensibleModel, Profile, TagDefinitionSet, Name, E as PExtensibleModel);
end;

procedure PExtensibleModelAuto.InsertReferenceToTaggedValue(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; Index: Integer; const Value: IExtensibleModel);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('ExtensibleModel').FindInstanceByGuidRecurse(Value.GetGuid);
  StarUMLApplication.InsertCollectionTaggedValue(TheObject as PExtensibleModel, Profile, TagDefinitionSet, Name, Index, E as PExtensibleModel);
end;

procedure PExtensibleModelAuto.DeleteReferenceFromTaggedValue(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; Index: Integer);
begin
  StarUMLApplication.DeleteCollectionTaggedValue(TheObject as PExtensibleModel, Profile, TagDefinitionSet, Name, Index);
end;

function PExtensibleModelAuto.IndexOfReferenceFromTaggedValue(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString; const Value: IExtensibleModel): Integer;
var
  T: PTaggedValue;
  E: PElement;
begin
  T := (TheObject as PExtensibleModel).FindTaggedValue(Profile, TagDefinitionSet, Name);
  if T <> nil then
  begin
    E := MetaModel.FindMetaClass('ExtensibleModel').FindInstanceByGuidRecurse(Value.GetGuid);
    Result := T.IndexOfReferenceValue(E as PExtensibleModel);
  end
  else
    Result := -1;
end;

procedure PExtensibleModelAuto.SetTaggedValueAsDefault(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString);
begin
  StarUMLApplication.SetTaggedValueAsDefault((TheObject as PExtensibleModel), Profile, TagDefinitionSet, Name);
end;

function PExtensibleModelAuto.GetTaggedValue(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): OleVariant;
var
  T: PTaggedValue;
  ColArray: Variant;
  I: Integer;
begin
  T := (TheObject as PExtensibleModel).FindTaggedValue(Profile, TagDefinitionSet, Name);
  Result := Null;
  if (T <> nil) and (T.GetTagDefinition <> nil) then begin
    case T.GetTagDefinition.TagType of
      ExtCore.tkInteger:
        Result := GetTaggedValueAsInteger(Profile, TagDefinitionSet, Name);
      ExtCore.tkBoolean:
        Result := GetTaggedValueAsBoolean(Profile, TagDefinitionSet, Name);
      ExtCore.tkString:
        Result := GetTaggedValueAsString(Profile, TagDefinitionSet, Name);
      ExtCore.tkReal:
        Result := GetTaggedValueAsReal(Profile, TagDefinitionSet, Name);
      ExtCore.tkEnumeration:
        Result := GetTaggedValueAsEnum(Profile, TagDefinitionSet, Name);
      ExtCore.tkReference:
        Result := GetTaggedValueAsReference(Profile, TagDefinitionSet, Name);
      ExtCore.tkCollection:
        begin
          ColArray := VarArrayCreate([0, GetTaggedValueAsReferenceCount(Profile, TagDefinitionSet, Name) - 1], varVariant);
          for I := 0 to GetTaggedValueAsReferenceCount(Profile, TagDefinitionSet, Name) - 1 do begin
            ColArray[I] := GetTaggedValueAsReferenceAt(Profile, TagDefinitionSet, Name, I);
          end;
          Result := ColArray;
        end;
    end;
  end;
end;

// PExtensibleModelAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PConstraintAuto

function PConstraintAuto.Get_Name: WideString;
begin
  Result := (TheObject as PConstraint).Name;
end;

procedure PConstraintAuto.Set_Name(const Value: WideString);
var
  C: PConstraint;
begin
  C := TheObject as PConstraint;
  StarUMLApplication.ChangeConstraint(C.ConstrainedModel, C, Value, C.Body);
end;

function PConstraintAuto.Get_Body: WideString;
begin
  Result := (TheObject as PConstraint).Body;
end;

procedure PConstraintAuto.Set_Body(const Value: WideString);
var
  C: PConstraint;
begin
  C := TheObject as PConstraint;
  StarUMLApplication.ChangeConstraint(C.ConstrainedModel, C, C.Name, Value);
end;

function PConstraintAuto.Get_ConstrainedModel: IExtensibleModel;
begin
  Result := (TheObject as PConstraint).ConstrainedModel.GetAutomationObject as IExtensibleModel;
end;

// PConstraintAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTaggedValueAuto

function PTaggedValueAuto.Get_ProfileName: WideString;
begin
  Result := (TheObject as PTaggedValue).ProfileName;
end;

function PTaggedValueAuto.Get_TagDefinitionSetName: WideString;
begin
  Result := (TheObject as PTaggedValue).TagDefinitionSetName;
end;

function PTaggedValueAuto.Get_Name: WideString;
begin
  Result := (TheObject as PTaggedValue).Name;
end;

function PTaggedValueAuto.Get_DataValue: WideString;
begin
  Result := (TheObject as PTaggedValue).DataValue;
end;

function PTaggedValueAuto.Get_TaggedModel: IExtensibleModel;
begin
  Result := (TheObject as PTaggedValue).TaggedModel.GetAutomationObject as IExtensibleModel;
end;

function PTaggedValueAuto.GetReferenceValueCount: Integer;
begin
  Result := (TheObject as PTaggedValue).ReferenceValueCount;
end;

function PTaggedValueAuto.GetReferenceValueAt(Index: Integer): IExtensibleModel;
var
  E: PExtensibleModel;
begin
  E := (TheObject as PTaggedValue).ReferenceValue[Index];
  if E <> nil then
    Result := E.GetAutomationObject as IExtensibleModel
  else
    Result := nil;
end;

function PTaggedValueAuto.GetTagDefinition: ITagDefinition;
var
  T: PTagDefinition;
begin
  T := (TheObject as PTaggedValue).GetTagDefinition;
  if T <> nil then
    Result := T.GetAutomationObject as ITagDefinition
  else
    Result := nil;
end;

function PTaggedValueAuto.GetTagDefinitionSet: ITagDefinitionSet;
var
  T: PTagDefinitionSet;
begin
  T := (TheObject as PTaggedValue).GetTagDefinitionSet;
  if T <> nil then
    Result := T.GetAutomationObject as ITagDefinitionSet
  else
    Result := nil;
end;

function PTaggedValueAuto.GetProfile: IProfile;
var
  P: PProfile;
begin
  P := (TheObject as PTaggedValue).GetProfile;
  if P <> nil then
    Result := P.GetAutomationObject as IProfile
  else
    Result := nil;
end;

// PTaggedValueAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PProfileAuto

function PProfileAuto.Get_Name: WideString;
begin
  Result := (TheObject as PProfile).Name;
end;

function PProfileAuto.Get_Description: WideString;
begin
  Result := (TheObject as PProfile).Description;
end;

function PProfileAuto.Get_Path: WideString;
begin
  Result := (TheObject as PProfile).Path;
end;

function PProfileAuto.Get_FileName: WideString;
begin
  Result := (TheObject as PProfile).FileName;
end;

function PProfileAuto.Get_IconFile: WideString;
begin
  Result := (TheObject as PProfile).IconFile;
end;

function PProfileAuto.GetDataTypeCount: Integer;
begin
  Result := (TheObject as PProfile).DataTypeCount;
end;

function PProfileAuto.GetDataTypeAt(Index: Integer): IDataType;
begin
  Result := (TheObject as PProfile).DataType[Index].GetAutomationObject as IDataType;
end;

function PProfileAuto.GetStereotypeCount: Integer;
begin
  Result := (TheObject as PProfile).StereotypeCount;
end;

function PProfileAuto.GetStereotypeAt(Index: Integer): IStereotype;
begin
  Result := (TheObject as PProfile).Stereotype[Index].GetAutomationObject as IStereotype;
end;

function PProfileAuto.GetTagDefinitionSetCount: Integer;
begin
  Result := (TheObject as PProfile).TagDefinitionSetCount;
end;

function PProfileAuto.GetTagDefinitionSetAt(Index: Integer): ITagDefinitionSet;
begin
  Result := (TheObject as PProfile).TagDefinitionSet[Index].GetAutomationObject as ITagDefinitionSet;
end;

function PProfileAuto.FindTagDefinition(const TagDefinitionSet: WideString; const Name: WideString): ITagDefinition; safecall;
var
  T: PTagDefinition;
begin
  T := (TheObject as PProfile).FindTagDefinition(TagDefinitionSet, Name);
  if T <> nil then
    Result := T.GetAutomationObject as ITagDefinition
  else
    Result := nil;
end;

function PProfileAuto.FindTagDefinitionSet(const Name: WideString): ITagDefinitionSet;
var
  T: PTagDefinitionSet;
begin
  T := (TheObject as PProfile).FindTagDefinitionSet(Name);
  if T <> nil then
    Result := T.GetAutomationObject as ITagDefinitionSet
  else
    Result := nil;
end;

function PProfileAuto.FindStereotype(const Name: WideString; const BaseClass: WideString): IStereotype;
var
  T: PStereotype;
begin
  T := (TheObject as PProfile).FindStereotype(Name, BaseClass);
  if T <> nil then
    Result := T.GetAutomationObject as IStereotype
  else
    Result := nil;
end;

function PProfileAuto.FindDataType(const Name: WideString): IDataType;
var
  T: PDataType;
begin
  T := (TheObject as PProfile).FindDataType(Name);
  if T <> nil then
    Result := T.GetAutomationObject as IDataType
  else
    Result := nil;
end;

// PProfileAuto
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PStereotypeAuto

function PStereotypeAuto.Get_Name: WideString;
begin
  Result := (TheObject as PStereotype).Name;
end;

function PStereotypeAuto.Get_IconFile: WideString;
begin
  Result := (TheObject as PStereotype).IconFile;
end;

function PStereotypeAuto.Get_IconMinWidth: Integer;
begin
  Result := (TheObject as PStereotype).IconMinWidth;
end;

function PStereotypeAuto.Get_IconMinHeight: Integer;
begin
  Result := (TheObject as PStereotype).IconMinHeight;
end;

function PStereotypeAuto.Get_Description: WideString;
begin
  Result := (TheObject as PStereotype).Description;
end;

function PStereotypeAuto.Get_Profile: IProfile;
begin
  Result := (TheObject as PStereotype).Profile.GetAutomationObject as IProfile;
end;

function PStereotypeAuto.GetChildCount: Integer;
begin
  Result := (TheObject as PStereotype).ChildCount;
end;

function PStereotypeAuto.GetChildAt(Index: Integer): IStereotype;
var
  S: PStereotype;
begin
  S := (TheObject as PStereotype).Children[Index];
  if S <> nil then
    Result := S.GetAutomationObject as IStereotype
  else
    Result := nil;
end;

function PStereotypeAuto.Get_Parent: IStereotype;
begin
  if (TheObject as PStereotype).Profile <> nil then
    Result := (TheObject as PStereotype).Profile.GetAutomationObject as IStereotype
  else
    Result := nil;
end;

function PStereotypeAuto.Get_TagDefinitionSet: ITagDefinitionSet;
begin
  if (TheObject as PStereotype).TagDefinitionSet <> nil then
    Result := (TheObject as PStereotype).TagDefinitionSet.GetAutomationObject as ITagDefinitionSet
  else
    Result := nil;
end;

function PStereotypeAuto.GetBaseClassAt(Index: Integer): WideString;
begin
  Result := (TheObject as PStereotype).BaseClasses[Index];
end;

function PStereotypeAuto.GetBaseClassCount: Integer;
begin
  Result := (TheObject as PStereotype).BaseClassCount;
end;

function PStereotypeAuto.CanApplyTo(const ClassName: WideString): WordBool;
begin
  Result := (TheObject as PStereotype).CanApplyTo(ClassName);
end;

// PStereotypeAuto
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// PDataTypeAuto

function PDataTypeAuto.Get_Name: WideString;
begin
  Result := (TheObject as PDataType).Name;
end;

function PDataTypeAuto.Get_Profile: IProfile;
begin
  Result := (TheObject as PDataType).Profile.GetAutomationObject as IProfile;
end;

// PDataTypeAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTagDefinitionAuto

function PTagDefinitionAuto.Get_Name: WideString;
begin
  Result := (TheObject as PTagDefinition).Name;
end;

function PTagDefinitionAuto.Get_TagType: TagTypeKind;
begin
  Result := TagTypeKind((TheObject as PTagDefinition).TagType);
end;

function PTagDefinitionAuto.Get_ReferenceType: WideString;
begin
  Result := (TheObject as PTagDefinition).ReferenceType;
end;

function PTagDefinitionAuto.Get_DefaultValue: WideString;
begin
  Result := (TheObject as PTagDefinition).DefaultValue;
end;

function PTagDefinitionAuto.Get_TagDefinitionSet: ITagDefinitionSet;
begin
  Result := (TheObject as PTagDefinition).TagDefinitionSet.GetAutomationObject as ITagDefinitionSet;
end;

function PTagDefinitionAuto.IndexOfLiteral(const ALiteral: WideString): Integer;
begin
  Result := (TheObject as PTagDefinition).IndexOfLiteral(ALiteral);
end;

function PTagDefinitionAuto.GetLiteralAt(Index: Integer): WideString;
begin
  Result := (TheObject as PTagDefinition).Literals[Index];
end;

function PTagDefinitionAuto.GetLiteralCount: Integer;
begin
  Result := (TheObject as PTagDefinition).LiteralCount;
end;

// PTagDefinitionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PTagDefinitionSetAuto

function PTagDefinitionSetAuto.Get_Name: WideString;
begin
  Result := (TheObject as PTagDefinitionSet).Name;
end;

function PTagDefinitionSetAuto.Get_Profile: IProfile;
begin
  Result := (TheObject as PTagDefinitionSet).Profile.GetAutomationObject as IProfile;
end;

function PTagDefinitionSetAuto.GetTagDefinitionCount: Integer;
begin
  Result := (TheObject as PTagDefinitionSet).TagDefinitionCount;
end;

function PTagDefinitionSetAuto.GetTagDefinitionAt(Index: Integer): ITagDefinition;
begin
  Result := (TheObject as PTagDefinitionSet).TagDefinitions[Index].GetAutomationObject as ITagDefinition;
end;

function PTagDefinitionSetAuto.Get_Stereotype: IStereotype;
begin
  if (TheObject as PTagDefinitionSet).Stereotype <> nil then
    Result := (TheObject as PTagDefinitionSet).Stereotype.GetAutomationObject as IStereotype
  else
    Result := nil;
end;

function PTagDefinitionSetAuto.GetBaseClassAt(Index: Integer): WideString;
begin
  Result := (TheObject as PTagDefinitionSet).BaseClasses[Index];
end;

function PTagDefinitionSetAuto.GetBaseClassCount: Integer;
begin
  Result := (TheObject as PTagDefinitionSet).BaseClassCount;
end;

function PTagDefinitionSetAuto.FindTagDefinition(const Name: WideString): ITagDefinition;
var
  T: PTagDefinition;
begin
  T := (TheObject as PTagDefinitionSet).FindTagDefinition(Name);
  if T <> nil then
    Result := T.GetAutomationObject as ITagDefinition
  else
    Result := nil;
end;

function PTagDefinitionSetAuto.CanApplyTo(const ClassName: WideString): WordBool;
begin
  Result := (TheObject as PTagDefinitionSet).CanApplyTo(ClassName);
end;

// PTagDefinitionSetAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PExtensionManagerAuto

function PExtensionManagerAuto.GetIncludedProfileCount: Integer;
begin
  Result := (TheObject as PExtensionManager).IncludedProfileCount;
end;

function PExtensionManagerAuto.GetIncludedProfileAt(Index: Integer): IProfile;
begin
  Result := (TheObject as PExtensionManager).IncludedProfile[Index].GetAutomationObject as IProfile;
end;

function PExtensionManagerAuto.GetAvailableProfileCount: Integer;
begin
  Result := (TheObject as PExtensionManager).AvailableProfileCount;
end;

function PExtensionManagerAuto.GetAvailableProfileAt(Index: Integer): IProfile;
begin
  Result := (TheObject as PExtensionManager).AvailableProfile[Index].GetAutomationObject as IProfile;
end;

function PExtensionManagerAuto.FindIncludedProfile(const Name: WideString): IProfile;
var
  P: PProfile;
begin
  P := (TheObject as PExtensionManager).FindIncludedProfile(Name);
  if P <> nil then
    Result := P.GetAutomationObject as IProfile
  else
    Result := nil;
end;

procedure PExtensionManagerAuto.IncludeProfile(const Profile: WideString);
begin
  (TheObject as PExtensionManager).IncludeProfile(Profile);
end;

procedure PExtensionManagerAuto.ExcludeProfile(const Profile: WideString);
begin
  (TheObject as PExtensionManager).ExcludeProfile(Profile);
end;

procedure PExtensionManagerAuto.ClearIncludedProfiles;
begin
  (TheObject as PExtensionManager).ClearIncludedProfiles;
end;

function PExtensionManagerAuto.FindAvailableProfile(const Name: WideString): IProfile;
var
  P: PProfile;
begin
  P := (TheObject as PExtensionManager).FindAvailableProfile(Name);
  if P <> nil then
    Result := P.GetAutomationObject as IProfile
  else
    Result := nil;
end;

function PExtensionManagerAuto.FindStereotype(const Profile: WideString; const Name: WideString; const BaseClass: WideString): IStereotype;
var
  S: PStereotype;
begin
  S := (TheObject as PExtensionManager).FindStereotype(Profile, Name, BaseClass);
  if S <> nil then
    Result := S.GetAutomationObject as IStereotype
  else
    Result := nil;
end;

function PExtensionManagerAuto.FindFirstStereotype(const Name: WideString; const BaseClass: WideString): IStereotype;
var
  S: PStereotype;
begin
  S := (TheObject as PExtensionManager).FindFirstStereotype(Name, BaseClass);
  if S <> nil then
    Result := S.GetAutomationObject as IStereotype
  else
    Result := nil;
end;

function PExtensionManagerAuto.FindTagDefinition(const Profile: WideString; const TagDefinitionSet: WideString; const Name: WideString): ITagDefinition;
var
  T: PTagDefinition;
begin
  T := (TheObject as PExtensionManager).FindTagDefinition(Profile, TagDefinitionSet, Name);
  if T <> nil then
    Result := T.GetAutomationObject as ITagDefinition
  else
    Result := nil;
end;

function PExtensionManagerAuto.FindTagDefinitionSet(const Profile: WideString; const Name: WideString): ITagDefinitionSet;
var
  TS: PTagDefinitionSet;
begin
  TS := (TheObject as PExtensionManager).FindTagDefinitionSet(Profile, Name);
  if TS <> nil then
    Result := TS.GetAutomationObject as ITagDefinitionSet
  else
    Result := nil;
end;

// PExtensionManagerAuto
////////////////////////////////////////////////////////////////////////////////

procedure RegisterAutomationClasses;
begin
  ClassRegistry.RegisterAutomationClass(PExtensibleModel, PExtensibleModelAuto, IID_IExtensibleModel);
  ClassRegistry.RegisterAutomationClass(PConstraint, PConstraintAuto, IID_IConstraint);
  ClassRegistry.RegisterAutomationClass(PTaggedValue, PTaggedValueAuto, IID_ITaggedValue);
  ClassRegistry.RegisterAutomationClass(PProfile, PProfileAuto, IID_IProfile);
  ClassRegistry.RegisterAutomationClass(PStereotype, PStereotypeAuto, IID_IStereotype);
  ClassRegistry.RegisterAutomationClass(PDataType, PDataTypeAuto, IID_IDataType);
  ClassRegistry.RegisterAutomationClass(PTagDefinition, PTagDefinitionAuto, IID_ITagDefinition);
  ClassRegistry.RegisterAutomationClass(PTagDefinitionSet, PTagDefinitionSetAuto, IID_ITagDefinitionSet);
  ClassRegistry.RegisterAutomationClass(PExtensionManager, PExtensionManagerAuto, IID_IExtensionManager);
end;

initialization
  RegisterAutomationClasses;
end.
