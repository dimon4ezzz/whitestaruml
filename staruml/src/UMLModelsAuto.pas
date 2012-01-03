unit UMLModelsAuto;

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
  CoreAuto, ExtCoreAuto, WhiteStarUML_TLB;

type
  // Forward Declaration
  PUMLElementAuto = class;
  PUMLModelElementAuto = class;
  PUMLLinkEndAuto = class;
  PUMLLinkObjectAuto = class;
  PUMLPartitionAuto = class;
  PUMLInteractionFragmentAuto = class;
  PUMLInteractionOperandAuto = class;
  PUMLCombinedFragmentAuto = class;
  PUMLInteractionInstanceSetAuto = class;
  PUMLInstanceAuto = class;
  PUMLDataValueAuto = class;
  PUMLNodeInstanceAuto = class;
  PUMLObjectAuto = class;
  PUMLSubsystemInstanceAuto = class;
  PUMLUseCaseInstanceAuto = class;
  PUMLComponentInstanceAuto = class;
  PUMLArgumentAuto = class;
  PUMLConnectorEndAuto = class;
  PUMLStateVertexAuto = class;
  PUMLSynchStateAuto = class;
  PUMLPseudostateAuto = class;
  PUMLStubStateAuto = class;
  PUMLStateAuto = class;
  PUMLSimpleStateAuto = class;
  PUMLObjectFlowStateAuto = class;
  PUMLActionStateAuto = class;
  PUMLSignalAcceptStateAuto = class;
  PUMLCallStateAuto = class;
  PUMLSignalSendStateAuto = class;
  PUMLCompositeStateAuto = class;
  PUMLSubmachineStateAuto = class;
  PUMLSubactivityStateAuto = class;
  PUMLFinalStateAuto = class;
  PUMLFlowFinalStateAuto = class;
  PUMLInteractionAuto = class;
  PUMLMessageAuto = class;
  PUMLAssociationClassAuto = class;
  PUMLStateMachineAuto = class;
  PUMLActivityGraphAuto = class;
  PUMLFeatureAuto = class;
  PUMLBehavioralFeatureAuto = class;
  PUMLMethodAuto = class;
  PUMLOperationAuto = class;
  PUMLReceptionAuto = class;
  PUMLConnectorAuto = class;
  PUMLStructuralFeatureAuto = class;
  PUMLAttributeAuto = class;
  PUMLPortAuto = class;
  PUMLGeneralizableElementAuto = class;
  PUMLNamespaceAuto = class;
  PUMLCollaborationAuto = class;
  PUMLClassifierAuto = class;
  PUMLUseCaseAuto = class;
  PUMLActorAuto = class;
  PUMLClassifierInStateAuto = class;
  PUMLInterfaceAuto = class;
  PUMLPackageAuto = class;
  PUMLSubsystemAuto = class;
  PUMLProjectAuto = class;
  PUMLModelAuto = class;
  PUMLDataTypeAuto = class;
  PUMLProgrammingLanguageDataTypeAuto = class;
  PUMLPrimitiveAuto = class;
  PUMLEnumerationAuto = class;
  PUMLClassAuto = class;
  PUMLNodeAuto = class;
  PUMLArtifactAuto = class;
  PUMLComponentAuto = class;
  PUMLSignalAuto = class;
  PUMLExceptionAuto = class;
  PUMLClassifierRoleAuto = class;
  PUMLEventAuto = class;
  PUMLChangeEventAuto = class;
  PUMLSignalEventAuto = class;
  PUMLTimeEventAuto = class;
  PUMLCallEventAuto = class;
  PUMLEnumerationLiteralAuto = class;
  PUMLStimulusAuto = class;
  PUMLAttributeLinkAuto = class;
  PUMLRelationshipAuto = class;
  PUMLGeneralizationAuto = class;
  PUMLIncludeAuto = class;
  PUMLDependencyAuto = class;
  PUMLRealizationAuto = class;
  PUMLExtendAuto = class;
  PUMLAssociationAuto = class;
  PUMLAssociationRoleAuto = class;
  PUMLActionAuto = class;
  PUMLTerminateActionAuto = class;
  PUMLSendActionAuto = class;
  PUMLActionSequenceAuto = class;
  PUMLCreateActionAuto = class;
  PUMLDestroyActionAuto = class;
  PUMLUninterpretedActionAuto = class;
  PUMLCallActionAuto = class;
  PUMLReturnActionAuto = class;
  PUMLCollaborationInstanceSetAuto = class;
  PUMLParameterAuto = class;
  PUMLAssociationEndAuto = class;
  PUMLAssociationEndRoleAuto = class;
  PUMLTransitionAuto = class;
  PUMLExtensionPointAuto = class;
  PUMLLinkAuto = class;
  PUMLCommentAuto = class;
  PUMLTemplateParameterAuto = class;
  PUMLTemplateArgumentAuto = class;
  PUMLElementImportAuto = class;
  PUMLDiagramAuto = class;
  PUMLDeploymentDiagramAuto = class;
  PUMLComponentDiagramAuto = class;
  PUMLSequenceDiagramAuto = class;
  PUMLCollaborationDiagramAuto = class;
  PUMLSequenceRoleDiagramAuto = class;
  PUMLUseCaseDiagramAuto = class;
  PUMLClassDiagramAuto = class;
  PUMLActivityDiagramAuto = class;
  PUMLCollaborationRoleDiagramAuto = class;
  PUMLCompositeStructureDiagramAuto = class;
  PUMLStatechartDiagramAuto = class;

  // Class Definitions
  // PUMLElementAuto
  PUMLElementAuto = class(PExtensibleModelAuto, IUMLElement)
  protected
  end;

  // PUMLModelElementAuto
  PUMLModelElementAuto = class(PUMLElementAuto, IUMLModelElement)
  protected
    function Get_Visibility: UMLVisibilityKind; safecall;
    procedure Set_Visibility(Value: UMLVisibilityKind); safecall;
    function Get_IsSpecification: WordBool; safecall;
    procedure Set_IsSpecification(Value: WordBool); safecall;
    procedure ClearElementImports; safecall;
    procedure AddElementImport(const Value: IUMLElementImport); safecall;
    procedure RemoveElementImport(const Value: IUMLElementImport); safecall;
    procedure InsertElementImport(Index: Integer; const Value: IUMLElementImport); safecall;
    procedure DeleteElementImport(Index: Integer); safecall;
    function IndexOfElementImport(const Value: IUMLElementImport): Integer; safecall;
    function GetElementImportAt(Index: Integer): IUMLElementImport; safecall;
    function GetElementImportCount: Integer; safecall;
    function Get_Namespace: IUMLNamespace; safecall;
    procedure ClearClientDependencies; safecall;
    procedure AddClientDependency(const Value: IUMLDependency); safecall;
    procedure RemoveClientDependency(const Value: IUMLDependency); safecall;
    procedure InsertClientDependency(Index: Integer; const Value: IUMLDependency); safecall;
    procedure DeleteClientDependency(Index: Integer); safecall;
    function IndexOfClientDependency(const Value: IUMLDependency): Integer; safecall;
    function GetClientDependencyAt(Index: Integer): IUMLDependency; safecall;
    function GetClientDependencyCount: Integer; safecall;
    procedure ClearSupplierDependencies; safecall;
    procedure AddSupplierDependency(const Value: IUMLDependency); safecall;
    procedure RemoveSupplierDependency(const Value: IUMLDependency); safecall;
    procedure InsertSupplierDependency(Index: Integer; const Value: IUMLDependency); safecall;
    procedure DeleteSupplierDependency(Index: Integer); safecall;
    function IndexOfSupplierDependency(const Value: IUMLDependency): Integer; safecall;
    function GetSupplierDependencyAt(Index: Integer): IUMLDependency; safecall;
    function GetSupplierDependencyCount: Integer; safecall;
    procedure ClearDefaultParameters; safecall;
    procedure AddDefaultParameter(const Value: IUMLTemplateParameter); safecall;
    procedure RemoveDefaultParameter(const Value: IUMLTemplateParameter); safecall;
    procedure InsertDefaultParameter(Index: Integer; const Value: IUMLTemplateParameter); safecall;
    procedure DeleteDefaultParameter(Index: Integer); safecall;
    function IndexOfDefaultParameter(const Value: IUMLTemplateParameter): Integer; safecall;
    function GetDefaultParameterAt(Index: Integer): IUMLTemplateParameter; safecall;
    function GetDefaultParameterCount: Integer; safecall;
    procedure ClearComments; safecall;
    procedure AddComment(const Value: IUMLComment); safecall;
    procedure RemoveComment(const Value: IUMLComment); safecall;
    procedure InsertComment(Index: Integer; const Value: IUMLComment); safecall;
    procedure DeleteComment(Index: Integer); safecall;
    function IndexOfComment(const Value: IUMLComment): Integer; safecall;
    function GetCommentAt(Index: Integer): IUMLComment; safecall;
    function GetCommentCount: Integer; safecall;
    function Get_Container: IUMLComponent; safecall;
    procedure Set_Container(const Value: IUMLComponent); safecall;
    function GetTemplateParameterAt(Index: Integer): IUMLTemplateParameter; safecall;
    function GetTemplateParameterCount: Integer; safecall;
    function Get_ParameterOwner: IUMLTemplateParameter; safecall;
    procedure ClearTemplateArguments; safecall;
    procedure AddTemplateArgument(const Value: IUMLTemplateArgument); safecall;
    procedure RemoveTemplateArgument(const Value: IUMLTemplateArgument); safecall;
    procedure InsertTemplateArgument(Index: Integer; const Value: IUMLTemplateArgument); safecall;
    procedure DeleteTemplateArgument(Index: Integer); safecall;
    function IndexOfTemplateArgument(const Value: IUMLTemplateArgument): Integer; safecall;
    function GetTemplateArgumentAt(Index: Integer): IUMLTemplateArgument; safecall;
    function GetTemplateArgumentCount: Integer; safecall;
    function GetBehaviorAt(Index: Integer): IUMLStateMachine; safecall;
    function GetBehaviorCount: Integer; safecall;
    procedure ClearContentRoles; safecall;
    procedure AddContentRole(const Value: IUMLClassifierRole); safecall;
    procedure RemoveContentRole(const Value: IUMLClassifierRole); safecall;
    procedure InsertContentRole(Index: Integer; const Value: IUMLClassifierRole); safecall;
    procedure DeleteContentRole(Index: Integer); safecall;
    function IndexOfContentRole(const Value: IUMLClassifierRole): Integer; safecall;
    function GetContentRoleAt(Index: Integer): IUMLClassifierRole; safecall;
    function GetContentRoleCount: Integer; safecall;
    procedure ClearOwnerPartitions; safecall;
    procedure AddOwnerPartition(const Value: IUMLPartition); safecall;
    procedure RemoveOwnerPartition(const Value: IUMLPartition); safecall;
    procedure InsertOwnerPartition(Index: Integer; const Value: IUMLPartition); safecall;
    procedure DeleteOwnerPartition(Index: Integer); safecall;
    function IndexOfOwnerPartition(const Value: IUMLPartition): Integer; safecall;
    function GetOwnerPartitionAt(Index: Integer): IUMLPartition; safecall;
    function GetOwnerPartitionCount: Integer; safecall;
  end;

  // PUMLLinkEndAuto
  PUMLLinkEndAuto = class(PUMLModelElementAuto, IUMLLinkEnd)
  protected
    function Get_Instance: IUMLInstance; safecall;
    procedure Set_Instance(const Value: IUMLInstance); safecall;
    function Get_Link: IUMLLink; safecall;
    function Get_AssociationEnd: IUMLAssociationEnd; safecall;
    procedure Set_AssociationEnd(const Value: IUMLAssociationEnd); safecall;
    function GetQualifiedValueAt(Index: Integer): IUMLAttributeLink; safecall;
    function GetQualifiedValueCount: Integer; safecall;
    function GetOtherSide: IUMLLinkEnd; safecall;
  end;

  // PUMLLinkObjectAuto
  PUMLLinkObjectAuto = class(PUMLModelElementAuto, IUMLLinkObject)
  protected
    function Get_LinkSide: IUMLLink; safecall;
    procedure Set_LinkSide(const Value: IUMLLink); safecall;
    function Get_ObjectSide: IUMLObject; safecall;
    procedure Set_ObjectSide(const Value: IUMLObject); safecall;
  end;

  // PUMLPartitionAuto
  PUMLPartitionAuto = class(PUMLModelElementAuto, IUMLPartition)
  protected
    procedure ClearContents; safecall;
    procedure AddContent(const Value: IUMLModelElement); safecall;
    procedure RemoveContent(const Value: IUMLModelElement); safecall;
    procedure InsertContent(Index: Integer; const Value: IUMLModelElement); safecall;
    procedure DeleteContent(Index: Integer); safecall;
    function IndexOfContent(const Value: IUMLModelElement): Integer; safecall;
    function GetContentAt(Index: Integer): IUMLModelElement; safecall;
    function GetContentCount: Integer; safecall;
    function Get_ActivityGraph: IUMLActivityGraph; safecall;
  end;

  // PUMLInteractionFragmentAuto
  PUMLInteractionFragmentAuto = class(PUMLModelElementAuto, IUMLInteractionFragment)
  protected
    function Get_EnclosingOperand: IUMLInteractionOperand; safecall;
    procedure Set_EnclosingOperand(const Value: IUMLInteractionOperand); safecall;
    function Get_EnclosingInteraction: IUMLInteraction; safecall;
    procedure Set_EnclosingInteraction(const Value: IUMLInteraction); safecall;
    function Get_EnclosingInteractionInstanceSet: IUMLInteractionInstanceSet; safecall;
    procedure Set_EnclosingInteractionInstanceSet(const Value: IUMLInteractionInstanceSet); safecall;
  end;

  // PUMLInteractionOperandAuto
  PUMLInteractionOperandAuto = class(PUMLInteractionFragmentAuto, IUMLInteractionOperand)
  protected
    function Get_Guard: WideString; safecall;
    procedure Set_Guard(const Value: WideString); safecall;
    function Get_CombinedFragment: IUMLCombinedFragment; safecall;
    procedure Set_CombinedFragment(const Value: IUMLCombinedFragment); safecall;
    procedure ClearFragments; safecall;
    procedure AddFragment(const Value: IUMLInteractionFragment); safecall;
    procedure RemoveFragment(const Value: IUMLInteractionFragment); safecall;
    procedure InsertFragment(Index: Integer; const Value: IUMLInteractionFragment); safecall;
    procedure DeleteFragment(Index: Integer); safecall;
    function IndexOfFragment(const Value: IUMLInteractionFragment): Integer; safecall;
    function GetFragmentAt(Index: Integer): IUMLInteractionFragment; safecall;
    function GetFragmentCount: Integer; safecall;
  end;

  // PUMLCombinedFragmentAuto
  PUMLCombinedFragmentAuto = class(PUMLInteractionFragmentAuto, IUMLCombinedFragment)
  protected
    function Get_InteractionOperator: UMLInteractionOperatorKind; safecall;
    procedure Set_InteractionOperator(Value: UMLInteractionOperatorKind); safecall;
    procedure ClearOperands; safecall;
    procedure AddOperand(const Value: IUMLInteractionOperand); safecall;
    procedure RemoveOperand(const Value: IUMLInteractionOperand); safecall;
    procedure InsertOperand(Index: Integer; const Value: IUMLInteractionOperand); safecall;
    procedure DeleteOperand(Index: Integer); safecall;
    function IndexOfOperand(const Value: IUMLInteractionOperand): Integer; safecall;
    function GetOperandAt(Index: Integer): IUMLInteractionOperand; safecall;
    function GetOperandCount: Integer; safecall;
  end;

  // PUMLInteractionInstanceSetAuto
  PUMLInteractionInstanceSetAuto = class(PUMLModelElementAuto, IUMLInteractionInstanceSet)
  protected
    function Get_Context: IUMLCollaborationInstanceSet; safecall;
    function Get_Interaction: IUMLInteraction; safecall;
    procedure Set_Interaction(const Value: IUMLInteraction); safecall;
    function GetParticipatingStimulusAt(Index: Integer): IUMLStimulus; safecall;
    function GetParticipatingStimulusCount: Integer; safecall;
    procedure ClearFragments; safecall;
    procedure AddFragment(const Value: IUMLInteractionFragment); safecall;
    procedure RemoveFragment(const Value: IUMLInteractionFragment); safecall;
    procedure InsertFragment(Index: Integer; const Value: IUMLInteractionFragment); safecall;
    procedure DeleteFragment(Index: Integer); safecall;
    function IndexOfFragment(const Value: IUMLInteractionFragment): Integer; safecall;
    function GetFragmentAt(Index: Integer): IUMLInteractionFragment; safecall;
    function GetFragmentCount: Integer; safecall;
  end;

  // PUMLInstanceAuto
  PUMLInstanceAuto = class(PUMLModelElementAuto, IUMLInstance)
  protected
    function Get_IsMultiInstance: WordBool; safecall;
    procedure Set_IsMultiInstance(Value: WordBool); safecall;
    function Get_Classifier: IUMLClassifier; safecall;
    procedure Set_Classifier(const Value: IUMLClassifier); safecall;
    procedure ClearAttributeLinks; safecall;
    procedure AddAttributeLink(const Value: IUMLAttributeLink); safecall;
    procedure RemoveAttributeLink(const Value: IUMLAttributeLink); safecall;
    procedure InsertAttributeLink(Index: Integer; const Value: IUMLAttributeLink); safecall;
    procedure DeleteAttributeLink(Index: Integer); safecall;
    function IndexOfAttributeLink(const Value: IUMLAttributeLink): Integer; safecall;
    function GetAttributeLinkAt(Index: Integer): IUMLAttributeLink; safecall;
    function GetAttributeLinkCount: Integer; safecall;
    procedure ClearLinkEnds; safecall;
    procedure AddLinkEnd(const Value: IUMLLinkEnd); safecall;
    procedure RemoveLinkEnd(const Value: IUMLLinkEnd); safecall;
    procedure InsertLinkEnd(Index: Integer; const Value: IUMLLinkEnd); safecall;
    procedure DeleteLinkEnd(Index: Integer); safecall;
    function IndexOfLinkEnd(const Value: IUMLLinkEnd): Integer; safecall;
    function GetLinkEndAt(Index: Integer): IUMLLinkEnd; safecall;
    function GetLinkEndCount: Integer; safecall;
    function GetSlotAt(Index: Integer): IUMLAttributeLink; safecall;
    function GetSlotCount: Integer; safecall;
    procedure ClearSendingStimuli; safecall;
    procedure AddSendingStimulus(const Value: IUMLStimulus); safecall;
    procedure RemoveSendingStimulus(const Value: IUMLStimulus); safecall;
    procedure InsertSendingStimulus(Index: Integer; const Value: IUMLStimulus); safecall;
    procedure DeleteSendingStimulus(Index: Integer); safecall;
    function IndexOfSendingStimulus(const Value: IUMLStimulus): Integer; safecall;
    function GetSendingStimulusAt(Index: Integer): IUMLStimulus; safecall;
    function GetSendingStimulusCount: Integer; safecall;
    function Get_ComponentInstance: IUMLComponentInstance; safecall;
    procedure Set_ComponentInstance(const Value: IUMLComponentInstance); safecall;
    procedure ClearReceivingStimuli; safecall;
    procedure AddReceivingStimulus(const Value: IUMLStimulus); safecall;
    procedure RemoveReceivingStimulus(const Value: IUMLStimulus); safecall;
    procedure InsertReceivingStimulus(Index: Integer; const Value: IUMLStimulus); safecall;
    procedure DeleteReceivingStimulus(Index: Integer); safecall;
    function IndexOfReceivingStimulus(const Value: IUMLStimulus): Integer; safecall;
    function GetReceivingStimulusAt(Index: Integer): IUMLStimulus; safecall;
    function GetReceivingStimulusCount: Integer; safecall;
    function Get_Owner: IUMLInstance; safecall;
    function GetOwnedInstanceAt(Index: Integer): IUMLInstance; safecall;
    function GetOwnedInstanceCount: Integer; safecall;
    function GetOwnedLinkAt(Index: Integer): IUMLLink; safecall;
    function GetOwnedLinkCount: Integer; safecall;
    procedure ClearPlayedRoles; safecall;
    procedure AddPlayedRole(const Value: IUMLClassifierRole); safecall;
    procedure RemovePlayedRole(const Value: IUMLClassifierRole); safecall;
    procedure InsertPlayedRole(Index: Integer; const Value: IUMLClassifierRole); safecall;
    procedure DeletePlayedRole(Index: Integer); safecall;
    function IndexOfPlayedRole(const Value: IUMLClassifierRole): Integer; safecall;
    function GetPlayedRoleAt(Index: Integer): IUMLClassifierRole; safecall;
    function GetPlayedRoleCount: Integer; safecall;
    function Get_CollaborationInstanceSet: IUMLCollaborationInstanceSet; safecall;
  end;

  // PUMLDataValueAuto
  PUMLDataValueAuto = class(PUMLInstanceAuto, IUMLDataValue)
  protected
  end;

  // PUMLNodeInstanceAuto
  PUMLNodeInstanceAuto = class(PUMLInstanceAuto, IUMLNodeInstance)
  protected
    procedure ClearResidents; safecall;
    procedure AddResident(const Value: IUMLComponentInstance); safecall;
    procedure RemoveResident(const Value: IUMLComponentInstance); safecall;
    procedure InsertResident(Index: Integer; const Value: IUMLComponentInstance); safecall;
    procedure DeleteResident(Index: Integer); safecall;
    function IndexOfResident(const Value: IUMLComponentInstance): Integer; safecall;
    function GetResidentAt(Index: Integer): IUMLComponentInstance; safecall;
    function GetResidentCount: Integer; safecall;
  end;

  // PUMLObjectAuto
  PUMLObjectAuto = class(PUMLInstanceAuto, IUMLObject)
  protected
    function Get_LinkObject: IUMLLinkObject; safecall;
    procedure Set_LinkObject(const Value: IUMLLinkObject); safecall;
  end;

  // PUMLSubsystemInstanceAuto
  PUMLSubsystemInstanceAuto = class(PUMLInstanceAuto, IUMLSubsystemInstance)
  protected
  end;

  // PUMLUseCaseInstanceAuto
  PUMLUseCaseInstanceAuto = class(PUMLInstanceAuto, IUMLUseCaseInstance)
  protected
  end;

  // PUMLComponentInstanceAuto
  PUMLComponentInstanceAuto = class(PUMLInstanceAuto, IUMLComponentInstance)
  protected
    function Get_NodeInstance: IUMLNodeInstance; safecall;
    procedure Set_NodeInstance(const Value: IUMLNodeInstance); safecall;
    procedure ClearResidents; safecall;
    procedure AddResident(const Value: IUMLInstance); safecall;
    procedure RemoveResident(const Value: IUMLInstance); safecall;
    procedure InsertResident(Index: Integer; const Value: IUMLInstance); safecall;
    procedure DeleteResident(Index: Integer); safecall;
    function IndexOfResident(const Value: IUMLInstance): Integer; safecall;
    function GetResidentAt(Index: Integer): IUMLInstance; safecall;
    function GetResidentCount: Integer; safecall;
  end;

  // PUMLArgumentAuto
  PUMLArgumentAuto = class(PUMLModelElementAuto, IUMLArgument)
  protected
    function Get_Value: WideString; safecall;
    procedure Set_Value(const Value: WideString); safecall;
    function Get_Action: IUMLAction; safecall;
  end;

  // PUMLConnectorEndAuto
  PUMLConnectorEndAuto = class(PUMLModelElementAuto, IUMLConnectorEnd)
  protected
    function Get_Multiplicity: WideString; safecall;
    procedure Set_Multiplicity(const Value: WideString); safecall;
    function Get_IsOrdered: WordBool; safecall;
    procedure Set_IsOrdered(Value: WordBool); safecall;
    function Get_IsUnique: WordBool; safecall;
    procedure Set_IsUnique(Value: WordBool); safecall;
    function Get_Connector: IUMLConnector; safecall;
    procedure Set_Connector(const Value: IUMLConnector); safecall;
    function Get_Role: IUMLFeature; safecall;
    procedure Set_Role(const Value: IUMLFeature); safecall;
  end;

  // PUMLStateVertexAuto
  PUMLStateVertexAuto = class(PUMLModelElementAuto, IUMLStateVertex)
  protected
    function Get_ContainerState: IUMLCompositeState; safecall;
    procedure ClearOutgoings; safecall;
    procedure AddOutgoing(const Value: IUMLTransition); safecall;
    procedure RemoveOutgoing(const Value: IUMLTransition); safecall;
    procedure InsertOutgoing(Index: Integer; const Value: IUMLTransition); safecall;
    procedure DeleteOutgoing(Index: Integer); safecall;
    function IndexOfOutgoing(const Value: IUMLTransition): Integer; safecall;
    function GetOutgoingAt(Index: Integer): IUMLTransition; safecall;
    function GetOutgoingCount: Integer; safecall;
    procedure ClearIncomings; safecall;
    procedure AddIncoming(const Value: IUMLTransition); safecall;
    procedure RemoveIncoming(const Value: IUMLTransition); safecall;
    procedure InsertIncoming(Index: Integer; const Value: IUMLTransition); safecall;
    procedure DeleteIncoming(Index: Integer); safecall;
    function IndexOfIncoming(const Value: IUMLTransition): Integer; safecall;
    function GetIncomingAt(Index: Integer): IUMLTransition; safecall;
    function GetIncomingCount: Integer; safecall;
  end;

  // PUMLSynchStateAuto
  PUMLSynchStateAuto = class(PUMLStateVertexAuto, IUMLSynchState)
  protected
    function Get_Bound: Integer; safecall;
    procedure Set_Bound(Value: Integer); safecall;
  end;

  // PUMLPseudostateAuto
  PUMLPseudostateAuto = class(PUMLStateVertexAuto, IUMLPseudostate)
  protected
    function Get_PseudostateKind: UMLPseudostateKind; safecall;
    procedure Set_PseudostateKind(Value: UMLPseudostateKind); safecall;
  end;

  // PUMLStubStateAuto
  PUMLStubStateAuto = class(PUMLStateVertexAuto, IUMLStubState)
  protected
    function Get_ReferenceState: WideString; safecall;
    procedure Set_ReferenceState(const Value: WideString); safecall;
  end;

  // PUMLStateAuto
  PUMLStateAuto = class(PUMLStateVertexAuto, IUMLState)
  protected
    function GetEntryActionAt(Index: Integer): IUMLAction; safecall;
    function GetEntryActionCount: Integer; safecall;
    function GetExitActionAt(Index: Integer): IUMLAction; safecall;
    function GetExitActionCount: Integer; safecall;
    function Get_StateMachine: IUMLStateMachine; safecall;
    procedure ClearDeferrableEvents; safecall;
    procedure AddDeferrableEvent(const Value: IUMLEvent); safecall;
    procedure RemoveDeferrableEvent(const Value: IUMLEvent); safecall;
    procedure InsertDeferrableEvent(Index: Integer; const Value: IUMLEvent); safecall;
    procedure DeleteDeferrableEvent(Index: Integer); safecall;
    function IndexOfDeferrableEvent(const Value: IUMLEvent): Integer; safecall;
    function GetDeferrableEventAt(Index: Integer): IUMLEvent; safecall;
    function GetDeferrableEventCount: Integer; safecall;
    function GetInternalTransitionAt(Index: Integer): IUMLTransition; safecall;
    function GetInternalTransitionCount: Integer; safecall;
    function GetDoActivityAt(Index: Integer): IUMLAction; safecall;
    function GetDoActivityCount: Integer; safecall;
    procedure ClearClassifierStates; safecall;
    procedure AddClassifierState(const Value: IUMLClassifierInState); safecall;
    procedure RemoveClassifierState(const Value: IUMLClassifierInState); safecall;
    procedure InsertClassifierState(Index: Integer; const Value: IUMLClassifierInState); safecall;
    procedure DeleteClassifierState(Index: Integer); safecall;
    function IndexOfClassifierState(const Value: IUMLClassifierInState): Integer; safecall;
    function GetClassifierStateAt(Index: Integer): IUMLClassifierInState; safecall;
    function GetClassifierStateCount: Integer; safecall;
  end;

  // PUMLSimpleStateAuto
  PUMLSimpleStateAuto = class(PUMLStateAuto, IUMLSimpleState)
  protected
  end;

  // PUMLObjectFlowStateAuto
  PUMLObjectFlowStateAuto = class(PUMLSimpleStateAuto, IUMLObjectFlowState)
  protected
    function Get_IsSynch: WordBool; safecall;
    procedure Set_IsSynch(Value: WordBool); safecall;
    procedure ClearParameters; safecall;
    procedure AddParameter(const Value: IUMLParameter); safecall;
    procedure RemoveParameter(const Value: IUMLParameter); safecall;
    procedure InsertParameter(Index: Integer; const Value: IUMLParameter); safecall;
    procedure DeleteParameter(Index: Integer); safecall;
    function IndexOfParameter(const Value: IUMLParameter): Integer; safecall;
    function GetParameterAt(Index: Integer): IUMLParameter; safecall;
    function GetParameterCount: Integer; safecall;
    function Get_Type_: IUMLClassifier; safecall;
    procedure Set_Type_(const Value: IUMLClassifier); safecall;
  end;

  // PUMLActionStateAuto
  PUMLActionStateAuto = class(PUMLSimpleStateAuto, IUMLActionState)
  protected
    function Get_IsDynamic: WordBool; safecall;
    procedure Set_IsDynamic(Value: WordBool); safecall;
    function Get_DynamicArguments: WideString; safecall;
    procedure Set_DynamicArguments(const Value: WideString); safecall;
    function Get_DynamicMultiplicity: WideString; safecall;
    procedure Set_DynamicMultiplicity(const Value: WideString); safecall;
  end;

  // PUMLSignalAcceptStateAuto
  PUMLSignalAcceptStateAuto = class(PUMLActionStateAuto, IUMLSignalAcceptState)
  protected
  end;

  // PUMLCallStateAuto
  PUMLCallStateAuto = class(PUMLActionStateAuto, IUMLCallState)
  protected
  end;

  // PUMLSignalSendStateAuto
  PUMLSignalSendStateAuto = class(PUMLActionStateAuto, IUMLSignalSendState)
  protected
  end;

  // PUMLCompositeStateAuto
  PUMLCompositeStateAuto = class(PUMLStateAuto, IUMLCompositeState)
  protected
    function Get_IsConcurrent: WordBool; safecall;
    procedure Set_IsConcurrent(Value: WordBool); safecall;
    function GetSubvertexAt(Index: Integer): IUMLStateVertex; safecall;
    function GetSubvertexCount: Integer; safecall;
  end;

  // PUMLSubmachineStateAuto
  PUMLSubmachineStateAuto = class(PUMLCompositeStateAuto, IUMLSubmachineState)
  protected
    function Get_Submachine: IUMLStateMachine; safecall;
    procedure Set_Submachine(const Value: IUMLStateMachine); safecall;
  end;

  // PUMLSubactivityStateAuto
  PUMLSubactivityStateAuto = class(PUMLSubmachineStateAuto, IUMLSubactivityState)
  protected
    function Get_IsDynamic: WordBool; safecall;
    procedure Set_IsDynamic(Value: WordBool); safecall;
    function Get_DynamicArguments: WideString; safecall;
    procedure Set_DynamicArguments(const Value: WideString); safecall;
    function Get_DynamicMultiplicity: WideString; safecall;
    procedure Set_DynamicMultiplicity(const Value: WideString); safecall;
  end;

  // PUMLFinalStateAuto
  PUMLFinalStateAuto = class(PUMLStateAuto, IUMLFinalState)
  protected
  end;

  // PUMLFlowFinalStateAuto
  PUMLFlowFinalStateAuto = class(PUMLFinalStateAuto, IUMLFlowFinalState)
  protected
  end;

  // PUMLInteractionAuto
  PUMLInteractionAuto = class(PUMLModelElementAuto, IUMLInteraction)
  protected
    function GetMessageAt(Index: Integer): IUMLMessage; safecall;
    function GetMessageCount: Integer; safecall;
    function Get_Context: IUMLCollaboration; safecall;
    procedure ClearInteractionInstanceSets; safecall;
    procedure AddInteractionInstanceSet(const Value: IUMLInteractionInstanceSet); safecall;
    procedure RemoveInteractionInstanceSet(const Value: IUMLInteractionInstanceSet); safecall;
    procedure InsertInteractionInstanceSet(Index: Integer; const Value: IUMLInteractionInstanceSet); safecall;
    procedure DeleteInteractionInstanceSet(Index: Integer); safecall;
    function IndexOfInteractionInstanceSet(const Value: IUMLInteractionInstanceSet): Integer; safecall;
    function GetInteractionInstanceSetAt(Index: Integer): IUMLInteractionInstanceSet; safecall;
    function GetInteractionInstanceSetCount: Integer; safecall;
    procedure ClearFragments; safecall;
    procedure AddFragment(const Value: IUMLInteractionFragment); safecall;
    procedure RemoveFragment(const Value: IUMLInteractionFragment); safecall;
    procedure InsertFragment(Index: Integer; const Value: IUMLInteractionFragment); safecall;
    procedure DeleteFragment(Index: Integer); safecall;
    function IndexOfFragment(const Value: IUMLInteractionFragment): Integer; safecall;
    function GetFragmentAt(Index: Integer): IUMLInteractionFragment; safecall;
    function GetFragmentCount: Integer; safecall;
  end;

  // PUMLMessageAuto
  PUMLMessageAuto = class(PUMLModelElementAuto, IUMLMessage)
  protected
    function Get_Arguments: WideString; safecall;
    procedure Set_Arguments(const Value: WideString); safecall;
    function Get_Return: WideString; safecall;
    procedure Set_Return(const Value: WideString); safecall;
    function Get_Iteration: WideString; safecall;
    procedure Set_Iteration(const Value: WideString); safecall;
    function Get_Branch: WideString; safecall;
    procedure Set_Branch(const Value: WideString); safecall;
    function Get_Interaction: IUMLInteraction; safecall;
    function Get_Activator: IUMLMessage; safecall;
    procedure Set_Activator(const Value: IUMLMessage); safecall;
    procedure ClearActivatees; safecall;
    procedure AddActivatee(const Value: IUMLMessage); safecall;
    procedure RemoveActivatee(const Value: IUMLMessage); safecall;
    procedure InsertActivatee(Index: Integer; const Value: IUMLMessage); safecall;
    procedure DeleteActivatee(Index: Integer); safecall;
    function IndexOfActivatee(const Value: IUMLMessage): Integer; safecall;
    function GetActivateeAt(Index: Integer): IUMLMessage; safecall;
    function GetActivateeCount: Integer; safecall;
    function Get_Sender: IUMLClassifierRole; safecall;
    procedure Set_Sender(const Value: IUMLClassifierRole); safecall;
    function Get_Receiver: IUMLClassifierRole; safecall;
    procedure Set_Receiver(const Value: IUMLClassifierRole); safecall;
    function Get_Successor: IUMLMessage; safecall;
    procedure Set_Successor(const Value: IUMLMessage); safecall;
    function Get_Predecessor: IUMLMessage; safecall;
    procedure Set_Predecessor(const Value: IUMLMessage); safecall;
    function Get_CommunicationConnection: IUMLAssociationRole; safecall;
    procedure Set_CommunicationConnection(const Value: IUMLAssociationRole); safecall;
    function Get_Action: IUMLAction; safecall;
    procedure ClearConformingStimuli; safecall;
    procedure AddConformingStimulus(const Value: IUMLStimulus); safecall;
    procedure RemoveConformingStimulus(const Value: IUMLStimulus); safecall;
    procedure InsertConformingStimulus(Index: Integer; const Value: IUMLStimulus); safecall;
    procedure DeleteConformingStimulus(Index: Integer); safecall;
    function IndexOfConformingStimulus(const Value: IUMLStimulus): Integer; safecall;
    function GetConformingStimulusAt(Index: Integer): IUMLStimulus; safecall;
    function GetConformingStimulusCount: Integer; safecall;
  end;

  // PUMLAssociationClassAuto
  PUMLAssociationClassAuto = class(PUMLModelElementAuto, IUMLAssociationClass)
  protected
    function Get_ClassSide: IUMLClass; safecall;
    procedure Set_ClassSide(const Value: IUMLClass); safecall;
    function Get_AssociationSide: IUMLAssociation; safecall;
    procedure Set_AssociationSide(const Value: IUMLAssociation); safecall;
  end;

  // PUMLStateMachineAuto
  PUMLStateMachineAuto = class(PUMLModelElementAuto, IUMLStateMachine)
  protected
    function Get_Context: IUMLModelElement; safecall;
    function Get_Top: IUMLState; safecall;
    function GetTransitionAt(Index: Integer): IUMLTransition; safecall;
    function GetTransitionCount: Integer; safecall;
    procedure ClearSubmachineStates; safecall;
    procedure AddSubmachineState(const Value: IUMLSubmachineState); safecall;
    procedure RemoveSubmachineState(const Value: IUMLSubmachineState); safecall;
    procedure InsertSubmachineState(Index: Integer; const Value: IUMLSubmachineState); safecall;
    procedure DeleteSubmachineState(Index: Integer); safecall;
    function IndexOfSubmachineState(const Value: IUMLSubmachineState): Integer; safecall;
    function GetSubmachineStateAt(Index: Integer): IUMLSubmachineState; safecall;
    function GetSubmachineStateCount: Integer; safecall;
  end;

  // PUMLActivityGraphAuto
  PUMLActivityGraphAuto = class(PUMLStateMachineAuto, IUMLActivityGraph)
  protected
    function GetPartitionAt(Index: Integer): IUMLPartition; safecall;
    function GetPartitionCount: Integer; safecall;
  end;

  // PUMLFeatureAuto
  PUMLFeatureAuto = class(PUMLModelElementAuto, IUMLFeature)
  protected
    function Get_OwnerScope: UMLScopeKind; safecall;
    procedure Set_OwnerScope(Value: UMLScopeKind); safecall;
    procedure ClearConnectorEnds; safecall;
    procedure AddConnectorEnd(const Value: IUMLConnectorEnd); safecall;
    procedure RemoveConnectorEnd(const Value: IUMLConnectorEnd); safecall;
    procedure InsertConnectorEnd(Index: Integer; const Value: IUMLConnectorEnd); safecall;
    procedure DeleteConnectorEnd(Index: Integer); safecall;
    function IndexOfConnectorEnd(const Value: IUMLConnectorEnd): Integer; safecall;
    function GetConnectorEndAt(Index: Integer): IUMLConnectorEnd; safecall;
    function GetConnectorEndCount: Integer; safecall;
    procedure ClearClassifierRoles; safecall;
    procedure AddClassifierRole(const Value: IUMLClassifierRole); safecall;
    procedure RemoveClassifierRole(const Value: IUMLClassifierRole); safecall;
    procedure InsertClassifierRole(Index: Integer; const Value: IUMLClassifierRole); safecall;
    procedure DeleteClassifierRole(Index: Integer); safecall;
    function IndexOfClassifierRole(const Value: IUMLClassifierRole): Integer; safecall;
    function GetClassifierRoleAt(Index: Integer): IUMLClassifierRole; safecall;
    function GetClassifierRoleCount: Integer; safecall;
  end;

  // PUMLBehavioralFeatureAuto
  PUMLBehavioralFeatureAuto = class(PUMLFeatureAuto, IUMLBehavioralFeature)
  protected
    function Get_IsQuery: WordBool; safecall;
    procedure Set_IsQuery(Value: WordBool); safecall;
    function GetParameterAt(Index: Integer): IUMLParameter; safecall;
    function GetParameterCount: Integer; safecall;
    procedure ClearRaisedSignals; safecall;
    procedure AddRaisedSignal(const Value: IUMLSignal); safecall;
    procedure RemoveRaisedSignal(const Value: IUMLSignal); safecall;
    procedure InsertRaisedSignal(Index: Integer; const Value: IUMLSignal); safecall;
    procedure DeleteRaisedSignal(Index: Integer); safecall;
    function IndexOfRaisedSignal(const Value: IUMLSignal): Integer; safecall;
    function GetRaisedSignalAt(Index: Integer): IUMLSignal; safecall;
    function GetRaisedSignalCount: Integer; safecall;
  end;

  // PUMLMethodAuto
  PUMLMethodAuto = class(PUMLBehavioralFeatureAuto, IUMLMethod)
  protected
    function Get_Body: WideString; safecall;
    procedure Set_Body(const Value: WideString); safecall;
    function Get_Specification: IUMLOperation; safecall;
    procedure Set_Specification(const Value: IUMLOperation); safecall;
  end;

  // PUMLOperationAuto
  PUMLOperationAuto = class(PUMLBehavioralFeatureAuto, IUMLOperation)
  protected
    function Get_Concurrency: UMLCallConcurrencyKind; safecall;
    procedure Set_Concurrency(Value: UMLCallConcurrencyKind); safecall;
    function Get_IsRoot: WordBool; safecall;
    procedure Set_IsRoot(Value: WordBool); safecall;
    function Get_IsLeaf: WordBool; safecall;
    procedure Set_IsLeaf(Value: WordBool); safecall;
    function Get_IsAbstract: WordBool; safecall;
    procedure Set_IsAbstract(Value: WordBool); safecall;
    function Get_Specification: WideString; safecall;
    procedure Set_Specification(const Value: WideString); safecall;
    function Get_Owner: IUMLClassifier; safecall;
    procedure ClearMethods; safecall;
    procedure AddMethod(const Value: IUMLMethod); safecall;
    procedure RemoveMethod(const Value: IUMLMethod); safecall;
    procedure InsertMethod(Index: Integer; const Value: IUMLMethod); safecall;
    procedure DeleteMethod(Index: Integer); safecall;
    function IndexOfMethod(const Value: IUMLMethod): Integer; safecall;
    function GetMethodAt(Index: Integer): IUMLMethod; safecall;
    function GetMethodCount: Integer; safecall;
    procedure ClearCallActions; safecall;
    procedure AddCallAction(const Value: IUMLCallAction); safecall;
    procedure RemoveCallAction(const Value: IUMLCallAction); safecall;
    procedure InsertCallAction(Index: Integer; const Value: IUMLCallAction); safecall;
    procedure DeleteCallAction(Index: Integer); safecall;
    function IndexOfCallAction(const Value: IUMLCallAction): Integer; safecall;
    function GetCallActionAt(Index: Integer): IUMLCallAction; safecall;
    function GetCallActionCount: Integer; safecall;
    procedure ClearOccurrences; safecall;
    procedure AddOccurrence(const Value: IUMLCallEvent); safecall;
    procedure RemoveOccurrence(const Value: IUMLCallEvent); safecall;
    procedure InsertOccurrence(Index: Integer; const Value: IUMLCallEvent); safecall;
    procedure DeleteOccurrence(Index: Integer); safecall;
    function IndexOfOccurrence(const Value: IUMLCallEvent): Integer; safecall;
    function GetOccurrenceAt(Index: Integer): IUMLCallEvent; safecall;
    function GetOccurrenceCount: Integer; safecall;
    function GetOwnedCollaborationAt(Index: Integer): IUMLCollaboration; safecall;
    function GetOwnedCollaborationCount: Integer; safecall;
    function GetOwnedCollaborationInstanceSetAt(Index: Integer): IUMLCollaborationInstanceSet; safecall;
    function GetOwnedCollaborationInstanceSetCount: Integer; safecall;
  end;

  // PUMLReceptionAuto
  PUMLReceptionAuto = class(PUMLBehavioralFeatureAuto, IUMLReception)
  protected
    function Get_Specification: WideString; safecall;
    procedure Set_Specification(const Value: WideString); safecall;
    function Get_IsRoot: WordBool; safecall;
    procedure Set_IsRoot(Value: WordBool); safecall;
    function Get_IsLeaf: WordBool; safecall;
    procedure Set_IsLeaf(Value: WordBool); safecall;
    function Get_IsAbstract: WordBool; safecall;
    procedure Set_IsAbstract(Value: WordBool); safecall;
    function Get_Signal: IUMLSignal; safecall;
    procedure Set_Signal(const Value: IUMLSignal); safecall;
  end;

  // PUMLConnectorAuto
  PUMLConnectorAuto = class(PUMLFeatureAuto, IUMLConnector)
  protected
    procedure ClearEnds; safecall;
    procedure AddEnd(const Value: IUMLConnectorEnd); safecall;
    procedure RemoveEnd(const Value: IUMLConnectorEnd); safecall;
    procedure InsertEnd(Index: Integer; const Value: IUMLConnectorEnd); safecall;
    procedure DeleteEnd(Index: Integer); safecall;
    function IndexOfEnd(const Value: IUMLConnectorEnd): Integer; safecall;
    function GetEndAt(Index: Integer): IUMLConnectorEnd; safecall;
    function GetEndCount: Integer; safecall;
    function Get_Owner: IUMLClassifier; safecall;
    procedure Set_Owner(const Value: IUMLClassifier); safecall;
  end;

  // PUMLStructuralFeatureAuto
  PUMLStructuralFeatureAuto = class(PUMLFeatureAuto, IUMLStructuralFeature)
  protected
    function Get_Multiplicity: WideString; safecall;
    procedure Set_Multiplicity(const Value: WideString); safecall;
    function Get_Changeability: UMLChangeableKind; safecall;
    procedure Set_Changeability(Value: UMLChangeableKind); safecall;
    function Get_TargetScope: UMLScopeKind; safecall;
    procedure Set_TargetScope(Value: UMLScopeKind); safecall;
    function Get_Ordering: UMLOrderingKind; safecall;
    procedure Set_Ordering(Value: UMLOrderingKind); safecall;
    function Get_TypeExpression: WideString; safecall;
    procedure Set_TypeExpression(const Value: WideString); safecall;
    function Get_Type_: IUMLClassifier; safecall;
    procedure Set_Type_(const Value: IUMLClassifier); safecall;
    procedure SetType(const Value: IUMLClassifier); safecall;
    procedure SetType2(const Value: WideString); safecall;
  end;

  // PUMLAttributeAuto
  PUMLAttributeAuto = class(PUMLStructuralFeatureAuto, IUMLAttribute)
  protected
    function Get_InitialValue: WideString; safecall;
    procedure Set_InitialValue(const Value: WideString); safecall;
    function Get_AssociationEnd: IUMLAssociationEnd; safecall;
    function Get_Owner: IUMLClassifier; safecall;
    procedure ClearAttributeLinks; safecall;
    procedure AddAttributeLink(const Value: IUMLAttributeLink); safecall;
    procedure RemoveAttributeLink(const Value: IUMLAttributeLink); safecall;
    procedure InsertAttributeLink(Index: Integer; const Value: IUMLAttributeLink); safecall;
    procedure DeleteAttributeLink(Index: Integer); safecall;
    function IndexOfAttributeLink(const Value: IUMLAttributeLink): Integer; safecall;
    function GetAttributeLinkAt(Index: Integer): IUMLAttributeLink; safecall;
    function GetAttributeLinkCount: Integer; safecall;
    procedure ClearAssociationEndRoles; safecall;
    procedure AddAssociationEndRole(const Value: IUMLAssociationEndRole); safecall;
    procedure RemoveAssociationEndRole(const Value: IUMLAssociationEndRole); safecall;
    procedure InsertAssociationEndRole(Index: Integer; const Value: IUMLAssociationEndRole); safecall;
    procedure DeleteAssociationEndRole(Index: Integer); safecall;
    function IndexOfAssociationEndRole(const Value: IUMLAssociationEndRole): Integer; safecall;
    function GetAssociationEndRoleAt(Index: Integer): IUMLAssociationEndRole; safecall;
    function GetAssociationEndRoleCount: Integer; safecall;
  end;

  // PUMLPortAuto
  PUMLPortAuto = class(PUMLStructuralFeatureAuto, IUMLPort)
  protected
    function Get_IsBehavior: WordBool; safecall;
    procedure Set_IsBehavior(Value: WordBool); safecall;
    function Get_IsService: WordBool; safecall;
    procedure Set_IsService(Value: WordBool); safecall;
    function Get_Owner: IUMLClassifier; safecall;
    procedure Set_Owner(const Value: IUMLClassifier); safecall;
  end;

  // PUMLGeneralizableElementAuto
  PUMLGeneralizableElementAuto = class(PUMLModelElementAuto, IUMLGeneralizableElement)
  protected
    function Get_IsRoot: WordBool; safecall;
    procedure Set_IsRoot(Value: WordBool); safecall;
    function Get_IsLeaf: WordBool; safecall;
    procedure Set_IsLeaf(Value: WordBool); safecall;
    function Get_IsAbstract: WordBool; safecall;
    procedure Set_IsAbstract(Value: WordBool); safecall;
    procedure ClearGeneralizations; safecall;
    procedure AddGeneralization(const Value: IUMLGeneralization); safecall;
    procedure RemoveGeneralization(const Value: IUMLGeneralization); safecall;
    procedure InsertGeneralization(Index: Integer; const Value: IUMLGeneralization); safecall;
    procedure DeleteGeneralization(Index: Integer); safecall;
    function IndexOfGeneralization(const Value: IUMLGeneralization): Integer; safecall;
    function GetGeneralizationAt(Index: Integer): IUMLGeneralization; safecall;
    function GetGeneralizationCount: Integer; safecall;
    procedure ClearSpecializations; safecall;
    procedure AddSpecialization(const Value: IUMLGeneralization); safecall;
    procedure RemoveSpecialization(const Value: IUMLGeneralization); safecall;
    procedure InsertSpecialization(Index: Integer; const Value: IUMLGeneralization); safecall;
    procedure DeleteSpecialization(Index: Integer); safecall;
    function IndexOfSpecialization(const Value: IUMLGeneralization): Integer; safecall;
    function GetSpecializationAt(Index: Integer): IUMLGeneralization; safecall;
    function GetSpecializationCount: Integer; safecall;
  end;

  // PUMLNamespaceAuto
  PUMLNamespaceAuto = class(PUMLGeneralizableElementAuto, IUMLNamespace)
  protected
    function GetOwnedElementAt(Index: Integer): IUMLModelElement; safecall;
    function GetOwnedElementCount: Integer; safecall;
  end;

  // PUMLCollaborationAuto
  PUMLCollaborationAuto = class(PUMLNamespaceAuto, IUMLCollaboration)
  protected
    function GetInteractionAt(Index: Integer): IUMLInteraction; safecall;
    function GetInteractionCount: Integer; safecall;
    function Get_RepresentedOperation: IUMLOperation; safecall;
    procedure ClearCollaborationInstanceSets; safecall;
    procedure AddCollaborationInstanceSet(const Value: IUMLCollaborationInstanceSet); safecall;
    procedure RemoveCollaborationInstanceSet(const Value: IUMLCollaborationInstanceSet); safecall;
    procedure InsertCollaborationInstanceSet(Index: Integer; const Value: IUMLCollaborationInstanceSet); safecall;
    procedure DeleteCollaborationInstanceSet(Index: Integer); safecall;
    function IndexOfCollaborationInstanceSet(const Value: IUMLCollaborationInstanceSet): Integer; safecall;
    function GetCollaborationInstanceSetAt(Index: Integer): IUMLCollaborationInstanceSet; safecall;
    function GetCollaborationInstanceSetCount: Integer; safecall;
    procedure ClearUserCollaborations; safecall;
    procedure AddUserCollaboration(const Value: IUMLCollaboration); safecall;
    procedure RemoveUserCollaboration(const Value: IUMLCollaboration); safecall;
    procedure InsertUserCollaboration(Index: Integer; const Value: IUMLCollaboration); safecall;
    procedure DeleteUserCollaboration(Index: Integer); safecall;
    function IndexOfUserCollaboration(const Value: IUMLCollaboration): Integer; safecall;
    function GetUserCollaborationAt(Index: Integer): IUMLCollaboration; safecall;
    function GetUserCollaborationCount: Integer; safecall;
    procedure ClearUsedCollaborations; safecall;
    procedure AddUsedCollaboration(const Value: IUMLCollaboration); safecall;
    procedure RemoveUsedCollaboration(const Value: IUMLCollaboration); safecall;
    procedure InsertUsedCollaboration(Index: Integer; const Value: IUMLCollaboration); safecall;
    procedure DeleteUsedCollaboration(Index: Integer); safecall;
    function IndexOfUsedCollaboration(const Value: IUMLCollaboration): Integer; safecall;
    function GetUsedCollaborationAt(Index: Integer): IUMLCollaboration; safecall;
    function GetUsedCollaborationCount: Integer; safecall;
    function Get_RepresentedClassifier: IUMLClassifier; safecall;
  end;

  // PUMLClassifierAuto
  PUMLClassifierAuto = class(PUMLNamespaceAuto, IUMLClassifier)
  protected
    function GetOperationAt(Index: Integer): IUMLOperation; safecall;
    function GetOperationCount: Integer; safecall;
    procedure ClearTypedFeatures; safecall;
    procedure AddTypedFeature(const Value: IUMLStructuralFeature); safecall;
    procedure RemoveTypedFeature(const Value: IUMLStructuralFeature); safecall;
    procedure InsertTypedFeature(Index: Integer; const Value: IUMLStructuralFeature); safecall;
    procedure DeleteTypedFeature(Index: Integer); safecall;
    function IndexOfTypedFeature(const Value: IUMLStructuralFeature): Integer; safecall;
    function GetTypedFeatureAt(Index: Integer): IUMLStructuralFeature; safecall;
    function GetTypedFeatureCount: Integer; safecall;
    procedure ClearTypedParameters; safecall;
    procedure AddTypedParameter(const Value: IUMLParameter); safecall;
    procedure RemoveTypedParameter(const Value: IUMLParameter); safecall;
    procedure InsertTypedParameter(Index: Integer; const Value: IUMLParameter); safecall;
    procedure DeleteTypedParameter(Index: Integer); safecall;
    function IndexOfTypedParameter(const Value: IUMLParameter): Integer; safecall;
    function GetTypedParameterAt(Index: Integer): IUMLParameter; safecall;
    function GetTypedParameterCount: Integer; safecall;
    procedure ClearAssociations; safecall;
    procedure AddAssociation(const Value: IUMLAssociationEnd); safecall;
    procedure RemoveAssociation(const Value: IUMLAssociationEnd); safecall;
    procedure InsertAssociation(Index: Integer; const Value: IUMLAssociationEnd); safecall;
    procedure DeleteAssociation(Index: Integer); safecall;
    function IndexOfAssociation(const Value: IUMLAssociationEnd): Integer; safecall;
    function GetAssociationAt(Index: Integer): IUMLAssociationEnd; safecall;
    function GetAssociationCount: Integer; safecall;
    procedure ClearPowertypeGeneralizations; safecall;
    procedure AddPowertypeGeneralization(const Value: IUMLGeneralization); safecall;
    procedure RemovePowertypeGeneralization(const Value: IUMLGeneralization); safecall;
    procedure InsertPowertypeGeneralization(Index: Integer; const Value: IUMLGeneralization); safecall;
    procedure DeletePowertypeGeneralization(Index: Integer); safecall;
    function IndexOfPowertypeGeneralization(const Value: IUMLGeneralization): Integer; safecall;
    function GetPowertypeGeneralizationAt(Index: Integer): IUMLGeneralization; safecall;
    function GetPowertypeGeneralizationCount: Integer; safecall;
    function GetAttributeAt(Index: Integer): IUMLAttribute; safecall;
    function GetAttributeCount: Integer; safecall;
    procedure ClearOwnedPorts; safecall;
    procedure AddOwnedPort(const Value: IUMLPort); safecall;
    procedure RemoveOwnedPort(const Value: IUMLPort); safecall;
    procedure InsertOwnedPort(Index: Integer; const Value: IUMLPort); safecall;
    procedure DeleteOwnedPort(Index: Integer); safecall;
    function IndexOfOwnedPort(const Value: IUMLPort): Integer; safecall;
    function GetOwnedPortAt(Index: Integer): IUMLPort; safecall;
    function GetOwnedPortCount: Integer; safecall;
    procedure ClearOwnedConnectors; safecall;
    procedure AddOwnedConnector(const Value: IUMLConnector); safecall;
    procedure RemoveOwnedConnector(const Value: IUMLConnector); safecall;
    procedure InsertOwnedConnector(Index: Integer; const Value: IUMLConnector); safecall;
    procedure DeleteOwnedConnector(Index: Integer); safecall;
    function IndexOfOwnedConnector(const Value: IUMLConnector): Integer; safecall;
    function GetOwnedConnectorAt(Index: Integer): IUMLConnector; safecall;
    function GetOwnedConnectorCount: Integer; safecall;
    procedure ClearInstances; safecall;
    procedure AddInstance(const Value: IUMLInstance); safecall;
    procedure RemoveInstance(const Value: IUMLInstance); safecall;
    procedure InsertInstance(Index: Integer; const Value: IUMLInstance); safecall;
    procedure DeleteInstance(Index: Integer); safecall;
    function IndexOfInstance(const Value: IUMLInstance): Integer; safecall;
    function GetInstanceAt(Index: Integer): IUMLInstance; safecall;
    function GetInstanceCount: Integer; safecall;
    procedure ClearCreateActions; safecall;
    procedure AddCreateAction(const Value: IUMLCreateAction); safecall;
    procedure RemoveCreateAction(const Value: IUMLCreateAction); safecall;
    procedure InsertCreateAction(Index: Integer; const Value: IUMLCreateAction); safecall;
    procedure DeleteCreateAction(Index: Integer); safecall;
    function IndexOfCreateAction(const Value: IUMLCreateAction): Integer; safecall;
    function GetCreateActionAt(Index: Integer): IUMLCreateAction; safecall;
    function GetCreateActionCount: Integer; safecall;
    procedure ClearClassifierRoles; safecall;
    procedure AddClassifierRole(const Value: IUMLClassifierRole); safecall;
    procedure RemoveClassifierRole(const Value: IUMLClassifierRole); safecall;
    procedure InsertClassifierRole(Index: Integer; const Value: IUMLClassifierRole); safecall;
    procedure DeleteClassifierRole(Index: Integer); safecall;
    function IndexOfClassifierRole(const Value: IUMLClassifierRole): Integer; safecall;
    function GetClassifierRoleAt(Index: Integer): IUMLClassifierRole; safecall;
    function GetClassifierRoleCount: Integer; safecall;
    function GetOwnedCollaborationAt(Index: Integer): IUMLCollaboration; safecall;
    function GetOwnedCollaborationCount: Integer; safecall;
    function GetOwnedCollaborationInstanceSetAt(Index: Integer): IUMLCollaborationInstanceSet; safecall;
    function GetOwnedCollaborationInstanceSetCount: Integer; safecall;
    procedure ClearClassifierInStates; safecall;
    procedure AddClassifierInState(const Value: IUMLClassifierInState); safecall;
    procedure RemoveClassifierInState(const Value: IUMLClassifierInState); safecall;
    procedure InsertClassifierInState(Index: Integer; const Value: IUMLClassifierInState); safecall;
    procedure DeleteClassifierInState(Index: Integer); safecall;
    function IndexOfClassifierInState(const Value: IUMLClassifierInState): Integer; safecall;
    function GetClassifierInStateAt(Index: Integer): IUMLClassifierInState; safecall;
    function GetClassifierInStateCount: Integer; safecall;
    procedure ClearObjectFlowStates; safecall;
    procedure AddObjectFlowState(const Value: IUMLObjectFlowState); safecall;
    procedure RemoveObjectFlowState(const Value: IUMLObjectFlowState); safecall;
    procedure InsertObjectFlowState(Index: Integer; const Value: IUMLObjectFlowState); safecall;
    procedure DeleteObjectFlowState(Index: Integer); safecall;
    function IndexOfObjectFlowState(const Value: IUMLObjectFlowState): Integer; safecall;
    function GetObjectFlowStateAt(Index: Integer): IUMLObjectFlowState; safecall;
    function GetObjectFlowStateCount: Integer; safecall;
  end;

  // PUMLUseCaseAuto
  PUMLUseCaseAuto = class(PUMLClassifierAuto, IUMLUseCase)
  protected
    procedure ClearExtenders; safecall;
    procedure AddExtender(const Value: IUMLExtend); safecall;
    procedure RemoveExtender(const Value: IUMLExtend); safecall;
    procedure InsertExtender(Index: Integer; const Value: IUMLExtend); safecall;
    procedure DeleteExtender(Index: Integer); safecall;
    function IndexOfExtender(const Value: IUMLExtend): Integer; safecall;
    function GetExtenderAt(Index: Integer): IUMLExtend; safecall;
    function GetExtenderCount: Integer; safecall;
    procedure ClearExtends; safecall;
    procedure AddExtend(const Value: IUMLExtend); safecall;
    procedure RemoveExtend(const Value: IUMLExtend); safecall;
    procedure InsertExtend(Index: Integer; const Value: IUMLExtend); safecall;
    procedure DeleteExtend(Index: Integer); safecall;
    function IndexOfExtend(const Value: IUMLExtend): Integer; safecall;
    function GetExtendAt(Index: Integer): IUMLExtend; safecall;
    function GetExtendCount: Integer; safecall;
    procedure ClearIncluders; safecall;
    procedure AddIncluder(const Value: IUMLInclude); safecall;
    procedure RemoveIncluder(const Value: IUMLInclude); safecall;
    procedure InsertIncluder(Index: Integer; const Value: IUMLInclude); safecall;
    procedure DeleteIncluder(Index: Integer); safecall;
    function IndexOfIncluder(const Value: IUMLInclude): Integer; safecall;
    function GetIncluderAt(Index: Integer): IUMLInclude; safecall;
    function GetIncluderCount: Integer; safecall;
    procedure ClearIncludes; safecall;
    procedure AddInclude(const Value: IUMLInclude); safecall;
    procedure RemoveInclude(const Value: IUMLInclude); safecall;
    procedure InsertInclude(Index: Integer; const Value: IUMLInclude); safecall;
    procedure DeleteInclude(Index: Integer); safecall;
    function IndexOfInclude(const Value: IUMLInclude): Integer; safecall;
    function GetIncludeAt(Index: Integer): IUMLInclude; safecall;
    function GetIncludeCount: Integer; safecall;
    function GetExtensionPointAt(Index: Integer): IUMLExtensionPoint; safecall;
    function GetExtensionPointCount: Integer; safecall;
  end;

  // PUMLActorAuto
  PUMLActorAuto = class(PUMLClassifierAuto, IUMLActor)
  protected
  end;

  // PUMLClassifierInStateAuto
  PUMLClassifierInStateAuto = class(PUMLClassifierAuto, IUMLClassifierInState)
  protected
    function Get_Type_: IUMLClassifier; safecall;
    procedure Set_Type_(const Value: IUMLClassifier); safecall;
    procedure ClearInStates; safecall;
    procedure AddInState(const Value: IUMLState); safecall;
    procedure RemoveInState(const Value: IUMLState); safecall;
    procedure InsertInState(Index: Integer; const Value: IUMLState); safecall;
    procedure DeleteInState(Index: Integer); safecall;
    function IndexOfInState(const Value: IUMLState): Integer; safecall;
    function GetInStateAt(Index: Integer): IUMLState; safecall;
    function GetInStateCount: Integer; safecall;
  end;

  // PUMLInterfaceAuto
  PUMLInterfaceAuto = class(PUMLClassifierAuto, IUMLInterface)
  protected
  end;

  // PUMLPackageAuto
  PUMLPackageAuto = class(PUMLClassifierAuto, IUMLPackage)
  protected
    function GetElementImportItemAt(Index: Integer): IUMLElementImport; safecall;
    function GetElementImportItemCount: Integer; safecall;
  end;

  // PUMLSubsystemAuto
  PUMLSubsystemAuto = class(PUMLPackageAuto, IUMLSubsystem)
  protected
    function Get_IsInstantiable: WordBool; safecall;
    procedure Set_IsInstantiable(Value: WordBool); safecall;
  end;

  // PUMLProjectAuto
  PUMLProjectAuto = class(PUMLPackageAuto, IUMLProject)
  protected
    function Get_Title: WideString; safecall;
    procedure Set_Title(const Value: WideString); safecall;
    function Get_Author: WideString; safecall;
    procedure Set_Author(const Value: WideString); safecall;
    function Get_Company: WideString; safecall;
    procedure Set_Company(const Value: WideString); safecall;
    function Get_Copyright: WideString; safecall;
    procedure Set_Copyright(const Value: WideString); safecall;
  end;

  // PUMLModelAuto
  PUMLModelAuto = class(PUMLPackageAuto, IUMLModel)
  protected
  end;

  // PUMLDataTypeAuto
  PUMLDataTypeAuto = class(PUMLClassifierAuto, IUMLDataType)
  protected
  end;

  // PUMLProgrammingLanguageDataTypeAuto
  PUMLProgrammingLanguageDataTypeAuto = class(PUMLDataTypeAuto, IUMLProgrammingLanguageDataType)
  protected
    function Get_Expression: WideString; safecall;
    procedure Set_Expression(const Value: WideString); safecall;
  end;

  // PUMLPrimitiveAuto
  PUMLPrimitiveAuto = class(PUMLDataTypeAuto, IUMLPrimitive)
  protected
  end;

  // PUMLEnumerationAuto
  PUMLEnumerationAuto = class(PUMLDataTypeAuto, IUMLEnumeration)
  protected
    function GetLiteralAt(Index: Integer): IUMLEnumerationLiteral; safecall;
    function GetLiteralCount: Integer; safecall;
  end;

  // PUMLClassAuto
  PUMLClassAuto = class(PUMLClassifierAuto, IUMLClass)
  protected
    function Get_IsActive: WordBool; safecall;
    procedure Set_IsActive(Value: WordBool); safecall;
    function Get_AssociationClass: IUMLAssociationClass; safecall;
    procedure Set_AssociationClass(const Value: IUMLAssociationClass); safecall;
  end;

  // PUMLNodeAuto
  PUMLNodeAuto = class(PUMLClassifierAuto, IUMLNode)
  protected
    procedure ClearDeployedComponents; safecall;
    procedure AddDeployedComponent(const Value: IUMLComponent); safecall;
    procedure RemoveDeployedComponent(const Value: IUMLComponent); safecall;
    procedure InsertDeployedComponent(Index: Integer; const Value: IUMLComponent); safecall;
    procedure DeleteDeployedComponent(Index: Integer); safecall;
    function IndexOfDeployedComponent(const Value: IUMLComponent): Integer; safecall;
    function GetDeployedComponentAt(Index: Integer): IUMLComponent; safecall;
    function GetDeployedComponentCount: Integer; safecall;
    procedure ClearDeployedArtifacts; safecall;
    procedure AddDeployedArtifact(const Value: IUMLArtifact); safecall;
    procedure RemoveDeployedArtifact(const Value: IUMLArtifact); safecall;
    procedure InsertDeployedArtifact(Index: Integer; const Value: IUMLArtifact); safecall;
    procedure DeleteDeployedArtifact(Index: Integer); safecall;
    function IndexOfDeployedArtifact(const Value: IUMLArtifact): Integer; safecall;
    function GetDeployedArtifactAt(Index: Integer): IUMLArtifact; safecall;
    function GetDeployedArtifactCount: Integer; safecall;
  end;

  // PUMLArtifactAuto
  PUMLArtifactAuto = class(PUMLClassifierAuto, IUMLArtifact)
  protected
    procedure ClearImplementationLocations; safecall;
    procedure AddImplementationLocation(const Value: IUMLComponent); safecall;
    procedure RemoveImplementationLocation(const Value: IUMLComponent); safecall;
    procedure InsertImplementationLocation(Index: Integer; const Value: IUMLComponent); safecall;
    procedure DeleteImplementationLocation(Index: Integer); safecall;
    function IndexOfImplementationLocation(const Value: IUMLComponent): Integer; safecall;
    function GetImplementationLocationAt(Index: Integer): IUMLComponent; safecall;
    function GetImplementationLocationCount: Integer; safecall;
    procedure ClearDeploymentLocations; safecall;
    procedure AddDeploymentLocation(const Value: IUMLNode); safecall;
    procedure RemoveDeploymentLocation(const Value: IUMLNode); safecall;
    procedure InsertDeploymentLocation(Index: Integer; const Value: IUMLNode); safecall;
    procedure DeleteDeploymentLocation(Index: Integer); safecall;
    function IndexOfDeploymentLocation(const Value: IUMLNode): Integer; safecall;
    function GetDeploymentLocationAt(Index: Integer): IUMLNode; safecall;
    function GetDeploymentLocationCount: Integer; safecall;
  end;

  // PUMLComponentAuto
  PUMLComponentAuto = class(PUMLClassifierAuto, IUMLComponent)
  protected
    procedure ClearDeploymentLocations; safecall;
    procedure AddDeploymentLocation(const Value: IUMLNode); safecall;
    procedure RemoveDeploymentLocation(const Value: IUMLNode); safecall;
    procedure InsertDeploymentLocation(Index: Integer; const Value: IUMLNode); safecall;
    procedure DeleteDeploymentLocation(Index: Integer); safecall;
    function IndexOfDeploymentLocation(const Value: IUMLNode): Integer; safecall;
    function GetDeploymentLocationAt(Index: Integer): IUMLNode; safecall;
    function GetDeploymentLocationCount: Integer; safecall;
    procedure ClearResidents; safecall;
    procedure AddResident(const Value: IUMLModelElement); safecall;
    procedure RemoveResident(const Value: IUMLModelElement); safecall;
    procedure InsertResident(Index: Integer; const Value: IUMLModelElement); safecall;
    procedure DeleteResident(Index: Integer); safecall;
    function IndexOfResident(const Value: IUMLModelElement): Integer; safecall;
    function GetResidentAt(Index: Integer): IUMLModelElement; safecall;
    function GetResidentCount: Integer; safecall;
    procedure ClearImplementations; safecall;
    procedure AddImplementation(const Value: IUMLArtifact); safecall;
    procedure RemoveImplementation(const Value: IUMLArtifact); safecall;
    procedure InsertImplementation(Index: Integer; const Value: IUMLArtifact); safecall;
    procedure DeleteImplementation(Index: Integer); safecall;
    function IndexOfImplementation(const Value: IUMLArtifact): Integer; safecall;
    function GetImplementationAt(Index: Integer): IUMLArtifact; safecall;
    function GetImplementationCount: Integer; safecall;
  end;

  // PUMLSignalAuto
  PUMLSignalAuto = class(PUMLClassifierAuto, IUMLSignal)
  protected
    procedure ClearReceptions; safecall;
    procedure AddReception(const Value: IUMLReception); safecall;
    procedure RemoveReception(const Value: IUMLReception); safecall;
    procedure InsertReception(Index: Integer; const Value: IUMLReception); safecall;
    procedure DeleteReception(Index: Integer); safecall;
    function IndexOfReception(const Value: IUMLReception): Integer; safecall;
    function GetReceptionAt(Index: Integer): IUMLReception; safecall;
    function GetReceptionCount: Integer; safecall;
    procedure ClearContexts; safecall;
    procedure AddContext(const Value: IUMLBehavioralFeature); safecall;
    procedure RemoveContext(const Value: IUMLBehavioralFeature); safecall;
    procedure InsertContext(Index: Integer; const Value: IUMLBehavioralFeature); safecall;
    procedure DeleteContext(Index: Integer); safecall;
    function IndexOfContext(const Value: IUMLBehavioralFeature): Integer; safecall;
    function GetContextAt(Index: Integer): IUMLBehavioralFeature; safecall;
    function GetContextCount: Integer; safecall;
    procedure ClearSendActions; safecall;
    procedure AddSendAction(const Value: IUMLSendAction); safecall;
    procedure RemoveSendAction(const Value: IUMLSendAction); safecall;
    procedure InsertSendAction(Index: Integer; const Value: IUMLSendAction); safecall;
    procedure DeleteSendAction(Index: Integer); safecall;
    function IndexOfSendAction(const Value: IUMLSendAction): Integer; safecall;
    function GetSendActionAt(Index: Integer): IUMLSendAction; safecall;
    function GetSendActionCount: Integer; safecall;
    procedure ClearOccurrences; safecall;
    procedure AddOccurrence(const Value: IUMLSignalEvent); safecall;
    procedure RemoveOccurrence(const Value: IUMLSignalEvent); safecall;
    procedure InsertOccurrence(Index: Integer; const Value: IUMLSignalEvent); safecall;
    procedure DeleteOccurrence(Index: Integer); safecall;
    function IndexOfOccurrence(const Value: IUMLSignalEvent): Integer; safecall;
    function GetOccurrenceAt(Index: Integer): IUMLSignalEvent; safecall;
    function GetOccurrenceCount: Integer; safecall;
  end;

  // PUMLExceptionAuto
  PUMLExceptionAuto = class(PUMLSignalAuto, IUMLException)
  protected
  end;

  // PUMLClassifierRoleAuto
  PUMLClassifierRoleAuto = class(PUMLClassifierAuto, IUMLClassifierRole)
  protected
    function Get_Multiplicity: WideString; safecall;
    procedure Set_Multiplicity(const Value: WideString); safecall;
    function Get_Base: IUMLClassifier; safecall;
    procedure Set_Base(const Value: IUMLClassifier); safecall;
    procedure ClearAvailableFeatures; safecall;
    procedure AddAvailableFeature(const Value: IUMLFeature); safecall;
    procedure RemoveAvailableFeature(const Value: IUMLFeature); safecall;
    procedure InsertAvailableFeature(Index: Integer; const Value: IUMLFeature); safecall;
    procedure DeleteAvailableFeature(Index: Integer); safecall;
    function IndexOfAvailableFeature(const Value: IUMLFeature): Integer; safecall;
    function GetAvailableFeatureAt(Index: Integer): IUMLFeature; safecall;
    function GetAvailableFeatureCount: Integer; safecall;
    procedure ClearSenderClientMessages; safecall;
    procedure AddSenderClientMessage(const Value: IUMLMessage); safecall;
    procedure RemoveSenderClientMessage(const Value: IUMLMessage); safecall;
    procedure InsertSenderClientMessage(Index: Integer; const Value: IUMLMessage); safecall;
    procedure DeleteSenderClientMessage(Index: Integer); safecall;
    function IndexOfSenderClientMessage(const Value: IUMLMessage): Integer; safecall;
    function GetSenderClientMessageAt(Index: Integer): IUMLMessage; safecall;
    function GetSenderClientMessageCount: Integer; safecall;
    procedure ClearReceiverClientMessages; safecall;
    procedure AddReceiverClientMessage(const Value: IUMLMessage); safecall;
    procedure RemoveReceiverClientMessage(const Value: IUMLMessage); safecall;
    procedure InsertReceiverClientMessage(Index: Integer; const Value: IUMLMessage); safecall;
    procedure DeleteReceiverClientMessage(Index: Integer); safecall;
    function IndexOfReceiverClientMessage(const Value: IUMLMessage): Integer; safecall;
    function GetReceiverClientMessageAt(Index: Integer): IUMLMessage; safecall;
    function GetReceiverClientMessageCount: Integer; safecall;
    procedure ClearAvailableContents; safecall;
    procedure AddAvailableContent(const Value: IUMLModelElement); safecall;
    procedure RemoveAvailableContent(const Value: IUMLModelElement); safecall;
    procedure InsertAvailableContent(Index: Integer; const Value: IUMLModelElement); safecall;
    procedure DeleteAvailableContent(Index: Integer); safecall;
    function IndexOfAvailableContent(const Value: IUMLModelElement): Integer; safecall;
    function GetAvailableContentAt(Index: Integer): IUMLModelElement; safecall;
    function GetAvailableContentCount: Integer; safecall;
    procedure ClearConformingInstances; safecall;
    procedure AddConformingInstance(const Value: IUMLInstance); safecall;
    procedure RemoveConformingInstance(const Value: IUMLInstance); safecall;
    procedure InsertConformingInstance(Index: Integer; const Value: IUMLInstance); safecall;
    procedure DeleteConformingInstance(Index: Integer); safecall;
    function IndexOfConformingInstance(const Value: IUMLInstance): Integer; safecall;
    function GetConformingInstanceAt(Index: Integer): IUMLInstance; safecall;
    function GetConformingInstanceCount: Integer; safecall;
  end;

  // PUMLEventAuto
  PUMLEventAuto = class(PUMLModelElementAuto, IUMLEvent)
  protected
    function GetParameterAt(Index: Integer): IUMLParameter; safecall;
    function GetParameterCount: Integer; safecall;
    procedure ClearStates; safecall;
    procedure AddState(const Value: IUMLState); safecall;
    procedure RemoveState(const Value: IUMLState); safecall;
    procedure InsertState(Index: Integer; const Value: IUMLState); safecall;
    procedure DeleteState(Index: Integer); safecall;
    function IndexOfState(const Value: IUMLState): Integer; safecall;
    function GetStateAt(Index: Integer): IUMLState; safecall;
    function GetStateCount: Integer; safecall;
    function Get_Transition: IUMLTransition; safecall;
  end;

  // PUMLChangeEventAuto
  PUMLChangeEventAuto = class(PUMLEventAuto, IUMLChangeEvent)
  protected
    function Get_ChangeExpression: WideString; safecall;
    procedure Set_ChangeExpression(const Value: WideString); safecall;
  end;

  // PUMLSignalEventAuto
  PUMLSignalEventAuto = class(PUMLEventAuto, IUMLSignalEvent)
  protected
    function Get_Signal: IUMLSignal; safecall;
    procedure Set_Signal(const Value: IUMLSignal); safecall;
  end;

  // PUMLTimeEventAuto
  PUMLTimeEventAuto = class(PUMLEventAuto, IUMLTimeEvent)
  protected
    function Get_When: WideString; safecall;
    procedure Set_When(const Value: WideString); safecall;
  end;

  // PUMLCallEventAuto
  PUMLCallEventAuto = class(PUMLEventAuto, IUMLCallEvent)
  protected
    function Get_Operation: IUMLOperation; safecall;
    procedure Set_Operation(const Value: IUMLOperation); safecall;
  end;

  // PUMLEnumerationLiteralAuto
  PUMLEnumerationLiteralAuto = class(PUMLModelElementAuto, IUMLEnumerationLiteral)
  protected
    function Get_Enumeration: IUMLEnumeration; safecall;
  end;

  // PUMLStimulusAuto
  PUMLStimulusAuto = class(PUMLModelElementAuto, IUMLStimulus)
  protected
    function Get_Arguments: WideString; safecall;
    procedure Set_Arguments(const Value: WideString); safecall;
    function Get_Return: WideString; safecall;
    procedure Set_Return(const Value: WideString); safecall;
    function Get_Iteration: WideString; safecall;
    procedure Set_Iteration(const Value: WideString); safecall;
    function Get_Branch: WideString; safecall;
    procedure Set_Branch(const Value: WideString); safecall;
    function Get_Sender: IUMLInstance; safecall;
    procedure Set_Sender(const Value: IUMLInstance); safecall;
    function Get_Receiver: IUMLInstance; safecall;
    procedure Set_Receiver(const Value: IUMLInstance); safecall;
    function Get_CommunicationLink: IUMLLink; safecall;
    procedure Set_CommunicationLink(const Value: IUMLLink); safecall;
    function Get_Action: IUMLAction; safecall;
    function Get_Activator: IUMLStimulus; safecall;
    procedure Set_Activator(const Value: IUMLStimulus); safecall;
    procedure ClearActivatees; safecall;
    procedure AddActivatee(const Value: IUMLStimulus); safecall;
    procedure RemoveActivatee(const Value: IUMLStimulus); safecall;
    procedure InsertActivatee(Index: Integer; const Value: IUMLStimulus); safecall;
    procedure DeleteActivatee(Index: Integer); safecall;
    function IndexOfActivatee(const Value: IUMLStimulus): Integer; safecall;
    function GetActivateeAt(Index: Integer): IUMLStimulus; safecall;
    function GetActivateeCount: Integer; safecall;
    function Get_Predecessor: IUMLStimulus; safecall;
    procedure Set_Predecessor(const Value: IUMLStimulus); safecall;
    function Get_Successor: IUMLStimulus; safecall;
    procedure Set_Successor(const Value: IUMLStimulus); safecall;
    procedure ClearPlayedRoles; safecall;
    procedure AddPlayedRole(const Value: IUMLMessage); safecall;
    procedure RemovePlayedRole(const Value: IUMLMessage); safecall;
    procedure InsertPlayedRole(Index: Integer; const Value: IUMLMessage); safecall;
    procedure DeletePlayedRole(Index: Integer); safecall;
    function IndexOfPlayedRole(const Value: IUMLMessage): Integer; safecall;
    function GetPlayedRoleAt(Index: Integer): IUMLMessage; safecall;
    function GetPlayedRoleCount: Integer; safecall;
    function Get_InteractionInstanceSet: IUMLInteractionInstanceSet; safecall;
  end;

  // PUMLAttributeLinkAuto
  PUMLAttributeLinkAuto = class(PUMLModelElementAuto, IUMLAttributeLink)
  protected
    function Get_ValueExpression: WideString; safecall;
    procedure Set_ValueExpression(const Value: WideString); safecall;
    function Get_Attribute: IUMLAttribute; safecall;
    procedure Set_Attribute(const Value: IUMLAttribute); safecall;
    function Get_Value_: IUMLInstance; safecall;
    procedure Set_Value_(const Value: IUMLInstance); safecall;
    function Get_Instance: IUMLInstance; safecall;
    function Get_LinkEnd: IUMLLinkEnd; safecall;
  end;

  // PUMLRelationshipAuto
  PUMLRelationshipAuto = class(PUMLModelElementAuto, IUMLRelationship)
  protected
  end;

  // PUMLGeneralizationAuto
  PUMLGeneralizationAuto = class(PUMLRelationshipAuto, IUMLGeneralization)
  protected
    function Get_Discriminator: WideString; safecall;
    procedure Set_Discriminator(const Value: WideString); safecall;
    function Get_Child: IUMLGeneralizableElement; safecall;
    procedure Set_Child(const Value: IUMLGeneralizableElement); safecall;
    function Get_Parent: IUMLGeneralizableElement; safecall;
    procedure Set_Parent(const Value: IUMLGeneralizableElement); safecall;
    function Get_Powertype: IUMLClassifier; safecall;
    procedure Set_Powertype(const Value: IUMLClassifier); safecall;
  end;

  // PUMLIncludeAuto
  PUMLIncludeAuto = class(PUMLRelationshipAuto, IUMLInclude)
  protected
    function Get_Addition: IUMLUseCase; safecall;
    procedure Set_Addition(const Value: IUMLUseCase); safecall;
    function Get_Base: IUMLUseCase; safecall;
    procedure Set_Base(const Value: IUMLUseCase); safecall;
  end;

  // PUMLDependencyAuto
  PUMLDependencyAuto = class(PUMLRelationshipAuto, IUMLDependency)
  protected
    function Get_Mapping: WideString; safecall;
    procedure Set_Mapping(const Value: WideString); safecall;
    function Get_Client: IUMLModelElement; safecall;
    procedure Set_Client(const Value: IUMLModelElement); safecall;
    function Get_Supplier: IUMLModelElement; safecall;
    procedure Set_Supplier(const Value: IUMLModelElement); safecall;
  end;

  // PUMLRealizationAuto
  PUMLRealizationAuto = class(PUMLDependencyAuto, IUMLRealization)
  protected
  end;

  // PUMLExtendAuto
  PUMLExtendAuto = class(PUMLRelationshipAuto, IUMLExtend)
  protected
    function Get_Condition: WideString; safecall;
    procedure Set_Condition(const Value: WideString); safecall;
    function Get_Base: IUMLUseCase; safecall;
    procedure Set_Base(const Value: IUMLUseCase); safecall;
    function Get_Extension: IUMLUseCase; safecall;
    procedure Set_Extension(const Value: IUMLUseCase); safecall;
    procedure ClearExtensionPoints; safecall;
    procedure AddExtensionPoint(const Value: IUMLExtensionPoint); safecall;
    procedure RemoveExtensionPoint(const Value: IUMLExtensionPoint); safecall;
    procedure InsertExtensionPoint(Index: Integer; const Value: IUMLExtensionPoint); safecall;
    procedure DeleteExtensionPoint(Index: Integer); safecall;
    function IndexOfExtensionPoint(const Value: IUMLExtensionPoint): Integer; safecall;
    function GetExtensionPointAt(Index: Integer): IUMLExtensionPoint; safecall;
    function GetExtensionPointCount: Integer; safecall;
  end;

  // PUMLAssociationAuto
  PUMLAssociationAuto = class(PUMLRelationshipAuto, IUMLAssociation)
  protected
    function GetConnectionAt(Index: Integer): IUMLAssociationEnd; safecall;
    function GetConnectionCount: Integer; safecall;
    function Get_AssociationClass: IUMLAssociationClass; safecall;
    procedure Set_AssociationClass(const Value: IUMLAssociationClass); safecall;
    procedure ClearLinks; safecall;
    procedure AddLink(const Value: IUMLLink); safecall;
    procedure RemoveLink(const Value: IUMLLink); safecall;
    procedure InsertLink(Index: Integer; const Value: IUMLLink); safecall;
    procedure DeleteLink(Index: Integer); safecall;
    function IndexOfLink(const Value: IUMLLink): Integer; safecall;
    function GetLinkAt(Index: Integer): IUMLLink; safecall;
    function GetLinkCount: Integer; safecall;
    procedure ClearAssociationRoles; safecall;
    procedure AddAssociationRole(const Value: IUMLAssociationRole); safecall;
    procedure RemoveAssociationRole(const Value: IUMLAssociationRole); safecall;
    procedure InsertAssociationRole(Index: Integer; const Value: IUMLAssociationRole); safecall;
    procedure DeleteAssociationRole(Index: Integer); safecall;
    function IndexOfAssociationRole(const Value: IUMLAssociationRole): Integer; safecall;
    function GetAssociationRoleAt(Index: Integer): IUMLAssociationRole; safecall;
    function GetAssociationRoleCount: Integer; safecall;
  end;

  // PUMLAssociationRoleAuto
  PUMLAssociationRoleAuto = class(PUMLAssociationAuto, IUMLAssociationRole)
  protected
    function Get_Multiplicity: WideString; safecall;
    procedure Set_Multiplicity(const Value: WideString); safecall;
    function Get_Base: IUMLAssociation; safecall;
    procedure Set_Base(const Value: IUMLAssociation); safecall;
    procedure ClearMessages; safecall;
    procedure AddMessage(const Value: IUMLMessage); safecall;
    procedure RemoveMessage(const Value: IUMLMessage); safecall;
    procedure InsertMessage(Index: Integer; const Value: IUMLMessage); safecall;
    procedure DeleteMessage(Index: Integer); safecall;
    function IndexOfMessage(const Value: IUMLMessage): Integer; safecall;
    function GetMessageAt(Index: Integer): IUMLMessage; safecall;
    function GetMessageCount: Integer; safecall;
    procedure ClearConformingLinks; safecall;
    procedure AddConformingLink(const Value: IUMLLink); safecall;
    procedure RemoveConformingLink(const Value: IUMLLink); safecall;
    procedure InsertConformingLink(Index: Integer; const Value: IUMLLink); safecall;
    procedure DeleteConformingLink(Index: Integer); safecall;
    function IndexOfConformingLink(const Value: IUMLLink): Integer; safecall;
    function GetConformingLinkAt(Index: Integer): IUMLLink; safecall;
    function GetConformingLinkCount: Integer; safecall;
  end;

  // PUMLActionAuto
  PUMLActionAuto = class(PUMLModelElementAuto, IUMLAction)
  protected
    function Get_Recurrence: WideString; safecall;
    procedure Set_Recurrence(const Value: WideString); safecall;
    function Get_Target: WideString; safecall;
    procedure Set_Target(const Value: WideString); safecall;
    function Get_IsAsynchronous: WordBool; safecall;
    procedure Set_IsAsynchronous(Value: WordBool); safecall;
    function Get_Script: WideString; safecall;
    procedure Set_Script(const Value: WideString); safecall;
    function GetActualArgumentAt(Index: Integer): IUMLArgument; safecall;
    function GetActualArgumentCount: Integer; safecall;
    function Get_ActionSequence: IUMLActionSequence; safecall;
    function Get_Stimulus: IUMLStimulus; safecall;
    function Get_EntryState: IUMLState; safecall;
    function Get_ExitState: IUMLState; safecall;
    function Get_Transition: IUMLTransition; safecall;
    function Get_DoActivityState: IUMLState; safecall;
    function Get_Message: IUMLMessage; safecall;
  end;

  // PUMLTerminateActionAuto
  PUMLTerminateActionAuto = class(PUMLActionAuto, IUMLTerminateAction)
  protected
  end;

  // PUMLSendActionAuto
  PUMLSendActionAuto = class(PUMLActionAuto, IUMLSendAction)
  protected
    function Get_Signal: IUMLSignal; safecall;
    procedure Set_Signal(const Value: IUMLSignal); safecall;
  end;

  // PUMLActionSequenceAuto
  PUMLActionSequenceAuto = class(PUMLActionAuto, IUMLActionSequence)
  protected
    function GetActionAt(Index: Integer): IUMLAction; safecall;
    function GetActionCount: Integer; safecall;
  end;

  // PUMLCreateActionAuto
  PUMLCreateActionAuto = class(PUMLActionAuto, IUMLCreateAction)
  protected
    function Get_Instantiation: IUMLClassifier; safecall;
    procedure Set_Instantiation(const Value: IUMLClassifier); safecall;
  end;

  // PUMLDestroyActionAuto
  PUMLDestroyActionAuto = class(PUMLActionAuto, IUMLDestroyAction)
  protected
  end;

  // PUMLUninterpretedActionAuto
  PUMLUninterpretedActionAuto = class(PUMLActionAuto, IUMLUninterpretedAction)
  protected
  end;

  // PUMLCallActionAuto
  PUMLCallActionAuto = class(PUMLActionAuto, IUMLCallAction)
  protected
    function Get_Operation: IUMLOperation; safecall;
    procedure Set_Operation(const Value: IUMLOperation); safecall;
  end;

  // PUMLReturnActionAuto
  PUMLReturnActionAuto = class(PUMLActionAuto, IUMLReturnAction)
  protected
  end;

  // PUMLCollaborationInstanceSetAuto
  PUMLCollaborationInstanceSetAuto = class(PUMLModelElementAuto, IUMLCollaborationInstanceSet)
  protected
    function GetInteractionInstanceSetAt(Index: Integer): IUMLInteractionInstanceSet; safecall;
    function GetInteractionInstanceSetCount: Integer; safecall;
    function Get_Collaboration: IUMLCollaboration; safecall;
    procedure Set_Collaboration(const Value: IUMLCollaboration); safecall;
    function GetParticipatingInstanceAt(Index: Integer): IUMLInstance; safecall;
    function GetParticipatingInstanceCount: Integer; safecall;
    function GetParticipatingLinkAt(Index: Integer): IUMLLink; safecall;
    function GetParticipatingLinkCount: Integer; safecall;
    function Get_RepresentedOperation: IUMLOperation; safecall;
    function Get_RepresentedClassifier: IUMLClassifier; safecall;
  end;

  // PUMLParameterAuto
  PUMLParameterAuto = class(PUMLModelElementAuto, IUMLParameter)
  protected
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const Value: WideString); safecall;
    function Get_DirectionKind: UMLParameterDirectionKind; safecall;
    procedure Set_DirectionKind(Value: UMLParameterDirectionKind); safecall;
    function Get_TypeExpression: WideString; safecall;
    procedure Set_TypeExpression(const Value: WideString); safecall;
    function Get_BehavioralFeature: IUMLBehavioralFeature; safecall;
    function Get_Type_: IUMLClassifier; safecall;
    procedure Set_Type_(const Value: IUMLClassifier); safecall;
    function Get_Event: IUMLEvent; safecall;
    procedure ClearStates; safecall;
    procedure AddState(const Value: IUMLObjectFlowState); safecall;
    procedure RemoveState(const Value: IUMLObjectFlowState); safecall;
    procedure InsertState(Index: Integer; const Value: IUMLObjectFlowState); safecall;
    procedure DeleteState(Index: Integer); safecall;
    function IndexOfState(const Value: IUMLObjectFlowState): Integer; safecall;
    function GetStateAt(Index: Integer): IUMLObjectFlowState; safecall;
    function GetStateCount: Integer; safecall;
    procedure SetType(const Value: IUMLClassifier); safecall;
    procedure SetType2(const Value: WideString); safecall;
  end;

  // PUMLAssociationEndAuto
  PUMLAssociationEndAuto = class(PUMLModelElementAuto, IUMLAssociationEnd)
  protected
    function Get_IsNavigable: WordBool; safecall;
    procedure Set_IsNavigable(Value: WordBool); safecall;
    function Get_Ordering: UMLOrderingKind; safecall;
    procedure Set_Ordering(Value: UMLOrderingKind); safecall;
    function Get_Aggregation: UMLAggregationKind; safecall;
    procedure Set_Aggregation(Value: UMLAggregationKind); safecall;
    function Get_TargetScope: UMLScopeKind; safecall;
    procedure Set_TargetScope(Value: UMLScopeKind); safecall;
    function Get_Multiplicity: WideString; safecall;
    procedure Set_Multiplicity(const Value: WideString); safecall;
    function Get_Changeability: UMLChangeableKind; safecall;
    procedure Set_Changeability(Value: UMLChangeableKind); safecall;
    function Get_Association: IUMLAssociation; safecall;
    function GetQualifierAt(Index: Integer): IUMLAttribute; safecall;
    function GetQualifierCount: Integer; safecall;
    function Get_Participant: IUMLClassifier; safecall;
    procedure Set_Participant(const Value: IUMLClassifier); safecall;
    procedure ClearLinkEnds; safecall;
    procedure AddLinkEnd(const Value: IUMLLinkEnd); safecall;
    procedure RemoveLinkEnd(const Value: IUMLLinkEnd); safecall;
    procedure InsertLinkEnd(Index: Integer; const Value: IUMLLinkEnd); safecall;
    procedure DeleteLinkEnd(Index: Integer); safecall;
    function IndexOfLinkEnd(const Value: IUMLLinkEnd): Integer; safecall;
    function GetLinkEndAt(Index: Integer): IUMLLinkEnd; safecall;
    function GetLinkEndCount: Integer; safecall;
    procedure ClearAssociationEndRoles; safecall;
    procedure AddAssociationEndRole(const Value: IUMLAssociationEndRole); safecall;
    procedure RemoveAssociationEndRole(const Value: IUMLAssociationEndRole); safecall;
    procedure InsertAssociationEndRole(Index: Integer; const Value: IUMLAssociationEndRole); safecall;
    procedure DeleteAssociationEndRole(Index: Integer); safecall;
    function IndexOfAssociationEndRole(const Value: IUMLAssociationEndRole): Integer; safecall;
    function GetAssociationEndRoleAt(Index: Integer): IUMLAssociationEndRole; safecall;
    function GetAssociationEndRoleCount: Integer; safecall;
    function GetOtherSide: IUMLAssociationEnd; safecall;
  end;

  // PUMLAssociationEndRoleAuto
  PUMLAssociationEndRoleAuto = class(PUMLAssociationEndAuto, IUMLAssociationEndRole)
  protected
    function Get_CollaborationMultiplicity: WideString; safecall;
    procedure Set_CollaborationMultiplicity(const Value: WideString); safecall;
    function Get_Base: IUMLAssociationEnd; safecall;
    procedure Set_Base(const Value: IUMLAssociationEnd); safecall;
    procedure ClearAvailableQualifiers; safecall;
    procedure AddAvailableQualifier(const Value: IUMLAttribute); safecall;
    procedure RemoveAvailableQualifier(const Value: IUMLAttribute); safecall;
    procedure InsertAvailableQualifier(Index: Integer; const Value: IUMLAttribute); safecall;
    procedure DeleteAvailableQualifier(Index: Integer); safecall;
    function IndexOfAvailableQualifier(const Value: IUMLAttribute): Integer; safecall;
    function GetAvailableQualifierAt(Index: Integer): IUMLAttribute; safecall;
    function GetAvailableQualifierCount: Integer; safecall;
  end;

  // PUMLTransitionAuto
  PUMLTransitionAuto = class(PUMLModelElementAuto, IUMLTransition)
  protected
    function Get_GuardCondition: WideString; safecall;
    procedure Set_GuardCondition(const Value: WideString); safecall;
    function GetEffectAt(Index: Integer): IUMLAction; safecall;
    function GetEffectCount: Integer; safecall;
    function Get_State: IUMLState; safecall;
    function GetTriggerAt(Index: Integer): IUMLEvent; safecall;
    function GetTriggerCount: Integer; safecall;
    function Get_StateMachine: IUMLStateMachine; safecall;
    function Get_Source: IUMLStateVertex; safecall;
    procedure Set_Source(const Value: IUMLStateVertex); safecall;
    function Get_Target: IUMLStateVertex; safecall;
    procedure Set_Target(const Value: IUMLStateVertex); safecall;
  end;

  // PUMLExtensionPointAuto
  PUMLExtensionPointAuto = class(PUMLModelElementAuto, IUMLExtensionPoint)
  protected
    function Get_Location: WideString; safecall;
    procedure Set_Location(const Value: WideString); safecall;
    function Get_UseCase: IUMLUseCase; safecall;
    procedure ClearExtends; safecall;
    procedure AddExtend(const Value: IUMLExtend); safecall;
    procedure RemoveExtend(const Value: IUMLExtend); safecall;
    procedure InsertExtend(Index: Integer; const Value: IUMLExtend); safecall;
    procedure DeleteExtend(Index: Integer); safecall;
    function IndexOfExtend(const Value: IUMLExtend): Integer; safecall;
    function GetExtendAt(Index: Integer): IUMLExtend; safecall;
    function GetExtendCount: Integer; safecall;
  end;

  // PUMLLinkAuto
  PUMLLinkAuto = class(PUMLModelElementAuto, IUMLLink)
  protected
    function Get_Association: IUMLAssociation; safecall;
    procedure Set_Association(const Value: IUMLAssociation); safecall;
    function GetConnectionAt(Index: Integer): IUMLLinkEnd; safecall;
    function GetConnectionCount: Integer; safecall;
    procedure ClearStimuli; safecall;
    procedure AddStimulus(const Value: IUMLStimulus); safecall;
    procedure RemoveStimulus(const Value: IUMLStimulus); safecall;
    procedure InsertStimulus(Index: Integer; const Value: IUMLStimulus); safecall;
    procedure DeleteStimulus(Index: Integer); safecall;
    function IndexOfStimulus(const Value: IUMLStimulus): Integer; safecall;
    function GetStimulusAt(Index: Integer): IUMLStimulus; safecall;
    function GetStimulusCount: Integer; safecall;
    function Get_Owner: IUMLInstance; safecall;
    function Get_LinkObject: IUMLLinkObject; safecall;
    procedure Set_LinkObject(const Value: IUMLLinkObject); safecall;
    procedure ClearPlayedRoles; safecall;
    procedure AddPlayedRole(const Value: IUMLAssociationRole); safecall;
    procedure RemovePlayedRole(const Value: IUMLAssociationRole); safecall;
    procedure InsertPlayedRole(Index: Integer; const Value: IUMLAssociationRole); safecall;
    procedure DeletePlayedRole(Index: Integer); safecall;
    function IndexOfPlayedRole(const Value: IUMLAssociationRole): Integer; safecall;
    function GetPlayedRoleAt(Index: Integer): IUMLAssociationRole; safecall;
    function GetPlayedRoleCount: Integer; safecall;
    function Get_CollaborationInstanceSet: IUMLCollaborationInstanceSet; safecall;
  end;

  // PUMLCommentAuto
  PUMLCommentAuto = class(PUMLModelElementAuto, IUMLComment)
  protected
    function Get_Body: WideString; safecall;
    procedure Set_Body(const Value: WideString); safecall;
    procedure ClearAnnotatedElements; safecall;
    procedure AddAnnotatedElement(const Value: IUMLModelElement); safecall;
    procedure RemoveAnnotatedElement(const Value: IUMLModelElement); safecall;
    procedure InsertAnnotatedElement(Index: Integer; const Value: IUMLModelElement); safecall;
    procedure DeleteAnnotatedElement(Index: Integer); safecall;
    function IndexOfAnnotatedElement(const Value: IUMLModelElement): Integer; safecall;
    function GetAnnotatedElementAt(Index: Integer): IUMLModelElement; safecall;
    function GetAnnotatedElementCount: Integer; safecall;
  end;

  // PUMLTemplateParameterAuto
  PUMLTemplateParameterAuto = class(PUMLElementAuto, IUMLTemplateParameter)
  protected
    function Get_ParameterType: WideString; safecall;
    procedure Set_ParameterType(const Value: WideString); safecall;
    function Get_DefaultValue: WideString; safecall;
    procedure Set_DefaultValue(const Value: WideString); safecall;
    function Get_DefaultElement: IUMLModelElement; safecall;
    procedure Set_DefaultElement(const Value: IUMLModelElement); safecall;
    function Get_Template: IUMLModelElement; safecall;
    function Get_Parameter: IUMLModelElement; safecall;
  end;

  // PUMLTemplateArgumentAuto
  PUMLTemplateArgumentAuto = class(PUMLElementAuto, IUMLTemplateArgument)
  protected
    function Get_ModelElement: IUMLModelElement; safecall;
    procedure Set_ModelElement(const Value: IUMLModelElement); safecall;
  end;

  // PUMLElementImportAuto
  PUMLElementImportAuto = class(PUMLElementAuto, IUMLElementImport)
  protected
    function Get_Visibility: UMLVisibilityKind; safecall;
    procedure Set_Visibility(Value: UMLVisibilityKind); safecall;
    function Get_Alias: WideString; safecall;
    procedure Set_Alias(const Value: WideString); safecall;
    function Get_IsSpecification: WordBool; safecall;
    procedure Set_IsSpecification(Value: WordBool); safecall;
    function Get_ImportedElement: IUMLModelElement; safecall;
    procedure Set_ImportedElement(const Value: IUMLModelElement); safecall;
    function Get_Package: IUMLPackage; safecall;
  end;

  // PUMLDiagramAuto
  PUMLDiagramAuto = class(PDiagramAuto, IUMLDiagram)
  protected
  end;

  // PUMLDeploymentDiagramAuto
  PUMLDeploymentDiagramAuto = class(PUMLDiagramAuto, IUMLDeploymentDiagram)
  protected
  end;

  // PUMLComponentDiagramAuto
  PUMLComponentDiagramAuto = class(PUMLDiagramAuto, IUMLComponentDiagram)
  protected
  end;

  // PUMLSequenceDiagramAuto
  PUMLSequenceDiagramAuto = class(PUMLDiagramAuto, IUMLSequenceDiagram)
  protected
    function Get_ShowSequenceNumber: WordBool; safecall;
    procedure Set_ShowSequenceNumber(Value: WordBool); safecall;
    function Get_MessageSignature: UMLMessageSignatureKind; safecall;
    procedure Set_MessageSignature(Value: UMLMessageSignatureKind); safecall;
    function Get_ShowActivation: WordBool; safecall;
    procedure Set_ShowActivation(Value: WordBool); safecall;
  end;

  // PUMLCollaborationDiagramAuto
  PUMLCollaborationDiagramAuto = class(PUMLDiagramAuto, IUMLCollaborationDiagram)
  protected
    function Get_ShowSequenceNumber: WordBool; safecall;
    procedure Set_ShowSequenceNumber(Value: WordBool); safecall;
    function Get_MessageSignature: UMLMessageSignatureKind; safecall;
    procedure Set_MessageSignature(Value: UMLMessageSignatureKind); safecall;
  end;

  // PUMLSequenceRoleDiagramAuto
  PUMLSequenceRoleDiagramAuto = class(PUMLDiagramAuto, IUMLSequenceRoleDiagram)
  protected
    function Get_ShowSequenceNumber: WordBool; safecall;
    procedure Set_ShowSequenceNumber(Value: WordBool); safecall;
    function Get_MessageSignature: UMLMessageSignatureKind; safecall;
    procedure Set_MessageSignature(Value: UMLMessageSignatureKind); safecall;
    function Get_ShowActivation: WordBool; safecall;
    procedure Set_ShowActivation(Value: WordBool); safecall;
  end;

  // PUMLUseCaseDiagramAuto
  PUMLUseCaseDiagramAuto = class(PUMLDiagramAuto, IUMLUseCaseDiagram)
  protected
  end;

  // PUMLClassDiagramAuto
  PUMLClassDiagramAuto = class(PUMLDiagramAuto, IUMLClassDiagram)
  protected
  end;

  // PUMLActivityDiagramAuto
  PUMLActivityDiagramAuto = class(PUMLDiagramAuto, IUMLActivityDiagram)
  protected
  end;

  // PUMLCollaborationRoleDiagramAuto
  PUMLCollaborationRoleDiagramAuto = class(PUMLDiagramAuto, IUMLCollaborationRoleDiagram)
  protected
    function Get_ShowSequenceNumber: WordBool; safecall;
    procedure Set_ShowSequenceNumber(Value: WordBool); safecall;
    function Get_MessageSignature: UMLMessageSignatureKind; safecall;
    procedure Set_MessageSignature(Value: UMLMessageSignatureKind); safecall;
  end;

  // PUMLCompositeStructureDiagramAuto
  PUMLCompositeStructureDiagramAuto = class(PUMLDiagramAuto, IUMLCompositeStructureDiagram)
  protected
  end;

  // PUMLStatechartDiagramAuto
  PUMLStatechartDiagramAuto = class(PUMLDiagramAuto, IUMLStatechartDiagram)
  protected
  end;

implementation

uses
  BasicClasses, Core, UMLModels, StarUMLApp;

////////////////////////////////////////////////////////////////////////////////
// PUMLElementAuto

// PUMLElementAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLModelElementAuto

function PUMLModelElementAuto.Get_Visibility: UMLVisibilityKind;
begin
  Result := Ord((TheObject as PUMLModelElement).Visibility);
end;

procedure PUMLModelElementAuto.Set_Visibility(Value: UMLVisibilityKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Visibility', UMLVisibilityKindToString(PUMLVisibilityKind(Value)));
end;

function PUMLModelElementAuto.Get_IsSpecification: WordBool;
begin
  Result := (TheObject as PUMLModelElement).IsSpecification;
end;

procedure PUMLModelElementAuto.Set_IsSpecification(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsSpecification', BooleanToString(Value));
end;

procedure PUMLModelElementAuto.ClearElementImports;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ElementImports;');
end;

procedure PUMLModelElementAuto.AddElementImport(const Value: IUMLElementImport);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLElementImport').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ElementImports', E as PModel);
end;

procedure PUMLModelElementAuto.RemoveElementImport(const Value: IUMLElementImport);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLElementImport').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ElementImports', E as PModel);
end;

procedure PUMLModelElementAuto.InsertElementImport(Index: Integer; const Value: IUMLElementImport);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLElementImport').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ElementImports', Index, E as PModel);
end;

procedure PUMLModelElementAuto.DeleteElementImport(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ElementImports', Index);
end;

function PUMLModelElementAuto.IndexOfElementImport(const Value: IUMLElementImport): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLElementImport').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLModelElement).IndexOfElementImport(E as PUMLElementImport);
  end;
end;

function PUMLModelElementAuto.GetElementImportAt(Index: Integer): IUMLElementImport;
var
  E: PUMLElementImport;
begin
  E := (TheObject as PUMLModelElement).ElementImports[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLElementImportAuto;
end;

function PUMLModelElementAuto.GetElementImportCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).ElementImportCount;
end;

function PUMLModelElementAuto.Get_Namespace: IUMLNamespace;
var
  E: PUMLNamespace;
begin
  E := (TheObject as PUMLModelElement).Namespace;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLNamespaceAuto;
end;

procedure PUMLModelElementAuto.ClearClientDependencies;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ClientDependencies;');
end;

procedure PUMLModelElementAuto.AddClientDependency(const Value: IUMLDependency);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLDependency').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ClientDependencies', E as PModel);
end;

procedure PUMLModelElementAuto.RemoveClientDependency(const Value: IUMLDependency);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLDependency').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ClientDependencies', E as PModel);
end;

procedure PUMLModelElementAuto.InsertClientDependency(Index: Integer; const Value: IUMLDependency);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLDependency').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ClientDependencies', Index, E as PModel);
end;

procedure PUMLModelElementAuto.DeleteClientDependency(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ClientDependencies', Index);
end;

function PUMLModelElementAuto.IndexOfClientDependency(const Value: IUMLDependency): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLDependency').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLModelElement).IndexOfClientDependency(E as PUMLDependency);
  end;
end;

function PUMLModelElementAuto.GetClientDependencyAt(Index: Integer): IUMLDependency;
var
  E: PUMLDependency;
begin
  E := (TheObject as PUMLModelElement).ClientDependencies[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLDependencyAuto;
end;

function PUMLModelElementAuto.GetClientDependencyCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).ClientDependencyCount;
end;

procedure PUMLModelElementAuto.ClearSupplierDependencies;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'SupplierDependencies;');
end;

procedure PUMLModelElementAuto.AddSupplierDependency(const Value: IUMLDependency);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLDependency').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'SupplierDependencies', E as PModel);
end;

procedure PUMLModelElementAuto.RemoveSupplierDependency(const Value: IUMLDependency);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLDependency').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'SupplierDependencies', E as PModel);
end;

procedure PUMLModelElementAuto.InsertSupplierDependency(Index: Integer; const Value: IUMLDependency);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLDependency').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'SupplierDependencies', Index, E as PModel);
end;

procedure PUMLModelElementAuto.DeleteSupplierDependency(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'SupplierDependencies', Index);
end;

function PUMLModelElementAuto.IndexOfSupplierDependency(const Value: IUMLDependency): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLDependency').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLModelElement).IndexOfSupplierDependency(E as PUMLDependency);
  end;
end;

function PUMLModelElementAuto.GetSupplierDependencyAt(Index: Integer): IUMLDependency;
var
  E: PUMLDependency;
begin
  E := (TheObject as PUMLModelElement).SupplierDependencies[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLDependencyAuto;
end;

function PUMLModelElementAuto.GetSupplierDependencyCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).SupplierDependencyCount;
end;

procedure PUMLModelElementAuto.ClearDefaultParameters;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'DefaultParameters;');
end;

procedure PUMLModelElementAuto.AddDefaultParameter(const Value: IUMLTemplateParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTemplateParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'DefaultParameters', E as PModel);
end;

procedure PUMLModelElementAuto.RemoveDefaultParameter(const Value: IUMLTemplateParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTemplateParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'DefaultParameters', E as PModel);
end;

procedure PUMLModelElementAuto.InsertDefaultParameter(Index: Integer; const Value: IUMLTemplateParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTemplateParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'DefaultParameters', Index, E as PModel);
end;

procedure PUMLModelElementAuto.DeleteDefaultParameter(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'DefaultParameters', Index);
end;

function PUMLModelElementAuto.IndexOfDefaultParameter(const Value: IUMLTemplateParameter): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLTemplateParameter').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLModelElement).IndexOfDefaultParameter(E as PUMLTemplateParameter);
  end;
end;

function PUMLModelElementAuto.GetDefaultParameterAt(Index: Integer): IUMLTemplateParameter;
var
  E: PUMLTemplateParameter;
begin
  E := (TheObject as PUMLModelElement).DefaultParameters[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTemplateParameterAuto;
end;

function PUMLModelElementAuto.GetDefaultParameterCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).DefaultParameterCount;
end;

procedure PUMLModelElementAuto.ClearComments;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Comments;');
end;

procedure PUMLModelElementAuto.AddComment(const Value: IUMLComment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Comments', E as PModel);
end;

procedure PUMLModelElementAuto.RemoveComment(const Value: IUMLComment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Comments', E as PModel);
end;

procedure PUMLModelElementAuto.InsertComment(Index: Integer; const Value: IUMLComment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Comments', Index, E as PModel);
end;

procedure PUMLModelElementAuto.DeleteComment(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Comments', Index);
end;

function PUMLModelElementAuto.IndexOfComment(const Value: IUMLComment): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLComment').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLModelElement).IndexOfComment(E as PUMLComment);
  end;
end;

function PUMLModelElementAuto.GetCommentAt(Index: Integer): IUMLComment;
var
  E: PUMLComment;
begin
  E := (TheObject as PUMLModelElement).Comments[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCommentAuto;
end;

function PUMLModelElementAuto.GetCommentCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).CommentCount;
end;

function PUMLModelElementAuto.Get_Container: IUMLComponent;
var
  E: PUMLComponent;
begin
  E := (TheObject as PUMLModelElement).Container;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLComponentAuto;
end;

procedure PUMLModelElementAuto.Set_Container(const Value: IUMLComponent);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Container', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Container', E as PModel);
  end;
end;

function PUMLModelElementAuto.GetTemplateParameterAt(Index: Integer): IUMLTemplateParameter;
var
  E: PUMLTemplateParameter;
begin
  E := (TheObject as PUMLModelElement).TemplateParameters[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTemplateParameterAuto;
end;

function PUMLModelElementAuto.GetTemplateParameterCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).TemplateParameterCount;
end;

function PUMLModelElementAuto.Get_ParameterOwner: IUMLTemplateParameter;
var
  E: PUMLTemplateParameter;
begin
  E := (TheObject as PUMLModelElement).ParameterOwner;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTemplateParameterAuto;
end;

procedure PUMLModelElementAuto.ClearTemplateArguments;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'TemplateArguments;');
end;

procedure PUMLModelElementAuto.AddTemplateArgument(const Value: IUMLTemplateArgument);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTemplateArgument').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'TemplateArguments', E as PModel);
end;

procedure PUMLModelElementAuto.RemoveTemplateArgument(const Value: IUMLTemplateArgument);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTemplateArgument').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'TemplateArguments', E as PModel);
end;

procedure PUMLModelElementAuto.InsertTemplateArgument(Index: Integer; const Value: IUMLTemplateArgument);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTemplateArgument').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'TemplateArguments', Index, E as PModel);
end;

procedure PUMLModelElementAuto.DeleteTemplateArgument(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'TemplateArguments', Index);
end;

function PUMLModelElementAuto.IndexOfTemplateArgument(const Value: IUMLTemplateArgument): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLTemplateArgument').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLModelElement).IndexOfTemplateArgument(E as PUMLTemplateArgument);
  end;
end;

function PUMLModelElementAuto.GetTemplateArgumentAt(Index: Integer): IUMLTemplateArgument;
var
  E: PUMLTemplateArgument;
begin
  E := (TheObject as PUMLModelElement).TemplateArguments[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTemplateArgumentAuto;
end;

function PUMLModelElementAuto.GetTemplateArgumentCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).TemplateArgumentCount;
end;

function PUMLModelElementAuto.GetBehaviorAt(Index: Integer): IUMLStateMachine;
var
  E: PUMLStateMachine;
begin
  E := (TheObject as PUMLModelElement).Behaviors[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateMachineAuto;
end;

function PUMLModelElementAuto.GetBehaviorCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).BehaviorCount;
end;

procedure PUMLModelElementAuto.ClearContentRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ContentRoles;');
end;

procedure PUMLModelElementAuto.AddContentRole(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ContentRoles', E as PModel);
end;

procedure PUMLModelElementAuto.RemoveContentRole(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ContentRoles', E as PModel);
end;

procedure PUMLModelElementAuto.InsertContentRole(Index: Integer; const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ContentRoles', Index, E as PModel);
end;

procedure PUMLModelElementAuto.DeleteContentRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ContentRoles', Index);
end;

function PUMLModelElementAuto.IndexOfContentRole(const Value: IUMLClassifierRole): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLModelElement).IndexOfContentRole(E as PUMLClassifierRole);
  end;
end;

function PUMLModelElementAuto.GetContentRoleAt(Index: Integer): IUMLClassifierRole;
var
  E: PUMLClassifierRole;
begin
  E := (TheObject as PUMLModelElement).ContentRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierRoleAuto;
end;

function PUMLModelElementAuto.GetContentRoleCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).ContentRoleCount;
end;

procedure PUMLModelElementAuto.ClearOwnerPartitions;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'OwnerPartitions;');
end;

procedure PUMLModelElementAuto.AddOwnerPartition(const Value: IUMLPartition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLPartition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'OwnerPartitions', E as PModel);
end;

procedure PUMLModelElementAuto.RemoveOwnerPartition(const Value: IUMLPartition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLPartition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'OwnerPartitions', E as PModel);
end;

procedure PUMLModelElementAuto.InsertOwnerPartition(Index: Integer; const Value: IUMLPartition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLPartition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'OwnerPartitions', Index, E as PModel);
end;

procedure PUMLModelElementAuto.DeleteOwnerPartition(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'OwnerPartitions', Index);
end;

function PUMLModelElementAuto.IndexOfOwnerPartition(const Value: IUMLPartition): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLPartition').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLModelElement).IndexOfOwnerPartition(E as PUMLPartition);
  end;
end;

function PUMLModelElementAuto.GetOwnerPartitionAt(Index: Integer): IUMLPartition;
var
  E: PUMLPartition;
begin
  E := (TheObject as PUMLModelElement).OwnerPartitions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLPartitionAuto;
end;

function PUMLModelElementAuto.GetOwnerPartitionCount: Integer;
begin
  Result := (TheObject as PUMLModelElement).OwnerPartitionCount;
end;

// PUMLModelElementAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLLinkEndAuto

function PUMLLinkEndAuto.Get_Instance: IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLLinkEnd).Instance;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

procedure PUMLLinkEndAuto.Set_Instance(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Instance', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Instance', E as PModel);
  end;
end;

function PUMLLinkEndAuto.Get_Link: IUMLLink;
var
  E: PUMLLink;
begin
  E := (TheObject as PUMLLinkEnd).Link;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkAuto;
end;

function PUMLLinkEndAuto.Get_AssociationEnd: IUMLAssociationEnd;
var
  E: PUMLAssociationEnd;
begin
  E := (TheObject as PUMLLinkEnd).AssociationEnd;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationEndAuto;
end;

procedure PUMLLinkEndAuto.Set_AssociationEnd(const Value: IUMLAssociationEnd);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'AssociationEnd', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationEnd').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'AssociationEnd', E as PModel);
  end;
end;

function PUMLLinkEndAuto.GetQualifiedValueAt(Index: Integer): IUMLAttributeLink;
var
  E: PUMLAttributeLink;
begin
  E := (TheObject as PUMLLinkEnd).QualifiedValues[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeLinkAuto;
end;

function PUMLLinkEndAuto.GetQualifiedValueCount: Integer;
begin
  Result := (TheObject as PUMLLinkEnd).QualifiedValueCount;
end;

function PUMLLinkEndAuto.GetOtherSide: IUMLLinkEnd;
var
  L: PUMLLink;
  OtherSide: PUMLLinkEnd;
begin
  L := (TheObject as PUMLLinkEnd).Link;
  OtherSide := L.Connections[1 - L.IndexOfConnection(TheObject as PUMLLinkEnd)];
  Result := OtherSide.GetAutomationObject as IUMLLinkEnd;
end;

// PUMLLinkEndAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLLinkObjectAuto

function PUMLLinkObjectAuto.Get_LinkSide: IUMLLink;
var
  E: PUMLLink;
begin
  E := (TheObject as PUMLLinkObject).LinkSide;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkAuto;
end;

procedure PUMLLinkObjectAuto.Set_LinkSide(const Value: IUMLLink);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'LinkSide', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'LinkSide', E as PModel);
  end;
end;

function PUMLLinkObjectAuto.Get_ObjectSide: IUMLObject;
var
  E: PUMLObject;
begin
  E := (TheObject as PUMLLinkObject).ObjectSide;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLObjectAuto;
end;

procedure PUMLLinkObjectAuto.Set_ObjectSide(const Value: IUMLObject);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ObjectSide', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLObject').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ObjectSide', E as PModel);
  end;
end;

// PUMLLinkObjectAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPartitionAuto

procedure PUMLPartitionAuto.ClearContents;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Contents;');
end;

procedure PUMLPartitionAuto.AddContent(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Contents', E as PModel);
end;

procedure PUMLPartitionAuto.RemoveContent(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Contents', E as PModel);
end;

procedure PUMLPartitionAuto.InsertContent(Index: Integer; const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Contents', Index, E as PModel);
end;

procedure PUMLPartitionAuto.DeleteContent(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Contents', Index);
end;

function PUMLPartitionAuto.IndexOfContent(const Value: IUMLModelElement): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLPartition).IndexOfContent(E as PUMLModelElement);
  end;
end;

function PUMLPartitionAuto.GetContentAt(Index: Integer): IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLPartition).Contents[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

function PUMLPartitionAuto.GetContentCount: Integer;
begin
  Result := (TheObject as PUMLPartition).ContentCount;
end;

function PUMLPartitionAuto.Get_ActivityGraph: IUMLActivityGraph;
var
  E: PUMLActivityGraph;
begin
  E := (TheObject as PUMLPartition).ActivityGraph;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActivityGraphAuto;
end;

// PUMLPartitionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInteractionFragmentAuto

function PUMLInteractionFragmentAuto.Get_EnclosingOperand: IUMLInteractionOperand;
var
  E: PUMLInteractionOperand;
begin
  E := (TheObject as PUMLInteractionFragment).EnclosingOperand;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionOperandAuto;
end;

procedure PUMLInteractionFragmentAuto.Set_EnclosingOperand(const Value: IUMLInteractionOperand);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'EnclosingOperand', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLInteractionOperand').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'EnclosingOperand', E as PModel);
  end;
end;

function PUMLInteractionFragmentAuto.Get_EnclosingInteraction: IUMLInteraction;
var
  E: PUMLInteraction;
begin
  E := (TheObject as PUMLInteractionFragment).EnclosingInteraction;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionAuto;
end;

procedure PUMLInteractionFragmentAuto.Set_EnclosingInteraction(const Value: IUMLInteraction);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'EnclosingInteraction', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLInteraction').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'EnclosingInteraction', E as PModel);
  end;
end;

function PUMLInteractionFragmentAuto.Get_EnclosingInteractionInstanceSet: IUMLInteractionInstanceSet;
var
  E: PUMLInteractionInstanceSet;
begin
  E := (TheObject as PUMLInteractionFragment).EnclosingInteractionInstanceSet;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionInstanceSetAuto;
end;

procedure PUMLInteractionFragmentAuto.Set_EnclosingInteractionInstanceSet(const Value: IUMLInteractionInstanceSet);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'EnclosingInteractionInstanceSet', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLInteractionInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'EnclosingInteractionInstanceSet', E as PModel);
  end;
end;

// PUMLInteractionFragmentAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInteractionOperandAuto

function PUMLInteractionOperandAuto.Get_Guard: WideString;
begin
  Result := (TheObject as PUMLInteractionOperand).Guard;
end;

procedure PUMLInteractionOperandAuto.Set_Guard(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Guard', Value);
end;

function PUMLInteractionOperandAuto.Get_CombinedFragment: IUMLCombinedFragment;
var
  E: PUMLCombinedFragment;
begin
  E := (TheObject as PUMLInteractionOperand).CombinedFragment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCombinedFragmentAuto;
end;

procedure PUMLInteractionOperandAuto.Set_CombinedFragment(const Value: IUMLCombinedFragment);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'CombinedFragment', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLCombinedFragment').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'CombinedFragment', E as PModel);
  end;
end;

procedure PUMLInteractionOperandAuto.ClearFragments;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Fragments;');
end;

procedure PUMLInteractionOperandAuto.AddFragment(const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Fragments', E as PModel);
end;

procedure PUMLInteractionOperandAuto.RemoveFragment(const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Fragments', E as PModel);
end;

procedure PUMLInteractionOperandAuto.InsertFragment(Index: Integer; const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Fragments', Index, E as PModel);
end;

procedure PUMLInteractionOperandAuto.DeleteFragment(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Fragments', Index);
end;

function PUMLInteractionOperandAuto.IndexOfFragment(const Value: IUMLInteractionFragment): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInteractionOperand).IndexOfFragment(E as PUMLInteractionFragment);
  end;
end;

function PUMLInteractionOperandAuto.GetFragmentAt(Index: Integer): IUMLInteractionFragment;
var
  E: PUMLInteractionFragment;
begin
  E := (TheObject as PUMLInteractionOperand).Fragments[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionFragmentAuto;
end;

function PUMLInteractionOperandAuto.GetFragmentCount: Integer;
begin
  Result := (TheObject as PUMLInteractionOperand).FragmentCount;
end;

// PUMLInteractionOperandAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCombinedFragmentAuto

function PUMLCombinedFragmentAuto.Get_InteractionOperator: UMLInteractionOperatorKind;
begin
  Result := Ord((TheObject as PUMLCombinedFragment).InteractionOperator);
end;

procedure PUMLCombinedFragmentAuto.Set_InteractionOperator(Value: UMLInteractionOperatorKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'InteractionOperator', UMLInteractionOperatorKindToString(PUMLInteractionOperatorKind(Value)));
end;

procedure PUMLCombinedFragmentAuto.ClearOperands;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Operands;');
end;

procedure PUMLCombinedFragmentAuto.AddOperand(const Value: IUMLInteractionOperand);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionOperand').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Operands', E as PModel);
end;

procedure PUMLCombinedFragmentAuto.RemoveOperand(const Value: IUMLInteractionOperand);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionOperand').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Operands', E as PModel);
end;

procedure PUMLCombinedFragmentAuto.InsertOperand(Index: Integer; const Value: IUMLInteractionOperand);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionOperand').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Operands', Index, E as PModel);
end;

procedure PUMLCombinedFragmentAuto.DeleteOperand(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Operands', Index);
end;

function PUMLCombinedFragmentAuto.IndexOfOperand(const Value: IUMLInteractionOperand): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInteractionOperand').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLCombinedFragment).IndexOfOperand(E as PUMLInteractionOperand);
  end;
end;

function PUMLCombinedFragmentAuto.GetOperandAt(Index: Integer): IUMLInteractionOperand;
var
  E: PUMLInteractionOperand;
begin
  E := (TheObject as PUMLCombinedFragment).Operands[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionOperandAuto;
end;

function PUMLCombinedFragmentAuto.GetOperandCount: Integer;
begin
  Result := (TheObject as PUMLCombinedFragment).OperandCount;
end;

// PUMLCombinedFragmentAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInteractionInstanceSetAuto

function PUMLInteractionInstanceSetAuto.Get_Context: IUMLCollaborationInstanceSet;
var
  E: PUMLCollaborationInstanceSet;
begin
  E := (TheObject as PUMLInteractionInstanceSet).Context;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationInstanceSetAuto;
end;

function PUMLInteractionInstanceSetAuto.Get_Interaction: IUMLInteraction;
var
  E: PUMLInteraction;
begin
  E := (TheObject as PUMLInteractionInstanceSet).Interaction;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionAuto;
end;

procedure PUMLInteractionInstanceSetAuto.Set_Interaction(const Value: IUMLInteraction);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Interaction', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLInteraction').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Interaction', E as PModel);
  end;
end;

function PUMLInteractionInstanceSetAuto.GetParticipatingStimulusAt(Index: Integer): IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLInteractionInstanceSet).ParticipatingStimuli[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

function PUMLInteractionInstanceSetAuto.GetParticipatingStimulusCount: Integer;
begin
  Result := (TheObject as PUMLInteractionInstanceSet).ParticipatingStimulusCount;
end;

procedure PUMLInteractionInstanceSetAuto.ClearFragments;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Fragments;');
end;

procedure PUMLInteractionInstanceSetAuto.AddFragment(const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Fragments', E as PModel);
end;

procedure PUMLInteractionInstanceSetAuto.RemoveFragment(const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Fragments', E as PModel);
end;

procedure PUMLInteractionInstanceSetAuto.InsertFragment(Index: Integer; const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Fragments', Index, E as PModel);
end;

procedure PUMLInteractionInstanceSetAuto.DeleteFragment(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Fragments', Index);
end;

function PUMLInteractionInstanceSetAuto.IndexOfFragment(const Value: IUMLInteractionFragment): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInteractionInstanceSet).IndexOfFragment(E as PUMLInteractionFragment);
  end;
end;

function PUMLInteractionInstanceSetAuto.GetFragmentAt(Index: Integer): IUMLInteractionFragment;
var
  E: PUMLInteractionFragment;
begin
  E := (TheObject as PUMLInteractionInstanceSet).Fragments[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionFragmentAuto;
end;

function PUMLInteractionInstanceSetAuto.GetFragmentCount: Integer;
begin
  Result := (TheObject as PUMLInteractionInstanceSet).FragmentCount;
end;

// PUMLInteractionInstanceSetAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInstanceAuto

function PUMLInstanceAuto.Get_IsMultiInstance: WordBool;
begin
  Result := (TheObject as PUMLInstance).IsMultiInstance;
end;

procedure PUMLInstanceAuto.Set_IsMultiInstance(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsMultiInstance', BooleanToString(Value));
end;

function PUMLInstanceAuto.Get_Classifier: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLInstance).Classifier;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLInstanceAuto.Set_Classifier(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Classifier', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Classifier', E as PModel);
  end;
end;

procedure PUMLInstanceAuto.ClearAttributeLinks;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AttributeLinks;');
end;

procedure PUMLInstanceAuto.AddAttributeLink(const Value: IUMLAttributeLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttributeLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AttributeLinks', E as PModel);
end;

procedure PUMLInstanceAuto.RemoveAttributeLink(const Value: IUMLAttributeLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttributeLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AttributeLinks', E as PModel);
end;

procedure PUMLInstanceAuto.InsertAttributeLink(Index: Integer; const Value: IUMLAttributeLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttributeLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AttributeLinks', Index, E as PModel);
end;

procedure PUMLInstanceAuto.DeleteAttributeLink(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AttributeLinks', Index);
end;

function PUMLInstanceAuto.IndexOfAttributeLink(const Value: IUMLAttributeLink): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLAttributeLink').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInstance).IndexOfAttributeLink(E as PUMLAttributeLink);
  end;
end;

function PUMLInstanceAuto.GetAttributeLinkAt(Index: Integer): IUMLAttributeLink;
var
  E: PUMLAttributeLink;
begin
  E := (TheObject as PUMLInstance).AttributeLinks[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeLinkAuto;
end;

function PUMLInstanceAuto.GetAttributeLinkCount: Integer;
begin
  Result := (TheObject as PUMLInstance).AttributeLinkCount;
end;

procedure PUMLInstanceAuto.ClearLinkEnds;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'LinkEnds;');
end;

procedure PUMLInstanceAuto.AddLinkEnd(const Value: IUMLLinkEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLinkEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'LinkEnds', E as PModel);
end;

procedure PUMLInstanceAuto.RemoveLinkEnd(const Value: IUMLLinkEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLinkEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'LinkEnds', E as PModel);
end;

procedure PUMLInstanceAuto.InsertLinkEnd(Index: Integer; const Value: IUMLLinkEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLinkEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'LinkEnds', Index, E as PModel);
end;

procedure PUMLInstanceAuto.DeleteLinkEnd(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'LinkEnds', Index);
end;

function PUMLInstanceAuto.IndexOfLinkEnd(const Value: IUMLLinkEnd): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLLinkEnd').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInstance).IndexOfLinkEnd(E as PUMLLinkEnd);
  end;
end;

function PUMLInstanceAuto.GetLinkEndAt(Index: Integer): IUMLLinkEnd;
var
  E: PUMLLinkEnd;
begin
  E := (TheObject as PUMLInstance).LinkEnds[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkEndAuto;
end;

function PUMLInstanceAuto.GetLinkEndCount: Integer;
begin
  Result := (TheObject as PUMLInstance).LinkEndCount;
end;

function PUMLInstanceAuto.GetSlotAt(Index: Integer): IUMLAttributeLink;
var
  E: PUMLAttributeLink;
begin
  E := (TheObject as PUMLInstance).Slots[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeLinkAuto;
end;

function PUMLInstanceAuto.GetSlotCount: Integer;
begin
  Result := (TheObject as PUMLInstance).SlotCount;
end;

procedure PUMLInstanceAuto.ClearSendingStimuli;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'SendingStimuli;');
end;

procedure PUMLInstanceAuto.AddSendingStimulus(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'SendingStimuli', E as PModel);
end;

procedure PUMLInstanceAuto.RemoveSendingStimulus(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'SendingStimuli', E as PModel);
end;

procedure PUMLInstanceAuto.InsertSendingStimulus(Index: Integer; const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'SendingStimuli', Index, E as PModel);
end;

procedure PUMLInstanceAuto.DeleteSendingStimulus(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'SendingStimuli', Index);
end;

function PUMLInstanceAuto.IndexOfSendingStimulus(const Value: IUMLStimulus): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInstance).IndexOfSendingStimulus(E as PUMLStimulus);
  end;
end;

function PUMLInstanceAuto.GetSendingStimulusAt(Index: Integer): IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLInstance).SendingStimuli[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

function PUMLInstanceAuto.GetSendingStimulusCount: Integer;
begin
  Result := (TheObject as PUMLInstance).SendingStimulusCount;
end;

function PUMLInstanceAuto.Get_ComponentInstance: IUMLComponentInstance;
var
  E: PUMLComponentInstance;
begin
  E := (TheObject as PUMLInstance).ComponentInstance;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLComponentInstanceAuto;
end;

procedure PUMLInstanceAuto.Set_ComponentInstance(const Value: IUMLComponentInstance);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ComponentInstance', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLComponentInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ComponentInstance', E as PModel);
  end;
end;

procedure PUMLInstanceAuto.ClearReceivingStimuli;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ReceivingStimuli;');
end;

procedure PUMLInstanceAuto.AddReceivingStimulus(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ReceivingStimuli', E as PModel);
end;

procedure PUMLInstanceAuto.RemoveReceivingStimulus(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ReceivingStimuli', E as PModel);
end;

procedure PUMLInstanceAuto.InsertReceivingStimulus(Index: Integer; const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ReceivingStimuli', Index, E as PModel);
end;

procedure PUMLInstanceAuto.DeleteReceivingStimulus(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ReceivingStimuli', Index);
end;

function PUMLInstanceAuto.IndexOfReceivingStimulus(const Value: IUMLStimulus): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInstance).IndexOfReceivingStimulus(E as PUMLStimulus);
  end;
end;

function PUMLInstanceAuto.GetReceivingStimulusAt(Index: Integer): IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLInstance).ReceivingStimuli[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

function PUMLInstanceAuto.GetReceivingStimulusCount: Integer;
begin
  Result := (TheObject as PUMLInstance).ReceivingStimulusCount;
end;

function PUMLInstanceAuto.Get_Owner: IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLInstance).Owner;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

function PUMLInstanceAuto.GetOwnedInstanceAt(Index: Integer): IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLInstance).OwnedInstances[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

function PUMLInstanceAuto.GetOwnedInstanceCount: Integer;
begin
  Result := (TheObject as PUMLInstance).OwnedInstanceCount;
end;

function PUMLInstanceAuto.GetOwnedLinkAt(Index: Integer): IUMLLink;
var
  E: PUMLLink;
begin
  E := (TheObject as PUMLInstance).OwnedLinks[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkAuto;
end;

function PUMLInstanceAuto.GetOwnedLinkCount: Integer;
begin
  Result := (TheObject as PUMLInstance).OwnedLinkCount;
end;

procedure PUMLInstanceAuto.ClearPlayedRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'PlayedRoles;');
end;

procedure PUMLInstanceAuto.AddPlayedRole(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'PlayedRoles', E as PModel);
end;

procedure PUMLInstanceAuto.RemovePlayedRole(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'PlayedRoles', E as PModel);
end;

procedure PUMLInstanceAuto.InsertPlayedRole(Index: Integer; const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'PlayedRoles', Index, E as PModel);
end;

procedure PUMLInstanceAuto.DeletePlayedRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'PlayedRoles', Index);
end;

function PUMLInstanceAuto.IndexOfPlayedRole(const Value: IUMLClassifierRole): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInstance).IndexOfPlayedRole(E as PUMLClassifierRole);
  end;
end;

function PUMLInstanceAuto.GetPlayedRoleAt(Index: Integer): IUMLClassifierRole;
var
  E: PUMLClassifierRole;
begin
  E := (TheObject as PUMLInstance).PlayedRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierRoleAuto;
end;

function PUMLInstanceAuto.GetPlayedRoleCount: Integer;
begin
  Result := (TheObject as PUMLInstance).PlayedRoleCount;
end;

function PUMLInstanceAuto.Get_CollaborationInstanceSet: IUMLCollaborationInstanceSet;
var
  E: PUMLCollaborationInstanceSet;
begin
  E := (TheObject as PUMLInstance).CollaborationInstanceSet;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationInstanceSetAuto;
end;

// PUMLInstanceAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDataValueAuto

// PUMLDataValueAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNodeInstanceAuto

procedure PUMLNodeInstanceAuto.ClearResidents;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Residents;');
end;

procedure PUMLNodeInstanceAuto.AddResident(const Value: IUMLComponentInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponentInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Residents', E as PModel);
end;

procedure PUMLNodeInstanceAuto.RemoveResident(const Value: IUMLComponentInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponentInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Residents', E as PModel);
end;

procedure PUMLNodeInstanceAuto.InsertResident(Index: Integer; const Value: IUMLComponentInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponentInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Residents', Index, E as PModel);
end;

procedure PUMLNodeInstanceAuto.DeleteResident(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Residents', Index);
end;

function PUMLNodeInstanceAuto.IndexOfResident(const Value: IUMLComponentInstance): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLComponentInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLNodeInstance).IndexOfResident(E as PUMLComponentInstance);
  end;
end;

function PUMLNodeInstanceAuto.GetResidentAt(Index: Integer): IUMLComponentInstance;
var
  E: PUMLComponentInstance;
begin
  E := (TheObject as PUMLNodeInstance).Residents[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLComponentInstanceAuto;
end;

function PUMLNodeInstanceAuto.GetResidentCount: Integer;
begin
  Result := (TheObject as PUMLNodeInstance).ResidentCount;
end;

// PUMLNodeInstanceAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLObjectAuto

function PUMLObjectAuto.Get_LinkObject: IUMLLinkObject;
var
  E: PUMLLinkObject;
begin
  E := (TheObject as PUMLObject).LinkObject;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkObjectAuto;
end;

procedure PUMLObjectAuto.Set_LinkObject(const Value: IUMLLinkObject);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'LinkObject', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLLinkObject').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'LinkObject', E as PModel);
  end;
end;

// PUMLObjectAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubsystemInstanceAuto

// PUMLSubsystemInstanceAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLUseCaseInstanceAuto

// PUMLUseCaseInstanceAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponentInstanceAuto

function PUMLComponentInstanceAuto.Get_NodeInstance: IUMLNodeInstance;
var
  E: PUMLNodeInstance;
begin
  E := (TheObject as PUMLComponentInstance).NodeInstance;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLNodeInstanceAuto;
end;

procedure PUMLComponentInstanceAuto.Set_NodeInstance(const Value: IUMLNodeInstance);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'NodeInstance', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLNodeInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'NodeInstance', E as PModel);
  end;
end;

procedure PUMLComponentInstanceAuto.ClearResidents;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Residents;');
end;

procedure PUMLComponentInstanceAuto.AddResident(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Residents', E as PModel);
end;

procedure PUMLComponentInstanceAuto.RemoveResident(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Residents', E as PModel);
end;

procedure PUMLComponentInstanceAuto.InsertResident(Index: Integer; const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Residents', Index, E as PModel);
end;

procedure PUMLComponentInstanceAuto.DeleteResident(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Residents', Index);
end;

function PUMLComponentInstanceAuto.IndexOfResident(const Value: IUMLInstance): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLComponentInstance).IndexOfResident(E as PUMLInstance);
  end;
end;

function PUMLComponentInstanceAuto.GetResidentAt(Index: Integer): IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLComponentInstance).Residents[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

function PUMLComponentInstanceAuto.GetResidentCount: Integer;
begin
  Result := (TheObject as PUMLComponentInstance).ResidentCount;
end;

// PUMLComponentInstanceAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLArgumentAuto

function PUMLArgumentAuto.Get_Value: WideString;
begin
  Result := (TheObject as PUMLArgument).Value;
end;

procedure PUMLArgumentAuto.Set_Value(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Value', Value);
end;

function PUMLArgumentAuto.Get_Action: IUMLAction;
var
  E: PUMLAction;
begin
  E := (TheObject as PUMLArgument).Action;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionAuto;
end;

// PUMLArgumentAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLConnectorEndAuto

function PUMLConnectorEndAuto.Get_Multiplicity: WideString;
begin
  Result := (TheObject as PUMLConnectorEnd).Multiplicity;
end;

procedure PUMLConnectorEndAuto.Set_Multiplicity(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Multiplicity', Value);
end;

function PUMLConnectorEndAuto.Get_IsOrdered: WordBool;
begin
  Result := (TheObject as PUMLConnectorEnd).IsOrdered;
end;

procedure PUMLConnectorEndAuto.Set_IsOrdered(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsOrdered', BooleanToString(Value));
end;

function PUMLConnectorEndAuto.Get_IsUnique: WordBool;
begin
  Result := (TheObject as PUMLConnectorEnd).IsUnique;
end;

procedure PUMLConnectorEndAuto.Set_IsUnique(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsUnique', BooleanToString(Value));
end;

function PUMLConnectorEndAuto.Get_Connector: IUMLConnector;
var
  E: PUMLConnector;
begin
  E := (TheObject as PUMLConnectorEnd).Connector;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLConnectorAuto;
end;

procedure PUMLConnectorEndAuto.Set_Connector(const Value: IUMLConnector);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Connector', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLConnector').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Connector', E as PModel);
  end;
end;

function PUMLConnectorEndAuto.Get_Role: IUMLFeature;
var
  E: PUMLFeature;
begin
  E := (TheObject as PUMLConnectorEnd).Role;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLFeatureAuto;
end;

procedure PUMLConnectorEndAuto.Set_Role(const Value: IUMLFeature);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Role', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLFeature').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Role', E as PModel);
  end;
end;

// PUMLConnectorEndAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStateVertexAuto

function PUMLStateVertexAuto.Get_ContainerState: IUMLCompositeState;
var
  E: PUMLCompositeState;
begin
  E := (TheObject as PUMLStateVertex).ContainerState;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCompositeStateAuto;
end;

procedure PUMLStateVertexAuto.ClearOutgoings;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Outgoings;');
end;

procedure PUMLStateVertexAuto.AddOutgoing(const Value: IUMLTransition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTransition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Outgoings', E as PModel);
end;

procedure PUMLStateVertexAuto.RemoveOutgoing(const Value: IUMLTransition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTransition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Outgoings', E as PModel);
end;

procedure PUMLStateVertexAuto.InsertOutgoing(Index: Integer; const Value: IUMLTransition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTransition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Outgoings', Index, E as PModel);
end;

procedure PUMLStateVertexAuto.DeleteOutgoing(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Outgoings', Index);
end;

function PUMLStateVertexAuto.IndexOfOutgoing(const Value: IUMLTransition): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLTransition').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLStateVertex).IndexOfOutgoing(E as PUMLTransition);
  end;
end;

function PUMLStateVertexAuto.GetOutgoingAt(Index: Integer): IUMLTransition;
var
  E: PUMLTransition;
begin
  E := (TheObject as PUMLStateVertex).Outgoings[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTransitionAuto;
end;

function PUMLStateVertexAuto.GetOutgoingCount: Integer;
begin
  Result := (TheObject as PUMLStateVertex).OutgoingCount;
end;

procedure PUMLStateVertexAuto.ClearIncomings;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Incomings;');
end;

procedure PUMLStateVertexAuto.AddIncoming(const Value: IUMLTransition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTransition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Incomings', E as PModel);
end;

procedure PUMLStateVertexAuto.RemoveIncoming(const Value: IUMLTransition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTransition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Incomings', E as PModel);
end;

procedure PUMLStateVertexAuto.InsertIncoming(Index: Integer; const Value: IUMLTransition);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLTransition').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Incomings', Index, E as PModel);
end;

procedure PUMLStateVertexAuto.DeleteIncoming(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Incomings', Index);
end;

function PUMLStateVertexAuto.IndexOfIncoming(const Value: IUMLTransition): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLTransition').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLStateVertex).IndexOfIncoming(E as PUMLTransition);
  end;
end;

function PUMLStateVertexAuto.GetIncomingAt(Index: Integer): IUMLTransition;
var
  E: PUMLTransition;
begin
  E := (TheObject as PUMLStateVertex).Incomings[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTransitionAuto;
end;

function PUMLStateVertexAuto.GetIncomingCount: Integer;
begin
  Result := (TheObject as PUMLStateVertex).IncomingCount;
end;

// PUMLStateVertexAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSynchStateAuto

function PUMLSynchStateAuto.Get_Bound: Integer;
begin
  Result := (TheObject as PUMLSynchState).Bound;
end;

procedure PUMLSynchStateAuto.Set_Bound(Value: Integer);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Bound', IntegerToString(Value));
end;

// PUMLSynchStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPseudostateAuto

function PUMLPseudostateAuto.Get_PseudostateKind: UMLPseudostateKind;
begin
  Result := Ord((TheObject as PUMLPseudostate).PseudostateKind);
end;

procedure PUMLPseudostateAuto.Set_PseudostateKind(Value: UMLPseudostateKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'PseudostateKind', UMLPseudostateKindToString(PUMLPseudostateKind(Value)));
end;

// PUMLPseudostateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStubStateAuto

function PUMLStubStateAuto.Get_ReferenceState: WideString;
begin
  Result := (TheObject as PUMLStubState).ReferenceState;
end;

procedure PUMLStubStateAuto.Set_ReferenceState(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ReferenceState', Value);
end;

// PUMLStubStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStateAuto

function PUMLStateAuto.GetEntryActionAt(Index: Integer): IUMLAction;
var
  E: PUMLAction;
begin
  E := (TheObject as PUMLState).EntryActions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionAuto;
end;

function PUMLStateAuto.GetEntryActionCount: Integer;
begin
  Result := (TheObject as PUMLState).EntryActionCount;
end;

function PUMLStateAuto.GetExitActionAt(Index: Integer): IUMLAction;
var
  E: PUMLAction;
begin
  E := (TheObject as PUMLState).ExitActions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionAuto;
end;

function PUMLStateAuto.GetExitActionCount: Integer;
begin
  Result := (TheObject as PUMLState).ExitActionCount;
end;

function PUMLStateAuto.Get_StateMachine: IUMLStateMachine;
var
  E: PUMLStateMachine;
begin
  E := (TheObject as PUMLState).StateMachine;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateMachineAuto;
end;

procedure PUMLStateAuto.ClearDeferrableEvents;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'DeferrableEvents;');
end;

procedure PUMLStateAuto.AddDeferrableEvent(const Value: IUMLEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'DeferrableEvents', E as PModel);
end;

procedure PUMLStateAuto.RemoveDeferrableEvent(const Value: IUMLEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'DeferrableEvents', E as PModel);
end;

procedure PUMLStateAuto.InsertDeferrableEvent(Index: Integer; const Value: IUMLEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'DeferrableEvents', Index, E as PModel);
end;

procedure PUMLStateAuto.DeleteDeferrableEvent(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'DeferrableEvents', Index);
end;

function PUMLStateAuto.IndexOfDeferrableEvent(const Value: IUMLEvent): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLEvent').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLState).IndexOfDeferrableEvent(E as PUMLEvent);
  end;
end;

function PUMLStateAuto.GetDeferrableEventAt(Index: Integer): IUMLEvent;
var
  E: PUMLEvent;
begin
  E := (TheObject as PUMLState).DeferrableEvents[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLEventAuto;
end;

function PUMLStateAuto.GetDeferrableEventCount: Integer;
begin
  Result := (TheObject as PUMLState).DeferrableEventCount;
end;

function PUMLStateAuto.GetInternalTransitionAt(Index: Integer): IUMLTransition;
var
  E: PUMLTransition;
begin
  E := (TheObject as PUMLState).InternalTransitions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTransitionAuto;
end;

function PUMLStateAuto.GetInternalTransitionCount: Integer;
begin
  Result := (TheObject as PUMLState).InternalTransitionCount;
end;

function PUMLStateAuto.GetDoActivityAt(Index: Integer): IUMLAction;
var
  E: PUMLAction;
begin
  E := (TheObject as PUMLState).DoActivities[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionAuto;
end;

function PUMLStateAuto.GetDoActivityCount: Integer;
begin
  Result := (TheObject as PUMLState).DoActivityCount;
end;

procedure PUMLStateAuto.ClearClassifierStates;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ClassifierStates;');
end;

procedure PUMLStateAuto.AddClassifierState(const Value: IUMLClassifierInState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierInState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ClassifierStates', E as PModel);
end;

procedure PUMLStateAuto.RemoveClassifierState(const Value: IUMLClassifierInState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierInState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ClassifierStates', E as PModel);
end;

procedure PUMLStateAuto.InsertClassifierState(Index: Integer; const Value: IUMLClassifierInState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierInState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ClassifierStates', Index, E as PModel);
end;

procedure PUMLStateAuto.DeleteClassifierState(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ClassifierStates', Index);
end;

function PUMLStateAuto.IndexOfClassifierState(const Value: IUMLClassifierInState): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLClassifierInState').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLState).IndexOfClassifierState(E as PUMLClassifierInState);
  end;
end;

function PUMLStateAuto.GetClassifierStateAt(Index: Integer): IUMLClassifierInState;
var
  E: PUMLClassifierInState;
begin
  E := (TheObject as PUMLState).ClassifierStates[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierInStateAuto;
end;

function PUMLStateAuto.GetClassifierStateCount: Integer;
begin
  Result := (TheObject as PUMLState).ClassifierStateCount;
end;

// PUMLStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSimpleStateAuto

// PUMLSimpleStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLObjectFlowStateAuto

function PUMLObjectFlowStateAuto.Get_IsSynch: WordBool;
begin
  Result := (TheObject as PUMLObjectFlowState).IsSynch;
end;

procedure PUMLObjectFlowStateAuto.Set_IsSynch(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsSynch', BooleanToString(Value));
end;

procedure PUMLObjectFlowStateAuto.ClearParameters;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Parameters;');
end;

procedure PUMLObjectFlowStateAuto.AddParameter(const Value: IUMLParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Parameters', E as PModel);
end;

procedure PUMLObjectFlowStateAuto.RemoveParameter(const Value: IUMLParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Parameters', E as PModel);
end;

procedure PUMLObjectFlowStateAuto.InsertParameter(Index: Integer; const Value: IUMLParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Parameters', Index, E as PModel);
end;

procedure PUMLObjectFlowStateAuto.DeleteParameter(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Parameters', Index);
end;

function PUMLObjectFlowStateAuto.IndexOfParameter(const Value: IUMLParameter): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLParameter').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLObjectFlowState).IndexOfParameter(E as PUMLParameter);
  end;
end;

function PUMLObjectFlowStateAuto.GetParameterAt(Index: Integer): IUMLParameter;
var
  E: PUMLParameter;
begin
  E := (TheObject as PUMLObjectFlowState).Parameters[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLParameterAuto;
end;

function PUMLObjectFlowStateAuto.GetParameterCount: Integer;
begin
  Result := (TheObject as PUMLObjectFlowState).ParameterCount;
end;

function PUMLObjectFlowStateAuto.Get_Type_: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLObjectFlowState).Type_;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLObjectFlowStateAuto.Set_Type_(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Type_', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Type_', E as PModel);
  end;
end;

// PUMLObjectFlowStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActionStateAuto

function PUMLActionStateAuto.Get_IsDynamic: WordBool;
begin
  Result := (TheObject as PUMLActionState).IsDynamic;
end;

procedure PUMLActionStateAuto.Set_IsDynamic(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsDynamic', BooleanToString(Value));
end;

function PUMLActionStateAuto.Get_DynamicArguments: WideString;
begin
  Result := (TheObject as PUMLActionState).DynamicArguments;
end;

procedure PUMLActionStateAuto.Set_DynamicArguments(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'DynamicArguments', Value);
end;

function PUMLActionStateAuto.Get_DynamicMultiplicity: WideString;
begin
  Result := (TheObject as PUMLActionState).DynamicMultiplicity;
end;

procedure PUMLActionStateAuto.Set_DynamicMultiplicity(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'DynamicMultiplicity', Value);
end;

// PUMLActionStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSignalAcceptStateAuto

// PUMLSignalAcceptStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCallStateAuto

// PUMLCallStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSignalSendStateAuto

// PUMLSignalSendStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCompositeStateAuto

function PUMLCompositeStateAuto.Get_IsConcurrent: WordBool;
begin
  Result := (TheObject as PUMLCompositeState).IsConcurrent;
end;

procedure PUMLCompositeStateAuto.Set_IsConcurrent(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsConcurrent', BooleanToString(Value));
end;

function PUMLCompositeStateAuto.GetSubvertexAt(Index: Integer): IUMLStateVertex;
var
  E: PUMLStateVertex;
begin
  E := (TheObject as PUMLCompositeState).Subvertices[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateVertexAuto;
end;

function PUMLCompositeStateAuto.GetSubvertexCount: Integer;
begin
  Result := (TheObject as PUMLCompositeState).SubvertexCount;
end;

// PUMLCompositeStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubmachineStateAuto

function PUMLSubmachineStateAuto.Get_Submachine: IUMLStateMachine;
var
  E: PUMLStateMachine;
begin
  E := (TheObject as PUMLSubmachineState).Submachine;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateMachineAuto;
end;

procedure PUMLSubmachineStateAuto.Set_Submachine(const Value: IUMLStateMachine);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Submachine', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLStateMachine').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Submachine', E as PModel);
  end;
end;

// PUMLSubmachineStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubactivityStateAuto

function PUMLSubactivityStateAuto.Get_IsDynamic: WordBool;
begin
  Result := (TheObject as PUMLSubactivityState).IsDynamic;
end;

procedure PUMLSubactivityStateAuto.Set_IsDynamic(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsDynamic', BooleanToString(Value));
end;

function PUMLSubactivityStateAuto.Get_DynamicArguments: WideString;
begin
  Result := (TheObject as PUMLSubactivityState).DynamicArguments;
end;

procedure PUMLSubactivityStateAuto.Set_DynamicArguments(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'DynamicArguments', Value);
end;

function PUMLSubactivityStateAuto.Get_DynamicMultiplicity: WideString;
begin
  Result := (TheObject as PUMLSubactivityState).DynamicMultiplicity;
end;

procedure PUMLSubactivityStateAuto.Set_DynamicMultiplicity(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'DynamicMultiplicity', Value);
end;

// PUMLSubactivityStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLFinalStateAuto

// PUMLFinalStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLFlowFinalStateAuto

// PUMLFlowFinalStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInteractionAuto

function PUMLInteractionAuto.GetMessageAt(Index: Integer): IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLInteraction).Messages[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

function PUMLInteractionAuto.GetMessageCount: Integer;
begin
  Result := (TheObject as PUMLInteraction).MessageCount;
end;

function PUMLInteractionAuto.Get_Context: IUMLCollaboration;
var
  E: PUMLCollaboration;
begin
  E := (TheObject as PUMLInteraction).Context;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationAuto;
end;

procedure PUMLInteractionAuto.ClearInteractionInstanceSets;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'InteractionInstanceSets;');
end;

procedure PUMLInteractionAuto.AddInteractionInstanceSet(const Value: IUMLInteractionInstanceSet);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'InteractionInstanceSets', E as PModel);
end;

procedure PUMLInteractionAuto.RemoveInteractionInstanceSet(const Value: IUMLInteractionInstanceSet);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'InteractionInstanceSets', E as PModel);
end;

procedure PUMLInteractionAuto.InsertInteractionInstanceSet(Index: Integer; const Value: IUMLInteractionInstanceSet);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'InteractionInstanceSets', Index, E as PModel);
end;

procedure PUMLInteractionAuto.DeleteInteractionInstanceSet(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'InteractionInstanceSets', Index);
end;

function PUMLInteractionAuto.IndexOfInteractionInstanceSet(const Value: IUMLInteractionInstanceSet): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInteractionInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInteraction).IndexOfInteractionInstanceSet(E as PUMLInteractionInstanceSet);
  end;
end;

function PUMLInteractionAuto.GetInteractionInstanceSetAt(Index: Integer): IUMLInteractionInstanceSet;
var
  E: PUMLInteractionInstanceSet;
begin
  E := (TheObject as PUMLInteraction).InteractionInstanceSets[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionInstanceSetAuto;
end;

function PUMLInteractionAuto.GetInteractionInstanceSetCount: Integer;
begin
  Result := (TheObject as PUMLInteraction).InteractionInstanceSetCount;
end;

procedure PUMLInteractionAuto.ClearFragments;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Fragments;');
end;

procedure PUMLInteractionAuto.AddFragment(const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Fragments', E as PModel);
end;

procedure PUMLInteractionAuto.RemoveFragment(const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Fragments', E as PModel);
end;

procedure PUMLInteractionAuto.InsertFragment(Index: Integer; const Value: IUMLInteractionFragment);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Fragments', Index, E as PModel);
end;

procedure PUMLInteractionAuto.DeleteFragment(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Fragments', Index);
end;

function PUMLInteractionAuto.IndexOfFragment(const Value: IUMLInteractionFragment): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInteractionFragment').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLInteraction).IndexOfFragment(E as PUMLInteractionFragment);
  end;
end;

function PUMLInteractionAuto.GetFragmentAt(Index: Integer): IUMLInteractionFragment;
var
  E: PUMLInteractionFragment;
begin
  E := (TheObject as PUMLInteraction).Fragments[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionFragmentAuto;
end;

function PUMLInteractionAuto.GetFragmentCount: Integer;
begin
  Result := (TheObject as PUMLInteraction).FragmentCount;
end;

// PUMLInteractionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLMessageAuto

function PUMLMessageAuto.Get_Arguments: WideString;
begin
  Result := (TheObject as PUMLMessage).Arguments;
end;

procedure PUMLMessageAuto.Set_Arguments(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Arguments', Value);
end;

function PUMLMessageAuto.Get_Return: WideString;
begin
  Result := (TheObject as PUMLMessage).Return;
end;

procedure PUMLMessageAuto.Set_Return(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Return', Value);
end;

function PUMLMessageAuto.Get_Iteration: WideString;
begin
  Result := (TheObject as PUMLMessage).Iteration;
end;

procedure PUMLMessageAuto.Set_Iteration(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Iteration', Value);
end;

function PUMLMessageAuto.Get_Branch: WideString;
begin
  Result := (TheObject as PUMLMessage).Branch;
end;

procedure PUMLMessageAuto.Set_Branch(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Branch', Value);
end;

function PUMLMessageAuto.Get_Interaction: IUMLInteraction;
var
  E: PUMLInteraction;
begin
  E := (TheObject as PUMLMessage).Interaction;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionAuto;
end;

function PUMLMessageAuto.Get_Activator: IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLMessage).Activator;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

procedure PUMLMessageAuto.Set_Activator(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Activator', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Activator', E as PModel);
  end;
end;

procedure PUMLMessageAuto.ClearActivatees;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Activatees;');
end;

procedure PUMLMessageAuto.AddActivatee(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Activatees', E as PModel);
end;

procedure PUMLMessageAuto.RemoveActivatee(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Activatees', E as PModel);
end;

procedure PUMLMessageAuto.InsertActivatee(Index: Integer; const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Activatees', Index, E as PModel);
end;

procedure PUMLMessageAuto.DeleteActivatee(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Activatees', Index);
end;

function PUMLMessageAuto.IndexOfActivatee(const Value: IUMLMessage): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLMessage).IndexOfActivatee(E as PUMLMessage);
  end;
end;

function PUMLMessageAuto.GetActivateeAt(Index: Integer): IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLMessage).Activatees[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

function PUMLMessageAuto.GetActivateeCount: Integer;
begin
  Result := (TheObject as PUMLMessage).ActivateeCount;
end;

function PUMLMessageAuto.Get_Sender: IUMLClassifierRole;
var
  E: PUMLClassifierRole;
begin
  E := (TheObject as PUMLMessage).Sender;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierRoleAuto;
end;

procedure PUMLMessageAuto.Set_Sender(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Sender', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Sender', E as PModel);
  end;
end;

function PUMLMessageAuto.Get_Receiver: IUMLClassifierRole;
var
  E: PUMLClassifierRole;
begin
  E := (TheObject as PUMLMessage).Receiver;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierRoleAuto;
end;

procedure PUMLMessageAuto.Set_Receiver(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Receiver', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Receiver', E as PModel);
  end;
end;

function PUMLMessageAuto.Get_Successor: IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLMessage).Successor;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

procedure PUMLMessageAuto.Set_Successor(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Successor', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Successor', E as PModel);
  end;
end;

function PUMLMessageAuto.Get_Predecessor: IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLMessage).Predecessor;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

procedure PUMLMessageAuto.Set_Predecessor(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Predecessor', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Predecessor', E as PModel);
  end;
end;

function PUMLMessageAuto.Get_CommunicationConnection: IUMLAssociationRole;
var
  E: PUMLAssociationRole;
begin
  E := (TheObject as PUMLMessage).CommunicationConnection;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationRoleAuto;
end;

procedure PUMLMessageAuto.Set_CommunicationConnection(const Value: IUMLAssociationRole);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'CommunicationConnection', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'CommunicationConnection', E as PModel);
  end;
end;

function PUMLMessageAuto.Get_Action: IUMLAction;
var
  E: PUMLAction;
begin
  E := (TheObject as PUMLMessage).Action;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionAuto;
end;

procedure PUMLMessageAuto.ClearConformingStimuli;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ConformingStimuli;');
end;

procedure PUMLMessageAuto.AddConformingStimulus(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ConformingStimuli', E as PModel);
end;

procedure PUMLMessageAuto.RemoveConformingStimulus(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ConformingStimuli', E as PModel);
end;

procedure PUMLMessageAuto.InsertConformingStimulus(Index: Integer; const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ConformingStimuli', Index, E as PModel);
end;

procedure PUMLMessageAuto.DeleteConformingStimulus(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ConformingStimuli', Index);
end;

function PUMLMessageAuto.IndexOfConformingStimulus(const Value: IUMLStimulus): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLMessage).IndexOfConformingStimulus(E as PUMLStimulus);
  end;
end;

function PUMLMessageAuto.GetConformingStimulusAt(Index: Integer): IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLMessage).ConformingStimuli[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

function PUMLMessageAuto.GetConformingStimulusCount: Integer;
begin
  Result := (TheObject as PUMLMessage).ConformingStimulusCount;
end;

// PUMLMessageAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationClassAuto

function PUMLAssociationClassAuto.Get_ClassSide: IUMLClass;
var
  E: PUMLClass;
begin
  E := (TheObject as PUMLAssociationClass).ClassSide;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassAuto;
end;

procedure PUMLAssociationClassAuto.Set_ClassSide(const Value: IUMLClass);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ClassSide', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClass').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ClassSide', E as PModel);
  end;
end;

function PUMLAssociationClassAuto.Get_AssociationSide: IUMLAssociation;
var
  E: PUMLAssociation;
begin
  E := (TheObject as PUMLAssociationClass).AssociationSide;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationAuto;
end;

procedure PUMLAssociationClassAuto.Set_AssociationSide(const Value: IUMLAssociation);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'AssociationSide', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAssociation').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'AssociationSide', E as PModel);
  end;
end;

// PUMLAssociationClassAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStateMachineAuto

function PUMLStateMachineAuto.Get_Context: IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLStateMachine).Context;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

function PUMLStateMachineAuto.Get_Top: IUMLState;
var
  E: PUMLState;
begin
  E := (TheObject as PUMLStateMachine).Top;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateAuto;
end;

function PUMLStateMachineAuto.GetTransitionAt(Index: Integer): IUMLTransition;
var
  E: PUMLTransition;
begin
  E := (TheObject as PUMLStateMachine).Transitions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTransitionAuto;
end;

function PUMLStateMachineAuto.GetTransitionCount: Integer;
begin
  Result := (TheObject as PUMLStateMachine).TransitionCount;
end;

procedure PUMLStateMachineAuto.ClearSubmachineStates;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'SubmachineStates;');
end;

procedure PUMLStateMachineAuto.AddSubmachineState(const Value: IUMLSubmachineState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSubmachineState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'SubmachineStates', E as PModel);
end;

procedure PUMLStateMachineAuto.RemoveSubmachineState(const Value: IUMLSubmachineState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSubmachineState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'SubmachineStates', E as PModel);
end;

procedure PUMLStateMachineAuto.InsertSubmachineState(Index: Integer; const Value: IUMLSubmachineState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSubmachineState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'SubmachineStates', Index, E as PModel);
end;

procedure PUMLStateMachineAuto.DeleteSubmachineState(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'SubmachineStates', Index);
end;

function PUMLStateMachineAuto.IndexOfSubmachineState(const Value: IUMLSubmachineState): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLSubmachineState').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLStateMachine).IndexOfSubmachineState(E as PUMLSubmachineState);
  end;
end;

function PUMLStateMachineAuto.GetSubmachineStateAt(Index: Integer): IUMLSubmachineState;
var
  E: PUMLSubmachineState;
begin
  E := (TheObject as PUMLStateMachine).SubmachineStates[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLSubmachineStateAuto;
end;

function PUMLStateMachineAuto.GetSubmachineStateCount: Integer;
begin
  Result := (TheObject as PUMLStateMachine).SubmachineStateCount;
end;

// PUMLStateMachineAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActivityGraphAuto

function PUMLActivityGraphAuto.GetPartitionAt(Index: Integer): IUMLPartition;
var
  E: PUMLPartition;
begin
  E := (TheObject as PUMLActivityGraph).Partitions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLPartitionAuto;
end;

function PUMLActivityGraphAuto.GetPartitionCount: Integer;
begin
  Result := (TheObject as PUMLActivityGraph).PartitionCount;
end;

// PUMLActivityGraphAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLFeatureAuto

function PUMLFeatureAuto.Get_OwnerScope: UMLScopeKind;
begin
  Result := Ord((TheObject as PUMLFeature).OwnerScope);
end;

procedure PUMLFeatureAuto.Set_OwnerScope(Value: UMLScopeKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'OwnerScope', UMLScopeKindToString(PUMLScopeKind(Value)));
end;

procedure PUMLFeatureAuto.ClearConnectorEnds;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ConnectorEnds;');
end;

procedure PUMLFeatureAuto.AddConnectorEnd(const Value: IUMLConnectorEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnectorEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ConnectorEnds', E as PModel);
end;

procedure PUMLFeatureAuto.RemoveConnectorEnd(const Value: IUMLConnectorEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnectorEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ConnectorEnds', E as PModel);
end;

procedure PUMLFeatureAuto.InsertConnectorEnd(Index: Integer; const Value: IUMLConnectorEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnectorEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ConnectorEnds', Index, E as PModel);
end;

procedure PUMLFeatureAuto.DeleteConnectorEnd(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ConnectorEnds', Index);
end;

function PUMLFeatureAuto.IndexOfConnectorEnd(const Value: IUMLConnectorEnd): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLConnectorEnd').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLFeature).IndexOfConnectorEnd(E as PUMLConnectorEnd);
  end;
end;

function PUMLFeatureAuto.GetConnectorEndAt(Index: Integer): IUMLConnectorEnd;
var
  E: PUMLConnectorEnd;
begin
  E := (TheObject as PUMLFeature).ConnectorEnds[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLConnectorEndAuto;
end;

function PUMLFeatureAuto.GetConnectorEndCount: Integer;
begin
  Result := (TheObject as PUMLFeature).ConnectorEndCount;
end;

procedure PUMLFeatureAuto.ClearClassifierRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ClassifierRoles;');
end;

procedure PUMLFeatureAuto.AddClassifierRole(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ClassifierRoles', E as PModel);
end;

procedure PUMLFeatureAuto.RemoveClassifierRole(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ClassifierRoles', E as PModel);
end;

procedure PUMLFeatureAuto.InsertClassifierRole(Index: Integer; const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ClassifierRoles', Index, E as PModel);
end;

procedure PUMLFeatureAuto.DeleteClassifierRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ClassifierRoles', Index);
end;

function PUMLFeatureAuto.IndexOfClassifierRole(const Value: IUMLClassifierRole): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLFeature).IndexOfClassifierRole(E as PUMLClassifierRole);
  end;
end;

function PUMLFeatureAuto.GetClassifierRoleAt(Index: Integer): IUMLClassifierRole;
var
  E: PUMLClassifierRole;
begin
  E := (TheObject as PUMLFeature).ClassifierRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierRoleAuto;
end;

function PUMLFeatureAuto.GetClassifierRoleCount: Integer;
begin
  Result := (TheObject as PUMLFeature).ClassifierRoleCount;
end;

// PUMLFeatureAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLBehavioralFeatureAuto

function PUMLBehavioralFeatureAuto.Get_IsQuery: WordBool;
begin
  Result := (TheObject as PUMLBehavioralFeature).IsQuery;
end;

procedure PUMLBehavioralFeatureAuto.Set_IsQuery(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsQuery', BooleanToString(Value));
end;

function PUMLBehavioralFeatureAuto.GetParameterAt(Index: Integer): IUMLParameter;
var
  E: PUMLParameter;
begin
  E := (TheObject as PUMLBehavioralFeature).Parameters[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLParameterAuto;
end;

function PUMLBehavioralFeatureAuto.GetParameterCount: Integer;
begin
  Result := (TheObject as PUMLBehavioralFeature).ParameterCount;
end;

procedure PUMLBehavioralFeatureAuto.ClearRaisedSignals;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'RaisedSignals;');
end;

procedure PUMLBehavioralFeatureAuto.AddRaisedSignal(const Value: IUMLSignal);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSignal').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'RaisedSignals', E as PModel);
end;

procedure PUMLBehavioralFeatureAuto.RemoveRaisedSignal(const Value: IUMLSignal);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSignal').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'RaisedSignals', E as PModel);
end;

procedure PUMLBehavioralFeatureAuto.InsertRaisedSignal(Index: Integer; const Value: IUMLSignal);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSignal').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'RaisedSignals', Index, E as PModel);
end;

procedure PUMLBehavioralFeatureAuto.DeleteRaisedSignal(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'RaisedSignals', Index);
end;

function PUMLBehavioralFeatureAuto.IndexOfRaisedSignal(const Value: IUMLSignal): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLSignal').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLBehavioralFeature).IndexOfRaisedSignal(E as PUMLSignal);
  end;
end;

function PUMLBehavioralFeatureAuto.GetRaisedSignalAt(Index: Integer): IUMLSignal;
var
  E: PUMLSignal;
begin
  E := (TheObject as PUMLBehavioralFeature).RaisedSignals[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLSignalAuto;
end;

function PUMLBehavioralFeatureAuto.GetRaisedSignalCount: Integer;
begin
  Result := (TheObject as PUMLBehavioralFeature).RaisedSignalCount;
end;

// PUMLBehavioralFeatureAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLMethodAuto

function PUMLMethodAuto.Get_Body: WideString;
begin
  Result := (TheObject as PUMLMethod).Body;
end;

procedure PUMLMethodAuto.Set_Body(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Body', Value);
end;

function PUMLMethodAuto.Get_Specification: IUMLOperation;
var
  E: PUMLOperation;
begin
  E := (TheObject as PUMLMethod).Specification;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationAuto;
end;

procedure PUMLMethodAuto.Set_Specification(const Value: IUMLOperation);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Specification', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLOperation').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Specification', E as PModel);
  end;
end;

// PUMLMethodAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLOperationAuto

function PUMLOperationAuto.Get_Concurrency: UMLCallConcurrencyKind;
begin
  Result := Ord((TheObject as PUMLOperation).Concurrency);
end;

procedure PUMLOperationAuto.Set_Concurrency(Value: UMLCallConcurrencyKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Concurrency', UMLCallConcurrencyKindToString(PUMLCallConcurrencyKind(Value)));
end;

function PUMLOperationAuto.Get_IsRoot: WordBool;
begin
  Result := (TheObject as PUMLOperation).IsRoot;
end;

procedure PUMLOperationAuto.Set_IsRoot(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsRoot', BooleanToString(Value));
end;

function PUMLOperationAuto.Get_IsLeaf: WordBool;
begin
  Result := (TheObject as PUMLOperation).IsLeaf;
end;

procedure PUMLOperationAuto.Set_IsLeaf(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsLeaf', BooleanToString(Value));
end;

function PUMLOperationAuto.Get_IsAbstract: WordBool;
begin
  Result := (TheObject as PUMLOperation).IsAbstract;
end;

procedure PUMLOperationAuto.Set_IsAbstract(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsAbstract', BooleanToString(Value));
end;

function PUMLOperationAuto.Get_Specification: WideString;
begin
  Result := (TheObject as PUMLOperation).Specification;
end;

procedure PUMLOperationAuto.Set_Specification(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Specification', Value);
end;

function PUMLOperationAuto.Get_Owner: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLOperation).Owner;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLOperationAuto.ClearMethods;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Methods;');
end;

procedure PUMLOperationAuto.AddMethod(const Value: IUMLMethod);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMethod').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Methods', E as PModel);
end;

procedure PUMLOperationAuto.RemoveMethod(const Value: IUMLMethod);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMethod').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Methods', E as PModel);
end;

procedure PUMLOperationAuto.InsertMethod(Index: Integer; const Value: IUMLMethod);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMethod').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Methods', Index, E as PModel);
end;

procedure PUMLOperationAuto.DeleteMethod(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Methods', Index);
end;

function PUMLOperationAuto.IndexOfMethod(const Value: IUMLMethod): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLMethod').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLOperation).IndexOfMethod(E as PUMLMethod);
  end;
end;

function PUMLOperationAuto.GetMethodAt(Index: Integer): IUMLMethod;
var
  E: PUMLMethod;
begin
  E := (TheObject as PUMLOperation).Methods[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMethodAuto;
end;

function PUMLOperationAuto.GetMethodCount: Integer;
begin
  Result := (TheObject as PUMLOperation).MethodCount;
end;

procedure PUMLOperationAuto.ClearCallActions;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'CallActions;');
end;

procedure PUMLOperationAuto.AddCallAction(const Value: IUMLCallAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCallAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'CallActions', E as PModel);
end;

procedure PUMLOperationAuto.RemoveCallAction(const Value: IUMLCallAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCallAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'CallActions', E as PModel);
end;

procedure PUMLOperationAuto.InsertCallAction(Index: Integer; const Value: IUMLCallAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCallAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'CallActions', Index, E as PModel);
end;

procedure PUMLOperationAuto.DeleteCallAction(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'CallActions', Index);
end;

function PUMLOperationAuto.IndexOfCallAction(const Value: IUMLCallAction): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLCallAction').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLOperation).IndexOfCallAction(E as PUMLCallAction);
  end;
end;

function PUMLOperationAuto.GetCallActionAt(Index: Integer): IUMLCallAction;
var
  E: PUMLCallAction;
begin
  E := (TheObject as PUMLOperation).CallActions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCallActionAuto;
end;

function PUMLOperationAuto.GetCallActionCount: Integer;
begin
  Result := (TheObject as PUMLOperation).CallActionCount;
end;

procedure PUMLOperationAuto.ClearOccurrences;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Occurrences;');
end;

procedure PUMLOperationAuto.AddOccurrence(const Value: IUMLCallEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCallEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Occurrences', E as PModel);
end;

procedure PUMLOperationAuto.RemoveOccurrence(const Value: IUMLCallEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCallEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Occurrences', E as PModel);
end;

procedure PUMLOperationAuto.InsertOccurrence(Index: Integer; const Value: IUMLCallEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCallEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Occurrences', Index, E as PModel);
end;

procedure PUMLOperationAuto.DeleteOccurrence(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Occurrences', Index);
end;

function PUMLOperationAuto.IndexOfOccurrence(const Value: IUMLCallEvent): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLCallEvent').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLOperation).IndexOfOccurrence(E as PUMLCallEvent);
  end;
end;

function PUMLOperationAuto.GetOccurrenceAt(Index: Integer): IUMLCallEvent;
var
  E: PUMLCallEvent;
begin
  E := (TheObject as PUMLOperation).Occurrences[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCallEventAuto;
end;

function PUMLOperationAuto.GetOccurrenceCount: Integer;
begin
  Result := (TheObject as PUMLOperation).OccurrenceCount;
end;

function PUMLOperationAuto.GetOwnedCollaborationAt(Index: Integer): IUMLCollaboration;
var
  E: PUMLCollaboration;
begin
  E := (TheObject as PUMLOperation).OwnedCollaborations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationAuto;
end;

function PUMLOperationAuto.GetOwnedCollaborationCount: Integer;
begin
  Result := (TheObject as PUMLOperation).OwnedCollaborationCount;
end;

function PUMLOperationAuto.GetOwnedCollaborationInstanceSetAt(Index: Integer): IUMLCollaborationInstanceSet;
var
  E: PUMLCollaborationInstanceSet;
begin
  E := (TheObject as PUMLOperation).OwnedCollaborationInstanceSets[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationInstanceSetAuto;
end;

function PUMLOperationAuto.GetOwnedCollaborationInstanceSetCount: Integer;
begin
  Result := (TheObject as PUMLOperation).OwnedCollaborationInstanceSetCount;
end;

// PUMLOperationAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLReceptionAuto

function PUMLReceptionAuto.Get_Specification: WideString;
begin
  Result := (TheObject as PUMLReception).Specification;
end;

procedure PUMLReceptionAuto.Set_Specification(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Specification', Value);
end;

function PUMLReceptionAuto.Get_IsRoot: WordBool;
begin
  Result := (TheObject as PUMLReception).IsRoot;
end;

procedure PUMLReceptionAuto.Set_IsRoot(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsRoot', BooleanToString(Value));
end;

function PUMLReceptionAuto.Get_IsLeaf: WordBool;
begin
  Result := (TheObject as PUMLReception).IsLeaf;
end;

procedure PUMLReceptionAuto.Set_IsLeaf(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsLeaf', BooleanToString(Value));
end;

function PUMLReceptionAuto.Get_IsAbstract: WordBool;
begin
  Result := (TheObject as PUMLReception).IsAbstract;
end;

procedure PUMLReceptionAuto.Set_IsAbstract(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsAbstract', BooleanToString(Value));
end;

function PUMLReceptionAuto.Get_Signal: IUMLSignal;
var
  E: PUMLSignal;
begin
  E := (TheObject as PUMLReception).Signal;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLSignalAuto;
end;

procedure PUMLReceptionAuto.Set_Signal(const Value: IUMLSignal);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Signal', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLSignal').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Signal', E as PModel);
  end;
end;

// PUMLReceptionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLConnectorAuto

procedure PUMLConnectorAuto.ClearEnds;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Ends;');
end;

procedure PUMLConnectorAuto.AddEnd(const Value: IUMLConnectorEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnectorEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Ends', E as PModel);
end;

procedure PUMLConnectorAuto.RemoveEnd(const Value: IUMLConnectorEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnectorEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Ends', E as PModel);
end;

procedure PUMLConnectorAuto.InsertEnd(Index: Integer; const Value: IUMLConnectorEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnectorEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Ends', Index, E as PModel);
end;

procedure PUMLConnectorAuto.DeleteEnd(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Ends', Index);
end;

function PUMLConnectorAuto.IndexOfEnd(const Value: IUMLConnectorEnd): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLConnectorEnd').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLConnector).IndexOfEnd(E as PUMLConnectorEnd);
  end;
end;

function PUMLConnectorAuto.GetEndAt(Index: Integer): IUMLConnectorEnd;
var
  E: PUMLConnectorEnd;
begin
  E := (TheObject as PUMLConnector).Ends[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLConnectorEndAuto;
end;

function PUMLConnectorAuto.GetEndCount: Integer;
begin
  Result := (TheObject as PUMLConnector).EndCount;
end;

function PUMLConnectorAuto.Get_Owner: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLConnector).Owner;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLConnectorAuto.Set_Owner(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Owner', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Owner', E as PModel);
  end;
end;

// PUMLConnectorAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStructuralFeatureAuto

function PUMLStructuralFeatureAuto.Get_Multiplicity: WideString;
begin
  Result := (TheObject as PUMLStructuralFeature).Multiplicity;
end;

procedure PUMLStructuralFeatureAuto.Set_Multiplicity(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Multiplicity', Value);
end;

function PUMLStructuralFeatureAuto.Get_Changeability: UMLChangeableKind;
begin
  Result := Ord((TheObject as PUMLStructuralFeature).Changeability);
end;

procedure PUMLStructuralFeatureAuto.Set_Changeability(Value: UMLChangeableKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Changeability', UMLChangeableKindToString(PUMLChangeableKind(Value)));
end;

function PUMLStructuralFeatureAuto.Get_TargetScope: UMLScopeKind;
begin
  Result := Ord((TheObject as PUMLStructuralFeature).TargetScope);
end;

procedure PUMLStructuralFeatureAuto.Set_TargetScope(Value: UMLScopeKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'TargetScope', UMLScopeKindToString(PUMLScopeKind(Value)));
end;

function PUMLStructuralFeatureAuto.Get_Ordering: UMLOrderingKind;
begin
  Result := Ord((TheObject as PUMLStructuralFeature).Ordering);
end;

procedure PUMLStructuralFeatureAuto.Set_Ordering(Value: UMLOrderingKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Ordering', UMLOrderingKindToString(PUMLOrderingKind(Value)));
end;

function PUMLStructuralFeatureAuto.Get_TypeExpression: WideString;
begin
  Result := (TheObject as PUMLStructuralFeature).TypeExpression;
end;

procedure PUMLStructuralFeatureAuto.Set_TypeExpression(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'TypeExpression', Value);
end;

function PUMLStructuralFeatureAuto.Get_Type_: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLStructuralFeature).Type_;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLStructuralFeatureAuto.Set_Type_(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Type_', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Type_', E as PModel);
  end;
end;

procedure PUMLStructuralFeatureAuto.SetType(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.ChangeTypeExpression(TheObject as PModel, '', E as PModel);
end;

procedure PUMLStructuralFeatureAuto.SetType2(const Value: WideString);
begin
  StarUMLApplication.ChangeTypeExpression(TheObject as PModel, Value, nil);
end;

// PUMLStructuralFeatureAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAttributeAuto

function PUMLAttributeAuto.Get_InitialValue: WideString;
begin
  Result := (TheObject as PUMLAttribute).InitialValue;
end;

procedure PUMLAttributeAuto.Set_InitialValue(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'InitialValue', Value);
end;

function PUMLAttributeAuto.Get_AssociationEnd: IUMLAssociationEnd;
var
  E: PUMLAssociationEnd;
begin
  E := (TheObject as PUMLAttribute).AssociationEnd;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationEndAuto;
end;

function PUMLAttributeAuto.Get_Owner: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLAttribute).Owner;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLAttributeAuto.ClearAttributeLinks;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AttributeLinks;');
end;

procedure PUMLAttributeAuto.AddAttributeLink(const Value: IUMLAttributeLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttributeLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AttributeLinks', E as PModel);
end;

procedure PUMLAttributeAuto.RemoveAttributeLink(const Value: IUMLAttributeLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttributeLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AttributeLinks', E as PModel);
end;

procedure PUMLAttributeAuto.InsertAttributeLink(Index: Integer; const Value: IUMLAttributeLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttributeLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AttributeLinks', Index, E as PModel);
end;

procedure PUMLAttributeAuto.DeleteAttributeLink(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AttributeLinks', Index);
end;

function PUMLAttributeAuto.IndexOfAttributeLink(const Value: IUMLAttributeLink): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLAttributeLink').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAttribute).IndexOfAttributeLink(E as PUMLAttributeLink);
  end;
end;

function PUMLAttributeAuto.GetAttributeLinkAt(Index: Integer): IUMLAttributeLink;
var
  E: PUMLAttributeLink;
begin
  E := (TheObject as PUMLAttribute).AttributeLinks[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeLinkAuto;
end;

function PUMLAttributeAuto.GetAttributeLinkCount: Integer;
begin
  Result := (TheObject as PUMLAttribute).AttributeLinkCount;
end;

procedure PUMLAttributeAuto.ClearAssociationEndRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AssociationEndRoles;');
end;

procedure PUMLAttributeAuto.AddAssociationEndRole(const Value: IUMLAssociationEndRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEndRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AssociationEndRoles', E as PModel);
end;

procedure PUMLAttributeAuto.RemoveAssociationEndRole(const Value: IUMLAssociationEndRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEndRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AssociationEndRoles', E as PModel);
end;

procedure PUMLAttributeAuto.InsertAssociationEndRole(Index: Integer; const Value: IUMLAssociationEndRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEndRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AssociationEndRoles', Index, E as PModel);
end;

procedure PUMLAttributeAuto.DeleteAssociationEndRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AssociationEndRoles', Index);
end;

function PUMLAttributeAuto.IndexOfAssociationEndRole(const Value: IUMLAssociationEndRole): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationEndRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAttribute).IndexOfAssociationEndRole(E as PUMLAssociationEndRole);
  end;
end;

function PUMLAttributeAuto.GetAssociationEndRoleAt(Index: Integer): IUMLAssociationEndRole;
var
  E: PUMLAssociationEndRole;
begin
  E := (TheObject as PUMLAttribute).AssociationEndRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationEndRoleAuto;
end;

function PUMLAttributeAuto.GetAssociationEndRoleCount: Integer;
begin
  Result := (TheObject as PUMLAttribute).AssociationEndRoleCount;
end;

// PUMLAttributeAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPortAuto

function PUMLPortAuto.Get_IsBehavior: WordBool;
begin
  Result := (TheObject as PUMLPort).IsBehavior;
end;

procedure PUMLPortAuto.Set_IsBehavior(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsBehavior', BooleanToString(Value));
end;

function PUMLPortAuto.Get_IsService: WordBool;
begin
  Result := (TheObject as PUMLPort).IsService;
end;

procedure PUMLPortAuto.Set_IsService(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsService', BooleanToString(Value));
end;

function PUMLPortAuto.Get_Owner: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLPort).Owner;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLPortAuto.Set_Owner(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Owner', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Owner', E as PModel);
  end;
end;

// PUMLPortAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLGeneralizableElementAuto

function PUMLGeneralizableElementAuto.Get_IsRoot: WordBool;
begin
  Result := (TheObject as PUMLGeneralizableElement).IsRoot;
end;

procedure PUMLGeneralizableElementAuto.Set_IsRoot(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsRoot', BooleanToString(Value));
end;

function PUMLGeneralizableElementAuto.Get_IsLeaf: WordBool;
begin
  Result := (TheObject as PUMLGeneralizableElement).IsLeaf;
end;

procedure PUMLGeneralizableElementAuto.Set_IsLeaf(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsLeaf', BooleanToString(Value));
end;

function PUMLGeneralizableElementAuto.Get_IsAbstract: WordBool;
begin
  Result := (TheObject as PUMLGeneralizableElement).IsAbstract;
end;

procedure PUMLGeneralizableElementAuto.Set_IsAbstract(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsAbstract', BooleanToString(Value));
end;

procedure PUMLGeneralizableElementAuto.ClearGeneralizations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Generalizations;');
end;

procedure PUMLGeneralizableElementAuto.AddGeneralization(const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Generalizations', E as PModel);
end;

procedure PUMLGeneralizableElementAuto.RemoveGeneralization(const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Generalizations', E as PModel);
end;

procedure PUMLGeneralizableElementAuto.InsertGeneralization(Index: Integer; const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Generalizations', Index, E as PModel);
end;

procedure PUMLGeneralizableElementAuto.DeleteGeneralization(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Generalizations', Index);
end;

function PUMLGeneralizableElementAuto.IndexOfGeneralization(const Value: IUMLGeneralization): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLGeneralizableElement).IndexOfGeneralization(E as PUMLGeneralization);
  end;
end;

function PUMLGeneralizableElementAuto.GetGeneralizationAt(Index: Integer): IUMLGeneralization;
var
  E: PUMLGeneralization;
begin
  E := (TheObject as PUMLGeneralizableElement).Generalizations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLGeneralizationAuto;
end;

function PUMLGeneralizableElementAuto.GetGeneralizationCount: Integer;
begin
  Result := (TheObject as PUMLGeneralizableElement).GeneralizationCount;
end;

procedure PUMLGeneralizableElementAuto.ClearSpecializations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Specializations;');
end;

procedure PUMLGeneralizableElementAuto.AddSpecialization(const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Specializations', E as PModel);
end;

procedure PUMLGeneralizableElementAuto.RemoveSpecialization(const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Specializations', E as PModel);
end;

procedure PUMLGeneralizableElementAuto.InsertSpecialization(Index: Integer; const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Specializations', Index, E as PModel);
end;

procedure PUMLGeneralizableElementAuto.DeleteSpecialization(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Specializations', Index);
end;

function PUMLGeneralizableElementAuto.IndexOfSpecialization(const Value: IUMLGeneralization): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLGeneralizableElement).IndexOfSpecialization(E as PUMLGeneralization);
  end;
end;

function PUMLGeneralizableElementAuto.GetSpecializationAt(Index: Integer): IUMLGeneralization;
var
  E: PUMLGeneralization;
begin
  E := (TheObject as PUMLGeneralizableElement).Specializations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLGeneralizationAuto;
end;

function PUMLGeneralizableElementAuto.GetSpecializationCount: Integer;
begin
  Result := (TheObject as PUMLGeneralizableElement).SpecializationCount;
end;

// PUMLGeneralizableElementAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNamespaceAuto

function PUMLNamespaceAuto.GetOwnedElementAt(Index: Integer): IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLNamespace).OwnedElements[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

function PUMLNamespaceAuto.GetOwnedElementCount: Integer;
begin
  Result := (TheObject as PUMLNamespace).OwnedElementCount;
end;

// PUMLNamespaceAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationAuto

function PUMLCollaborationAuto.GetInteractionAt(Index: Integer): IUMLInteraction;
var
  E: PUMLInteraction;
begin
  E := (TheObject as PUMLCollaboration).Interactions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionAuto;
end;

function PUMLCollaborationAuto.GetInteractionCount: Integer;
begin
  Result := (TheObject as PUMLCollaboration).InteractionCount;
end;

function PUMLCollaborationAuto.Get_RepresentedOperation: IUMLOperation;
var
  E: PUMLOperation;
begin
  E := (TheObject as PUMLCollaboration).RepresentedOperation;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationAuto;
end;

procedure PUMLCollaborationAuto.ClearCollaborationInstanceSets;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'CollaborationInstanceSets;');
end;

procedure PUMLCollaborationAuto.AddCollaborationInstanceSet(const Value: IUMLCollaborationInstanceSet);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaborationInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'CollaborationInstanceSets', E as PModel);
end;

procedure PUMLCollaborationAuto.RemoveCollaborationInstanceSet(const Value: IUMLCollaborationInstanceSet);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaborationInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'CollaborationInstanceSets', E as PModel);
end;

procedure PUMLCollaborationAuto.InsertCollaborationInstanceSet(Index: Integer; const Value: IUMLCollaborationInstanceSet);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaborationInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'CollaborationInstanceSets', Index, E as PModel);
end;

procedure PUMLCollaborationAuto.DeleteCollaborationInstanceSet(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'CollaborationInstanceSets', Index);
end;

function PUMLCollaborationAuto.IndexOfCollaborationInstanceSet(const Value: IUMLCollaborationInstanceSet): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLCollaborationInstanceSet').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLCollaboration).IndexOfCollaborationInstanceSet(E as PUMLCollaborationInstanceSet);
  end;
end;

function PUMLCollaborationAuto.GetCollaborationInstanceSetAt(Index: Integer): IUMLCollaborationInstanceSet;
var
  E: PUMLCollaborationInstanceSet;
begin
  E := (TheObject as PUMLCollaboration).CollaborationInstanceSets[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationInstanceSetAuto;
end;

function PUMLCollaborationAuto.GetCollaborationInstanceSetCount: Integer;
begin
  Result := (TheObject as PUMLCollaboration).CollaborationInstanceSetCount;
end;

procedure PUMLCollaborationAuto.ClearUserCollaborations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'UserCollaborations;');
end;

procedure PUMLCollaborationAuto.AddUserCollaboration(const Value: IUMLCollaboration);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'UserCollaborations', E as PModel);
end;

procedure PUMLCollaborationAuto.RemoveUserCollaboration(const Value: IUMLCollaboration);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'UserCollaborations', E as PModel);
end;

procedure PUMLCollaborationAuto.InsertUserCollaboration(Index: Integer; const Value: IUMLCollaboration);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'UserCollaborations', Index, E as PModel);
end;

procedure PUMLCollaborationAuto.DeleteUserCollaboration(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'UserCollaborations', Index);
end;

function PUMLCollaborationAuto.IndexOfUserCollaboration(const Value: IUMLCollaboration): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLCollaboration).IndexOfUserCollaboration(E as PUMLCollaboration);
  end;
end;

function PUMLCollaborationAuto.GetUserCollaborationAt(Index: Integer): IUMLCollaboration;
var
  E: PUMLCollaboration;
begin
  E := (TheObject as PUMLCollaboration).UserCollaborations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationAuto;
end;

function PUMLCollaborationAuto.GetUserCollaborationCount: Integer;
begin
  Result := (TheObject as PUMLCollaboration).UserCollaborationCount;
end;

procedure PUMLCollaborationAuto.ClearUsedCollaborations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'UsedCollaborations;');
end;

procedure PUMLCollaborationAuto.AddUsedCollaboration(const Value: IUMLCollaboration);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'UsedCollaborations', E as PModel);
end;

procedure PUMLCollaborationAuto.RemoveUsedCollaboration(const Value: IUMLCollaboration);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'UsedCollaborations', E as PModel);
end;

procedure PUMLCollaborationAuto.InsertUsedCollaboration(Index: Integer; const Value: IUMLCollaboration);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'UsedCollaborations', Index, E as PModel);
end;

procedure PUMLCollaborationAuto.DeleteUsedCollaboration(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'UsedCollaborations', Index);
end;

function PUMLCollaborationAuto.IndexOfUsedCollaboration(const Value: IUMLCollaboration): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLCollaboration).IndexOfUsedCollaboration(E as PUMLCollaboration);
  end;
end;

function PUMLCollaborationAuto.GetUsedCollaborationAt(Index: Integer): IUMLCollaboration;
var
  E: PUMLCollaboration;
begin
  E := (TheObject as PUMLCollaboration).UsedCollaborations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationAuto;
end;

function PUMLCollaborationAuto.GetUsedCollaborationCount: Integer;
begin
  Result := (TheObject as PUMLCollaboration).UsedCollaborationCount;
end;

function PUMLCollaborationAuto.Get_RepresentedClassifier: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLCollaboration).RepresentedClassifier;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

// PUMLCollaborationAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassifierAuto

function PUMLClassifierAuto.GetOperationAt(Index: Integer): IUMLOperation;
var
  E: PUMLOperation;
begin
  E := (TheObject as PUMLClassifier).Operations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationAuto;
end;

function PUMLClassifierAuto.GetOperationCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).OperationCount;
end;

procedure PUMLClassifierAuto.ClearTypedFeatures;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'TypedFeatures;');
end;

procedure PUMLClassifierAuto.AddTypedFeature(const Value: IUMLStructuralFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStructuralFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'TypedFeatures', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveTypedFeature(const Value: IUMLStructuralFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStructuralFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'TypedFeatures', E as PModel);
end;

procedure PUMLClassifierAuto.InsertTypedFeature(Index: Integer; const Value: IUMLStructuralFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStructuralFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'TypedFeatures', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteTypedFeature(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'TypedFeatures', Index);
end;

function PUMLClassifierAuto.IndexOfTypedFeature(const Value: IUMLStructuralFeature): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLStructuralFeature').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfTypedFeature(E as PUMLStructuralFeature);
  end;
end;

function PUMLClassifierAuto.GetTypedFeatureAt(Index: Integer): IUMLStructuralFeature;
var
  E: PUMLStructuralFeature;
begin
  E := (TheObject as PUMLClassifier).TypedFeatures[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStructuralFeatureAuto;
end;

function PUMLClassifierAuto.GetTypedFeatureCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).TypedFeatureCount;
end;

procedure PUMLClassifierAuto.ClearTypedParameters;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'TypedParameters;');
end;

procedure PUMLClassifierAuto.AddTypedParameter(const Value: IUMLParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'TypedParameters', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveTypedParameter(const Value: IUMLParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'TypedParameters', E as PModel);
end;

procedure PUMLClassifierAuto.InsertTypedParameter(Index: Integer; const Value: IUMLParameter);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLParameter').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'TypedParameters', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteTypedParameter(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'TypedParameters', Index);
end;

function PUMLClassifierAuto.IndexOfTypedParameter(const Value: IUMLParameter): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLParameter').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfTypedParameter(E as PUMLParameter);
  end;
end;

function PUMLClassifierAuto.GetTypedParameterAt(Index: Integer): IUMLParameter;
var
  E: PUMLParameter;
begin
  E := (TheObject as PUMLClassifier).TypedParameters[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLParameterAuto;
end;

function PUMLClassifierAuto.GetTypedParameterCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).TypedParameterCount;
end;

procedure PUMLClassifierAuto.ClearAssociations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Associations;');
end;

procedure PUMLClassifierAuto.AddAssociation(const Value: IUMLAssociationEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Associations', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveAssociation(const Value: IUMLAssociationEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Associations', E as PModel);
end;

procedure PUMLClassifierAuto.InsertAssociation(Index: Integer; const Value: IUMLAssociationEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Associations', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteAssociation(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Associations', Index);
end;

function PUMLClassifierAuto.IndexOfAssociation(const Value: IUMLAssociationEnd): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationEnd').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfAssociation(E as PUMLAssociationEnd);
  end;
end;

function PUMLClassifierAuto.GetAssociationAt(Index: Integer): IUMLAssociationEnd;
var
  E: PUMLAssociationEnd;
begin
  E := (TheObject as PUMLClassifier).Associations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationEndAuto;
end;

function PUMLClassifierAuto.GetAssociationCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).AssociationCount;
end;

procedure PUMLClassifierAuto.ClearPowertypeGeneralizations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'PowertypeGeneralizations;');
end;

procedure PUMLClassifierAuto.AddPowertypeGeneralization(const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'PowertypeGeneralizations', E as PModel);
end;

procedure PUMLClassifierAuto.RemovePowertypeGeneralization(const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'PowertypeGeneralizations', E as PModel);
end;

procedure PUMLClassifierAuto.InsertPowertypeGeneralization(Index: Integer; const Value: IUMLGeneralization);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'PowertypeGeneralizations', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeletePowertypeGeneralization(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'PowertypeGeneralizations', Index);
end;

function PUMLClassifierAuto.IndexOfPowertypeGeneralization(const Value: IUMLGeneralization): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLGeneralization').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfPowertypeGeneralization(E as PUMLGeneralization);
  end;
end;

function PUMLClassifierAuto.GetPowertypeGeneralizationAt(Index: Integer): IUMLGeneralization;
var
  E: PUMLGeneralization;
begin
  E := (TheObject as PUMLClassifier).PowertypeGeneralizations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLGeneralizationAuto;
end;

function PUMLClassifierAuto.GetPowertypeGeneralizationCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).PowertypeGeneralizationCount;
end;

function PUMLClassifierAuto.GetAttributeAt(Index: Integer): IUMLAttribute;
var
  E: PUMLAttribute;
begin
  E := (TheObject as PUMLClassifier).Attributes[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeAuto;
end;

function PUMLClassifierAuto.GetAttributeCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).AttributeCount;
end;

procedure PUMLClassifierAuto.ClearOwnedPorts;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'OwnedPorts;');
end;

procedure PUMLClassifierAuto.AddOwnedPort(const Value: IUMLPort);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLPort').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'OwnedPorts', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveOwnedPort(const Value: IUMLPort);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLPort').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'OwnedPorts', E as PModel);
end;

procedure PUMLClassifierAuto.InsertOwnedPort(Index: Integer; const Value: IUMLPort);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLPort').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'OwnedPorts', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteOwnedPort(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'OwnedPorts', Index);
end;

function PUMLClassifierAuto.IndexOfOwnedPort(const Value: IUMLPort): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLPort').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfOwnedPort(E as PUMLPort);
  end;
end;

function PUMLClassifierAuto.GetOwnedPortAt(Index: Integer): IUMLPort;
var
  E: PUMLPort;
begin
  E := (TheObject as PUMLClassifier).OwnedPorts[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLPortAuto;
end;

function PUMLClassifierAuto.GetOwnedPortCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).OwnedPortCount;
end;

procedure PUMLClassifierAuto.ClearOwnedConnectors;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'OwnedConnectors;');
end;

procedure PUMLClassifierAuto.AddOwnedConnector(const Value: IUMLConnector);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnector').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'OwnedConnectors', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveOwnedConnector(const Value: IUMLConnector);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnector').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'OwnedConnectors', E as PModel);
end;

procedure PUMLClassifierAuto.InsertOwnedConnector(Index: Integer; const Value: IUMLConnector);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLConnector').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'OwnedConnectors', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteOwnedConnector(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'OwnedConnectors', Index);
end;

function PUMLClassifierAuto.IndexOfOwnedConnector(const Value: IUMLConnector): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLConnector').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfOwnedConnector(E as PUMLConnector);
  end;
end;

function PUMLClassifierAuto.GetOwnedConnectorAt(Index: Integer): IUMLConnector;
var
  E: PUMLConnector;
begin
  E := (TheObject as PUMLClassifier).OwnedConnectors[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLConnectorAuto;
end;

function PUMLClassifierAuto.GetOwnedConnectorCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).OwnedConnectorCount;
end;

procedure PUMLClassifierAuto.ClearInstances;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Instances;');
end;

procedure PUMLClassifierAuto.AddInstance(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Instances', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveInstance(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Instances', E as PModel);
end;

procedure PUMLClassifierAuto.InsertInstance(Index: Integer; const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Instances', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteInstance(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Instances', Index);
end;

function PUMLClassifierAuto.IndexOfInstance(const Value: IUMLInstance): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfInstance(E as PUMLInstance);
  end;
end;

function PUMLClassifierAuto.GetInstanceAt(Index: Integer): IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLClassifier).Instances[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

function PUMLClassifierAuto.GetInstanceCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).InstanceCount;
end;

procedure PUMLClassifierAuto.ClearCreateActions;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'CreateActions;');
end;

procedure PUMLClassifierAuto.AddCreateAction(const Value: IUMLCreateAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCreateAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'CreateActions', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveCreateAction(const Value: IUMLCreateAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCreateAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'CreateActions', E as PModel);
end;

procedure PUMLClassifierAuto.InsertCreateAction(Index: Integer; const Value: IUMLCreateAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLCreateAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'CreateActions', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteCreateAction(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'CreateActions', Index);
end;

function PUMLClassifierAuto.IndexOfCreateAction(const Value: IUMLCreateAction): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLCreateAction').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfCreateAction(E as PUMLCreateAction);
  end;
end;

function PUMLClassifierAuto.GetCreateActionAt(Index: Integer): IUMLCreateAction;
var
  E: PUMLCreateAction;
begin
  E := (TheObject as PUMLClassifier).CreateActions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCreateActionAuto;
end;

function PUMLClassifierAuto.GetCreateActionCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).CreateActionCount;
end;

procedure PUMLClassifierAuto.ClearClassifierRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ClassifierRoles;');
end;

procedure PUMLClassifierAuto.AddClassifierRole(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ClassifierRoles', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveClassifierRole(const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ClassifierRoles', E as PModel);
end;

procedure PUMLClassifierAuto.InsertClassifierRole(Index: Integer; const Value: IUMLClassifierRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ClassifierRoles', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteClassifierRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ClassifierRoles', Index);
end;

function PUMLClassifierAuto.IndexOfClassifierRole(const Value: IUMLClassifierRole): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLClassifierRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfClassifierRole(E as PUMLClassifierRole);
  end;
end;

function PUMLClassifierAuto.GetClassifierRoleAt(Index: Integer): IUMLClassifierRole;
var
  E: PUMLClassifierRole;
begin
  E := (TheObject as PUMLClassifier).ClassifierRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierRoleAuto;
end;

function PUMLClassifierAuto.GetClassifierRoleCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).ClassifierRoleCount;
end;

function PUMLClassifierAuto.GetOwnedCollaborationAt(Index: Integer): IUMLCollaboration;
var
  E: PUMLCollaboration;
begin
  E := (TheObject as PUMLClassifier).OwnedCollaborations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationAuto;
end;

function PUMLClassifierAuto.GetOwnedCollaborationCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).OwnedCollaborationCount;
end;

function PUMLClassifierAuto.GetOwnedCollaborationInstanceSetAt(Index: Integer): IUMLCollaborationInstanceSet;
var
  E: PUMLCollaborationInstanceSet;
begin
  E := (TheObject as PUMLClassifier).OwnedCollaborationInstanceSets[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationInstanceSetAuto;
end;

function PUMLClassifierAuto.GetOwnedCollaborationInstanceSetCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).OwnedCollaborationInstanceSetCount;
end;

procedure PUMLClassifierAuto.ClearClassifierInStates;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ClassifierInStates;');
end;

procedure PUMLClassifierAuto.AddClassifierInState(const Value: IUMLClassifierInState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierInState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ClassifierInStates', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveClassifierInState(const Value: IUMLClassifierInState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierInState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ClassifierInStates', E as PModel);
end;

procedure PUMLClassifierAuto.InsertClassifierInState(Index: Integer; const Value: IUMLClassifierInState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifierInState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ClassifierInStates', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteClassifierInState(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ClassifierInStates', Index);
end;

function PUMLClassifierAuto.IndexOfClassifierInState(const Value: IUMLClassifierInState): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLClassifierInState').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfClassifierInState(E as PUMLClassifierInState);
  end;
end;

function PUMLClassifierAuto.GetClassifierInStateAt(Index: Integer): IUMLClassifierInState;
var
  E: PUMLClassifierInState;
begin
  E := (TheObject as PUMLClassifier).ClassifierInStates[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierInStateAuto;
end;

function PUMLClassifierAuto.GetClassifierInStateCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).ClassifierInStateCount;
end;

procedure PUMLClassifierAuto.ClearObjectFlowStates;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ObjectFlowStates;');
end;

procedure PUMLClassifierAuto.AddObjectFlowState(const Value: IUMLObjectFlowState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLObjectFlowState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ObjectFlowStates', E as PModel);
end;

procedure PUMLClassifierAuto.RemoveObjectFlowState(const Value: IUMLObjectFlowState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLObjectFlowState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ObjectFlowStates', E as PModel);
end;

procedure PUMLClassifierAuto.InsertObjectFlowState(Index: Integer; const Value: IUMLObjectFlowState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLObjectFlowState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ObjectFlowStates', Index, E as PModel);
end;

procedure PUMLClassifierAuto.DeleteObjectFlowState(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ObjectFlowStates', Index);
end;

function PUMLClassifierAuto.IndexOfObjectFlowState(const Value: IUMLObjectFlowState): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLObjectFlowState').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifier).IndexOfObjectFlowState(E as PUMLObjectFlowState);
  end;
end;

function PUMLClassifierAuto.GetObjectFlowStateAt(Index: Integer): IUMLObjectFlowState;
var
  E: PUMLObjectFlowState;
begin
  E := (TheObject as PUMLClassifier).ObjectFlowStates[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLObjectFlowStateAuto;
end;

function PUMLClassifierAuto.GetObjectFlowStateCount: Integer;
begin
  Result := (TheObject as PUMLClassifier).ObjectFlowStateCount;
end;

// PUMLClassifierAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLUseCaseAuto

procedure PUMLUseCaseAuto.ClearExtenders;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Extenders;');
end;

procedure PUMLUseCaseAuto.AddExtender(const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Extenders', E as PModel);
end;

procedure PUMLUseCaseAuto.RemoveExtender(const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Extenders', E as PModel);
end;

procedure PUMLUseCaseAuto.InsertExtender(Index: Integer; const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Extenders', Index, E as PModel);
end;

procedure PUMLUseCaseAuto.DeleteExtender(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Extenders', Index);
end;

function PUMLUseCaseAuto.IndexOfExtender(const Value: IUMLExtend): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLUseCase).IndexOfExtender(E as PUMLExtend);
  end;
end;

function PUMLUseCaseAuto.GetExtenderAt(Index: Integer): IUMLExtend;
var
  E: PUMLExtend;
begin
  E := (TheObject as PUMLUseCase).Extenders[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLExtendAuto;
end;

function PUMLUseCaseAuto.GetExtenderCount: Integer;
begin
  Result := (TheObject as PUMLUseCase).ExtenderCount;
end;

procedure PUMLUseCaseAuto.ClearExtends;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Extends;');
end;

procedure PUMLUseCaseAuto.AddExtend(const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Extends', E as PModel);
end;

procedure PUMLUseCaseAuto.RemoveExtend(const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Extends', E as PModel);
end;

procedure PUMLUseCaseAuto.InsertExtend(Index: Integer; const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Extends', Index, E as PModel);
end;

procedure PUMLUseCaseAuto.DeleteExtend(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Extends', Index);
end;

function PUMLUseCaseAuto.IndexOfExtend(const Value: IUMLExtend): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLUseCase).IndexOfExtend(E as PUMLExtend);
  end;
end;

function PUMLUseCaseAuto.GetExtendAt(Index: Integer): IUMLExtend;
var
  E: PUMLExtend;
begin
  E := (TheObject as PUMLUseCase).Extends[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLExtendAuto;
end;

function PUMLUseCaseAuto.GetExtendCount: Integer;
begin
  Result := (TheObject as PUMLUseCase).ExtendCount;
end;

procedure PUMLUseCaseAuto.ClearIncluders;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Includers;');
end;

procedure PUMLUseCaseAuto.AddIncluder(const Value: IUMLInclude);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInclude').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Includers', E as PModel);
end;

procedure PUMLUseCaseAuto.RemoveIncluder(const Value: IUMLInclude);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInclude').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Includers', E as PModel);
end;

procedure PUMLUseCaseAuto.InsertIncluder(Index: Integer; const Value: IUMLInclude);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInclude').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Includers', Index, E as PModel);
end;

procedure PUMLUseCaseAuto.DeleteIncluder(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Includers', Index);
end;

function PUMLUseCaseAuto.IndexOfIncluder(const Value: IUMLInclude): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInclude').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLUseCase).IndexOfIncluder(E as PUMLInclude);
  end;
end;

function PUMLUseCaseAuto.GetIncluderAt(Index: Integer): IUMLInclude;
var
  E: PUMLInclude;
begin
  E := (TheObject as PUMLUseCase).Includers[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLIncludeAuto;
end;

function PUMLUseCaseAuto.GetIncluderCount: Integer;
begin
  Result := (TheObject as PUMLUseCase).IncluderCount;
end;

procedure PUMLUseCaseAuto.ClearIncludes;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Includes;');
end;

procedure PUMLUseCaseAuto.AddInclude(const Value: IUMLInclude);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInclude').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Includes', E as PModel);
end;

procedure PUMLUseCaseAuto.RemoveInclude(const Value: IUMLInclude);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInclude').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Includes', E as PModel);
end;

procedure PUMLUseCaseAuto.InsertInclude(Index: Integer; const Value: IUMLInclude);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInclude').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Includes', Index, E as PModel);
end;

procedure PUMLUseCaseAuto.DeleteInclude(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Includes', Index);
end;

function PUMLUseCaseAuto.IndexOfInclude(const Value: IUMLInclude): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInclude').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLUseCase).IndexOfInclude(E as PUMLInclude);
  end;
end;

function PUMLUseCaseAuto.GetIncludeAt(Index: Integer): IUMLInclude;
var
  E: PUMLInclude;
begin
  E := (TheObject as PUMLUseCase).Includes[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLIncludeAuto;
end;

function PUMLUseCaseAuto.GetIncludeCount: Integer;
begin
  Result := (TheObject as PUMLUseCase).IncludeCount;
end;

function PUMLUseCaseAuto.GetExtensionPointAt(Index: Integer): IUMLExtensionPoint;
var
  E: PUMLExtensionPoint;
begin
  E := (TheObject as PUMLUseCase).ExtensionPoints[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLExtensionPointAuto;
end;

function PUMLUseCaseAuto.GetExtensionPointCount: Integer;
begin
  Result := (TheObject as PUMLUseCase).ExtensionPointCount;
end;

// PUMLUseCaseAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActorAuto

// PUMLActorAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassifierInStateAuto

function PUMLClassifierInStateAuto.Get_Type_: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLClassifierInState).Type_;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLClassifierInStateAuto.Set_Type_(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Type_', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Type_', E as PModel);
  end;
end;

procedure PUMLClassifierInStateAuto.ClearInStates;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'InStates;');
end;

procedure PUMLClassifierInStateAuto.AddInState(const Value: IUMLState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'InStates', E as PModel);
end;

procedure PUMLClassifierInStateAuto.RemoveInState(const Value: IUMLState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'InStates', E as PModel);
end;

procedure PUMLClassifierInStateAuto.InsertInState(Index: Integer; const Value: IUMLState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'InStates', Index, E as PModel);
end;

procedure PUMLClassifierInStateAuto.DeleteInState(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'InStates', Index);
end;

function PUMLClassifierInStateAuto.IndexOfInState(const Value: IUMLState): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLState').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifierInState).IndexOfInState(E as PUMLState);
  end;
end;

function PUMLClassifierInStateAuto.GetInStateAt(Index: Integer): IUMLState;
var
  E: PUMLState;
begin
  E := (TheObject as PUMLClassifierInState).InStates[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateAuto;
end;

function PUMLClassifierInStateAuto.GetInStateCount: Integer;
begin
  Result := (TheObject as PUMLClassifierInState).InStateCount;
end;

// PUMLClassifierInStateAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInterfaceAuto

// PUMLInterfaceAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPackageAuto

function PUMLPackageAuto.GetElementImportItemAt(Index: Integer): IUMLElementImport;
var
  E: PUMLElementImport;
begin
  E := (TheObject as PUMLPackage).ElementImportItems[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLElementImportAuto;
end;

function PUMLPackageAuto.GetElementImportItemCount: Integer;
begin
  Result := (TheObject as PUMLPackage).ElementImportItemCount;
end;

// PUMLPackageAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubsystemAuto

function PUMLSubsystemAuto.Get_IsInstantiable: WordBool;
begin
  Result := (TheObject as PUMLSubsystem).IsInstantiable;
end;

procedure PUMLSubsystemAuto.Set_IsInstantiable(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsInstantiable', BooleanToString(Value));
end;

// PUMLSubsystemAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLProjectAuto

function PUMLProjectAuto.Get_Title: WideString;
begin
  Result := (TheObject as PUMLProject).Title;
end;

procedure PUMLProjectAuto.Set_Title(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Title', Value);
end;

function PUMLProjectAuto.Get_Author: WideString;
begin
  Result := (TheObject as PUMLProject).Author;
end;

procedure PUMLProjectAuto.Set_Author(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Author', Value);
end;

function PUMLProjectAuto.Get_Company: WideString;
begin
  Result := (TheObject as PUMLProject).Company;
end;

procedure PUMLProjectAuto.Set_Company(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Company', Value);
end;

function PUMLProjectAuto.Get_Copyright: WideString;
begin
  Result := (TheObject as PUMLProject).Copyright;
end;

procedure PUMLProjectAuto.Set_Copyright(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Copyright', Value);
end;

// PUMLProjectAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLModelAuto

// PUMLModelAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDataTypeAuto

// PUMLDataTypeAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLProgrammingLanguageDataTypeAuto

function PUMLProgrammingLanguageDataTypeAuto.Get_Expression: WideString;
begin
  Result := (TheObject as PUMLProgrammingLanguageDataType).Expression;
end;

procedure PUMLProgrammingLanguageDataTypeAuto.Set_Expression(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Expression', Value);
end;

// PUMLProgrammingLanguageDataTypeAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPrimitiveAuto

// PUMLPrimitiveAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLEnumerationAuto

function PUMLEnumerationAuto.GetLiteralAt(Index: Integer): IUMLEnumerationLiteral;
var
  E: PUMLEnumerationLiteral;
begin
  E := (TheObject as PUMLEnumeration).Literals[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLEnumerationLiteralAuto;
end;

function PUMLEnumerationAuto.GetLiteralCount: Integer;
begin
  Result := (TheObject as PUMLEnumeration).LiteralCount;
end;

// PUMLEnumerationAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassAuto

function PUMLClassAuto.Get_IsActive: WordBool;
begin
  Result := (TheObject as PUMLClass).IsActive;
end;

procedure PUMLClassAuto.Set_IsActive(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsActive', BooleanToString(Value));
end;

function PUMLClassAuto.Get_AssociationClass: IUMLAssociationClass;
var
  E: PUMLAssociationClass;
begin
  E := (TheObject as PUMLClass).AssociationClass;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationClassAuto;
end;

procedure PUMLClassAuto.Set_AssociationClass(const Value: IUMLAssociationClass);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'AssociationClass', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationClass').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'AssociationClass', E as PModel);
  end;
end;

// PUMLClassAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNodeAuto

procedure PUMLNodeAuto.ClearDeployedComponents;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'DeployedComponents;');
end;

procedure PUMLNodeAuto.AddDeployedComponent(const Value: IUMLComponent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'DeployedComponents', E as PModel);
end;

procedure PUMLNodeAuto.RemoveDeployedComponent(const Value: IUMLComponent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'DeployedComponents', E as PModel);
end;

procedure PUMLNodeAuto.InsertDeployedComponent(Index: Integer; const Value: IUMLComponent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'DeployedComponents', Index, E as PModel);
end;

procedure PUMLNodeAuto.DeleteDeployedComponent(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'DeployedComponents', Index);
end;

function PUMLNodeAuto.IndexOfDeployedComponent(const Value: IUMLComponent): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLNode).IndexOfDeployedComponent(E as PUMLComponent);
  end;
end;

function PUMLNodeAuto.GetDeployedComponentAt(Index: Integer): IUMLComponent;
var
  E: PUMLComponent;
begin
  E := (TheObject as PUMLNode).DeployedComponents[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLComponentAuto;
end;

function PUMLNodeAuto.GetDeployedComponentCount: Integer;
begin
  Result := (TheObject as PUMLNode).DeployedComponentCount;
end;

procedure PUMLNodeAuto.ClearDeployedArtifacts;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'DeployedArtifacts;');
end;

procedure PUMLNodeAuto.AddDeployedArtifact(const Value: IUMLArtifact);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLArtifact').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'DeployedArtifacts', E as PModel);
end;

procedure PUMLNodeAuto.RemoveDeployedArtifact(const Value: IUMLArtifact);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLArtifact').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'DeployedArtifacts', E as PModel);
end;

procedure PUMLNodeAuto.InsertDeployedArtifact(Index: Integer; const Value: IUMLArtifact);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLArtifact').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'DeployedArtifacts', Index, E as PModel);
end;

procedure PUMLNodeAuto.DeleteDeployedArtifact(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'DeployedArtifacts', Index);
end;

function PUMLNodeAuto.IndexOfDeployedArtifact(const Value: IUMLArtifact): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLArtifact').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLNode).IndexOfDeployedArtifact(E as PUMLArtifact);
  end;
end;

function PUMLNodeAuto.GetDeployedArtifactAt(Index: Integer): IUMLArtifact;
var
  E: PUMLArtifact;
begin
  E := (TheObject as PUMLNode).DeployedArtifacts[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLArtifactAuto;
end;

function PUMLNodeAuto.GetDeployedArtifactCount: Integer;
begin
  Result := (TheObject as PUMLNode).DeployedArtifactCount;
end;

// PUMLNodeAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLArtifactAuto

procedure PUMLArtifactAuto.ClearImplementationLocations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ImplementationLocations;');
end;

procedure PUMLArtifactAuto.AddImplementationLocation(const Value: IUMLComponent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ImplementationLocations', E as PModel);
end;

procedure PUMLArtifactAuto.RemoveImplementationLocation(const Value: IUMLComponent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ImplementationLocations', E as PModel);
end;

procedure PUMLArtifactAuto.InsertImplementationLocation(Index: Integer; const Value: IUMLComponent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ImplementationLocations', Index, E as PModel);
end;

procedure PUMLArtifactAuto.DeleteImplementationLocation(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ImplementationLocations', Index);
end;

function PUMLArtifactAuto.IndexOfImplementationLocation(const Value: IUMLComponent): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLComponent').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLArtifact).IndexOfImplementationLocation(E as PUMLComponent);
  end;
end;

function PUMLArtifactAuto.GetImplementationLocationAt(Index: Integer): IUMLComponent;
var
  E: PUMLComponent;
begin
  E := (TheObject as PUMLArtifact).ImplementationLocations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLComponentAuto;
end;

function PUMLArtifactAuto.GetImplementationLocationCount: Integer;
begin
  Result := (TheObject as PUMLArtifact).ImplementationLocationCount;
end;

procedure PUMLArtifactAuto.ClearDeploymentLocations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'DeploymentLocations;');
end;

procedure PUMLArtifactAuto.AddDeploymentLocation(const Value: IUMLNode);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLNode').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'DeploymentLocations', E as PModel);
end;

procedure PUMLArtifactAuto.RemoveDeploymentLocation(const Value: IUMLNode);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLNode').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'DeploymentLocations', E as PModel);
end;

procedure PUMLArtifactAuto.InsertDeploymentLocation(Index: Integer; const Value: IUMLNode);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLNode').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'DeploymentLocations', Index, E as PModel);
end;

procedure PUMLArtifactAuto.DeleteDeploymentLocation(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'DeploymentLocations', Index);
end;

function PUMLArtifactAuto.IndexOfDeploymentLocation(const Value: IUMLNode): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLNode').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLArtifact).IndexOfDeploymentLocation(E as PUMLNode);
  end;
end;

function PUMLArtifactAuto.GetDeploymentLocationAt(Index: Integer): IUMLNode;
var
  E: PUMLNode;
begin
  E := (TheObject as PUMLArtifact).DeploymentLocations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLNodeAuto;
end;

function PUMLArtifactAuto.GetDeploymentLocationCount: Integer;
begin
  Result := (TheObject as PUMLArtifact).DeploymentLocationCount;
end;

// PUMLArtifactAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponentAuto

procedure PUMLComponentAuto.ClearDeploymentLocations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'DeploymentLocations;');
end;

procedure PUMLComponentAuto.AddDeploymentLocation(const Value: IUMLNode);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLNode').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'DeploymentLocations', E as PModel);
end;

procedure PUMLComponentAuto.RemoveDeploymentLocation(const Value: IUMLNode);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLNode').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'DeploymentLocations', E as PModel);
end;

procedure PUMLComponentAuto.InsertDeploymentLocation(Index: Integer; const Value: IUMLNode);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLNode').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'DeploymentLocations', Index, E as PModel);
end;

procedure PUMLComponentAuto.DeleteDeploymentLocation(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'DeploymentLocations', Index);
end;

function PUMLComponentAuto.IndexOfDeploymentLocation(const Value: IUMLNode): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLNode').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLComponent).IndexOfDeploymentLocation(E as PUMLNode);
  end;
end;

function PUMLComponentAuto.GetDeploymentLocationAt(Index: Integer): IUMLNode;
var
  E: PUMLNode;
begin
  E := (TheObject as PUMLComponent).DeploymentLocations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLNodeAuto;
end;

function PUMLComponentAuto.GetDeploymentLocationCount: Integer;
begin
  Result := (TheObject as PUMLComponent).DeploymentLocationCount;
end;

procedure PUMLComponentAuto.ClearResidents;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Residents;');
end;

procedure PUMLComponentAuto.AddResident(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Residents', E as PModel);
end;

procedure PUMLComponentAuto.RemoveResident(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Residents', E as PModel);
end;

procedure PUMLComponentAuto.InsertResident(Index: Integer; const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Residents', Index, E as PModel);
end;

procedure PUMLComponentAuto.DeleteResident(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Residents', Index);
end;

function PUMLComponentAuto.IndexOfResident(const Value: IUMLModelElement): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLComponent).IndexOfResident(E as PUMLModelElement);
  end;
end;

function PUMLComponentAuto.GetResidentAt(Index: Integer): IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLComponent).Residents[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

function PUMLComponentAuto.GetResidentCount: Integer;
begin
  Result := (TheObject as PUMLComponent).ResidentCount;
end;

procedure PUMLComponentAuto.ClearImplementations;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Implementations;');
end;

procedure PUMLComponentAuto.AddImplementation(const Value: IUMLArtifact);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLArtifact').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Implementations', E as PModel);
end;

procedure PUMLComponentAuto.RemoveImplementation(const Value: IUMLArtifact);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLArtifact').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Implementations', E as PModel);
end;

procedure PUMLComponentAuto.InsertImplementation(Index: Integer; const Value: IUMLArtifact);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLArtifact').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Implementations', Index, E as PModel);
end;

procedure PUMLComponentAuto.DeleteImplementation(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Implementations', Index);
end;

function PUMLComponentAuto.IndexOfImplementation(const Value: IUMLArtifact): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLArtifact').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLComponent).IndexOfImplementation(E as PUMLArtifact);
  end;
end;

function PUMLComponentAuto.GetImplementationAt(Index: Integer): IUMLArtifact;
var
  E: PUMLArtifact;
begin
  E := (TheObject as PUMLComponent).Implementations[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLArtifactAuto;
end;

function PUMLComponentAuto.GetImplementationCount: Integer;
begin
  Result := (TheObject as PUMLComponent).ImplementationCount;
end;

// PUMLComponentAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSignalAuto

procedure PUMLSignalAuto.ClearReceptions;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Receptions;');
end;

procedure PUMLSignalAuto.AddReception(const Value: IUMLReception);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLReception').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Receptions', E as PModel);
end;

procedure PUMLSignalAuto.RemoveReception(const Value: IUMLReception);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLReception').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Receptions', E as PModel);
end;

procedure PUMLSignalAuto.InsertReception(Index: Integer; const Value: IUMLReception);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLReception').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Receptions', Index, E as PModel);
end;

procedure PUMLSignalAuto.DeleteReception(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Receptions', Index);
end;

function PUMLSignalAuto.IndexOfReception(const Value: IUMLReception): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLReception').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLSignal).IndexOfReception(E as PUMLReception);
  end;
end;

function PUMLSignalAuto.GetReceptionAt(Index: Integer): IUMLReception;
var
  E: PUMLReception;
begin
  E := (TheObject as PUMLSignal).Receptions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLReceptionAuto;
end;

function PUMLSignalAuto.GetReceptionCount: Integer;
begin
  Result := (TheObject as PUMLSignal).ReceptionCount;
end;

procedure PUMLSignalAuto.ClearContexts;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Contexts;');
end;

procedure PUMLSignalAuto.AddContext(const Value: IUMLBehavioralFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLBehavioralFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Contexts', E as PModel);
end;

procedure PUMLSignalAuto.RemoveContext(const Value: IUMLBehavioralFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLBehavioralFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Contexts', E as PModel);
end;

procedure PUMLSignalAuto.InsertContext(Index: Integer; const Value: IUMLBehavioralFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLBehavioralFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Contexts', Index, E as PModel);
end;

procedure PUMLSignalAuto.DeleteContext(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Contexts', Index);
end;

function PUMLSignalAuto.IndexOfContext(const Value: IUMLBehavioralFeature): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLBehavioralFeature').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLSignal).IndexOfContext(E as PUMLBehavioralFeature);
  end;
end;

function PUMLSignalAuto.GetContextAt(Index: Integer): IUMLBehavioralFeature;
var
  E: PUMLBehavioralFeature;
begin
  E := (TheObject as PUMLSignal).Contexts[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLBehavioralFeatureAuto;
end;

function PUMLSignalAuto.GetContextCount: Integer;
begin
  Result := (TheObject as PUMLSignal).ContextCount;
end;

procedure PUMLSignalAuto.ClearSendActions;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'SendActions;');
end;

procedure PUMLSignalAuto.AddSendAction(const Value: IUMLSendAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSendAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'SendActions', E as PModel);
end;

procedure PUMLSignalAuto.RemoveSendAction(const Value: IUMLSendAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSendAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'SendActions', E as PModel);
end;

procedure PUMLSignalAuto.InsertSendAction(Index: Integer; const Value: IUMLSendAction);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSendAction').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'SendActions', Index, E as PModel);
end;

procedure PUMLSignalAuto.DeleteSendAction(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'SendActions', Index);
end;

function PUMLSignalAuto.IndexOfSendAction(const Value: IUMLSendAction): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLSendAction').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLSignal).IndexOfSendAction(E as PUMLSendAction);
  end;
end;

function PUMLSignalAuto.GetSendActionAt(Index: Integer): IUMLSendAction;
var
  E: PUMLSendAction;
begin
  E := (TheObject as PUMLSignal).SendActions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLSendActionAuto;
end;

function PUMLSignalAuto.GetSendActionCount: Integer;
begin
  Result := (TheObject as PUMLSignal).SendActionCount;
end;

procedure PUMLSignalAuto.ClearOccurrences;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Occurrences;');
end;

procedure PUMLSignalAuto.AddOccurrence(const Value: IUMLSignalEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSignalEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Occurrences', E as PModel);
end;

procedure PUMLSignalAuto.RemoveOccurrence(const Value: IUMLSignalEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSignalEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Occurrences', E as PModel);
end;

procedure PUMLSignalAuto.InsertOccurrence(Index: Integer; const Value: IUMLSignalEvent);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLSignalEvent').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Occurrences', Index, E as PModel);
end;

procedure PUMLSignalAuto.DeleteOccurrence(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Occurrences', Index);
end;

function PUMLSignalAuto.IndexOfOccurrence(const Value: IUMLSignalEvent): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLSignalEvent').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLSignal).IndexOfOccurrence(E as PUMLSignalEvent);
  end;
end;

function PUMLSignalAuto.GetOccurrenceAt(Index: Integer): IUMLSignalEvent;
var
  E: PUMLSignalEvent;
begin
  E := (TheObject as PUMLSignal).Occurrences[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLSignalEventAuto;
end;

function PUMLSignalAuto.GetOccurrenceCount: Integer;
begin
  Result := (TheObject as PUMLSignal).OccurrenceCount;
end;

// PUMLSignalAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLExceptionAuto

// PUMLExceptionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassifierRoleAuto

function PUMLClassifierRoleAuto.Get_Multiplicity: WideString;
begin
  Result := (TheObject as PUMLClassifierRole).Multiplicity;
end;

procedure PUMLClassifierRoleAuto.Set_Multiplicity(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Multiplicity', Value);
end;

function PUMLClassifierRoleAuto.Get_Base: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLClassifierRole).Base;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLClassifierRoleAuto.Set_Base(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', E as PModel);
  end;
end;

procedure PUMLClassifierRoleAuto.ClearAvailableFeatures;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AvailableFeatures;');
end;

procedure PUMLClassifierRoleAuto.AddAvailableFeature(const Value: IUMLFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AvailableFeatures', E as PModel);
end;

procedure PUMLClassifierRoleAuto.RemoveAvailableFeature(const Value: IUMLFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AvailableFeatures', E as PModel);
end;

procedure PUMLClassifierRoleAuto.InsertAvailableFeature(Index: Integer; const Value: IUMLFeature);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLFeature').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AvailableFeatures', Index, E as PModel);
end;

procedure PUMLClassifierRoleAuto.DeleteAvailableFeature(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AvailableFeatures', Index);
end;

function PUMLClassifierRoleAuto.IndexOfAvailableFeature(const Value: IUMLFeature): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLFeature').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifierRole).IndexOfAvailableFeature(E as PUMLFeature);
  end;
end;

function PUMLClassifierRoleAuto.GetAvailableFeatureAt(Index: Integer): IUMLFeature;
var
  E: PUMLFeature;
begin
  E := (TheObject as PUMLClassifierRole).AvailableFeatures[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLFeatureAuto;
end;

function PUMLClassifierRoleAuto.GetAvailableFeatureCount: Integer;
begin
  Result := (TheObject as PUMLClassifierRole).AvailableFeatureCount;
end;

procedure PUMLClassifierRoleAuto.ClearSenderClientMessages;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'SenderClientMessages;');
end;

procedure PUMLClassifierRoleAuto.AddSenderClientMessage(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'SenderClientMessages', E as PModel);
end;

procedure PUMLClassifierRoleAuto.RemoveSenderClientMessage(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'SenderClientMessages', E as PModel);
end;

procedure PUMLClassifierRoleAuto.InsertSenderClientMessage(Index: Integer; const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'SenderClientMessages', Index, E as PModel);
end;

procedure PUMLClassifierRoleAuto.DeleteSenderClientMessage(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'SenderClientMessages', Index);
end;

function PUMLClassifierRoleAuto.IndexOfSenderClientMessage(const Value: IUMLMessage): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifierRole).IndexOfSenderClientMessage(E as PUMLMessage);
  end;
end;

function PUMLClassifierRoleAuto.GetSenderClientMessageAt(Index: Integer): IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLClassifierRole).SenderClientMessages[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

function PUMLClassifierRoleAuto.GetSenderClientMessageCount: Integer;
begin
  Result := (TheObject as PUMLClassifierRole).SenderClientMessageCount;
end;

procedure PUMLClassifierRoleAuto.ClearReceiverClientMessages;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ReceiverClientMessages;');
end;

procedure PUMLClassifierRoleAuto.AddReceiverClientMessage(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ReceiverClientMessages', E as PModel);
end;

procedure PUMLClassifierRoleAuto.RemoveReceiverClientMessage(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ReceiverClientMessages', E as PModel);
end;

procedure PUMLClassifierRoleAuto.InsertReceiverClientMessage(Index: Integer; const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ReceiverClientMessages', Index, E as PModel);
end;

procedure PUMLClassifierRoleAuto.DeleteReceiverClientMessage(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ReceiverClientMessages', Index);
end;

function PUMLClassifierRoleAuto.IndexOfReceiverClientMessage(const Value: IUMLMessage): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifierRole).IndexOfReceiverClientMessage(E as PUMLMessage);
  end;
end;

function PUMLClassifierRoleAuto.GetReceiverClientMessageAt(Index: Integer): IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLClassifierRole).ReceiverClientMessages[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

function PUMLClassifierRoleAuto.GetReceiverClientMessageCount: Integer;
begin
  Result := (TheObject as PUMLClassifierRole).ReceiverClientMessageCount;
end;

procedure PUMLClassifierRoleAuto.ClearAvailableContents;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AvailableContents;');
end;

procedure PUMLClassifierRoleAuto.AddAvailableContent(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AvailableContents', E as PModel);
end;

procedure PUMLClassifierRoleAuto.RemoveAvailableContent(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AvailableContents', E as PModel);
end;

procedure PUMLClassifierRoleAuto.InsertAvailableContent(Index: Integer; const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AvailableContents', Index, E as PModel);
end;

procedure PUMLClassifierRoleAuto.DeleteAvailableContent(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AvailableContents', Index);
end;

function PUMLClassifierRoleAuto.IndexOfAvailableContent(const Value: IUMLModelElement): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifierRole).IndexOfAvailableContent(E as PUMLModelElement);
  end;
end;

function PUMLClassifierRoleAuto.GetAvailableContentAt(Index: Integer): IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLClassifierRole).AvailableContents[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

function PUMLClassifierRoleAuto.GetAvailableContentCount: Integer;
begin
  Result := (TheObject as PUMLClassifierRole).AvailableContentCount;
end;

procedure PUMLClassifierRoleAuto.ClearConformingInstances;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ConformingInstances;');
end;

procedure PUMLClassifierRoleAuto.AddConformingInstance(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ConformingInstances', E as PModel);
end;

procedure PUMLClassifierRoleAuto.RemoveConformingInstance(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ConformingInstances', E as PModel);
end;

procedure PUMLClassifierRoleAuto.InsertConformingInstance(Index: Integer; const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ConformingInstances', Index, E as PModel);
end;

procedure PUMLClassifierRoleAuto.DeleteConformingInstance(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ConformingInstances', Index);
end;

function PUMLClassifierRoleAuto.IndexOfConformingInstance(const Value: IUMLInstance): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLClassifierRole).IndexOfConformingInstance(E as PUMLInstance);
  end;
end;

function PUMLClassifierRoleAuto.GetConformingInstanceAt(Index: Integer): IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLClassifierRole).ConformingInstances[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

function PUMLClassifierRoleAuto.GetConformingInstanceCount: Integer;
begin
  Result := (TheObject as PUMLClassifierRole).ConformingInstanceCount;
end;

// PUMLClassifierRoleAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLEventAuto

function PUMLEventAuto.GetParameterAt(Index: Integer): IUMLParameter;
var
  E: PUMLParameter;
begin
  E := (TheObject as PUMLEvent).Parameters[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLParameterAuto;
end;

function PUMLEventAuto.GetParameterCount: Integer;
begin
  Result := (TheObject as PUMLEvent).ParameterCount;
end;

procedure PUMLEventAuto.ClearStates;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'States;');
end;

procedure PUMLEventAuto.AddState(const Value: IUMLState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'States', E as PModel);
end;

procedure PUMLEventAuto.RemoveState(const Value: IUMLState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'States', E as PModel);
end;

procedure PUMLEventAuto.InsertState(Index: Integer; const Value: IUMLState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'States', Index, E as PModel);
end;

procedure PUMLEventAuto.DeleteState(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'States', Index);
end;

function PUMLEventAuto.IndexOfState(const Value: IUMLState): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLState').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLEvent).IndexOfState(E as PUMLState);
  end;
end;

function PUMLEventAuto.GetStateAt(Index: Integer): IUMLState;
var
  E: PUMLState;
begin
  E := (TheObject as PUMLEvent).States[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateAuto;
end;

function PUMLEventAuto.GetStateCount: Integer;
begin
  Result := (TheObject as PUMLEvent).StateCount;
end;

function PUMLEventAuto.Get_Transition: IUMLTransition;
var
  E: PUMLTransition;
begin
  E := (TheObject as PUMLEvent).Transition;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTransitionAuto;
end;

// PUMLEventAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLChangeEventAuto

function PUMLChangeEventAuto.Get_ChangeExpression: WideString;
begin
  Result := (TheObject as PUMLChangeEvent).ChangeExpression;
end;

procedure PUMLChangeEventAuto.Set_ChangeExpression(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ChangeExpression', Value);
end;

// PUMLChangeEventAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSignalEventAuto

function PUMLSignalEventAuto.Get_Signal: IUMLSignal;
var
  E: PUMLSignal;
begin
  E := (TheObject as PUMLSignalEvent).Signal;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLSignalAuto;
end;

procedure PUMLSignalEventAuto.Set_Signal(const Value: IUMLSignal);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Signal', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLSignal').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Signal', E as PModel);
  end;
end;

// PUMLSignalEventAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTimeEventAuto

function PUMLTimeEventAuto.Get_When: WideString;
begin
  Result := (TheObject as PUMLTimeEvent).When;
end;

procedure PUMLTimeEventAuto.Set_When(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'When', Value);
end;

// PUMLTimeEventAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCallEventAuto

function PUMLCallEventAuto.Get_Operation: IUMLOperation;
var
  E: PUMLOperation;
begin
  E := (TheObject as PUMLCallEvent).Operation;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationAuto;
end;

procedure PUMLCallEventAuto.Set_Operation(const Value: IUMLOperation);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Operation', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLOperation').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Operation', E as PModel);
  end;
end;

// PUMLCallEventAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLEnumerationLiteralAuto

function PUMLEnumerationLiteralAuto.Get_Enumeration: IUMLEnumeration;
var
  E: PUMLEnumeration;
begin
  E := (TheObject as PUMLEnumerationLiteral).Enumeration;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLEnumerationAuto;
end;

// PUMLEnumerationLiteralAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStimulusAuto

function PUMLStimulusAuto.Get_Arguments: WideString;
begin
  Result := (TheObject as PUMLStimulus).Arguments;
end;

procedure PUMLStimulusAuto.Set_Arguments(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Arguments', Value);
end;

function PUMLStimulusAuto.Get_Return: WideString;
begin
  Result := (TheObject as PUMLStimulus).Return;
end;

procedure PUMLStimulusAuto.Set_Return(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Return', Value);
end;

function PUMLStimulusAuto.Get_Iteration: WideString;
begin
  Result := (TheObject as PUMLStimulus).Iteration;
end;

procedure PUMLStimulusAuto.Set_Iteration(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Iteration', Value);
end;

function PUMLStimulusAuto.Get_Branch: WideString;
begin
  Result := (TheObject as PUMLStimulus).Branch;
end;

procedure PUMLStimulusAuto.Set_Branch(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Branch', Value);
end;

function PUMLStimulusAuto.Get_Sender: IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLStimulus).Sender;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

procedure PUMLStimulusAuto.Set_Sender(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Sender', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Sender', E as PModel);
  end;
end;

function PUMLStimulusAuto.Get_Receiver: IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLStimulus).Receiver;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

procedure PUMLStimulusAuto.Set_Receiver(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Receiver', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Receiver', E as PModel);
  end;
end;

function PUMLStimulusAuto.Get_CommunicationLink: IUMLLink;
var
  E: PUMLLink;
begin
  E := (TheObject as PUMLStimulus).CommunicationLink;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkAuto;
end;

procedure PUMLStimulusAuto.Set_CommunicationLink(const Value: IUMLLink);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'CommunicationLink', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'CommunicationLink', E as PModel);
  end;
end;

function PUMLStimulusAuto.Get_Action: IUMLAction;
var
  E: PUMLAction;
begin
  E := (TheObject as PUMLStimulus).Action;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionAuto;
end;

function PUMLStimulusAuto.Get_Activator: IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLStimulus).Activator;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

procedure PUMLStimulusAuto.Set_Activator(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Activator', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Activator', E as PModel);
  end;
end;

procedure PUMLStimulusAuto.ClearActivatees;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Activatees;');
end;

procedure PUMLStimulusAuto.AddActivatee(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Activatees', E as PModel);
end;

procedure PUMLStimulusAuto.RemoveActivatee(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Activatees', E as PModel);
end;

procedure PUMLStimulusAuto.InsertActivatee(Index: Integer; const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Activatees', Index, E as PModel);
end;

procedure PUMLStimulusAuto.DeleteActivatee(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Activatees', Index);
end;

function PUMLStimulusAuto.IndexOfActivatee(const Value: IUMLStimulus): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLStimulus).IndexOfActivatee(E as PUMLStimulus);
  end;
end;

function PUMLStimulusAuto.GetActivateeAt(Index: Integer): IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLStimulus).Activatees[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

function PUMLStimulusAuto.GetActivateeCount: Integer;
begin
  Result := (TheObject as PUMLStimulus).ActivateeCount;
end;

function PUMLStimulusAuto.Get_Predecessor: IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLStimulus).Predecessor;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

procedure PUMLStimulusAuto.Set_Predecessor(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Predecessor', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Predecessor', E as PModel);
  end;
end;

function PUMLStimulusAuto.Get_Successor: IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLStimulus).Successor;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

procedure PUMLStimulusAuto.Set_Successor(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Successor', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Successor', E as PModel);
  end;
end;

procedure PUMLStimulusAuto.ClearPlayedRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'PlayedRoles;');
end;

procedure PUMLStimulusAuto.AddPlayedRole(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'PlayedRoles', E as PModel);
end;

procedure PUMLStimulusAuto.RemovePlayedRole(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'PlayedRoles', E as PModel);
end;

procedure PUMLStimulusAuto.InsertPlayedRole(Index: Integer; const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'PlayedRoles', Index, E as PModel);
end;

procedure PUMLStimulusAuto.DeletePlayedRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'PlayedRoles', Index);
end;

function PUMLStimulusAuto.IndexOfPlayedRole(const Value: IUMLMessage): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLStimulus).IndexOfPlayedRole(E as PUMLMessage);
  end;
end;

function PUMLStimulusAuto.GetPlayedRoleAt(Index: Integer): IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLStimulus).PlayedRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

function PUMLStimulusAuto.GetPlayedRoleCount: Integer;
begin
  Result := (TheObject as PUMLStimulus).PlayedRoleCount;
end;

function PUMLStimulusAuto.Get_InteractionInstanceSet: IUMLInteractionInstanceSet;
var
  E: PUMLInteractionInstanceSet;
begin
  E := (TheObject as PUMLStimulus).InteractionInstanceSet;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionInstanceSetAuto;
end;

// PUMLStimulusAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAttributeLinkAuto

function PUMLAttributeLinkAuto.Get_ValueExpression: WideString;
begin
  Result := (TheObject as PUMLAttributeLink).ValueExpression;
end;

procedure PUMLAttributeLinkAuto.Set_ValueExpression(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ValueExpression', Value);
end;

function PUMLAttributeLinkAuto.Get_Attribute: IUMLAttribute;
var
  E: PUMLAttribute;
begin
  E := (TheObject as PUMLAttributeLink).Attribute;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeAuto;
end;

procedure PUMLAttributeLinkAuto.Set_Attribute(const Value: IUMLAttribute);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Attribute', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAttribute').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Attribute', E as PModel);
  end;
end;

function PUMLAttributeLinkAuto.Get_Value_: IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLAttributeLink).Value_;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

procedure PUMLAttributeLinkAuto.Set_Value_(const Value: IUMLInstance);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Value_', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLInstance').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Value_', E as PModel);
  end;
end;

function PUMLAttributeLinkAuto.Get_Instance: IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLAttributeLink).Instance;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

function PUMLAttributeLinkAuto.Get_LinkEnd: IUMLLinkEnd;
var
  E: PUMLLinkEnd;
begin
  E := (TheObject as PUMLAttributeLink).LinkEnd;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkEndAuto;
end;

// PUMLAttributeLinkAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLRelationshipAuto

// PUMLRelationshipAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLGeneralizationAuto

function PUMLGeneralizationAuto.Get_Discriminator: WideString;
begin
  Result := (TheObject as PUMLGeneralization).Discriminator;
end;

procedure PUMLGeneralizationAuto.Set_Discriminator(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Discriminator', Value);
end;

function PUMLGeneralizationAuto.Get_Child: IUMLGeneralizableElement;
var
  E: PUMLGeneralizableElement;
begin
  E := (TheObject as PUMLGeneralization).Child;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLGeneralizableElementAuto;
end;

procedure PUMLGeneralizationAuto.Set_Child(const Value: IUMLGeneralizableElement);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Child', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLGeneralizableElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Child', E as PModel);
  end;
end;

function PUMLGeneralizationAuto.Get_Parent: IUMLGeneralizableElement;
var
  E: PUMLGeneralizableElement;
begin
  E := (TheObject as PUMLGeneralization).Parent;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLGeneralizableElementAuto;
end;

procedure PUMLGeneralizationAuto.Set_Parent(const Value: IUMLGeneralizableElement);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Parent', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLGeneralizableElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Parent', E as PModel);
  end;
end;

function PUMLGeneralizationAuto.Get_Powertype: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLGeneralization).Powertype;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLGeneralizationAuto.Set_Powertype(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Powertype', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Powertype', E as PModel);
  end;
end;

// PUMLGeneralizationAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLIncludeAuto

function PUMLIncludeAuto.Get_Addition: IUMLUseCase;
var
  E: PUMLUseCase;
begin
  E := (TheObject as PUMLInclude).Addition;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLUseCaseAuto;
end;

procedure PUMLIncludeAuto.Set_Addition(const Value: IUMLUseCase);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Addition', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLUseCase').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Addition', E as PModel);
  end;
end;

function PUMLIncludeAuto.Get_Base: IUMLUseCase;
var
  E: PUMLUseCase;
begin
  E := (TheObject as PUMLInclude).Base;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLUseCaseAuto;
end;

procedure PUMLIncludeAuto.Set_Base(const Value: IUMLUseCase);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLUseCase').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', E as PModel);
  end;
end;

// PUMLIncludeAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDependencyAuto

function PUMLDependencyAuto.Get_Mapping: WideString;
begin
  Result := (TheObject as PUMLDependency).Mapping;
end;

procedure PUMLDependencyAuto.Set_Mapping(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Mapping', Value);
end;

function PUMLDependencyAuto.Get_Client: IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLDependency).Client;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

procedure PUMLDependencyAuto.Set_Client(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Client', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Client', E as PModel);
  end;
end;

function PUMLDependencyAuto.Get_Supplier: IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLDependency).Supplier;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

procedure PUMLDependencyAuto.Set_Supplier(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Supplier', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Supplier', E as PModel);
  end;
end;

// PUMLDependencyAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLRealizationAuto

// PUMLRealizationAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLExtendAuto

function PUMLExtendAuto.Get_Condition: WideString;
begin
  Result := (TheObject as PUMLExtend).Condition;
end;

procedure PUMLExtendAuto.Set_Condition(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Condition', Value);
end;

function PUMLExtendAuto.Get_Base: IUMLUseCase;
var
  E: PUMLUseCase;
begin
  E := (TheObject as PUMLExtend).Base;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLUseCaseAuto;
end;

procedure PUMLExtendAuto.Set_Base(const Value: IUMLUseCase);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLUseCase').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', E as PModel);
  end;
end;

function PUMLExtendAuto.Get_Extension: IUMLUseCase;
var
  E: PUMLUseCase;
begin
  E := (TheObject as PUMLExtend).Extension;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLUseCaseAuto;
end;

procedure PUMLExtendAuto.Set_Extension(const Value: IUMLUseCase);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Extension', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLUseCase').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Extension', E as PModel);
  end;
end;

procedure PUMLExtendAuto.ClearExtensionPoints;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ExtensionPoints;');
end;

procedure PUMLExtendAuto.AddExtensionPoint(const Value: IUMLExtensionPoint);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtensionPoint').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ExtensionPoints', E as PModel);
end;

procedure PUMLExtendAuto.RemoveExtensionPoint(const Value: IUMLExtensionPoint);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtensionPoint').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ExtensionPoints', E as PModel);
end;

procedure PUMLExtendAuto.InsertExtensionPoint(Index: Integer; const Value: IUMLExtensionPoint);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtensionPoint').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ExtensionPoints', Index, E as PModel);
end;

procedure PUMLExtendAuto.DeleteExtensionPoint(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ExtensionPoints', Index);
end;

function PUMLExtendAuto.IndexOfExtensionPoint(const Value: IUMLExtensionPoint): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLExtensionPoint').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLExtend).IndexOfExtensionPoint(E as PUMLExtensionPoint);
  end;
end;

function PUMLExtendAuto.GetExtensionPointAt(Index: Integer): IUMLExtensionPoint;
var
  E: PUMLExtensionPoint;
begin
  E := (TheObject as PUMLExtend).ExtensionPoints[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLExtensionPointAuto;
end;

function PUMLExtendAuto.GetExtensionPointCount: Integer;
begin
  Result := (TheObject as PUMLExtend).ExtensionPointCount;
end;

// PUMLExtendAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationAuto

function PUMLAssociationAuto.GetConnectionAt(Index: Integer): IUMLAssociationEnd;
var
  E: PUMLAssociationEnd;
begin
  E := (TheObject as PUMLAssociation).Connections[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationEndAuto;
end;

function PUMLAssociationAuto.GetConnectionCount: Integer;
begin
  Result := (TheObject as PUMLAssociation).ConnectionCount;
end;

function PUMLAssociationAuto.Get_AssociationClass: IUMLAssociationClass;
var
  E: PUMLAssociationClass;
begin
  E := (TheObject as PUMLAssociation).AssociationClass;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationClassAuto;
end;

procedure PUMLAssociationAuto.Set_AssociationClass(const Value: IUMLAssociationClass);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'AssociationClass', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationClass').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'AssociationClass', E as PModel);
  end;
end;

procedure PUMLAssociationAuto.ClearLinks;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Links;');
end;

procedure PUMLAssociationAuto.AddLink(const Value: IUMLLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Links', E as PModel);
end;

procedure PUMLAssociationAuto.RemoveLink(const Value: IUMLLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Links', E as PModel);
end;

procedure PUMLAssociationAuto.InsertLink(Index: Integer; const Value: IUMLLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Links', Index, E as PModel);
end;

procedure PUMLAssociationAuto.DeleteLink(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Links', Index);
end;

function PUMLAssociationAuto.IndexOfLink(const Value: IUMLLink): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAssociation).IndexOfLink(E as PUMLLink);
  end;
end;

function PUMLAssociationAuto.GetLinkAt(Index: Integer): IUMLLink;
var
  E: PUMLLink;
begin
  E := (TheObject as PUMLAssociation).Links[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkAuto;
end;

function PUMLAssociationAuto.GetLinkCount: Integer;
begin
  Result := (TheObject as PUMLAssociation).LinkCount;
end;

procedure PUMLAssociationAuto.ClearAssociationRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AssociationRoles;');
end;

procedure PUMLAssociationAuto.AddAssociationRole(const Value: IUMLAssociationRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AssociationRoles', E as PModel);
end;

procedure PUMLAssociationAuto.RemoveAssociationRole(const Value: IUMLAssociationRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AssociationRoles', E as PModel);
end;

procedure PUMLAssociationAuto.InsertAssociationRole(Index: Integer; const Value: IUMLAssociationRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AssociationRoles', Index, E as PModel);
end;

procedure PUMLAssociationAuto.DeleteAssociationRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AssociationRoles', Index);
end;

function PUMLAssociationAuto.IndexOfAssociationRole(const Value: IUMLAssociationRole): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAssociation).IndexOfAssociationRole(E as PUMLAssociationRole);
  end;
end;

function PUMLAssociationAuto.GetAssociationRoleAt(Index: Integer): IUMLAssociationRole;
var
  E: PUMLAssociationRole;
begin
  E := (TheObject as PUMLAssociation).AssociationRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationRoleAuto;
end;

function PUMLAssociationAuto.GetAssociationRoleCount: Integer;
begin
  Result := (TheObject as PUMLAssociation).AssociationRoleCount;
end;

// PUMLAssociationAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationRoleAuto

function PUMLAssociationRoleAuto.Get_Multiplicity: WideString;
begin
  Result := (TheObject as PUMLAssociationRole).Multiplicity;
end;

procedure PUMLAssociationRoleAuto.Set_Multiplicity(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Multiplicity', Value);
end;

function PUMLAssociationRoleAuto.Get_Base: IUMLAssociation;
var
  E: PUMLAssociation;
begin
  E := (TheObject as PUMLAssociationRole).Base;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationAuto;
end;

procedure PUMLAssociationRoleAuto.Set_Base(const Value: IUMLAssociation);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAssociation').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', E as PModel);
  end;
end;

procedure PUMLAssociationRoleAuto.ClearMessages;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Messages;');
end;

procedure PUMLAssociationRoleAuto.AddMessage(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Messages', E as PModel);
end;

procedure PUMLAssociationRoleAuto.RemoveMessage(const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Messages', E as PModel);
end;

procedure PUMLAssociationRoleAuto.InsertMessage(Index: Integer; const Value: IUMLMessage);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Messages', Index, E as PModel);
end;

procedure PUMLAssociationRoleAuto.DeleteMessage(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Messages', Index);
end;

function PUMLAssociationRoleAuto.IndexOfMessage(const Value: IUMLMessage): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLMessage').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAssociationRole).IndexOfMessage(E as PUMLMessage);
  end;
end;

function PUMLAssociationRoleAuto.GetMessageAt(Index: Integer): IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLAssociationRole).Messages[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

function PUMLAssociationRoleAuto.GetMessageCount: Integer;
begin
  Result := (TheObject as PUMLAssociationRole).MessageCount;
end;

procedure PUMLAssociationRoleAuto.ClearConformingLinks;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'ConformingLinks;');
end;

procedure PUMLAssociationRoleAuto.AddConformingLink(const Value: IUMLLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'ConformingLinks', E as PModel);
end;

procedure PUMLAssociationRoleAuto.RemoveConformingLink(const Value: IUMLLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'ConformingLinks', E as PModel);
end;

procedure PUMLAssociationRoleAuto.InsertConformingLink(Index: Integer; const Value: IUMLLink);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'ConformingLinks', Index, E as PModel);
end;

procedure PUMLAssociationRoleAuto.DeleteConformingLink(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'ConformingLinks', Index);
end;

function PUMLAssociationRoleAuto.IndexOfConformingLink(const Value: IUMLLink): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLLink').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAssociationRole).IndexOfConformingLink(E as PUMLLink);
  end;
end;

function PUMLAssociationRoleAuto.GetConformingLinkAt(Index: Integer): IUMLLink;
var
  E: PUMLLink;
begin
  E := (TheObject as PUMLAssociationRole).ConformingLinks[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkAuto;
end;

function PUMLAssociationRoleAuto.GetConformingLinkCount: Integer;
begin
  Result := (TheObject as PUMLAssociationRole).ConformingLinkCount;
end;

// PUMLAssociationRoleAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActionAuto

function PUMLActionAuto.Get_Recurrence: WideString;
begin
  Result := (TheObject as PUMLAction).Recurrence;
end;

procedure PUMLActionAuto.Set_Recurrence(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Recurrence', Value);
end;

function PUMLActionAuto.Get_Target: WideString;
begin
  Result := (TheObject as PUMLAction).Target;
end;

procedure PUMLActionAuto.Set_Target(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Target', Value);
end;

function PUMLActionAuto.Get_IsAsynchronous: WordBool;
begin
  Result := (TheObject as PUMLAction).IsAsynchronous;
end;

procedure PUMLActionAuto.Set_IsAsynchronous(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsAsynchronous', BooleanToString(Value));
end;

function PUMLActionAuto.Get_Script: WideString;
begin
  Result := (TheObject as PUMLAction).Script;
end;

procedure PUMLActionAuto.Set_Script(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Script', Value);
end;

function PUMLActionAuto.GetActualArgumentAt(Index: Integer): IUMLArgument;
var
  E: PUMLArgument;
begin
  E := (TheObject as PUMLAction).ActualArguments[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLArgumentAuto;
end;

function PUMLActionAuto.GetActualArgumentCount: Integer;
begin
  Result := (TheObject as PUMLAction).ActualArgumentCount;
end;

function PUMLActionAuto.Get_ActionSequence: IUMLActionSequence;
var
  E: PUMLActionSequence;
begin
  E := (TheObject as PUMLAction).ActionSequence;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionSequenceAuto;
end;

function PUMLActionAuto.Get_Stimulus: IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLAction).Stimulus;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

function PUMLActionAuto.Get_EntryState: IUMLState;
var
  E: PUMLState;
begin
  E := (TheObject as PUMLAction).EntryState;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateAuto;
end;

function PUMLActionAuto.Get_ExitState: IUMLState;
var
  E: PUMLState;
begin
  E := (TheObject as PUMLAction).ExitState;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateAuto;
end;

function PUMLActionAuto.Get_Transition: IUMLTransition;
var
  E: PUMLTransition;
begin
  E := (TheObject as PUMLAction).Transition;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTransitionAuto;
end;

function PUMLActionAuto.Get_DoActivityState: IUMLState;
var
  E: PUMLState;
begin
  E := (TheObject as PUMLAction).DoActivityState;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateAuto;
end;

function PUMLActionAuto.Get_Message: IUMLMessage;
var
  E: PUMLMessage;
begin
  E := (TheObject as PUMLAction).Message;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLMessageAuto;
end;

// PUMLActionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTerminateActionAuto

// PUMLTerminateActionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSendActionAuto

function PUMLSendActionAuto.Get_Signal: IUMLSignal;
var
  E: PUMLSignal;
begin
  E := (TheObject as PUMLSendAction).Signal;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLSignalAuto;
end;

procedure PUMLSendActionAuto.Set_Signal(const Value: IUMLSignal);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Signal', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLSignal').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Signal', E as PModel);
  end;
end;

// PUMLSendActionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActionSequenceAuto

function PUMLActionSequenceAuto.GetActionAt(Index: Integer): IUMLAction;
var
  E: PUMLAction;
begin
  E := (TheObject as PUMLActionSequence).Actions[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionAuto;
end;

function PUMLActionSequenceAuto.GetActionCount: Integer;
begin
  Result := (TheObject as PUMLActionSequence).ActionCount;
end;

// PUMLActionSequenceAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCreateActionAuto

function PUMLCreateActionAuto.Get_Instantiation: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLCreateAction).Instantiation;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLCreateActionAuto.Set_Instantiation(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Instantiation', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Instantiation', E as PModel);
  end;
end;

// PUMLCreateActionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDestroyActionAuto

// PUMLDestroyActionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLUninterpretedActionAuto

// PUMLUninterpretedActionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCallActionAuto

function PUMLCallActionAuto.Get_Operation: IUMLOperation;
var
  E: PUMLOperation;
begin
  E := (TheObject as PUMLCallAction).Operation;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationAuto;
end;

procedure PUMLCallActionAuto.Set_Operation(const Value: IUMLOperation);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Operation', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLOperation').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Operation', E as PModel);
  end;
end;

// PUMLCallActionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLReturnActionAuto

// PUMLReturnActionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationInstanceSetAuto

function PUMLCollaborationInstanceSetAuto.GetInteractionInstanceSetAt(Index: Integer): IUMLInteractionInstanceSet;
var
  E: PUMLInteractionInstanceSet;
begin
  E := (TheObject as PUMLCollaborationInstanceSet).InteractionInstanceSets[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInteractionInstanceSetAuto;
end;

function PUMLCollaborationInstanceSetAuto.GetInteractionInstanceSetCount: Integer;
begin
  Result := (TheObject as PUMLCollaborationInstanceSet).InteractionInstanceSetCount;
end;

function PUMLCollaborationInstanceSetAuto.Get_Collaboration: IUMLCollaboration;
var
  E: PUMLCollaboration;
begin
  E := (TheObject as PUMLCollaborationInstanceSet).Collaboration;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationAuto;
end;

procedure PUMLCollaborationInstanceSetAuto.Set_Collaboration(const Value: IUMLCollaboration);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Collaboration', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLCollaboration').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Collaboration', E as PModel);
  end;
end;

function PUMLCollaborationInstanceSetAuto.GetParticipatingInstanceAt(Index: Integer): IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLCollaborationInstanceSet).ParticipatingInstances[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

function PUMLCollaborationInstanceSetAuto.GetParticipatingInstanceCount: Integer;
begin
  Result := (TheObject as PUMLCollaborationInstanceSet).ParticipatingInstanceCount;
end;

function PUMLCollaborationInstanceSetAuto.GetParticipatingLinkAt(Index: Integer): IUMLLink;
var
  E: PUMLLink;
begin
  E := (TheObject as PUMLCollaborationInstanceSet).ParticipatingLinks[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkAuto;
end;

function PUMLCollaborationInstanceSetAuto.GetParticipatingLinkCount: Integer;
begin
  Result := (TheObject as PUMLCollaborationInstanceSet).ParticipatingLinkCount;
end;

function PUMLCollaborationInstanceSetAuto.Get_RepresentedOperation: IUMLOperation;
var
  E: PUMLOperation;
begin
  E := (TheObject as PUMLCollaborationInstanceSet).RepresentedOperation;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationAuto;
end;

function PUMLCollaborationInstanceSetAuto.Get_RepresentedClassifier: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLCollaborationInstanceSet).RepresentedClassifier;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

// PUMLCollaborationInstanceSetAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLParameterAuto

function PUMLParameterAuto.Get_DefaultValue: WideString;
begin
  Result := (TheObject as PUMLParameter).DefaultValue;
end;

procedure PUMLParameterAuto.Set_DefaultValue(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'DefaultValue', Value);
end;

function PUMLParameterAuto.Get_DirectionKind: UMLParameterDirectionKind;
begin
  Result := Ord((TheObject as PUMLParameter).DirectionKind);
end;

procedure PUMLParameterAuto.Set_DirectionKind(Value: UMLParameterDirectionKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'DirectionKind', UMLParameterDirectionKindToString(PUMLParameterDirectionKind(Value)));
end;

function PUMLParameterAuto.Get_TypeExpression: WideString;
begin
  Result := (TheObject as PUMLParameter).TypeExpression;
end;

procedure PUMLParameterAuto.Set_TypeExpression(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'TypeExpression', Value);
end;

function PUMLParameterAuto.Get_BehavioralFeature: IUMLBehavioralFeature;
var
  E: PUMLBehavioralFeature;
begin
  E := (TheObject as PUMLParameter).BehavioralFeature;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLBehavioralFeatureAuto;
end;

function PUMLParameterAuto.Get_Type_: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLParameter).Type_;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLParameterAuto.Set_Type_(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Type_', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Type_', E as PModel);
  end;
end;

function PUMLParameterAuto.Get_Event: IUMLEvent;
var
  E: PUMLEvent;
begin
  E := (TheObject as PUMLParameter).Event;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLEventAuto;
end;

procedure PUMLParameterAuto.ClearStates;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'States;');
end;

procedure PUMLParameterAuto.AddState(const Value: IUMLObjectFlowState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLObjectFlowState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'States', E as PModel);
end;

procedure PUMLParameterAuto.RemoveState(const Value: IUMLObjectFlowState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLObjectFlowState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'States', E as PModel);
end;

procedure PUMLParameterAuto.InsertState(Index: Integer; const Value: IUMLObjectFlowState);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLObjectFlowState').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'States', Index, E as PModel);
end;

procedure PUMLParameterAuto.DeleteState(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'States', Index);
end;

function PUMLParameterAuto.IndexOfState(const Value: IUMLObjectFlowState): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLObjectFlowState').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLParameter).IndexOfState(E as PUMLObjectFlowState);
  end;
end;

function PUMLParameterAuto.GetStateAt(Index: Integer): IUMLObjectFlowState;
var
  E: PUMLObjectFlowState;
begin
  E := (TheObject as PUMLParameter).States[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLObjectFlowStateAuto;
end;

function PUMLParameterAuto.GetStateCount: Integer;
begin
  Result := (TheObject as PUMLParameter).StateCount;
end;

procedure PUMLParameterAuto.SetType(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.ChangeTypeExpression(TheObject as PModel, '', E as PModel);
end;

procedure PUMLParameterAuto.SetType2(const Value: WideString);
begin
  StarUMLApplication.ChangeTypeExpression(TheObject as PModel, Value, nil);
end;

// PUMLParameterAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationEndAuto

function PUMLAssociationEndAuto.Get_IsNavigable: WordBool;
begin
  Result := (TheObject as PUMLAssociationEnd).IsNavigable;
end;

procedure PUMLAssociationEndAuto.Set_IsNavigable(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsNavigable', BooleanToString(Value));
end;

function PUMLAssociationEndAuto.Get_Ordering: UMLOrderingKind;
begin
  Result := Ord((TheObject as PUMLAssociationEnd).Ordering);
end;

procedure PUMLAssociationEndAuto.Set_Ordering(Value: UMLOrderingKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Ordering', UMLOrderingKindToString(PUMLOrderingKind(Value)));
end;

function PUMLAssociationEndAuto.Get_Aggregation: UMLAggregationKind;
begin
  Result := Ord((TheObject as PUMLAssociationEnd).Aggregation);
end;

procedure PUMLAssociationEndAuto.Set_Aggregation(Value: UMLAggregationKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Aggregation', UMLAggregationKindToString(PUMLAggregationKind(Value)));
end;

function PUMLAssociationEndAuto.Get_TargetScope: UMLScopeKind;
begin
  Result := Ord((TheObject as PUMLAssociationEnd).TargetScope);
end;

procedure PUMLAssociationEndAuto.Set_TargetScope(Value: UMLScopeKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'TargetScope', UMLScopeKindToString(PUMLScopeKind(Value)));
end;

function PUMLAssociationEndAuto.Get_Multiplicity: WideString;
begin
  Result := (TheObject as PUMLAssociationEnd).Multiplicity;
end;

procedure PUMLAssociationEndAuto.Set_Multiplicity(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Multiplicity', Value);
end;

function PUMLAssociationEndAuto.Get_Changeability: UMLChangeableKind;
begin
  Result := Ord((TheObject as PUMLAssociationEnd).Changeability);
end;

procedure PUMLAssociationEndAuto.Set_Changeability(Value: UMLChangeableKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Changeability', UMLChangeableKindToString(PUMLChangeableKind(Value)));
end;

function PUMLAssociationEndAuto.Get_Association: IUMLAssociation;
var
  E: PUMLAssociation;
begin
  E := (TheObject as PUMLAssociationEnd).Association;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationAuto;
end;

function PUMLAssociationEndAuto.GetQualifierAt(Index: Integer): IUMLAttribute;
var
  E: PUMLAttribute;
begin
  E := (TheObject as PUMLAssociationEnd).Qualifiers[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeAuto;
end;

function PUMLAssociationEndAuto.GetQualifierCount: Integer;
begin
  Result := (TheObject as PUMLAssociationEnd).QualifierCount;
end;

function PUMLAssociationEndAuto.Get_Participant: IUMLClassifier;
var
  E: PUMLClassifier;
begin
  E := (TheObject as PUMLAssociationEnd).Participant;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLClassifierAuto;
end;

procedure PUMLAssociationEndAuto.Set_Participant(const Value: IUMLClassifier);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Participant', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLClassifier').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Participant', E as PModel);
  end;
end;

procedure PUMLAssociationEndAuto.ClearLinkEnds;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'LinkEnds;');
end;

procedure PUMLAssociationEndAuto.AddLinkEnd(const Value: IUMLLinkEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLinkEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'LinkEnds', E as PModel);
end;

procedure PUMLAssociationEndAuto.RemoveLinkEnd(const Value: IUMLLinkEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLinkEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'LinkEnds', E as PModel);
end;

procedure PUMLAssociationEndAuto.InsertLinkEnd(Index: Integer; const Value: IUMLLinkEnd);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLLinkEnd').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'LinkEnds', Index, E as PModel);
end;

procedure PUMLAssociationEndAuto.DeleteLinkEnd(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'LinkEnds', Index);
end;

function PUMLAssociationEndAuto.IndexOfLinkEnd(const Value: IUMLLinkEnd): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLLinkEnd').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAssociationEnd).IndexOfLinkEnd(E as PUMLLinkEnd);
  end;
end;

function PUMLAssociationEndAuto.GetLinkEndAt(Index: Integer): IUMLLinkEnd;
var
  E: PUMLLinkEnd;
begin
  E := (TheObject as PUMLAssociationEnd).LinkEnds[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkEndAuto;
end;

function PUMLAssociationEndAuto.GetLinkEndCount: Integer;
begin
  Result := (TheObject as PUMLAssociationEnd).LinkEndCount;
end;

procedure PUMLAssociationEndAuto.ClearAssociationEndRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AssociationEndRoles;');
end;

procedure PUMLAssociationEndAuto.AddAssociationEndRole(const Value: IUMLAssociationEndRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEndRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AssociationEndRoles', E as PModel);
end;

procedure PUMLAssociationEndAuto.RemoveAssociationEndRole(const Value: IUMLAssociationEndRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEndRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AssociationEndRoles', E as PModel);
end;

procedure PUMLAssociationEndAuto.InsertAssociationEndRole(Index: Integer; const Value: IUMLAssociationEndRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationEndRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AssociationEndRoles', Index, E as PModel);
end;

procedure PUMLAssociationEndAuto.DeleteAssociationEndRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AssociationEndRoles', Index);
end;

function PUMLAssociationEndAuto.IndexOfAssociationEndRole(const Value: IUMLAssociationEndRole): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationEndRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAssociationEnd).IndexOfAssociationEndRole(E as PUMLAssociationEndRole);
  end;
end;

function PUMLAssociationEndAuto.GetAssociationEndRoleAt(Index: Integer): IUMLAssociationEndRole;
var
  E: PUMLAssociationEndRole;
begin
  E := (TheObject as PUMLAssociationEnd).AssociationEndRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationEndRoleAuto;
end;

function PUMLAssociationEndAuto.GetAssociationEndRoleCount: Integer;
begin
  Result := (TheObject as PUMLAssociationEnd).AssociationEndRoleCount;
end;

function PUMLAssociationEndAuto.GetOtherSide: IUMLAssociationEnd;
var
  Asso: PUMLAssociation;
  OtherSide: PUMLAssociationEnd;
begin
  Asso := (TheObject as PUMLAssociationEnd).Association;
  OtherSide := Asso.Connections[1 - Asso.IndexOfConnection(TheObject as PUMLAssociationEnd)];
  Result := OtherSide.GetAutomationObject as IUMLAssociationEnd;
end;

// PUMLAssociationEndAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationEndRoleAuto

function PUMLAssociationEndRoleAuto.Get_CollaborationMultiplicity: WideString;
begin
  Result := (TheObject as PUMLAssociationEndRole).CollaborationMultiplicity;
end;

procedure PUMLAssociationEndRoleAuto.Set_CollaborationMultiplicity(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'CollaborationMultiplicity', Value);
end;

function PUMLAssociationEndRoleAuto.Get_Base: IUMLAssociationEnd;
var
  E: PUMLAssociationEnd;
begin
  E := (TheObject as PUMLAssociationEndRole).Base;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationEndAuto;
end;

procedure PUMLAssociationEndRoleAuto.Set_Base(const Value: IUMLAssociationEnd);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationEnd').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Base', E as PModel);
  end;
end;

procedure PUMLAssociationEndRoleAuto.ClearAvailableQualifiers;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AvailableQualifiers;');
end;

procedure PUMLAssociationEndRoleAuto.AddAvailableQualifier(const Value: IUMLAttribute);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttribute').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AvailableQualifiers', E as PModel);
end;

procedure PUMLAssociationEndRoleAuto.RemoveAvailableQualifier(const Value: IUMLAttribute);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttribute').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AvailableQualifiers', E as PModel);
end;

procedure PUMLAssociationEndRoleAuto.InsertAvailableQualifier(Index: Integer; const Value: IUMLAttribute);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAttribute').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AvailableQualifiers', Index, E as PModel);
end;

procedure PUMLAssociationEndRoleAuto.DeleteAvailableQualifier(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AvailableQualifiers', Index);
end;

function PUMLAssociationEndRoleAuto.IndexOfAvailableQualifier(const Value: IUMLAttribute): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLAttribute').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLAssociationEndRole).IndexOfAvailableQualifier(E as PUMLAttribute);
  end;
end;

function PUMLAssociationEndRoleAuto.GetAvailableQualifierAt(Index: Integer): IUMLAttribute;
var
  E: PUMLAttribute;
begin
  E := (TheObject as PUMLAssociationEndRole).AvailableQualifiers[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeAuto;
end;

function PUMLAssociationEndRoleAuto.GetAvailableQualifierCount: Integer;
begin
  Result := (TheObject as PUMLAssociationEndRole).AvailableQualifierCount;
end;

// PUMLAssociationEndRoleAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTransitionAuto

function PUMLTransitionAuto.Get_GuardCondition: WideString;
begin
  Result := (TheObject as PUMLTransition).GuardCondition;
end;

procedure PUMLTransitionAuto.Set_GuardCondition(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'GuardCondition', Value);
end;

function PUMLTransitionAuto.GetEffectAt(Index: Integer): IUMLAction;
var
  E: PUMLAction;
begin
  E := (TheObject as PUMLTransition).Effects[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActionAuto;
end;

function PUMLTransitionAuto.GetEffectCount: Integer;
begin
  Result := (TheObject as PUMLTransition).EffectCount;
end;

function PUMLTransitionAuto.Get_State: IUMLState;
var
  E: PUMLState;
begin
  E := (TheObject as PUMLTransition).State;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateAuto;
end;

function PUMLTransitionAuto.GetTriggerAt(Index: Integer): IUMLEvent;
var
  E: PUMLEvent;
begin
  E := (TheObject as PUMLTransition).Triggers[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLEventAuto;
end;

function PUMLTransitionAuto.GetTriggerCount: Integer;
begin
  Result := (TheObject as PUMLTransition).TriggerCount;
end;

function PUMLTransitionAuto.Get_StateMachine: IUMLStateMachine;
var
  E: PUMLStateMachine;
begin
  E := (TheObject as PUMLTransition).StateMachine;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateMachineAuto;
end;

function PUMLTransitionAuto.Get_Source: IUMLStateVertex;
var
  E: PUMLStateVertex;
begin
  E := (TheObject as PUMLTransition).Source;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateVertexAuto;
end;

procedure PUMLTransitionAuto.Set_Source(const Value: IUMLStateVertex);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Source', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLStateVertex').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Source', E as PModel);
  end;
end;

function PUMLTransitionAuto.Get_Target: IUMLStateVertex;
var
  E: PUMLStateVertex;
begin
  E := (TheObject as PUMLTransition).Target;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStateVertexAuto;
end;

procedure PUMLTransitionAuto.Set_Target(const Value: IUMLStateVertex);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Target', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLStateVertex').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Target', E as PModel);
  end;
end;

// PUMLTransitionAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLExtensionPointAuto

function PUMLExtensionPointAuto.Get_Location: WideString;
begin
  Result := (TheObject as PUMLExtensionPoint).Location;
end;

procedure PUMLExtensionPointAuto.Set_Location(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Location', Value);
end;

function PUMLExtensionPointAuto.Get_UseCase: IUMLUseCase;
var
  E: PUMLUseCase;
begin
  E := (TheObject as PUMLExtensionPoint).UseCase;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLUseCaseAuto;
end;

procedure PUMLExtensionPointAuto.ClearExtends;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Extends;');
end;

procedure PUMLExtensionPointAuto.AddExtend(const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Extends', E as PModel);
end;

procedure PUMLExtensionPointAuto.RemoveExtend(const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Extends', E as PModel);
end;

procedure PUMLExtensionPointAuto.InsertExtend(Index: Integer; const Value: IUMLExtend);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Extends', Index, E as PModel);
end;

procedure PUMLExtensionPointAuto.DeleteExtend(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Extends', Index);
end;

function PUMLExtensionPointAuto.IndexOfExtend(const Value: IUMLExtend): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLExtend').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLExtensionPoint).IndexOfExtend(E as PUMLExtend);
  end;
end;

function PUMLExtensionPointAuto.GetExtendAt(Index: Integer): IUMLExtend;
var
  E: PUMLExtend;
begin
  E := (TheObject as PUMLExtensionPoint).Extends[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLExtendAuto;
end;

function PUMLExtensionPointAuto.GetExtendCount: Integer;
begin
  Result := (TheObject as PUMLExtensionPoint).ExtendCount;
end;

// PUMLExtensionPointAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLLinkAuto

function PUMLLinkAuto.Get_Association: IUMLAssociation;
var
  E: PUMLAssociation;
begin
  E := (TheObject as PUMLLink).Association;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationAuto;
end;

procedure PUMLLinkAuto.Set_Association(const Value: IUMLAssociation);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Association', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLAssociation').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'Association', E as PModel);
  end;
end;

function PUMLLinkAuto.GetConnectionAt(Index: Integer): IUMLLinkEnd;
var
  E: PUMLLinkEnd;
begin
  E := (TheObject as PUMLLink).Connections[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkEndAuto;
end;

function PUMLLinkAuto.GetConnectionCount: Integer;
begin
  Result := (TheObject as PUMLLink).ConnectionCount;
end;

procedure PUMLLinkAuto.ClearStimuli;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'Stimuli;');
end;

procedure PUMLLinkAuto.AddStimulus(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'Stimuli', E as PModel);
end;

procedure PUMLLinkAuto.RemoveStimulus(const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'Stimuli', E as PModel);
end;

procedure PUMLLinkAuto.InsertStimulus(Index: Integer; const Value: IUMLStimulus);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'Stimuli', Index, E as PModel);
end;

procedure PUMLLinkAuto.DeleteStimulus(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'Stimuli', Index);
end;

function PUMLLinkAuto.IndexOfStimulus(const Value: IUMLStimulus): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLStimulus').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLLink).IndexOfStimulus(E as PUMLStimulus);
  end;
end;

function PUMLLinkAuto.GetStimulusAt(Index: Integer): IUMLStimulus;
var
  E: PUMLStimulus;
begin
  E := (TheObject as PUMLLink).Stimuli[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLStimulusAuto;
end;

function PUMLLinkAuto.GetStimulusCount: Integer;
begin
  Result := (TheObject as PUMLLink).StimulusCount;
end;

function PUMLLinkAuto.Get_Owner: IUMLInstance;
var
  E: PUMLInstance;
begin
  E := (TheObject as PUMLLink).Owner;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInstanceAuto;
end;

function PUMLLinkAuto.Get_LinkObject: IUMLLinkObject;
var
  E: PUMLLinkObject;
begin
  E := (TheObject as PUMLLink).LinkObject;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLinkObjectAuto;
end;

procedure PUMLLinkAuto.Set_LinkObject(const Value: IUMLLinkObject);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'LinkObject', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLLinkObject').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'LinkObject', E as PModel);
  end;
end;

procedure PUMLLinkAuto.ClearPlayedRoles;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'PlayedRoles;');
end;

procedure PUMLLinkAuto.AddPlayedRole(const Value: IUMLAssociationRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'PlayedRoles', E as PModel);
end;

procedure PUMLLinkAuto.RemovePlayedRole(const Value: IUMLAssociationRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'PlayedRoles', E as PModel);
end;

procedure PUMLLinkAuto.InsertPlayedRole(Index: Integer; const Value: IUMLAssociationRole);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'PlayedRoles', Index, E as PModel);
end;

procedure PUMLLinkAuto.DeletePlayedRole(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'PlayedRoles', Index);
end;

function PUMLLinkAuto.IndexOfPlayedRole(const Value: IUMLAssociationRole): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLAssociationRole').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLLink).IndexOfPlayedRole(E as PUMLAssociationRole);
  end;
end;

function PUMLLinkAuto.GetPlayedRoleAt(Index: Integer): IUMLAssociationRole;
var
  E: PUMLAssociationRole;
begin
  E := (TheObject as PUMLLink).PlayedRoles[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAssociationRoleAuto;
end;

function PUMLLinkAuto.GetPlayedRoleCount: Integer;
begin
  Result := (TheObject as PUMLLink).PlayedRoleCount;
end;

function PUMLLinkAuto.Get_CollaborationInstanceSet: IUMLCollaborationInstanceSet;
var
  E: PUMLCollaborationInstanceSet;
begin
  E := (TheObject as PUMLLink).CollaborationInstanceSet;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLCollaborationInstanceSetAuto;
end;

// PUMLLinkAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCommentAuto

function PUMLCommentAuto.Get_Body: WideString;
begin
  Result := (TheObject as PUMLComment).Body;
end;

procedure PUMLCommentAuto.Set_Body(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Body', Value);
end;

procedure PUMLCommentAuto.ClearAnnotatedElements;
begin
  StarUMLApplication.ClearCollection(TheObject as PModel, 'AnnotatedElements;');
end;

procedure PUMLCommentAuto.AddAnnotatedElement(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.AddCollectionItem(TheObject as PModel, 'AnnotatedElements', E as PModel);
end;

procedure PUMLCommentAuto.RemoveAnnotatedElement(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RemoveCollectionItem(TheObject as PModel, 'AnnotatedElements', E as PModel);
end;

procedure PUMLCommentAuto.InsertAnnotatedElement(Index: Integer; const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then Exit;
  E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.InsertCollectionItem(TheObject as PModel, 'AnnotatedElements', Index, E as PModel);
end;

procedure PUMLCommentAuto.DeleteAnnotatedElement(Index: Integer);
begin
  StarUMLApplication.DeleteCollectionItem(TheObject as PModel, 'AnnotatedElements', Index);
end;

function PUMLCommentAuto.IndexOfAnnotatedElement(const Value: IUMLModelElement): Integer;
var
  E: PElement;
begin
  if Value = nil then Result := -1
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    Result := (TheObject as PUMLComment).IndexOfAnnotatedElement(E as PUMLModelElement);
  end;
end;

function PUMLCommentAuto.GetAnnotatedElementAt(Index: Integer): IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLComment).AnnotatedElements[Index];
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

function PUMLCommentAuto.GetAnnotatedElementCount: Integer;
begin
  Result := (TheObject as PUMLComment).AnnotatedElementCount;
end;

// PUMLCommentAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTemplateParameterAuto

function PUMLTemplateParameterAuto.Get_ParameterType: WideString;
begin
  Result := (TheObject as PUMLTemplateParameter).ParameterType;
end;

procedure PUMLTemplateParameterAuto.Set_ParameterType(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ParameterType', Value);
end;

function PUMLTemplateParameterAuto.Get_DefaultValue: WideString;
begin
  Result := (TheObject as PUMLTemplateParameter).DefaultValue;
end;

procedure PUMLTemplateParameterAuto.Set_DefaultValue(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'DefaultValue', Value);
end;

function PUMLTemplateParameterAuto.Get_DefaultElement: IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLTemplateParameter).DefaultElement;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

procedure PUMLTemplateParameterAuto.Set_DefaultElement(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'DefaultElement', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'DefaultElement', E as PModel);
  end;
end;

function PUMLTemplateParameterAuto.Get_Template: IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLTemplateParameter).Template;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

function PUMLTemplateParameterAuto.Get_Parameter: IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLTemplateParameter).Parameter;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

// PUMLTemplateParameterAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTemplateArgumentAuto

function PUMLTemplateArgumentAuto.Get_ModelElement: IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLTemplateArgument).ModelElement;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

procedure PUMLTemplateArgumentAuto.Set_ModelElement(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ModelElement', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ModelElement', E as PModel);
  end;
end;

// PUMLTemplateArgumentAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLElementImportAuto

function PUMLElementImportAuto.Get_Visibility: UMLVisibilityKind;
begin
  Result := Ord((TheObject as PUMLElementImport).Visibility);
end;

procedure PUMLElementImportAuto.Set_Visibility(Value: UMLVisibilityKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Visibility', UMLVisibilityKindToString(PUMLVisibilityKind(Value)));
end;

function PUMLElementImportAuto.Get_Alias: WideString;
begin
  Result := (TheObject as PUMLElementImport).Alias;
end;

procedure PUMLElementImportAuto.Set_Alias(const Value: WideString);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'Alias', Value);
end;

function PUMLElementImportAuto.Get_IsSpecification: WordBool;
begin
  Result := (TheObject as PUMLElementImport).IsSpecification;
end;

procedure PUMLElementImportAuto.Set_IsSpecification(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'IsSpecification', BooleanToString(Value));
end;

function PUMLElementImportAuto.Get_ImportedElement: IUMLModelElement;
var
  E: PUMLModelElement;
begin
  E := (TheObject as PUMLElementImport).ImportedElement;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLModelElementAuto;
end;

procedure PUMLElementImportAuto.Set_ImportedElement(const Value: IUMLModelElement);
var
  E: PElement;
begin
  if Value = nil then StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ImportedElement', nil)
  else begin
    E := MetaModel.FindMetaClass('UMLModelElement').FindInstanceByGuidRecurse(Value.GetGuid);
    // ASSERTIONS
    Assert(E <> nil, 'Unmanaged element found.');
    // ASSERTIONS
    StarUMLApplication.ChangeModelReference(TheObject as PModel, 'ImportedElement', E as PModel);
  end;
end;

function PUMLElementImportAuto.Get_Package: IUMLPackage;
var
  E: PUMLPackage;
begin
  E := (TheObject as PUMLElementImport).Package;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLPackageAuto;
end;

// PUMLElementImportAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDiagramAuto

// PUMLDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDeploymentDiagramAuto

// PUMLDeploymentDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponentDiagramAuto

// PUMLComponentDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSequenceDiagramAuto

function PUMLSequenceDiagramAuto.Get_ShowSequenceNumber: WordBool;
begin
  Result := (TheObject as PUMLSequenceDiagram).ShowSequenceNumber;
end;

procedure PUMLSequenceDiagramAuto.Set_ShowSequenceNumber(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ShowSequenceNumber', BooleanToString(Value));
end;

function PUMLSequenceDiagramAuto.Get_MessageSignature: UMLMessageSignatureKind;
begin
  Result := Ord((TheObject as PUMLSequenceDiagram).MessageSignature);
end;

procedure PUMLSequenceDiagramAuto.Set_MessageSignature(Value: UMLMessageSignatureKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'MessageSignature', UMLMessageSignatureKindToString(PUMLMessageSignatureKind(Value)));
end;

function PUMLSequenceDiagramAuto.Get_ShowActivation: WordBool;
begin
  Result := (TheObject as PUMLSequenceDiagram).ShowActivation;
end;

procedure PUMLSequenceDiagramAuto.Set_ShowActivation(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ShowActivation', BooleanToString(Value));
end;

// PUMLSequenceDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationDiagramAuto

function PUMLCollaborationDiagramAuto.Get_ShowSequenceNumber: WordBool;
begin
  Result := (TheObject as PUMLCollaborationDiagram).ShowSequenceNumber;
end;

procedure PUMLCollaborationDiagramAuto.Set_ShowSequenceNumber(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ShowSequenceNumber', BooleanToString(Value));
end;

function PUMLCollaborationDiagramAuto.Get_MessageSignature: UMLMessageSignatureKind;
begin
  Result := Ord((TheObject as PUMLCollaborationDiagram).MessageSignature);
end;

procedure PUMLCollaborationDiagramAuto.Set_MessageSignature(Value: UMLMessageSignatureKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'MessageSignature', UMLMessageSignatureKindToString(PUMLMessageSignatureKind(Value)));
end;

// PUMLCollaborationDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSequenceRoleDiagramAuto

function PUMLSequenceRoleDiagramAuto.Get_ShowSequenceNumber: WordBool;
begin
  Result := (TheObject as PUMLSequenceRoleDiagram).ShowSequenceNumber;
end;

procedure PUMLSequenceRoleDiagramAuto.Set_ShowSequenceNumber(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ShowSequenceNumber', BooleanToString(Value));
end;

function PUMLSequenceRoleDiagramAuto.Get_MessageSignature: UMLMessageSignatureKind;
begin
  Result := Ord((TheObject as PUMLSequenceRoleDiagram).MessageSignature);
end;

procedure PUMLSequenceRoleDiagramAuto.Set_MessageSignature(Value: UMLMessageSignatureKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'MessageSignature', UMLMessageSignatureKindToString(PUMLMessageSignatureKind(Value)));
end;

function PUMLSequenceRoleDiagramAuto.Get_ShowActivation: WordBool;
begin
  Result := (TheObject as PUMLSequenceRoleDiagram).ShowActivation;
end;

procedure PUMLSequenceRoleDiagramAuto.Set_ShowActivation(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ShowActivation', BooleanToString(Value));
end;

// PUMLSequenceRoleDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLUseCaseDiagramAuto

// PUMLUseCaseDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassDiagramAuto

// PUMLClassDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActivityDiagramAuto

// PUMLActivityDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationRoleDiagramAuto

function PUMLCollaborationRoleDiagramAuto.Get_ShowSequenceNumber: WordBool;
begin
  Result := (TheObject as PUMLCollaborationRoleDiagram).ShowSequenceNumber;
end;

procedure PUMLCollaborationRoleDiagramAuto.Set_ShowSequenceNumber(Value: WordBool);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'ShowSequenceNumber', BooleanToString(Value));
end;

function PUMLCollaborationRoleDiagramAuto.Get_MessageSignature: UMLMessageSignatureKind;
begin
  Result := Ord((TheObject as PUMLCollaborationRoleDiagram).MessageSignature);
end;

procedure PUMLCollaborationRoleDiagramAuto.Set_MessageSignature(Value: UMLMessageSignatureKind);
begin
  StarUMLApplication.ChangeModelAttribute(TheObject as PModel, 'MessageSignature', UMLMessageSignatureKindToString(PUMLMessageSignatureKind(Value)));
end;

// PUMLCollaborationRoleDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCompositeStructureDiagramAuto

// PUMLCompositeStructureDiagramAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStatechartDiagramAuto

// PUMLStatechartDiagramAuto
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// AutomationClass Register Function

procedure RegisterAutomationClasses;
begin
  ClassRegistry.RegisterAutomationClass(PUMLElement, PUMLElementAuto, IID_IUMLElement);
  ClassRegistry.RegisterAutomationClass(PUMLModelElement, PUMLModelElementAuto, IID_IUMLModelElement);
  ClassRegistry.RegisterAutomationClass(PUMLLinkEnd, PUMLLinkEndAuto, IID_IUMLLinkEnd);
  ClassRegistry.RegisterAutomationClass(PUMLLinkObject, PUMLLinkObjectAuto, IID_IUMLLinkObject);
  ClassRegistry.RegisterAutomationClass(PUMLPartition, PUMLPartitionAuto, IID_IUMLPartition);
  ClassRegistry.RegisterAutomationClass(PUMLInteractionFragment, PUMLInteractionFragmentAuto, IID_IUMLInteractionFragment);
  ClassRegistry.RegisterAutomationClass(PUMLInteractionOperand, PUMLInteractionOperandAuto, IID_IUMLInteractionOperand);
  ClassRegistry.RegisterAutomationClass(PUMLCombinedFragment, PUMLCombinedFragmentAuto, IID_IUMLCombinedFragment);
  ClassRegistry.RegisterAutomationClass(PUMLInteractionInstanceSet, PUMLInteractionInstanceSetAuto, IID_IUMLInteractionInstanceSet);
  ClassRegistry.RegisterAutomationClass(PUMLInstance, PUMLInstanceAuto, IID_IUMLInstance);
  ClassRegistry.RegisterAutomationClass(PUMLDataValue, PUMLDataValueAuto, IID_IUMLDataValue);
  ClassRegistry.RegisterAutomationClass(PUMLNodeInstance, PUMLNodeInstanceAuto, IID_IUMLNodeInstance);
  ClassRegistry.RegisterAutomationClass(PUMLObject, PUMLObjectAuto, IID_IUMLObject);
  ClassRegistry.RegisterAutomationClass(PUMLSubsystemInstance, PUMLSubsystemInstanceAuto, IID_IUMLSubsystemInstance);
  ClassRegistry.RegisterAutomationClass(PUMLUseCaseInstance, PUMLUseCaseInstanceAuto, IID_IUMLUseCaseInstance);
  ClassRegistry.RegisterAutomationClass(PUMLComponentInstance, PUMLComponentInstanceAuto, IID_IUMLComponentInstance);
  ClassRegistry.RegisterAutomationClass(PUMLArgument, PUMLArgumentAuto, IID_IUMLArgument);
  ClassRegistry.RegisterAutomationClass(PUMLConnectorEnd, PUMLConnectorEndAuto, IID_IUMLConnectorEnd);
  ClassRegistry.RegisterAutomationClass(PUMLStateVertex, PUMLStateVertexAuto, IID_IUMLStateVertex);
  ClassRegistry.RegisterAutomationClass(PUMLSynchState, PUMLSynchStateAuto, IID_IUMLSynchState);
  ClassRegistry.RegisterAutomationClass(PUMLPseudostate, PUMLPseudostateAuto, IID_IUMLPseudostate);
  ClassRegistry.RegisterAutomationClass(PUMLStubState, PUMLStubStateAuto, IID_IUMLStubState);
  ClassRegistry.RegisterAutomationClass(PUMLState, PUMLStateAuto, IID_IUMLState);
  ClassRegistry.RegisterAutomationClass(PUMLSimpleState, PUMLSimpleStateAuto, IID_IUMLSimpleState);
  ClassRegistry.RegisterAutomationClass(PUMLObjectFlowState, PUMLObjectFlowStateAuto, IID_IUMLObjectFlowState);
  ClassRegistry.RegisterAutomationClass(PUMLActionState, PUMLActionStateAuto, IID_IUMLActionState);
  ClassRegistry.RegisterAutomationClass(PUMLSignalAcceptState, PUMLSignalAcceptStateAuto, IID_IUMLSignalAcceptState);
  ClassRegistry.RegisterAutomationClass(PUMLCallState, PUMLCallStateAuto, IID_IUMLCallState);
  ClassRegistry.RegisterAutomationClass(PUMLSignalSendState, PUMLSignalSendStateAuto, IID_IUMLSignalSendState);
  ClassRegistry.RegisterAutomationClass(PUMLCompositeState, PUMLCompositeStateAuto, IID_IUMLCompositeState);
  ClassRegistry.RegisterAutomationClass(PUMLSubmachineState, PUMLSubmachineStateAuto, IID_IUMLSubmachineState);
  ClassRegistry.RegisterAutomationClass(PUMLSubactivityState, PUMLSubactivityStateAuto, IID_IUMLSubactivityState);
  ClassRegistry.RegisterAutomationClass(PUMLFinalState, PUMLFinalStateAuto, IID_IUMLFinalState);
  ClassRegistry.RegisterAutomationClass(PUMLFlowFinalState, PUMLFlowFinalStateAuto, IID_IUMLFlowFinalState);
  ClassRegistry.RegisterAutomationClass(PUMLInteraction, PUMLInteractionAuto, IID_IUMLInteraction);
  ClassRegistry.RegisterAutomationClass(PUMLMessage, PUMLMessageAuto, IID_IUMLMessage);
  ClassRegistry.RegisterAutomationClass(PUMLAssociationClass, PUMLAssociationClassAuto, IID_IUMLAssociationClass);
  ClassRegistry.RegisterAutomationClass(PUMLStateMachine, PUMLStateMachineAuto, IID_IUMLStateMachine);
  ClassRegistry.RegisterAutomationClass(PUMLActivityGraph, PUMLActivityGraphAuto, IID_IUMLActivityGraph);
  ClassRegistry.RegisterAutomationClass(PUMLFeature, PUMLFeatureAuto, IID_IUMLFeature);
  ClassRegistry.RegisterAutomationClass(PUMLBehavioralFeature, PUMLBehavioralFeatureAuto, IID_IUMLBehavioralFeature);
  ClassRegistry.RegisterAutomationClass(PUMLMethod, PUMLMethodAuto, IID_IUMLMethod);
  ClassRegistry.RegisterAutomationClass(PUMLOperation, PUMLOperationAuto, IID_IUMLOperation);
  ClassRegistry.RegisterAutomationClass(PUMLReception, PUMLReceptionAuto, IID_IUMLReception);
  ClassRegistry.RegisterAutomationClass(PUMLConnector, PUMLConnectorAuto, IID_IUMLConnector);
  ClassRegistry.RegisterAutomationClass(PUMLStructuralFeature, PUMLStructuralFeatureAuto, IID_IUMLStructuralFeature);
  ClassRegistry.RegisterAutomationClass(PUMLAttribute, PUMLAttributeAuto, IID_IUMLAttribute);
  ClassRegistry.RegisterAutomationClass(PUMLPort, PUMLPortAuto, IID_IUMLPort);
  ClassRegistry.RegisterAutomationClass(PUMLGeneralizableElement, PUMLGeneralizableElementAuto, IID_IUMLGeneralizableElement);
  ClassRegistry.RegisterAutomationClass(PUMLNamespace, PUMLNamespaceAuto, IID_IUMLNamespace);
  ClassRegistry.RegisterAutomationClass(PUMLCollaboration, PUMLCollaborationAuto, IID_IUMLCollaboration);
  ClassRegistry.RegisterAutomationClass(PUMLClassifier, PUMLClassifierAuto, IID_IUMLClassifier);
  ClassRegistry.RegisterAutomationClass(PUMLUseCase, PUMLUseCaseAuto, IID_IUMLUseCase);
  ClassRegistry.RegisterAutomationClass(PUMLActor, PUMLActorAuto, IID_IUMLActor);
  ClassRegistry.RegisterAutomationClass(PUMLClassifierInState, PUMLClassifierInStateAuto, IID_IUMLClassifierInState);
  ClassRegistry.RegisterAutomationClass(PUMLInterface, PUMLInterfaceAuto, IID_IUMLInterface);
  ClassRegistry.RegisterAutomationClass(PUMLPackage, PUMLPackageAuto, IID_IUMLPackage);
  ClassRegistry.RegisterAutomationClass(PUMLSubsystem, PUMLSubsystemAuto, IID_IUMLSubsystem);
  ClassRegistry.RegisterAutomationClass(PUMLProject, PUMLProjectAuto, IID_IUMLProject);
  ClassRegistry.RegisterAutomationClass(PUMLModel, PUMLModelAuto, IID_IUMLModel);
  ClassRegistry.RegisterAutomationClass(PUMLDataType, PUMLDataTypeAuto, IID_IUMLDataType);
  ClassRegistry.RegisterAutomationClass(PUMLProgrammingLanguageDataType, PUMLProgrammingLanguageDataTypeAuto, IID_IUMLProgrammingLanguageDataType);
  ClassRegistry.RegisterAutomationClass(PUMLPrimitive, PUMLPrimitiveAuto, IID_IUMLPrimitive);
  ClassRegistry.RegisterAutomationClass(PUMLEnumeration, PUMLEnumerationAuto, IID_IUMLEnumeration);
  ClassRegistry.RegisterAutomationClass(PUMLClass, PUMLClassAuto, IID_IUMLClass);
  ClassRegistry.RegisterAutomationClass(PUMLNode, PUMLNodeAuto, IID_IUMLNode);
  ClassRegistry.RegisterAutomationClass(PUMLArtifact, PUMLArtifactAuto, IID_IUMLArtifact);
  ClassRegistry.RegisterAutomationClass(PUMLComponent, PUMLComponentAuto, IID_IUMLComponent);
  ClassRegistry.RegisterAutomationClass(PUMLSignal, PUMLSignalAuto, IID_IUMLSignal);
  ClassRegistry.RegisterAutomationClass(PUMLException, PUMLExceptionAuto, IID_IUMLException);
  ClassRegistry.RegisterAutomationClass(PUMLClassifierRole, PUMLClassifierRoleAuto, IID_IUMLClassifierRole);
  ClassRegistry.RegisterAutomationClass(PUMLEvent, PUMLEventAuto, IID_IUMLEvent);
  ClassRegistry.RegisterAutomationClass(PUMLChangeEvent, PUMLChangeEventAuto, IID_IUMLChangeEvent);
  ClassRegistry.RegisterAutomationClass(PUMLSignalEvent, PUMLSignalEventAuto, IID_IUMLSignalEvent);
  ClassRegistry.RegisterAutomationClass(PUMLTimeEvent, PUMLTimeEventAuto, IID_IUMLTimeEvent);
  ClassRegistry.RegisterAutomationClass(PUMLCallEvent, PUMLCallEventAuto, IID_IUMLCallEvent);
  ClassRegistry.RegisterAutomationClass(PUMLEnumerationLiteral, PUMLEnumerationLiteralAuto, IID_IUMLEnumerationLiteral);
  ClassRegistry.RegisterAutomationClass(PUMLStimulus, PUMLStimulusAuto, IID_IUMLStimulus);
  ClassRegistry.RegisterAutomationClass(PUMLAttributeLink, PUMLAttributeLinkAuto, IID_IUMLAttributeLink);
  ClassRegistry.RegisterAutomationClass(PUMLRelationship, PUMLRelationshipAuto, IID_IUMLRelationship);
  ClassRegistry.RegisterAutomationClass(PUMLGeneralization, PUMLGeneralizationAuto, IID_IUMLGeneralization);
  ClassRegistry.RegisterAutomationClass(PUMLInclude, PUMLIncludeAuto, IID_IUMLInclude);
  ClassRegistry.RegisterAutomationClass(PUMLDependency, PUMLDependencyAuto, IID_IUMLDependency);
  ClassRegistry.RegisterAutomationClass(PUMLRealization, PUMLRealizationAuto, IID_IUMLRealization);
  ClassRegistry.RegisterAutomationClass(PUMLExtend, PUMLExtendAuto, IID_IUMLExtend);
  ClassRegistry.RegisterAutomationClass(PUMLAssociation, PUMLAssociationAuto, IID_IUMLAssociation);
  ClassRegistry.RegisterAutomationClass(PUMLAssociationRole, PUMLAssociationRoleAuto, IID_IUMLAssociationRole);
  ClassRegistry.RegisterAutomationClass(PUMLAction, PUMLActionAuto, IID_IUMLAction);
  ClassRegistry.RegisterAutomationClass(PUMLTerminateAction, PUMLTerminateActionAuto, IID_IUMLTerminateAction);
  ClassRegistry.RegisterAutomationClass(PUMLSendAction, PUMLSendActionAuto, IID_IUMLSendAction);
  ClassRegistry.RegisterAutomationClass(PUMLActionSequence, PUMLActionSequenceAuto, IID_IUMLActionSequence);
  ClassRegistry.RegisterAutomationClass(PUMLCreateAction, PUMLCreateActionAuto, IID_IUMLCreateAction);
  ClassRegistry.RegisterAutomationClass(PUMLDestroyAction, PUMLDestroyActionAuto, IID_IUMLDestroyAction);
  ClassRegistry.RegisterAutomationClass(PUMLUninterpretedAction, PUMLUninterpretedActionAuto, IID_IUMLUninterpretedAction);
  ClassRegistry.RegisterAutomationClass(PUMLCallAction, PUMLCallActionAuto, IID_IUMLCallAction);
  ClassRegistry.RegisterAutomationClass(PUMLReturnAction, PUMLReturnActionAuto, IID_IUMLReturnAction);
  ClassRegistry.RegisterAutomationClass(PUMLCollaborationInstanceSet, PUMLCollaborationInstanceSetAuto, IID_IUMLCollaborationInstanceSet);
  ClassRegistry.RegisterAutomationClass(PUMLParameter, PUMLParameterAuto, IID_IUMLParameter);
  ClassRegistry.RegisterAutomationClass(PUMLAssociationEnd, PUMLAssociationEndAuto, IID_IUMLAssociationEnd);
  ClassRegistry.RegisterAutomationClass(PUMLAssociationEndRole, PUMLAssociationEndRoleAuto, IID_IUMLAssociationEndRole);
  ClassRegistry.RegisterAutomationClass(PUMLTransition, PUMLTransitionAuto, IID_IUMLTransition);
  ClassRegistry.RegisterAutomationClass(PUMLExtensionPoint, PUMLExtensionPointAuto, IID_IUMLExtensionPoint);
  ClassRegistry.RegisterAutomationClass(PUMLLink, PUMLLinkAuto, IID_IUMLLink);
  ClassRegistry.RegisterAutomationClass(PUMLComment, PUMLCommentAuto, IID_IUMLComment);
  ClassRegistry.RegisterAutomationClass(PUMLTemplateParameter, PUMLTemplateParameterAuto, IID_IUMLTemplateParameter);
  ClassRegistry.RegisterAutomationClass(PUMLTemplateArgument, PUMLTemplateArgumentAuto, IID_IUMLTemplateArgument);
  ClassRegistry.RegisterAutomationClass(PUMLElementImport, PUMLElementImportAuto, IID_IUMLElementImport);
  ClassRegistry.RegisterAutomationClass(PUMLDiagram, PUMLDiagramAuto, IID_IUMLDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLDeploymentDiagram, PUMLDeploymentDiagramAuto, IID_IUMLDeploymentDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLComponentDiagram, PUMLComponentDiagramAuto, IID_IUMLComponentDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLSequenceDiagram, PUMLSequenceDiagramAuto, IID_IUMLSequenceDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLCollaborationDiagram, PUMLCollaborationDiagramAuto, IID_IUMLCollaborationDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLSequenceRoleDiagram, PUMLSequenceRoleDiagramAuto, IID_IUMLSequenceRoleDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLUseCaseDiagram, PUMLUseCaseDiagramAuto, IID_IUMLUseCaseDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLClassDiagram, PUMLClassDiagramAuto, IID_IUMLClassDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLActivityDiagram, PUMLActivityDiagramAuto, IID_IUMLActivityDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLCollaborationRoleDiagram, PUMLCollaborationRoleDiagramAuto, IID_IUMLCollaborationRoleDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLCompositeStructureDiagram, PUMLCompositeStructureDiagramAuto, IID_IUMLCompositeStructureDiagram);
  ClassRegistry.RegisterAutomationClass(PUMLStatechartDiagram, PUMLStatechartDiagramAuto, IID_IUMLStatechartDiagram);
end;

// AutomationClass Register Function
////////////////////////////////////////////////////////////////////////////////

initialization
  RegisterAutomationClasses;
end.

