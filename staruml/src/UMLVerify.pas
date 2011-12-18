unit UMLVerify;

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
2.5.3 (Core)
------------
2.5.3.1 Association [1,2]
2.5.3.5 BehavioralFeature [1]
2.5.3.8 Classifier [2,3,4,5]
2.5.3.20 GeneralizableElement [1,(not-in-spec),3]
2.5.3.23 Interface [3]

2.9.3 (Common Behavior)
-----------------------
2.9.3.6 ComponentInstance [1]
2.9.3.15 NodeInstance [1]

2.10.3 (Collaborations)
-----------------------
2.10.3.1 AssociationEndRole [2]
2.10.3.3 ClassifierRole [3,4]
2.10.3.8 Message [1]

2.11.3 (Use Cases)
------------------
2.11.3.1 Actor [1]

2.12.3 (StateMachines)
----------------------
2.12.3.1 CompositeState [1,2,3,4,5]
2.12.3.2 FinalState [1]
2.12.3.4 Pseudostate [1,2,7,8]
2.12.3.5 StateMachine [1,2,3,4]
2.12.3.7 SubmachineState [2]
2.12.3.8 Transition [5]

2.13.3 (Activity Graphs)
------------------------
2.13.3.1 ActivityGraph [1]
2.13.3.2 ActionState [2,3]
2.13.3.7 SubactivityState [1]

TOTAL : 38 RULES
}


interface

uses
  BasicClasses, Core, UMLModels,
  Classes, SysUtils, NLS, NLS_StarUML;

type
  // Forward Declarations
  PUMLVerifyItem = class;

  // Event and Function Types
  PFun = function(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
  PVerifyFun = function(Model: PModel): Boolean;
  PVerifyItemEvent = procedure(Sender: TObject; VerifyItem: PUMLVerifyItem) of object;
  PVerifyEvent = procedure(Sender: TObject; VerifyItem: PUMLVerifyItem; Model: PModel) of object;

  // PUMLVerifyItem
  PUMLVerifyItem = class
  private
   FTarget: string;
   FTitle: string;
   FOnVerify: PVerifyFun;
  public
   function Verify(Model: PModel): Boolean;
   property Target: string read FTarget write FTarget;
   property Title: string read FTitle write FTitle;
   property OnVerify: PVerifyFun read FOnVerify write FOnVerify;
  end;

  // PUMLVerifier
  PUMLVerifier = class
  private
    FVerifyItems: TList;
    FVerificationFailedCount: Integer;
    FOnBeginVerification: TNotifyEvent;
    FOnEndVerification: TNotifyEvent;
    FOnBeginVerifyItem: PVerifyItemEvent;
    FOnEndVerifyItem: PVerifyItemEvent;
    FOnVerified: PVerifyEvent;
    FOnVerificationFailed: PVerifyEvent;
    function GetVerifyItem(Index: Integer): PUMLVerifyItem;
    function GetVerifyItemCount: Integer;
    procedure BeginVerification;
    procedure EndVerification;
    procedure BeginVerifyItem(VerifyItem: PUMLVerifyItem);
    procedure EndVerifyItem(VerifyItem: PUMLVerifyItem);
    procedure Verified(VerifyItem: PUMLVerifyItem; Model: PModel);
    procedure VerificationFailed(VerifyItem: PUMLVerifyItem; Model: PModel);
  public
    constructor Create;
    destructor Destroy; override;
    function IndexOfVerifyItem(VI: PUMLVerifyItem): Integer;
    procedure AddVerifyItem(Target, Title: string; VerifyFun: PVerifyFun);
    procedure VerifyAll;
    property VerifyItems[Index: Integer]: PUMLVerifyItem read GetVerifyItem;
    property VerifyItemCount: Integer read GetVerifyItemCount;
    property VerificationFailedCount: Integer read FVerificationFailedCount;
    property OnBeginVerification: TNotifyEvent read FOnBeginVerification write FOnBeginVerification;
    property OnEndVerification: TNotifyEvent read FOnEndVerification write FOnEndVerification;
    property OnBeginVerifyItem: PVerifyItemEvent read FOnBeginVerifyItem write FOnBeginVerifyItem;
    property OnEndVerifyItem: PVerifyItemEvent read FOnEndVerifyItem write FOnEndVerifyItem;
    property OnVerified: PVerifyEvent read FOnVerified write FOnVerified;
    property OnVerificationFailed: PVerifyEvent read FOnVerificationFailed write FOnVerificationFailed;
  end;

var
  UMLVerifier: PUMLVerifier;

implementation

var
  C1, C2: POrderedSet;

////////////////////////////////////////////////////////////////////////////////
// PUMLVerifyItem

function PUMLVerifyItem.Verify(Model: PModel): Boolean;
begin
  Result := False;
  if Assigned(FOnVerify) then
    Result := FOnVerify(Model);
end;

// PUMLVerifyItem
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLVerifier

constructor PUMLVerifier.Create;
begin
  inherited;
  FVerifyItems := TList.Create;
end;

destructor PUMLVerifier.Destroy;
var
  I: Integer;
  VI: PUMLVerifyItem;
begin
  for I := FVerifyItems.Count - 1 downto 0 do
  begin
    VI := FVerifyItems.Items[I];
    VI.Free;
  end;
  FVerifyItems.Free;
  inherited;
end;

function PUMLVerifier.IndexOfVerifyItem(VI: PUMLVerifyItem): Integer;
begin
  Result := FVerifyItems.IndexOf(VI);
end;

function PUMLVerifier.GetVerifyItem(Index: Integer): PUMLVerifyItem;
begin
  Result := FVerifyItems.Items[Index];
end;

function PUMLVerifier.GetVerifyItemCount: Integer;
begin
  Result := FVerifyItems.Count;
end;

procedure PUMLVerifier.BeginVerification;
begin
  if Assigned(FOnBeginVerification) then
    FOnBeginVerification(Self);
end;

procedure PUMLVerifier.EndVerification;
begin
  if Assigned(FOnEndVerification) then
    FOnEndVerification(Self);
end;

procedure PUMLVerifier.BeginVerifyItem(VerifyItem: PUMLVerifyItem);
begin
  if Assigned(FOnBeginVerifyItem) then
    FOnBeginVerifyItem(Self, VerifyItem);
end;

procedure PUMLVerifier.EndVerifyItem(VerifyItem: PUMLVerifyItem);
begin
  if Assigned(FOnEndVerifyItem) then
    FOnEndVerifyItem(Self, VerifyItem);
end;

procedure PUMLVerifier.Verified(VerifyItem: PUMLVerifyItem; Model: PModel);
begin
  if Assigned(FOnVerified) then
    FOnVerified(Self, VerifyItem, Model);
end;

procedure PUMLVerifier.VerificationFailed(VerifyItem: PUMLVerifyItem; Model: PModel);
begin
  if Assigned(FOnVerificationFailed) then
    FOnVerificationFailed(Self, VerifyItem, Model);
end;

procedure PUMLVerifier.AddVerifyItem(Target, Title: string; VerifyFun: PVerifyFun);
var
  VI: PUMLVerifyItem;
begin
  VI := PUMLVerifyItem.Create;
  VI.Target := Target;
  VI.Title := Title;
  VI.OnVerify := VerifyFun;
  FVerifyItems.Add(VI);
end;

procedure PUMLVerifier.VerifyAll;
var
  I, J: Integer;
  VI: PUMLVerifyItem;
  VM: PModel;
  MetaClass: PMetaClass;
begin
  FVerificationFailedCount := 0;
  BeginVerification;
  for I := 0 to VerifyItemCount - 1 do
  begin
    VI := VerifyItems[I];
    BeginVerifyItem(VI);
    MetaClass := MetaModel.FindMetaClass(VI.Target);
    if MetaClass <> nil then
    begin
      for J := 0 to MetaClass.InclusiveInstanceCount - 1 do
      begin
        VM := MetaClass.InclusiveInstances[J] as PModel;
        if VI.Verify(VM) then begin
          Verified(VI, VM);
        end
        else begin
          Inc(FVerificationFailedCount);
          VerificationFailed(VI, VM);
        end;
      end;
    end;
    EndVerifyItem(VI);
  end;
  EndVerification;
end;

// PUMLVerifier
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utility Functions

// -----------------------------------------------------------------------------
// ForAll
// - if all elements of collection satisfy Fun function, return true
// - if not, return false
// -----------------------------------------------------------------------------
function ForAll(Collection: POrderedSet; Fun: PFun): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to Collection.Count - 1 do
    if not Fun(Collection.Items[I] as PModel) then
    begin
      Result := False;
      Exit;
    end;
end;

function ForAll2(Collection: POrderedSet; Fun: PFun): Boolean;
var
  I, J: Integer;
begin
  Result := True;
  for I := 0 to Collection.Count - 1 do
  begin
    for J := 0 to Collection.Count - 1 do
    begin
      if not Fun(Collection.Items[I] as PModel, Collection.Items[J] as PModel) then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// Select
// - remains elements only satisfying Fun function in collection
// -----------------------------------------------------------------------------
procedure Select(Collection: POrderedSet; Fun: PFun);
var
  I: Integer;
begin
  for I := Collection.Count - 1 downto 0 do
    if not Fun(Collection.Items[I] as PModel) then
      Collection.Delete(I);
end;

// -----------------------------------------------------------------------------
// Collect
// - collect all elements in collection corresponding to CollectionName of Model
// -----------------------------------------------------------------------------
procedure Collect(Model: PModel; CollectionName: string; Collection: POrderedSet);
var
  I: Integer;
begin
  for I := 0 to Model.MOF_GetCollectionCount(CollectionName) - 1 do
    Collection.Add(Model.MOF_GetCollectionItem(CollectionName, I));
end;

// -----------------------------------------------------------------------------
// IsUniqueNameCollection
// - detect name collision of elements in collection
// -----------------------------------------------------------------------------
function IsUniqueNameCollection(Collection: POrderedSet): Boolean;
var
  I, J: Integer;
  M1, M2: PModel;
begin
  Result := True;
  for I := 0 to Collection.Count - 1 do
  begin
    M1 := Collection.Items[I] as PModel;
    for J := 0 to Collection.Count - 1 do
    begin
      M2 := Collection.Items[J] as PModel;
      if (M1 <> M2) and (M1.Name = M2.Name) and (M1.Name <> '') and (M2.Name <> '') then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// IsNameInCollection
// - check existence of elements whose name is same each other in Collection
// -----------------------------------------------------------------------------
function IsNameInCollection(Collection: POrderedSet; Name: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Collection.Count - 1 do
   if (Collection.Items[I] as PModel).Name = Name then
   begin
     Result := True;
     Exit;
   end;
end;

// -----------------------------------------------------------------------------
// CollectOtherSideAssociationEnds
// - collect all elements in collection corresponding to CollectionName of Model
// -----------------------------------------------------------------------------
procedure CollectOtherSideAssociationEnds(Model: PModel; Collection: POrderedSet);
var
  I, J: Integer;
  TempSet: POrderedSet;
  Asso: PUMLAssociation;
begin
  TempSet := POrderedSet.Create;
  TempSet.Clear;
  Collect(Model, 'Associations', TempSet);
  for I := 0 to TempSet.Count - 1 do
  begin
    Asso := (TempSet.Items[I] as PUMLAssociationEnd).Association;
    for J := 0 to Asso.ConnectionCount - 1 do
      if Asso.Connections[J].Participant <> Model then
        Collection.Add(Asso.Connections[J]);
  end;
  TempSet.Free;
end;

// Utility Functions
////////////////////////////////////////////////////////////////////////////////

// =============================================================================
// SPEC NO. : 2.5.3.1 [1]
// TARGET   : UMLAssociation
// TITLE    : The AssociationEnds must have a unique name within a Association.
// =============================================================================

function Association_1(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Connections', C1);
  Result := IsUniqueNameCollection(C1);
end;

// =============================================================================
// SPEC NO. : 2.5.3.1 [2]
// TARGET   : UMLAssociation
// TITLE    : At most one AssociationEnd may be an aggregation or composition.
// =============================================================================

function CheckAggregationOrComposition(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
begin
  if (Model1 as PUMLAssociationEnd).Aggregation <> akNone then
    Result := True
  else
    Result := False;
end;

function Association_2(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Connections', C1);
  Select(C1, CheckAggregationOrComposition);
  if C1.Count <= 1 then
    Result := True
  else
    Result := False;
end;

// =============================================================================
// SPEC NO. : 2.5.3.5 [1]
// TARGET   : UMLBehavioralFeature
// TITLE    : All Parameters should have a unique name.
// =============================================================================

function BehavioralFeature_1(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Parameters', C1);
  Result := IsUniqueNameCollection(C1);
end;

// =============================================================================
// SPEC NO. : 2.5.3.8 [2]
// TARGET   : UMLClassifier
// TITLE    : No Attributes may have the same name within a Classifier.
// =============================================================================

function Classifier_1(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Attributes', C1);
  Result := IsUniqueNameCollection(C1);
end;

// =============================================================================
// SPEC NO. : 2.5.3.8 [3]
// TARGET   : UMLClassifier
// TITLE    : No opposite AssociationEnds may have the same name with a Classifier.
// =============================================================================

function Classifier_2(Model: PModel): Boolean;
begin
  C1.Clear;
  CollectOtherSideAssociationEnds(Model, C1);
  Result := IsUniqueNameCollection(C1);
end;

// =============================================================================
// SPEC NO. : 2.5.3.8 [4]
// TARGET   : UMLClassifier
// TITLE    : The name of an Attribute may not be the same as the name of an
//            opposite AssociationEnd or a ModelElement contained in the Classifier.
// =============================================================================

function Classifier_3(Model: PModel): Boolean;
var
  I: Integer;
  R: Boolean;
begin
  C1.Clear;
  Collect(Model, 'Attributes', C1);
  C2.Clear;
  CollectOtherSideAssociationEnds(Model, C2);
  Collect(Model, 'OwnedElements', C2);
  R := True;
  for I := 0 to C1.Count - 1 do
    R := R and (not IsNameInCollection(C2, (C1.Items[I] as PModel).Name));
  Result := R;
end;

// =============================================================================
// SPEC NO. : 2.5.3.8 [5]
// TARGET   : UMLClassifier
// TITLE    : The name of an opposite AssociationEnd may not be the same as the
//            name of an Attribute or a ModelElement contained in the Classifier.
// =============================================================================

function Classifier_4(Model: PModel): Boolean;
var
  I: Integer;
  R: Boolean;
begin
  C1.Clear;
  CollectOtherSideAssociationEnds(Model, C1);
  C2.Clear;
  Collect(Model, 'Attributes', C2);
  Collect(Model, 'OwnedElements', C2);
  R := True;
  for I := 0 to C1.Count - 1 do
    R := R and (not IsNameInCollection(C2, (C1.Items[I] as PModel).Name));
  Result := R;
end;

// =============================================================================
// SPEC NO. : 2.5.3.20 [1]
// TARGET   : UMLGeneralizableElement
// TITLE    : A root cannot have any Generalizations.
// =============================================================================

function GeneralizableElement_1(Model: PModel): Boolean;
var
  GE: PUMLGeneralizableElement;
begin
  Result := True;
  GE := Model as PUMLGeneralizableElement;
  if GE.IsRoot and (GE.GeneralizationCount > 0) then Result := False;
end;

// =============================================================================
// SPEC NO. : 2.5.3.20 [not-in-spec]
// TARGET   : UMLGeneralizableElement
// TITLE    : A leaf cannot have any Specializations.
// =============================================================================

function GeneralizableElement_2(Model: PModel): Boolean;
var
  GE: PUMLGeneralizableElement;
begin
  Result := True;
  GE := Model as PUMLGeneralizableElement;
  if GE.IsLeaf and (GE.SpecializationCount > 0) then Result := False;
end;

// =============================================================================
// SPEC NO. : 2.5.3.20 [3]
// TARGET   : UMLGeneralizableElement
// TITLE    : Circular inheritance is not allowed.
// =============================================================================

function GeneralizableElement_3(Model: PModel): Boolean;

  procedure CollectAllParents(GE: PUMLGeneralizableElement; Visited, C: POrderedSet);
  var
    I: Integer;
  begin
    if (GE.GeneralizationCount > 0) and (not Visited.Contains(GE)) then
    begin
      Visited.Add(GE);
      for I := 0 to GE.GeneralizationCount - 1 do
      begin
        C.Add(GE.Generalizations[I].Parent);
        CollectAllParents(GE.Generalizations[I].Parent, Visited, C);
      end;
    end;
  end;

begin
  C1.Clear;
  C2.Clear;
  CollectAllParents(Model as PUMLGeneralizableElement, C1, C2);
  Result := not C2.Contains(Model);
end;

// =============================================================================
// SPEC NO. : 2.5.3.23 [3]
// TARGET   : UMLInterface
// TITLE    : All Features defined in an Interface are public.
// =============================================================================

function CheckIsItPublic(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
begin
  if (Model1 as PUMLModelElement).Visibility = vkPublic then
    Result := True
  else
    Result := False;
end;

function Interface_1(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Attributes', C1);
  Collect(Model, 'Operations', C1);
  Result := ForAll(C1, CheckIsItPublic);
end;

// =============================================================================
// SPEC NO. : 2.9.3.6 [1]
// TARGET   : UMLComponentInstance
// TITLE    : A ComponentInstance originates from exactly one Component.
// =============================================================================

function ComponentInstance_1(Model: PModel): Boolean;
begin
  Result := (Model as PUMLComponentInstance).Classifier is PUMLComponent;
end;

// =============================================================================
// SPEC NO. : 2.9.3.15 [1]
// TARGET   : UMLNodeInstance
// TITLE    : A NodeInstance must have only one Classifier as its origin, and it
//            must be a Node.
// =============================================================================

function NodeInstance_1(Model: PModel): Boolean;
begin
  Result := (Model as PUMLNodeInstance).Classifier is PUMLNode;
end;

// =============================================================================
// SPEC NO. : 2.10.3.1 [2]
// TARGET   : UMLAssociationEndRole
// TITLE    : The type must be a kind of ClassifierRole.
// =============================================================================

function AssociationEndRole_1(Model: PModel): Boolean;
begin
  Result := (Model as PUMLAssociationEndRole).Participant is PUMLClassifierRole;
end;

// =============================================================================
// SPEC NO. : 2.10.3.3 [3]
// TARGET   : UMLClassifierRole
// TITLE    : A ClassifierRole does not have any Features of its own.
// =============================================================================

function ClassifierRole_1(Model: PModel): Boolean;
begin
  with Model as PUMLClassifierRole do
    Result := (AttributeCount + OperationCount) = 0;
end;

// =============================================================================
// SPEC NO. : 2.10.3.3 [4]
// TARGET   : UMLClassifierRole
// TITLE    : A ClassifierRole it not a role of another ClassifierRole.
// =============================================================================

function ClassifierRole_2(Model: PModel): Boolean;
begin
  Result := not ((Model as PUMLClassifierRole).Base is PUMLClassifierRole);
end;

// =============================================================================
// SPEC NO. : 2.10.3.8 [1]
// TARGET   : UMLMessage
// TITLE    : The sender and the receiver must participate in the Collaboration,
//            which defines the context of the Interaction.
// =============================================================================

function Message_1(Model: PModel): Boolean;
begin
  C1.Clear;
  with (Model as PUMLMessage) do begin
    Collect(Interaction.Context, 'OwnedElements', C1);
    Result := C1.Contains(Sender) and C1.Contains(Receiver);
  end;
end;

// =============================================================================
// SPEC NO. : 2.11.3.1 [1]
// TARGET   : UMLActor
// TITLE    : Actors can only have Associations to UseCases, Subsystems, and
//            Classes.
// =============================================================================

function CheckPossibleActorOtherSide(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
begin
  if (Model1 is PUMLUseCase) or (Model1 is PUMLSubsystem) or (Model1 is PUMLClass) then
    Result := True
  else
    Result := False;
end;

function Actor_1(Model: PModel): Boolean;
var
  I: Integer;
begin
  C1.Clear;
  CollectOtherSideAssociationEnds(Model, C1);
  C2.Clear;
  for I := 0 to C1.Count - 1 do
    C2.Add((C1.Items[I] as PUMLAssociationEnd).Participant);
  Result := ForAll(C2, CheckPossibleActorOtherSide);
end;

// =============================================================================
// SPEC NO. : 2.12.3.1 [1]
// TARGET   : UMLCompositeState
// TITLE    : A composite state can have at most one initial vertex.
// =============================================================================

function IsInitialState(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
begin
  if (Model1 is PUMLPseudostate) and ((Model1 as PUMLPseudostate).PseudostateKind = pkInitial) then
    Result := True
  else
    Result := False;
end;

function CompositeState_1(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Subvertices', C1);
  Select(C1, IsInitialState);
  if C1.Count <= 1 then
    Result := True
  else
    Result := False;
end;

// =============================================================================
// SPEC NO. : 2.12.3.1 [2]
// TARGET   : UMLCompositeState
// TITLE    : A composite state can have at most one deep history vertex.
// =============================================================================

function IsDeepHistory(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
begin
  if (Model1 is PUMLPseudostate) and ((Model1 as PUMLPseudostate).PseudostateKind = pkDeepHistory) then
    Result := True
  else
    Result := False;
end;

function CompositeState_2(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Subvertices', C1);
  Select(C1, IsDeepHistory);
  if C1.Count <= 1 then
    Result := True
  else
    Result := False;
end;

// =============================================================================
// SPEC NO. : 2.12.3.1 [3]
// TARGET   : UMLCompositeState
// TITLE    : A composite state can have at most one shallow history vertex.
// =============================================================================

function IsShallowHistory(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
begin
  if (Model1 is PUMLPseudostate) and ((Model1 as PUMLPseudostate).PseudostateKind = pkShallowHistory) then
    Result := True
  else
    Result := False;
end;

function CompositeState_3(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Subvertices', C1);
  Select(C1, IsShallowHistory);
  if C1.Count <= 1 then
    Result := True
  else
    Result := False;
end;

// =============================================================================
// SPEC NO. : 2.12.3.1 [4]
// TARGET   : UMLCompositeState
// TITLE    : There have to be at least two composite substates in a concurrent
//            composite state.
// =============================================================================

function IsCompositeState(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
begin
  Result := Model1 is PUMLCompositeState;
end;

function CompositeState_4(Model: PModel): Boolean;
begin
  if (Model as PUMLCompositeState).IsConcurrent then begin
    C1.Clear;
    Collect(Model, 'Subvertices', C1);
    Select(C1, IsCompositeState);
    Result := C1.Count >= 2;
  end
  else
    Result := True;
end;

// =============================================================================
// SPEC NO. : 2.12.3.1 [5]
// TARGET   : UMLCompositeState
// TITLE    : A concurrent state can only have composite states as substates.
// =============================================================================

function CompositeState_5(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Subvertices', C1);
  if (Model as PUMLCompositeState).IsConcurrent then
    Result := ForAll(C1, IsCompositeState)
  else
    Result := True;
end;

// =============================================================================
// SPEC NO. : 2.12.3.2 [1]
// TARGET   : UMLFinalState
// TITLE    : A final state cannot have any outgoing transitions.
// =============================================================================

function FinalState_1(Model: PModel): Boolean;
begin
  Result := (Model as PUMLFinalState).OutgoingCount = 0;
end;

// =============================================================================
// SPEC NO. : 2.12.3.4 [1]
// TARGET   : UMLPseudostate
// TITLE    : An initial vertex can have at most one outgoing transition and no
//            incoming transitions.
// =============================================================================

function Pseudostate_1(Model: PModel): Boolean;
begin
  with Model as PUMLPseudostate do
    if PseudostateKind = pkInitial then
      Result := (OutgoingCount <= 1) and (IncomingCount = 0)
    else
      Result := True;
end;

// =============================================================================
// SPEC NO. : 2.12.3.4 [2]
// TARGET   : UMLPseudostate
// TITLE    : History vertices can have at most one outgoing transitions.
// =============================================================================

function Pseudostate_2(Model: PModel): Boolean;
begin
  with Model as PUMLPseudostate do
    if (PseudostateKind = pkShallowHistory) or (PseudostateKind = pkDeepHistory) then
      Result := OutgoingCount <= 1
    else
      Result := True;
end;

// =============================================================================
// SPEC NO. : 2.12.3.4 [7]
// TARGET   : UMLPseudostate
// TITLE    : A junction vertex must have at least one incoming and one outgoing
//            transition.
// =============================================================================

function Pseudostate_3(Model: PModel): Boolean;
begin
  with Model as PUMLPseudostate do
    if PseudostateKind = pkJunction then
      Result := (IncomingCount >= 1) and (OutgoingCount >= 1)
    else
      Result := True;
end;

// =============================================================================
// SPEC NO. : 2.12.3.4 [8]
// TARGET   : UMLPseudostate
// TITLE    : A choice vertex must have at least one incoming and one outgoing
//            transition.
// =============================================================================

function Pseudostate_4(Model: PModel): Boolean;
begin
  with Model as PUMLPseudostate do
    if PseudostateKind = pkChoice then
      Result := (IncomingCount >= 1) and (OutgoingCount >= 1)
    else
      Result := True;
end;

// =============================================================================
// SPEC NO. : 2.12.3.5 [1]
// TARGET   : UMLStateMachine
// TITLE    : A StateMachine is aggregated within either a classifier or a
//            behavioral feature.
// =============================================================================

function StateMachine_1(Model: PModel): Boolean;
begin
  with Model as PUMLStateMachine do
    Result := (Context is PUMLClassifier) or (Context is PUMLBehavioralFeature);
end;

// =============================================================================
// SPEC NO. : 2.12.3.5 [2]
// TARGET   : UMLStateMachine
// TITLE    : A top state is always a composite.
// =============================================================================

function StateMachine_2(Model: PModel): Boolean;
begin
  with Model as PUMLStateMachine do
    Result := Top is PUMLCompositeState;
end;

// =============================================================================
// SPEC NO. : 2.12.3.5 [3]
// TARGET   : UMLStateMachine
// TITLE    : A top state cannot have any containing states.
// =============================================================================

function StateMachine_3(Model: PModel): Boolean;
begin
  with Model as PUMLStateMachine do
    Result := Top.ContainerState = nil;
end;

// =============================================================================
// SPEC NO. : 2.12.3.5 [4]
// TARGET   : UMLStateMachine
// TITLE    : The top state cannot be the source of transition.
// =============================================================================

function StateMachine_4(Model: PModel): Boolean;
begin
  with Model as PUMLStateMachine do
    Result := Top.OutgoingCount = 0;
end;

// =============================================================================
// SPEC NO. : 2.12.3.7 [2]
// TARGET   : UMLSubmachineState
// TITLE    : Submachine states are never concurrent.
// =============================================================================

function SubmachineState_1(Model: PModel): Boolean;
begin
  Result := not (Model as PUMLSubmachineState).IsConcurrent;
end;

// =============================================================================
// SPEC NO. : 2.12.3.8 [5]
// TARGET   : UMLTransition
// TITLE    : Transitions outgoing pseudostates may not have a trigger.
// =============================================================================

function Transition_1(Model: PModel): Boolean;
begin
  with Model as PUMLTransition do
    if Source is PUMLPseudostate then
      Result := TriggerCount = 0
    else
      Result := True;
end;

// =============================================================================
// SPEC NO. : 2.13.3.1 [1]
// TARGET   : UMLActivityGraph
// TITLE    : An ActivityGraph specifies the dynamics of a Package, or a
//            Classifier, or a BehavioralFeature.
// =============================================================================

function ActivityGraph_1(Model: PModel): Boolean;
begin
  with Model as PUMLActivityGraph do
    Result := (Context is PUMLPackage) or (Context is PUMLClassifier) or
      (Context is PUMLBehavioralFeature);
end;

// =============================================================================
// SPEC NO. : 2.13.3.2 [2]
// TARGET   : UMLActionState
// TITLE    : An action state does not have an internal transition, exit action,
//            or a do activity.
// =============================================================================

function ActionState_1(Model: PModel): Boolean;
begin
  with Model as PUMLActionState do
    Result := (InternalTransitionCount = 0) and (ExitActionCount = 0) and
      (DoActivityCount = 0);
end;

// =============================================================================
// SPEC NO. : 2.13.3.2 [3]
// TARGET   : UMLActionState
// TITLE    : Transitions originating from an action state have no trigger event.
// =============================================================================

function HaveNoTriggers(Model1: PModel; Model2: PModel = nil; Arg1: string = ''; Arg2: string = ''): Boolean;
begin
  Result := (Model1 as PUMLTransition).TriggerCount = 0;
end;

function ActionState_2(Model: PModel): Boolean;
begin
  C1.Clear;
  Collect(Model, 'Outgoings', C1);
  Result := ForAll(C1, HaveNoTriggers);
end;

// =============================================================================
// SPEC NO. : 2.13.3.7 [1]
// TARGET   : UMLSubactivityState
// TITLE    : A subactivity state is a submachine state that is linked to an
//            activity graph.
// =============================================================================

function SubactivityState_1(Model: PModel): Boolean;
begin
  with Model as PUMLSubactivityState do
    if Submachine <> nil then
      Result := Submachine is PUMLActivityGraph
    else
      Result := True;
end;


// -----------------------------------------------------------------------------
// RegisterAllVerifyFunctions
// -----------------------------------------------------------------------------

procedure RegisterAllVerifyFunctions;
begin
  UMLVerifier.AddVerifyItem('UMLAssociation', MSG_VERIFY_ASSOCIATION_1, Association_1);
  UMLVerifier.AddVerifyItem('UMLAssociation', MSG_VERIFY_ASSOCIATION_2, Association_2);
  UMLVerifier.AddVerifyItem('UMLBehavioralFeature', MSG_VERIFY_BEHAVIORALFEATURE_1, BehavioralFeature_1);
  UMLVerifier.AddVerifyItem('UMLClassifier', MSG_VERIFY_CLASSIFIER_1, Classifier_1);
  UMLVerifier.AddVerifyItem('UMLClassifier', MSG_VERIFY_CLASSIFIER_2, Classifier_2);
  UMLVerifier.AddVerifyItem('UMLClassifier', MSG_VERIFY_CLASSIFIER_3, Classifier_3);
  UMLVerifier.AddVerifyItem('UMLClassifier', MSG_VERIFY_CLASSIFIER_4, Classifier_4);
  UMLVerifier.AddVerifyItem('UMLGeneralizableElement', MSG_VERIFY_GENERALIZABLEELEMENT_1, GeneralizableElement_1);
  UMLVerifier.AddVerifyItem('UMLGeneralizableElement', MSG_VERIFY_GENERALIZABLEELEMENT_2, GeneralizableElement_2);
  UMLVerifier.AddVerifyItem('UMLGeneralizableElement', MSG_VERIFY_GENERALIZABLEELEMENT_3, GeneralizableElement_3);
  UMLVerifier.AddVerifyItem('UMLInterface', MSG_VERIFY_INTERFACE_1, Interface_1);
  UMLVerifier.AddVerifyItem('UMLComponentInstance', MSG_VERIFY_COMPONENTINSTANCE_1, ComponentInstance_1);
  UMLVerifier.AddVerifyItem('UMLNodeInstance', MSG_VERIFY_NODEINSTANCE_1, NodeInstance_1);
  UMLVerifier.AddVerifyItem('UMLAssociationEndRole', MSG_VERIFY_ASSOCIATIONENDROLE_1, AssociationEndRole_1);
  UMLVerifier.AddVerifyItem('UMLClassifierRole', MSG_VERIFY_CLASSIFIERROLE_1, ClassifierRole_1);
  UMLVerifier.AddVerifyItem('UMLClassifierRole', MSG_VERIFY_CLASSIFIERROLE_2, ClassifierRole_2);
  UMLVerifier.AddVerifyItem('UMLMessage', MSG_VERIFY_MESSAGE_1, Message_1);
  UMLVerifier.AddVerifyItem('UMLActor', MSG_VERIFY_ACTOR_1, Actor_1);
  UMLVerifier.AddVerifyItem('UMLCompositeState', MSG_VERIFY_COMPOSITESTATE_1, CompositeState_1);
  UMLVerifier.AddVerifyItem('UMLCompositeState', MSG_VERIFY_COMPOSITESTATE_2, CompositeState_2);
  UMLVerifier.AddVerifyItem('UMLCompositeState', MSG_VERIFY_COMPOSITESTATE_3, CompositeState_3);
  UMLVerifier.AddVerifyItem('UMLCompositeState', MSG_VERIFY_COMPOSITESTATE_4, CompositeState_4);
  UMLVerifier.AddVerifyItem('UMLCompositeState', MSG_VERIFY_COMPOSITESTATE_5, CompositeState_5);
  UMLVerifier.AddVerifyItem('UMLFinalState', MSG_VERIFY_FINALSTATE_1, FinalState_1);
  UMLVerifier.AddVerifyItem('UMLPseudostate', MSG_VERIFY_PSEUDOSTATE_1, Pseudostate_1);
  UMLVerifier.AddVerifyItem('UMLPseudostate', MSG_VERIFY_PSEUDOSTATE_2, Pseudostate_2);
  UMLVerifier.AddVerifyItem('UMLPseudostate', MSG_VERIFY_PSEUDOSTATE_3, Pseudostate_3);
  UMLVerifier.AddVerifyItem('UMLPseudostate', MSG_VERIFY_PSEUDOSTATE_4, Pseudostate_4);
  UMLVerifier.AddVerifyItem('UMLStateMachine', MSG_VERIFY_STATEMACHINE_1, StateMachine_1);
  UMLVerifier.AddVerifyItem('UMLStateMachine', MSG_VERIFY_STATEMACHINE_2, StateMachine_2);
  UMLVerifier.AddVerifyItem('UMLStateMachine', MSG_VERIFY_STATEMACHINE_3, StateMachine_3);
  UMLVerifier.AddVerifyItem('UMLStateMachine', MSG_VERIFY_STATEMACHINE_4, StateMachine_4);
  UMLVerifier.AddVerifyItem('UMLSubmachineState', MSG_VERIFY_SUBMACHINESTATE_1, SubmachineState_1);
  UMLVerifier.AddVerifyItem('UMLTransition', MSG_VERIFY_TRANSITION_1, Transition_1);
  UMLVerifier.AddVerifyItem('UMLActivityGraph', MSG_VERIFY_ACTIVITYGRAPH_1, ActivityGraph_1);
  UMLVerifier.AddVerifyItem('UMLActionState', MSG_VERIFY_ACTIONSTATE_1, ActionState_1);
  UMLVerifier.AddVerifyItem('UMLActionState', MSG_VERIFY_ACTIONSTATE_2, ActionState_2);
  UMLVerifier.AddVerifyItem('UMLSubactivityState', MSG_VERIFY_SUBACTIVITYSTATE_1, SubactivityState_1);
end;

initialization
  C1 := POrderedSet.Create;
  C2 := POrderedSet.Create;
  UMLVerifier := PUMLVerifier.Create;
  RegisterAllVerifyFunctions;
finalization
  C1.Free;
  C2.Free;
  UMLVerifier.Free;
end.

