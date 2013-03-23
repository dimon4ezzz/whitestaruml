unit UMLViewsAuto;

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
  Core, CoreAuto, ViewCoreAuto, WhiteStarUML_TLB;

type
  // Forward Declaration
  PUMLGeneralNodeViewAuto = class;
  PUMLCustomStateViewAuto = class;
  PUMLStateViewAuto = class;
  PUMLSubmachineStateViewAuto = class;
  PUMLCollaborationViewAuto = class;
  PUMLCustomComponentViewAuto = class;
  PUMLComponentInstanceViewAuto = class;
  PUMLComponentViewAuto = class;
  PUMLEnumerationViewAuto = class;
  PUMLCustomNodeViewAuto = class;
  PUMLNodeInstanceViewAuto = class;
  PUMLNodeViewAuto = class;
  PUMLCollaborationInstanceSetViewAuto = class;
  PUMLCustomSeqObjectViewAuto = class;
  PUMLSeqObjectViewAuto = class;
  PUMLSeqClassifierRoleViewAuto = class;
  PUMLCustomColObjectViewAuto = class;
  PUMLColClassifierRoleViewAuto = class;
  PUMLColObjectViewAuto = class;
  PUMLPackageViewAuto = class;
  PUMLModelViewAuto = class;
  PUMLSubsystemViewAuto = class;
  PUMLClassifierViewAuto = class;
  PUMLInterfaceViewAuto = class;
  PUMLClassViewAuto = class;
  PUMLActorViewAuto = class;
  PUMLSignalViewAuto = class;
  PUMLExceptionViewAuto = class;
  PUMLUseCaseViewAuto = class;
  PUMLActionStateViewAuto = class;
  PUMLSubactivityStateViewAuto = class;
  PUMLPseudostateViewAuto = class;
  PUMLFinalStateViewAuto = class;
  PUMLSwimlaneViewAuto = class;
  PUMLNoteLinkViewAuto = class;
  PUMLGeneralEdgeViewAuto = class;
  PUMLLinkViewAuto = class;
  PUMLGeneralizationViewAuto = class;
  PUMLIncludeViewAuto = class;
  PUMLDependencyViewAuto = class;
  PUMLTransitionViewAuto = class;
  PUMLRealizationViewAuto = class;
  PUMLExtendViewAuto = class;
  PUMLAssociationViewAuto = class;
  PUMLAssociationRoleViewAuto = class;
  PUMLListCompartmentViewAuto = class;
  PUMLOperationCompartmentViewAuto = class;
  PUMLAttributeCompartmentViewAuto = class;
  PUMLQualifierCompartmentViewAuto = class;
  PUMLInternalTransitionCompartmentViewAuto = class;
  PUMLTemplateParameterCompartmentViewAuto = class;
  PUMLEnumerationLiteralCompartmentViewAuto = class;
  PUMLNameCompartmentViewAuto = class;
  PUMLLifeLineViewAuto = class;
  PUMLActivationViewAuto = class;
  PUMLCustomSeqMessageViewAuto = class;
  PUMLSeqMessageViewAuto = class;
  PUMLSeqStimulusViewAuto = class;
  PUMLCustomColMessageViewAuto = class;
  PUMLColMessageViewAuto = class;
  PUMLColStimulusViewAuto = class;
  PUMLDiagramViewAuto = class;
  PUMLSequenceDiagramViewAuto = class;
  PUMLClassDiagramViewAuto = class;
  PUMLSequenceRoleDiagramViewAuto = class;
  PUMLActivityDiagramViewAuto = class;
  PUMLCollaborationDiagramViewAuto = class;
  PUMLStatechartDiagramViewAuto = class;
  PUMLDeploymentDiagramViewAuto = class;
  PUMLComponentDiagramViewAuto = class;
  PUMLCollaborationRoleDiagramViewAuto = class;
  PUMLUseCaseDiagramViewAuto = class;
  PUMLAssociationClassViewAuto = class;
  PUMLCustomTextViewAuto = class;
  PUMLNoteViewAuto = class;
  PUMLTextViewAuto = class;

  // Class Definitions
  // PUMLGeneralNodeViewAuto
  PUMLGeneralNodeViewAuto = class(PNodeViewAuto, IUMLGeneralNodeView)
  protected
    function Get_StereotypeDisplay: UMLStereotypeDisplayKind; safecall;
    procedure Set_StereotypeDisplay(Value: UMLStereotypeDisplayKind); safecall;
    function Get_ShowParentName: WordBool; safecall;
    procedure Set_ShowParentName(Value: WordBool); safecall;
    function Get_NameCompartment: IUMLNameCompartmentView; safecall;
  end;

  // PUMLCustomStateViewAuto
  PUMLCustomStateViewAuto = class(PUMLGeneralNodeViewAuto, IUMLCustomStateView)
  protected
    function Get_InternalTransitionCompartment: IUMLInternalTransitionCompartmentView; safecall;
  end;

  // PUMLStateViewAuto
  PUMLStateViewAuto = class(PUMLCustomStateViewAuto, IUMLStateView)
  protected
  end;

  // PUMLSubmachineStateViewAuto
  PUMLSubmachineStateViewAuto = class(PUMLCustomStateViewAuto, IUMLSubmachineStateView)
  protected
    function Get_IncludeLabel: ILabelView; safecall;
  end;

  // PUMLCollaborationViewAuto
  PUMLCollaborationViewAuto = class(PUMLGeneralNodeViewAuto, IUMLCollaborationView)
  protected
    function Get_TemplateParameterCompartment: IUMLTemplateParameterCompartmentView; safecall;
  end;

  // PUMLCustomComponentViewAuto
  PUMLCustomComponentViewAuto = class(PUMLGeneralNodeViewAuto, IUMLCustomComponentView)
  protected
  end;

  // PUMLComponentInstanceViewAuto
  PUMLComponentInstanceViewAuto = class(PUMLCustomComponentViewAuto, IUMLComponentInstanceView)
  protected
  end;

  // PUMLComponentViewAuto
  PUMLComponentViewAuto = class(PUMLCustomComponentViewAuto, IUMLComponentView)
  protected
  end;

  // PUMLEnumerationViewAuto
  PUMLEnumerationViewAuto = class(PUMLGeneralNodeViewAuto, IUMLEnumerationView)
  protected
    function Get_SuppressLiterals: WordBool; safecall;
    procedure Set_SuppressLiterals(Value: WordBool); safecall;
    function Get_SuppressOperations: WordBool; safecall;
    procedure Set_SuppressOperations(Value: WordBool); safecall;
    function Get_ShowOperationSignature: WordBool; safecall;
    procedure Set_ShowOperationSignature(Value: WordBool); safecall;
    function Get_ShowCompartmentStereotype: WordBool; safecall;
    procedure Set_ShowCompartmentStereotype(Value: WordBool); safecall;
    function Get_ShowCompartmentVisibility: WordBool; safecall;
    procedure Set_ShowCompartmentVisibility(Value: WordBool); safecall;
    function Get_EnumerationLiteralCompartment: IUMLEnumerationLiteralCompartmentView; safecall;
    function Get_OperationCompartment: IUMLOperationCompartmentView; safecall;
  end;

  // PUMLCustomNodeViewAuto
  PUMLCustomNodeViewAuto = class(PUMLGeneralNodeViewAuto, IUMLCustomNodeView)
  protected
  end;

  // PUMLNodeInstanceViewAuto
  PUMLNodeInstanceViewAuto = class(PUMLCustomNodeViewAuto, IUMLNodeInstanceView)
  protected
  end;

  // PUMLNodeViewAuto
  PUMLNodeViewAuto = class(PUMLCustomNodeViewAuto, IUMLNodeView)
  protected
  end;

  // PUMLCollaborationInstanceSetViewAuto
  PUMLCollaborationInstanceSetViewAuto = class(PUMLGeneralNodeViewAuto, IUMLCollaborationInstanceSetView)
  protected
  end;

  // PUMLCustomSeqObjectViewAuto
  PUMLCustomSeqObjectViewAuto = class(PUMLGeneralNodeViewAuto, IUMLCustomSeqObjectView)
  protected
    function Get_LifeLine: IUMLLifeLineView; safecall;
  end;

  // PUMLSeqObjectViewAuto
  PUMLSeqObjectViewAuto = class(PUMLCustomSeqObjectViewAuto, IUMLSeqObjectView)
  protected
  end;

  // PUMLSeqClassifierRoleViewAuto
  PUMLSeqClassifierRoleViewAuto = class(PUMLCustomSeqObjectViewAuto, IUMLSeqClassifierRoleView)
  protected
  end;

  // PUMLCustomColObjectViewAuto
  PUMLCustomColObjectViewAuto = class(PUMLGeneralNodeViewAuto, IUMLCustomColObjectView)
  protected
  end;

  // PUMLColClassifierRoleViewAuto
  PUMLColClassifierRoleViewAuto = class(PUMLCustomColObjectViewAuto, IUMLColClassifierRoleView)
  protected
  end;

  // PUMLColObjectViewAuto
  PUMLColObjectViewAuto = class(PUMLCustomColObjectViewAuto, IUMLColObjectView)
  protected
  end;

  // PUMLPackageViewAuto
  PUMLPackageViewAuto = class(PUMLGeneralNodeViewAuto, IUMLPackageView)
  protected
  end;

  // PUMLModelViewAuto
  PUMLModelViewAuto = class(PUMLPackageViewAuto, IUMLModelView)
  protected
  end;

  // PUMLSubsystemViewAuto
  PUMLSubsystemViewAuto = class(PUMLPackageViewAuto, IUMLSubsystemView)
  protected
    function Get_SuppressOperations: WordBool; safecall;
    procedure Set_SuppressOperations(Value: WordBool); safecall;
    function Get_ShowOperationSignature: WordBool; safecall;
    procedure Set_ShowOperationSignature(Value: WordBool); safecall;
    function Get_ShowCompartmentStereotype: WordBool; safecall;
    procedure Set_ShowCompartmentStereotype(Value: WordBool); safecall;
    function Get_ShowCompartmentVisibility: WordBool; safecall;
    procedure Set_ShowCompartmentVisibility(Value: WordBool); safecall;
    function Get_OperationCompartment: IUMLOperationCompartmentView; safecall;
  end;

  // PUMLClassifierViewAuto
  PUMLClassifierViewAuto = class(PUMLGeneralNodeViewAuto, IUMLClassifierView)
  protected
    function Get_SuppressAttributes: WordBool; safecall;
    procedure Set_SuppressAttributes(Value: WordBool); safecall;
    function Get_SuppressOperations: WordBool; safecall;
    procedure Set_SuppressOperations(Value: WordBool); safecall;
    function Get_ShowOperationSignature: WordBool; safecall;
    procedure Set_ShowOperationSignature(Value: WordBool); safecall;
    function Get_ShowCompartmentStereotype: WordBool; safecall;
    procedure Set_ShowCompartmentStereotype(Value: WordBool); safecall;
    function Get_ShowCompartmentVisibility: WordBool; safecall;
    procedure Set_ShowCompartmentVisibility(Value: WordBool); safecall;
    function Get_OperationCompartment: IUMLOperationCompartmentView; safecall;
    function Get_AttributeCompartment: IUMLAttributeCompartmentView; safecall;
  end;

  // PUMLInterfaceViewAuto
  PUMLInterfaceViewAuto = class(PUMLClassifierViewAuto, IUMLInterfaceView)
  protected
  end;

  // PUMLClassViewAuto
  PUMLClassViewAuto = class(PUMLClassifierViewAuto, IUMLClassView)
  protected
    function Get_TemplateParameterCompartment: IUMLTemplateParameterCompartmentView; safecall;
  end;

  // PUMLActorViewAuto
  PUMLActorViewAuto = class(PUMLClassifierViewAuto, IUMLActorView)
  protected
  end;

  // PUMLSignalViewAuto
  PUMLSignalViewAuto = class(PUMLClassifierViewAuto, IUMLSignalView)
  protected
  end;

  // PUMLExceptionViewAuto
  PUMLExceptionViewAuto = class(PUMLSignalViewAuto, IUMLExceptionView)
  protected
  end;

  // PUMLUseCaseViewAuto
  PUMLUseCaseViewAuto = class(PUMLClassifierViewAuto, IUMLUseCaseView)
  protected
  end;

  // PUMLActionStateViewAuto
  PUMLActionStateViewAuto = class(PUMLGeneralNodeViewAuto, IUMLActionStateView)
  protected
  end;

  // PUMLSubactivityStateViewAuto
  PUMLSubactivityStateViewAuto = class(PUMLActionStateViewAuto, IUMLSubactivityStateView)
  protected
    function Get_IncludeLabel: ILabelView; safecall;
  end;

  // PUMLPseudostateViewAuto
  PUMLPseudostateViewAuto = class(PNodeViewAuto, IUMLPseudostateView)
  protected
  end;

  // PUMLFinalStateViewAuto
  PUMLFinalStateViewAuto = class(PNodeViewAuto, IUMLFinalStateView)
  protected
  end;

  // PUMLSwimlaneViewAuto
  PUMLSwimlaneViewAuto = class(PNodeViewAuto, IUMLSwimlaneView)
  protected
  end;

  // PUMLNoteLinkViewAuto
  PUMLNoteLinkViewAuto = class(PEdgeViewAuto, IUMLNoteLinkView)
  protected
  end;

  // PUMLGeneralEdgeViewAuto
  PUMLGeneralEdgeViewAuto = class(PEdgeViewAuto, IUMLGeneralEdgeView)
  protected
    function Get_NameLabel: IEdgeLabelView; safecall;
    function Get_StereotypeLabel: IEdgeLabelView; safecall;
  end;

  // PUMLLinkViewAuto
  PUMLLinkViewAuto = class(PUMLGeneralEdgeViewAuto, IUMLLinkView)
  protected
    function Get_HeadEndLabel: IEdgeLabelView; safecall;
    function Get_TailEndLabel: IEdgeLabelView; safecall;
  end;

  // PUMLGeneralizationViewAuto
  PUMLGeneralizationViewAuto = class(PUMLGeneralEdgeViewAuto, IUMLGeneralizationView)
  protected
  end;

  // PUMLIncludeViewAuto
  PUMLIncludeViewAuto = class(PUMLGeneralEdgeViewAuto, IUMLIncludeView)
  protected
  end;

  // PUMLDependencyViewAuto
  PUMLDependencyViewAuto = class(PUMLGeneralEdgeViewAuto, IUMLDependencyView)
  protected
  end;

  // PUMLTransitionViewAuto
  PUMLTransitionViewAuto = class(PUMLGeneralEdgeViewAuto, IUMLTransitionView)
  protected
  end;

  // PUMLRealizationViewAuto
  PUMLRealizationViewAuto = class(PUMLGeneralEdgeViewAuto, IUMLRealizationView)
  protected
  end;

  // PUMLExtendViewAuto
  PUMLExtendViewAuto = class(PUMLGeneralEdgeViewAuto, IUMLExtendView)
  protected
  end;

  // PUMLAssociationViewAuto
  PUMLAssociationViewAuto = class(PUMLGeneralEdgeViewAuto, IUMLAssociationView)
  protected
    function Get_ShowCompartmentStereotype: WordBool; safecall;
    procedure Set_ShowCompartmentStereotype(Value: WordBool); safecall;
    function Get_ShowCompartmentVisibility: WordBool; safecall;
    procedure Set_ShowCompartmentVisibility(Value: WordBool); safecall;
    function Get_HeadRoleNameLabel: IEdgeLabelView; safecall;
    function Get_TailRoleNameLabel: IEdgeLabelView; safecall;
    function Get_HeadMultiplicityLabel: IEdgeLabelView; safecall;
    function Get_TailMultiplicityLabel: IEdgeLabelView; safecall;
    function Get_TailPropertyLabel: IEdgeLabelView; safecall;
    function Get_HeadPropertyLabel: IEdgeLabelView; safecall;
    function Get_HeadQualifierCompartment: IUMLQualifierCompartmentView; safecall;
    function Get_TailQualifierCompartment: IUMLQualifierCompartmentView; safecall;
  end;

  // PUMLAssociationRoleViewAuto
  PUMLAssociationRoleViewAuto = class(PUMLAssociationViewAuto, IUMLAssociationRoleView)
  protected
  end;

  // PUMLListCompartmentViewAuto
  PUMLListCompartmentViewAuto = class(PNodeViewAuto, IUMLListCompartmentView)
  protected
  end;

  // PUMLOperationCompartmentViewAuto
  PUMLOperationCompartmentViewAuto = class(PUMLListCompartmentViewAuto, IUMLOperationCompartmentView)
  protected
  end;

  // PUMLAttributeCompartmentViewAuto
  PUMLAttributeCompartmentViewAuto = class(PUMLListCompartmentViewAuto, IUMLAttributeCompartmentView)
  protected
  end;

  // PUMLQualifierCompartmentViewAuto
  PUMLQualifierCompartmentViewAuto = class(PUMLListCompartmentViewAuto, IUMLQualifierCompartmentView)
  protected
  end;

  // PUMLInternalTransitionCompartmentViewAuto
  PUMLInternalTransitionCompartmentViewAuto = class(PUMLListCompartmentViewAuto, IUMLInternalTransitionCompartmentView)
  protected
  end;

  // PUMLTemplateParameterCompartmentViewAuto
  PUMLTemplateParameterCompartmentViewAuto = class(PUMLListCompartmentViewAuto, IUMLTemplateParameterCompartmentView)
  protected
  end;

  // PUMLEnumerationLiteralCompartmentViewAuto
  PUMLEnumerationLiteralCompartmentViewAuto = class(PUMLListCompartmentViewAuto, IUMLEnumerationLiteralCompartmentView)
  protected
  end;

  // PUMLNameCompartmentViewAuto
  PUMLNameCompartmentViewAuto = class(PNodeViewAuto, IUMLNameCompartmentView)
  protected
    function Get_NameLabel: ILabelView; safecall;
    function Get_StereotypeLabel: ILabelView; safecall;
  end;

  // PUMLLifeLineViewAuto
  PUMLLifeLineViewAuto = class(PNodeViewAuto, IUMLLifeLineView)
  protected
  end;

  // PUMLActivationViewAuto
  PUMLActivationViewAuto = class(PNodeViewAuto, IUMLActivationView)
  protected
  end;

  // PUMLCustomSeqMessageViewAuto
  PUMLCustomSeqMessageViewAuto = class(PEdgeViewAuto, IUMLCustomSeqMessageView)
  protected
    function Get_Activation: IUMLActivationView; safecall;
    function Get_NameLabel: IEdgeLabelView; safecall;
    function Get_StereotypeLabel: IEdgeLabelView; safecall;
  end;

  // PUMLSeqMessageViewAuto
  PUMLSeqMessageViewAuto = class(PUMLCustomSeqMessageViewAuto, IUMLSeqMessageView)
  protected
  end;

  // PUMLSeqStimulusViewAuto
  PUMLSeqStimulusViewAuto = class(PUMLCustomSeqMessageViewAuto, IUMLSeqStimulusView)
  protected
  end;

  // PUMLCustomColMessageViewAuto
  PUMLCustomColMessageViewAuto = class(PEdgeNodeViewAuto, IUMLCustomColMessageView)
  protected
    function Get_NameLabel: INodeLabelView; safecall;
    function Get_StereotypeLabel: INodeLabelView; safecall;
  end;

  // PUMLColMessageViewAuto
  PUMLColMessageViewAuto = class(PUMLCustomColMessageViewAuto, IUMLColMessageView)
  protected
  end;

  // PUMLColStimulusViewAuto
  PUMLColStimulusViewAuto = class(PUMLCustomColMessageViewAuto, IUMLColStimulusView)
  protected
  end;

  // PUMLDiagramViewAuto
  PUMLDiagramViewAuto = class(PDiagramViewAuto, IUMLDiagramView)
  protected
  end;

  // PUMLSequenceDiagramViewAuto
  PUMLSequenceDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLSequenceDiagramView)
  protected
  end;

  // PUMLClassDiagramViewAuto
  PUMLClassDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLClassDiagramView)
  protected
  end;

  // PUMLSequenceRoleDiagramViewAuto
  PUMLSequenceRoleDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLSequenceRoleDiagramView)
  protected
  end;

  // PUMLActivityDiagramViewAuto
  PUMLActivityDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLActivityDiagramView)
  protected
  end;

  // PUMLCollaborationDiagramViewAuto
  PUMLCollaborationDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLCollaborationDiagramView)
  protected
  end;

  // PUMLStatechartDiagramViewAuto
  PUMLStatechartDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLStatechartDiagramView)
  protected
  end;

  // PUMLDeploymentDiagramViewAuto
  PUMLDeploymentDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLDeploymentDiagramView)
  protected
  end;

  // PUMLComponentDiagramViewAuto
  PUMLComponentDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLComponentDiagramView)
  protected
  end;

  // PUMLCollaborationRoleDiagramViewAuto
  PUMLCollaborationRoleDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLCollaborationRoleDiagramView)
  protected
  end;

  // PUMLUseCaseDiagramViewAuto
  PUMLUseCaseDiagramViewAuto = class(PUMLDiagramViewAuto, IUMLUseCaseDiagramView)
  protected
  end;

  // PUMLAssociationClassViewAuto
  PUMLAssociationClassViewAuto = class(PEdgeViewAuto, IUMLAssociationClassView)
  protected
  end;

  // PUMLCustomTextViewAuto
  PUMLCustomTextViewAuto = class(PNodeViewAuto, IUMLCustomTextView)
  protected
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
  end;

  // PUMLNoteViewAuto
  PUMLNoteViewAuto = class(PUMLCustomTextViewAuto, IUMLNoteView)
  protected
  end;

  // PUMLTextViewAuto
  PUMLTextViewAuto = class(PUMLCustomTextViewAuto, IUMLTextView)
  protected
  end;

implementation

uses
  BasicClasses, ViewCore, UMLViews, StarUMLApp;

////////////////////////////////////////////////////////////////////////////////
// PUMLGeneralNodeViewAuto

function PUMLGeneralNodeViewAuto.Get_StereotypeDisplay: UMLStereotypeDisplayKind;
begin
  Result := Ord((TheObject as PUMLGeneralNodeView).StereotypeDisplay);
end;

procedure PUMLGeneralNodeViewAuto.Set_StereotypeDisplay(Value: UMLStereotypeDisplayKind);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'StereotypeDisplay', UMLStereotypeDisplayKindToString(PUMLStereotypeDisplayKind(Value)));
end;

function PUMLGeneralNodeViewAuto.Get_ShowParentName: WordBool;
begin
  Result := (TheObject as PUMLGeneralNodeView).ShowParentName;
end;

procedure PUMLGeneralNodeViewAuto.Set_ShowParentName(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowParentName', BooleanToString(Value));
end;

function PUMLGeneralNodeViewAuto.Get_NameCompartment: IUMLNameCompartmentView;
var
  E: PUMLNameCompartmentView;
begin
  E := (TheObject as PUMLGeneralNodeView).NameCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLNameCompartmentViewAuto;
end;

// PUMLGeneralNodeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomStateViewAuto

function PUMLCustomStateViewAuto.Get_InternalTransitionCompartment: IUMLInternalTransitionCompartmentView;
var
  E: PUMLInternalTransitionCompartmentView;
begin
  E := (TheObject as PUMLCustomStateView).InternalTransitionCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLInternalTransitionCompartmentViewAuto;
end;

// PUMLCustomStateViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStateViewAuto

// PUMLStateViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubmachineStateViewAuto

function PUMLSubmachineStateViewAuto.Get_IncludeLabel: ILabelView;
var
  E: PLabelView;
begin
  E := (TheObject as PUMLSubmachineStateView).IncludeLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PLabelViewAuto;
end;

// PUMLSubmachineStateViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationViewAuto

function PUMLCollaborationViewAuto.Get_TemplateParameterCompartment: IUMLTemplateParameterCompartmentView;
var
  E: PUMLTemplateParameterCompartmentView;
begin
  E := (TheObject as PUMLCollaborationView).TemplateParameterCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTemplateParameterCompartmentViewAuto;
end;

// PUMLCollaborationViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomComponentViewAuto

// PUMLCustomComponentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponentInstanceViewAuto

// PUMLComponentInstanceViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponentViewAuto

// PUMLComponentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLEnumerationViewAuto

function PUMLEnumerationViewAuto.Get_SuppressLiterals: WordBool;
begin
  Result := (TheObject as PUMLEnumerationView).SuppressLiterals;
end;

procedure PUMLEnumerationViewAuto.Set_SuppressLiterals(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'SuppressLiterals', BooleanToString(Value));
end;

function PUMLEnumerationViewAuto.Get_SuppressOperations: WordBool;
begin
  Result := (TheObject as PUMLEnumerationView).SuppressOperations;
end;

procedure PUMLEnumerationViewAuto.Set_SuppressOperations(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'SuppressOperations', BooleanToString(Value));
end;

function PUMLEnumerationViewAuto.Get_ShowOperationSignature: WordBool;
begin
  Result := (TheObject as PUMLEnumerationView).ShowOperationSignature;
end;

procedure PUMLEnumerationViewAuto.Set_ShowOperationSignature(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowOperationSignature', BooleanToString(Value));
end;

function PUMLEnumerationViewAuto.Get_ShowCompartmentStereotype: WordBool;
begin
  Result := (TheObject as PUMLEnumerationView).ShowCompartmentStereotype;
end;

procedure PUMLEnumerationViewAuto.Set_ShowCompartmentStereotype(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowCompartmentStereotype', BooleanToString(Value));
end;

function PUMLEnumerationViewAuto.Get_ShowCompartmentVisibility: WordBool;
begin
  Result := (TheObject as PUMLEnumerationView).ShowCompartmentVisibility;
end;

procedure PUMLEnumerationViewAuto.Set_ShowCompartmentVisibility(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowCompartmentVisibility', BooleanToString(Value));
end;

function PUMLEnumerationViewAuto.Get_EnumerationLiteralCompartment: IUMLEnumerationLiteralCompartmentView;
var
  E: PUMLEnumerationLiteralCompartmentView;
begin
  E := (TheObject as PUMLEnumerationView).EnumerationLiteralCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLEnumerationLiteralCompartmentViewAuto;
end;

function PUMLEnumerationViewAuto.Get_OperationCompartment: IUMLOperationCompartmentView;
var
  E: PUMLOperationCompartmentView;
begin
  E := (TheObject as PUMLEnumerationView).OperationCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationCompartmentViewAuto;
end;

// PUMLEnumerationViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomNodeViewAuto

// PUMLCustomNodeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNodeInstanceViewAuto

// PUMLNodeInstanceViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNodeViewAuto

// PUMLNodeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationInstanceSetViewAuto

// PUMLCollaborationInstanceSetViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomSeqObjectViewAuto

function PUMLCustomSeqObjectViewAuto.Get_LifeLine: IUMLLifeLineView;
var
  E: PUMLLifeLineView;
begin
  E := (TheObject as PUMLCustomSeqObjectView).LifeLine;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLLifeLineViewAuto;
end;

// PUMLCustomSeqObjectViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSeqObjectViewAuto

// PUMLSeqObjectViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSeqClassifierRoleViewAuto

// PUMLSeqClassifierRoleViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomColObjectViewAuto

// PUMLCustomColObjectViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLColClassifierRoleViewAuto

// PUMLColClassifierRoleViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLColObjectViewAuto

// PUMLColObjectViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPackageViewAuto

// PUMLPackageViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLModelViewAuto

// PUMLModelViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubsystemViewAuto

function PUMLSubsystemViewAuto.Get_SuppressOperations: WordBool;
begin
  Result := (TheObject as PUMLSubsystemView).SuppressOperations;
end;

procedure PUMLSubsystemViewAuto.Set_SuppressOperations(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'SuppressOperations', BooleanToString(Value));
end;

function PUMLSubsystemViewAuto.Get_ShowOperationSignature: WordBool;
begin
  Result := (TheObject as PUMLSubsystemView).ShowOperationSignature;
end;

procedure PUMLSubsystemViewAuto.Set_ShowOperationSignature(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowOperationSignature', BooleanToString(Value));
end;

function PUMLSubsystemViewAuto.Get_ShowCompartmentStereotype: WordBool;
begin
  Result := (TheObject as PUMLSubsystemView).ShowCompartmentStereotype;
end;

procedure PUMLSubsystemViewAuto.Set_ShowCompartmentStereotype(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowCompartmentStereotype', BooleanToString(Value));
end;

function PUMLSubsystemViewAuto.Get_ShowCompartmentVisibility: WordBool;
begin
  Result := (TheObject as PUMLSubsystemView).ShowCompartmentVisibility;
end;

procedure PUMLSubsystemViewAuto.Set_ShowCompartmentVisibility(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowCompartmentVisibility', BooleanToString(Value));
end;

function PUMLSubsystemViewAuto.Get_OperationCompartment: IUMLOperationCompartmentView;
var
  E: PUMLOperationCompartmentView;
begin
  E := (TheObject as PUMLSubsystemView).OperationCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationCompartmentViewAuto;
end;

// PUMLSubsystemViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassifierViewAuto

function PUMLClassifierViewAuto.Get_SuppressAttributes: WordBool;
begin
  Result := (TheObject as PUMLClassifierView).SuppressAttributes;
end;

procedure PUMLClassifierViewAuto.Set_SuppressAttributes(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'SuppressAttributes', BooleanToString(Value));
end;

function PUMLClassifierViewAuto.Get_SuppressOperations: WordBool;
begin
  Result := (TheObject as PUMLClassifierView).SuppressOperations;
end;

procedure PUMLClassifierViewAuto.Set_SuppressOperations(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'SuppressOperations', BooleanToString(Value));
end;

function PUMLClassifierViewAuto.Get_ShowOperationSignature: WordBool;
begin
  Result := (TheObject as PUMLClassifierView).ShowOperationSignature;
end;

procedure PUMLClassifierViewAuto.Set_ShowOperationSignature(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowOperationSignature', BooleanToString(Value));
end;

function PUMLClassifierViewAuto.Get_ShowCompartmentStereotype: WordBool;
begin
  Result := (TheObject as PUMLClassifierView).ShowCompartmentStereotype;
end;

procedure PUMLClassifierViewAuto.Set_ShowCompartmentStereotype(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowCompartmentStereotype', BooleanToString(Value));
end;

function PUMLClassifierViewAuto.Get_ShowCompartmentVisibility: WordBool;
begin
  Result := (TheObject as PUMLClassifierView).ShowCompartmentVisibility;
end;

procedure PUMLClassifierViewAuto.Set_ShowCompartmentVisibility(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowCompartmentVisibility', BooleanToString(Value));
end;

function PUMLClassifierViewAuto.Get_OperationCompartment: IUMLOperationCompartmentView;
var
  E: PUMLOperationCompartmentView;
begin
  E := (TheObject as PUMLClassifierView).OperationCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLOperationCompartmentViewAuto;
end;

function PUMLClassifierViewAuto.Get_AttributeCompartment: IUMLAttributeCompartmentView;
var
  E: PUMLAttributeCompartmentView;
begin
  E := (TheObject as PUMLClassifierView).AttributeCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLAttributeCompartmentViewAuto;
end;

// PUMLClassifierViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInterfaceViewAuto

// PUMLInterfaceViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassViewAuto

function PUMLClassViewAuto.Get_TemplateParameterCompartment: IUMLTemplateParameterCompartmentView;
var
  E: PUMLTemplateParameterCompartmentView;
begin
  E := (TheObject as PUMLClassView).TemplateParameterCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLTemplateParameterCompartmentViewAuto;
end;

// PUMLClassViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActorViewAuto

// PUMLActorViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSignalViewAuto

// PUMLSignalViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLExceptionViewAuto

// PUMLExceptionViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLUseCaseViewAuto

// PUMLUseCaseViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActionStateViewAuto

// PUMLActionStateViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSubactivityStateViewAuto

function PUMLSubactivityStateViewAuto.Get_IncludeLabel: ILabelView;
var
  E: PLabelView;
begin
  E := (TheObject as PUMLSubactivityStateView).IncludeLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PLabelViewAuto;
end;

// PUMLSubactivityStateViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLPseudostateViewAuto

// PUMLPseudostateViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLFinalStateViewAuto

// PUMLFinalStateViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSwimlaneViewAuto

// PUMLSwimlaneViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNoteLinkViewAuto

// PUMLNoteLinkViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLGeneralEdgeViewAuto

function PUMLGeneralEdgeViewAuto.Get_NameLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLGeneralEdgeView).NameLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLGeneralEdgeViewAuto.Get_StereotypeLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLGeneralEdgeView).StereotypeLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

// PUMLGeneralEdgeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLLinkViewAuto

function PUMLLinkViewAuto.Get_HeadEndLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLLinkView).HeadEndLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLLinkViewAuto.Get_TailEndLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLLinkView).TailEndLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

// PUMLLinkViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLGeneralizationViewAuto

// PUMLGeneralizationViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLIncludeViewAuto

// PUMLIncludeViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDependencyViewAuto

// PUMLDependencyViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTransitionViewAuto

// PUMLTransitionViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLRealizationViewAuto

// PUMLRealizationViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLExtendViewAuto

// PUMLExtendViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationViewAuto

function PUMLAssociationViewAuto.Get_ShowCompartmentStereotype: WordBool;
begin
  Result := (TheObject as PUMLAssociationView).ShowCompartmentStereotype;
end;

procedure PUMLAssociationViewAuto.Set_ShowCompartmentStereotype(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowCompartmentStereotype', BooleanToString(Value));
end;

function PUMLAssociationViewAuto.Get_ShowCompartmentVisibility: WordBool;
begin
  Result := (TheObject as PUMLAssociationView).ShowCompartmentVisibility;
end;

procedure PUMLAssociationViewAuto.Set_ShowCompartmentVisibility(Value: WordBool);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'ShowCompartmentVisibility', BooleanToString(Value));
end;

function PUMLAssociationViewAuto.Get_HeadRoleNameLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLAssociationView).HeadRoleNameLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLAssociationViewAuto.Get_TailRoleNameLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLAssociationView).TailRoleNameLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLAssociationViewAuto.Get_HeadMultiplicityLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLAssociationView).HeadMultiplicityLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLAssociationViewAuto.Get_TailMultiplicityLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLAssociationView).TailMultiplicityLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLAssociationViewAuto.Get_TailPropertyLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLAssociationView).TailPropertyLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLAssociationViewAuto.Get_HeadPropertyLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLAssociationView).HeadPropertyLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLAssociationViewAuto.Get_HeadQualifierCompartment: IUMLQualifierCompartmentView;
var
  E: PUMLQualifierCompartmentView;
begin
  E := (TheObject as PUMLAssociationView).HeadQualifierCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLQualifierCompartmentViewAuto;
end;

function PUMLAssociationViewAuto.Get_TailQualifierCompartment: IUMLQualifierCompartmentView;
var
  E: PUMLQualifierCompartmentView;
begin
  E := (TheObject as PUMLAssociationView).TailQualifierCompartment;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLQualifierCompartmentViewAuto;
end;

// PUMLAssociationViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationRoleViewAuto

// PUMLAssociationRoleViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLListCompartmentViewAuto

// PUMLListCompartmentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLOperationCompartmentViewAuto

// PUMLOperationCompartmentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAttributeCompartmentViewAuto

// PUMLAttributeCompartmentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLQualifierCompartmentViewAuto

// PUMLQualifierCompartmentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLInternalTransitionCompartmentViewAuto

// PUMLInternalTransitionCompartmentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTemplateParameterCompartmentViewAuto

// PUMLTemplateParameterCompartmentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLEnumerationLiteralCompartmentViewAuto

// PUMLEnumerationLiteralCompartmentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNameCompartmentViewAuto

function PUMLNameCompartmentViewAuto.Get_NameLabel: ILabelView;
var
  E: PLabelView;
begin
  E := (TheObject as PUMLNameCompartmentView).NameLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PLabelViewAuto;
end;

function PUMLNameCompartmentViewAuto.Get_StereotypeLabel: ILabelView;
var
  E: PLabelView;
begin
  E := (TheObject as PUMLNameCompartmentView).StereotypeLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PLabelViewAuto;
end;

// PUMLNameCompartmentViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLLifeLineViewAuto

// PUMLLifeLineViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActivationViewAuto

// PUMLActivationViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomSeqMessageViewAuto

function PUMLCustomSeqMessageViewAuto.Get_Activation: IUMLActivationView;
var
  E: PUMLActivationView;
begin
  E := (TheObject as PUMLCustomSeqMessageView).Activation;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PUMLActivationViewAuto;
end;

function PUMLCustomSeqMessageViewAuto.Get_NameLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLCustomSeqMessageView).NameLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

function PUMLCustomSeqMessageViewAuto.Get_StereotypeLabel: IEdgeLabelView;
var
  E: PEdgeLabelView;
begin
  E := (TheObject as PUMLCustomSeqMessageView).StereotypeLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PEdgeLabelViewAuto;
end;

// PUMLCustomSeqMessageViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSeqMessageViewAuto

// PUMLSeqMessageViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSeqStimulusViewAuto

// PUMLSeqStimulusViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomColMessageViewAuto

function PUMLCustomColMessageViewAuto.Get_NameLabel: INodeLabelView;
var
  E: PNodeLabelView;
begin
  E := (TheObject as PUMLCustomColMessageView).NameLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PNodeLabelViewAuto;
end;

function PUMLCustomColMessageViewAuto.Get_StereotypeLabel: INodeLabelView;
var
  E: PNodeLabelView;
begin
  E := (TheObject as PUMLCustomColMessageView).StereotypeLabel;
  if E = nil then Result := nil
  else Result := E.GetAutomationObject as PNodeLabelViewAuto;
end;

// PUMLCustomColMessageViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLColMessageViewAuto

// PUMLColMessageViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLColStimulusViewAuto

// PUMLColStimulusViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDiagramViewAuto

// PUMLDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSequenceDiagramViewAuto

// PUMLSequenceDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLClassDiagramViewAuto

// PUMLClassDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLSequenceRoleDiagramViewAuto

// PUMLSequenceRoleDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLActivityDiagramViewAuto

// PUMLActivityDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationDiagramViewAuto

// PUMLCollaborationDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLStatechartDiagramViewAuto

// PUMLStatechartDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLDeploymentDiagramViewAuto

// PUMLDeploymentDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLComponentDiagramViewAuto

// PUMLComponentDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCollaborationRoleDiagramViewAuto

// PUMLCollaborationRoleDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLUseCaseDiagramViewAuto

// PUMLUseCaseDiagramViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLAssociationClassViewAuto

// PUMLAssociationClassViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLCustomTextViewAuto

function PUMLCustomTextViewAuto.Get_Text: WideString;
begin
  Result := (TheObject as PUMLCustomTextView).Text;
end;

procedure PUMLCustomTextViewAuto.Set_Text(const Value: WideString);
begin
  StarUMLApplication.ChangeViewAttribute(TheObject as PView, 'Text', Value);
end;

// PUMLCustomTextViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLNoteViewAuto

// PUMLNoteViewAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLTextViewAuto

// PUMLTextViewAuto
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// AutomationClass Register Function

procedure RegisterAutomationClasses;
begin
  ClassRegistry.RegisterAutomationClass(PUMLGeneralNodeView, PUMLGeneralNodeViewAuto, IID_IUMLGeneralNodeView);
  ClassRegistry.RegisterAutomationClass(PUMLCustomStateView, PUMLCustomStateViewAuto, IID_IUMLCustomStateView);
  ClassRegistry.RegisterAutomationClass(PUMLStateView, PUMLStateViewAuto, IID_IUMLStateView);
  ClassRegistry.RegisterAutomationClass(PUMLSubmachineStateView, PUMLSubmachineStateViewAuto, IID_IUMLSubmachineStateView);
  ClassRegistry.RegisterAutomationClass(PUMLCollaborationView, PUMLCollaborationViewAuto, IID_IUMLCollaborationView);
  ClassRegistry.RegisterAutomationClass(PUMLCustomComponentView, PUMLCustomComponentViewAuto, IID_IUMLCustomComponentView);
  ClassRegistry.RegisterAutomationClass(PUMLComponentInstanceView, PUMLComponentInstanceViewAuto, IID_IUMLComponentInstanceView);
  ClassRegistry.RegisterAutomationClass(PUMLComponentView, PUMLComponentViewAuto, IID_IUMLComponentView);
  ClassRegistry.RegisterAutomationClass(PUMLEnumerationView, PUMLEnumerationViewAuto, IID_IUMLEnumerationView);
  ClassRegistry.RegisterAutomationClass(PUMLCustomNodeView, PUMLCustomNodeViewAuto, IID_IUMLCustomNodeView);
  ClassRegistry.RegisterAutomationClass(PUMLNodeInstanceView, PUMLNodeInstanceViewAuto, IID_IUMLNodeInstanceView);
  ClassRegistry.RegisterAutomationClass(PUMLNodeView, PUMLNodeViewAuto, IID_IUMLNodeView);
  ClassRegistry.RegisterAutomationClass(PUMLCollaborationInstanceSetView, PUMLCollaborationInstanceSetViewAuto, IID_IUMLCollaborationInstanceSetView);
  ClassRegistry.RegisterAutomationClass(PUMLCustomSeqObjectView, PUMLCustomSeqObjectViewAuto, IID_IUMLCustomSeqObjectView);
  ClassRegistry.RegisterAutomationClass(PUMLSeqObjectView, PUMLSeqObjectViewAuto, IID_IUMLSeqObjectView);
  ClassRegistry.RegisterAutomationClass(PUMLSeqClassifierRoleView, PUMLSeqClassifierRoleViewAuto, IID_IUMLSeqClassifierRoleView);
  ClassRegistry.RegisterAutomationClass(PUMLCustomColObjectView, PUMLCustomColObjectViewAuto, IID_IUMLCustomColObjectView);
  ClassRegistry.RegisterAutomationClass(PUMLColClassifierRoleView, PUMLColClassifierRoleViewAuto, IID_IUMLColClassifierRoleView);
  ClassRegistry.RegisterAutomationClass(PUMLColObjectView, PUMLColObjectViewAuto, IID_IUMLColObjectView);
  ClassRegistry.RegisterAutomationClass(PUMLPackageView, PUMLPackageViewAuto, IID_IUMLPackageView);
  ClassRegistry.RegisterAutomationClass(PUMLModelView, PUMLModelViewAuto, IID_IUMLModelView);
  ClassRegistry.RegisterAutomationClass(PUMLSubsystemView, PUMLSubsystemViewAuto, IID_IUMLSubsystemView);
  ClassRegistry.RegisterAutomationClass(PUMLClassifierView, PUMLClassifierViewAuto, IID_IUMLClassifierView);
  ClassRegistry.RegisterAutomationClass(PUMLInterfaceView, PUMLInterfaceViewAuto, IID_IUMLInterfaceView);
  ClassRegistry.RegisterAutomationClass(PUMLClassView, PUMLClassViewAuto, IID_IUMLClassView);
  ClassRegistry.RegisterAutomationClass(PUMLActorView, PUMLActorViewAuto, IID_IUMLActorView);
  ClassRegistry.RegisterAutomationClass(PUMLSignalView, PUMLSignalViewAuto, IID_IUMLSignalView);
  ClassRegistry.RegisterAutomationClass(PUMLExceptionView, PUMLExceptionViewAuto, IID_IUMLExceptionView);
  ClassRegistry.RegisterAutomationClass(PUMLUseCaseView, PUMLUseCaseViewAuto, IID_IUMLUseCaseView);
  ClassRegistry.RegisterAutomationClass(PUMLActionStateView, PUMLActionStateViewAuto, IID_IUMLActionStateView);
  ClassRegistry.RegisterAutomationClass(PUMLSubactivityStateView, PUMLSubactivityStateViewAuto, IID_IUMLSubactivityStateView);
  ClassRegistry.RegisterAutomationClass(PUMLPseudostateView, PUMLPseudostateViewAuto, IID_IUMLPseudostateView);
  ClassRegistry.RegisterAutomationClass(PUMLFinalStateView, PUMLFinalStateViewAuto, IID_IUMLFinalStateView);
  ClassRegistry.RegisterAutomationClass(PUMLSwimlaneView, PUMLSwimlaneViewAuto, IID_IUMLSwimlaneView);
  ClassRegistry.RegisterAutomationClass(PUMLNoteLinkView, PUMLNoteLinkViewAuto, IID_IUMLNoteLinkView);
  ClassRegistry.RegisterAutomationClass(PUMLGeneralEdgeView, PUMLGeneralEdgeViewAuto, IID_IUMLGeneralEdgeView);
  ClassRegistry.RegisterAutomationClass(PUMLLinkView, PUMLLinkViewAuto, IID_IUMLLinkView);
  ClassRegistry.RegisterAutomationClass(PUMLGeneralizationView, PUMLGeneralizationViewAuto, IID_IUMLGeneralizationView);
  ClassRegistry.RegisterAutomationClass(PUMLIncludeView, PUMLIncludeViewAuto, IID_IUMLIncludeView);
  ClassRegistry.RegisterAutomationClass(PUMLDependencyView, PUMLDependencyViewAuto, IID_IUMLDependencyView);
  ClassRegistry.RegisterAutomationClass(PUMLTransitionView, PUMLTransitionViewAuto, IID_IUMLTransitionView);
  ClassRegistry.RegisterAutomationClass(PUMLRealizationView, PUMLRealizationViewAuto, IID_IUMLRealizationView);
  ClassRegistry.RegisterAutomationClass(PUMLExtendView, PUMLExtendViewAuto, IID_IUMLExtendView);
  ClassRegistry.RegisterAutomationClass(PUMLAssociationView, PUMLAssociationViewAuto, IID_IUMLAssociationView);
  ClassRegistry.RegisterAutomationClass(PUMLAssociationRoleView, PUMLAssociationRoleViewAuto, IID_IUMLAssociationRoleView);
  ClassRegistry.RegisterAutomationClass(PUMLListCompartmentView, PUMLListCompartmentViewAuto, IID_IUMLListCompartmentView);
  ClassRegistry.RegisterAutomationClass(PUMLOperationCompartmentView, PUMLOperationCompartmentViewAuto, IID_IUMLOperationCompartmentView);
  ClassRegistry.RegisterAutomationClass(PUMLAttributeCompartmentView, PUMLAttributeCompartmentViewAuto, IID_IUMLAttributeCompartmentView);
  ClassRegistry.RegisterAutomationClass(PUMLQualifierCompartmentView, PUMLQualifierCompartmentViewAuto, IID_IUMLQualifierCompartmentView);
  ClassRegistry.RegisterAutomationClass(PUMLInternalTransitionCompartmentView, PUMLInternalTransitionCompartmentViewAuto, IID_IUMLInternalTransitionCompartmentView);
  ClassRegistry.RegisterAutomationClass(PUMLTemplateParameterCompartmentView, PUMLTemplateParameterCompartmentViewAuto, IID_IUMLTemplateParameterCompartmentView);
  ClassRegistry.RegisterAutomationClass(PUMLEnumerationLiteralCompartmentView, PUMLEnumerationLiteralCompartmentViewAuto, IID_IUMLEnumerationLiteralCompartmentView);
  ClassRegistry.RegisterAutomationClass(PUMLNameCompartmentView, PUMLNameCompartmentViewAuto, IID_IUMLNameCompartmentView);
  ClassRegistry.RegisterAutomationClass(PUMLLifeLineView, PUMLLifeLineViewAuto, IID_IUMLLifeLineView);
  ClassRegistry.RegisterAutomationClass(PUMLActivationView, PUMLActivationViewAuto, IID_IUMLActivationView);
  ClassRegistry.RegisterAutomationClass(PUMLCustomSeqMessageView, PUMLCustomSeqMessageViewAuto, IID_IUMLCustomSeqMessageView);
  ClassRegistry.RegisterAutomationClass(PUMLSeqMessageView, PUMLSeqMessageViewAuto, IID_IUMLSeqMessageView);
  ClassRegistry.RegisterAutomationClass(PUMLSeqStimulusView, PUMLSeqStimulusViewAuto, IID_IUMLSeqStimulusView);
  ClassRegistry.RegisterAutomationClass(PUMLCustomColMessageView, PUMLCustomColMessageViewAuto, IID_IUMLCustomColMessageView);
  ClassRegistry.RegisterAutomationClass(PUMLColMessageView, PUMLColMessageViewAuto, IID_IUMLColMessageView);
  ClassRegistry.RegisterAutomationClass(PUMLColStimulusView, PUMLColStimulusViewAuto, IID_IUMLColStimulusView);
  ClassRegistry.RegisterAutomationClass(PUMLDiagramView, PUMLDiagramViewAuto, IID_IUMLDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLSequenceDiagramView, PUMLSequenceDiagramViewAuto, IID_IUMLSequenceDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLClassDiagramView, PUMLClassDiagramViewAuto, IID_IUMLClassDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLSequenceRoleDiagramView, PUMLSequenceRoleDiagramViewAuto, IID_IUMLSequenceRoleDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLActivityDiagramView, PUMLActivityDiagramViewAuto, IID_IUMLActivityDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLCollaborationDiagramView, PUMLCollaborationDiagramViewAuto, IID_IUMLCollaborationDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLStatechartDiagramView, PUMLStatechartDiagramViewAuto, IID_IUMLStatechartDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLDeploymentDiagramView, PUMLDeploymentDiagramViewAuto, IID_IUMLDeploymentDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLComponentDiagramView, PUMLComponentDiagramViewAuto, IID_IUMLComponentDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLCollaborationRoleDiagramView, PUMLCollaborationRoleDiagramViewAuto, IID_IUMLCollaborationRoleDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLUseCaseDiagramView, PUMLUseCaseDiagramViewAuto, IID_IUMLUseCaseDiagramView);
  ClassRegistry.RegisterAutomationClass(PUMLAssociationClassView, PUMLAssociationClassViewAuto, IID_IUMLAssociationClassView);
  ClassRegistry.RegisterAutomationClass(PUMLCustomTextView, PUMLCustomTextViewAuto, IID_IUMLCustomTextView);
  ClassRegistry.RegisterAutomationClass(PUMLNoteView, PUMLNoteViewAuto, IID_IUMLNoteView);
  ClassRegistry.RegisterAutomationClass(PUMLTextView, PUMLTextViewAuto, IID_IUMLTextView);
end;

// AutomationClass Register Function
////////////////////////////////////////////////////////////////////////////////

initialization
  RegisterAutomationClasses;
end.

