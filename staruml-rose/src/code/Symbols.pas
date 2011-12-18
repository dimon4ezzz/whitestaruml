unit Symbols;

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

const
  APPROACH_RATIONAL = 'Rational';
  FIRST_LOOP: Boolean = False;
  SECOND_LOOP: Boolean = True;
  UNNAMED = '$UNNAMED$';

  OBJ_STARUML_APP = 'StarUMLApplication';
  USE_CASE_VIEW_STR = 'Use Case View';
  LOGICAL_VIEW_STR = 'Logical View';
  COMPONENT_VIEW_STR = 'Component View';
  DEPLOYMENT_VIEW_STR = 'Deployment View';

  STEREOTYPE_ACTOR = 'Actor';
  STEREOTYPE_INTERFACE = 'Interface';
  CONSTR_CHARACTERISTICS = 'Characteristics';

  PETAL_ELEM_STATE_DIAGRAM = 'State_Diagram';
  PETAL_ELEM_ACTIVITY_DIAGRAM = 'ActivityDiagram';
  ELEM_NODE_VIEW = 'NodeView';
  ELEM_EDGE_VIEW = 'EdgeView';
  ELEM_EXTENSIBLE_MODEL = 'ExtensibleModel';
  ELEM_UML_GENERAL_EDGE_VIEW = 'UMLGeneralEdgeView';
  UML_ELEM_MODEL_ELEM = 'UMLModelElement';
  UML_ELEM_NAMESPACE = 'UMLNamespace';
  UML_ELEM_CLASSIFIER = 'UMLClassifier';
  UML_ELEM_GENERALIABLE = 'UMLGeneralizableElement';
  UML_ELEM_BEHAVIORAL = 'UMLBehavioralFeature';
  UML_ELEM_STA_VERTEX = 'UMLStateVertex';
  UML_ELEM_STATE = 'UMLState';
  UML_ELEM_INSTANCE = 'UMLInstance';
  UML_ELEM_MODEL = 'UMLModel';
  UML_ELEM_PROJECT = 'UMLProject';
  UML_ELEM_PACKAGE = 'UMLPackage';
  UML_ELEM_CLASS = 'UMLClass';
  UML_ELEM_INTERFACE = 'UMLInterface';
  UML_ELEM_ACTOR = 'UMLActor';
  UML_ELEM_NODE = 'UMLNode';
  UML_ELEM_USE_CASE = 'UMLUseCase';
  UML_ELEM_STATE_MACHINE = 'UMLStateMachine';
  UML_ELEM_ACTIVITY_GRAPH = 'UMLActivityGraph';
  UML_ELEM_COMPOSITE_STATE = 'UMLCompositeState';
  UML_ELEM_PSEUDO_STATE = 'UMLPseudostate';
  UML_ELEM_SUBMACHINE_STATE = 'UMLSubmachineState';
  UML_ELEM_FINAL_STATE = 'UMLFinalState';
  UML_ELEM_COLLABORATION = 'UMLCollaboration';
  UML_ELEM_COLLABORATION_SET = 'UMLCollaborationInstanceSet';
  UML_ELEM_INTERACTION = 'UMLInteraction';
  UML_ELEM_INTERACTION_SET = 'UMLInteractionInstanceSet';
  UML_ELEM_OBJECT = 'UMLObject';
  UML_ELEM_CLASSIFIER_ROLE = 'UMLClassifierRole';
  UML_ELEM_ATTRIBUTE = 'UMLAttribute';
  UML_ELEM_OPERATION = 'UMLOperation';
  UML_ELEM_PARAMETER = 'UMLParameter';
  UML_ELEM_TEMPLATE = 'UMLTemplateParameter';
  UML_ELEM_CALL_ACTION = 'UMLCallAction';
  UML_ELEM_LINK = 'UMLLink';
  UML_ELEM_ASSOC_ROLE = 'UMLAssociationRole';
  UML_ELEM_ASSOC = 'UMLAssociation';
  UML_ELEM_TRANSITION = 'UMLTransition';
  UML_ELEM_ASSOC_END = 'UMLAssociationEnd';
  UML_ELEM_MESSAGE = 'UMLMessage';
  UML_ELEM_STIMULUS = 'UMLStimulus';
  UML_ELEM_DIAGRAM = 'UMLDiagram';
  UML_ELEM_CLASS_DIAGRAM = 'UMLClassDiagram';
  UML_ELEM_COL_DIAGRAM = 'UMLCollaborationDiagram';
  UML_ELEM_COL_ROLE_DIAGRAM = 'UMLCollaborationRoleDiagram';
  UML_ELEM_SEQ_DIAGRAM = 'UMLSequenceDiagram';
  UML_ELEM_SEQ_ROLE_DIAGRAM = 'UMLSequenceRoleDiagram';
  UML_ELEM_STATE_DIAGRAM = 'UMLStatechartDiagram';
  UML_ELEM_ACTIVITY_DIAGRAM = 'UMLActivityDiagram';
  UML_ELEM_GEN_NODE_VIEW = 'UMLGeneralNodeView';
  UML_ELEM_CLASSIFIER_VIEW = 'UMLClassifierView';
  UML_ELEM_TEXT_VIEW = 'UMLTextView';
  UML_ELEM_NOTE_VIEW = 'UMLNoteView';
  UML_ELEM_COL_MESS_VIEW = 'UMLCustomColMessageView';
  UML_ELEM_SEQ_MESS_VIEW = 'UMLCustomSeqMessageView';
  UML_ELEM_PSEUDO_STATE_VIEW = 'UMLPseudostateView';
  UML_ELEM_DIAGRAM_VIEW = 'UMLDiagramView';
  UML_ELEM_COL_DIAGRAM_VIEW = 'UMLCollaborationDiagramView';
  UML_ELEM_COL_ROLE_DIAGRAM_VIEW = 'UMLCollaborationRoleDiagramView';
  UML_ELEM_SEQ_DIAGRAM_VIEW = 'UMLSequenceDiagramView';
  UML_ELEM_SEQ_ROLE_DIAGRAM_VIEW = 'UMLSequenceRoleDiagramView';
  UML_ELEM_STATE_DIAGRAM_VIEW = 'UMLStatechartDiagramView';
  UML_ELEM_ACTIVITY_DIAGRAM_VIEW = 'UMLActivityDiagramView';

implementation

end.
