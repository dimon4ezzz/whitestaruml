unit StarUMLAppAuto;

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
  BasicClasses, Core, CoreAuto, WhiteStarUML_TLB,
  Classes, Forms, ComObj;

const
  NumOfEventKind = 21;

type
  // PStarUMLApplicationAuto
  PStarUMLApplicationAuto = class(TAutoObject, IStarUMLApplication)
  protected
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_Handle: Integer; safecall;
    function Get_UMLFactory: IUMLFactory; safecall;
    function Get_ProjectManager: IProjectManager; safecall;
    function Get_SelectionManager: ISelectionManager; safecall;
    function Get_MetaModel: IMetaModel; safecall;
    function Get_ExtensionManager: IExtensionManager; safecall;
    function Get_ElementSelector: IElementSelector; safecall;
    function Get_ElementListSelector: IElementListSelector; safecall;
    function Get_EventPublisher: IEventPublisher; safecall;
    function GetProject: IUMLProject; safecall;
    function FindByPathname(const Pathname: WideString): IElement; safecall;
    procedure ClearHistory; safecall;
    procedure Undo; safecall;
    procedure Redo; safecall;
    function CanUndo: WordBool; safecall;
    function CanRedo: WordBool; safecall;
    procedure Copy; safecall;
    procedure Cut; safecall;
    procedure Paste; safecall;
    procedure DeleteModel(const AModel: IModel); safecall;
    procedure DeleteView(const AView: IView); safecall;
    procedure DeleteSelectedModels; safecall;
    procedure DeleteSelectedViews; safecall;
    procedure DeleteSelectedModelsAndViews; safecall;
    procedure RelocateModel(const AModel: IModel; const RelocateTo: IModel); safecall;
    function GetOptionValue(const SchemaID: WideString; const Key: WideString): OleVariant; safecall;
    procedure Log(const Text: WideString); safecall;
    procedure BeginUpdate; safecall;
    procedure EndUpdate; safecall;
    procedure EndUpdate2(CompletelyRebuild: WordBool; UseUpdateLock: WordBool); safecall;
    procedure BeginGroupAction; safecall;
    procedure EndGroupAction; safecall;
    procedure EnableGeneralEditMenu; safecall;
    procedure DisableGeneralEditMenu; safecall;
    procedure OpenDiagram(const ADiagram: IDiagram); safecall;
    procedure CloseDiagram(const ADiagram: IDiagram); safecall;
    procedure CloseActiveDiagram; safecall;
    procedure CloseAllDiagrams; safecall;
    function GetOpenedDiagramAt(Index: Integer): IDiagram; safecall;
    function GetOpenedDiagramCount: Integer; safecall;
    procedure SelectInModelExplorer(const AModel: IModel); safecall;
    procedure ClearAllMessages; safecall;
    procedure ClearMessages(Kind: InformationMessageKind); safecall;
    procedure AddMessageItem(Kind: InformationMessageKind; const Text: WideString;
                             const ElementLink: IElement); safecall;
    procedure NavigateWeb(const URL: WideString); safecall;
    procedure Exit; safecall;
  end;

  // PUMLFactoryAuto
  PUMLFactoryAuto = class(PAutoObject, IUMLFactory)
  private
    function InstantiateModel(Owner: IModel; ModelKind: string; Argument: Integer = 0; End1: IModel = nil; End2: IModel = nil; AuxArg: IModel = nil): IModel;
    function InstantiateDiagram(Owner: IModel; DiagramKind: string): IDiagram;
    function InstantiateView(DiagramView: IDiagramView; Model: IModel; ViewKind: string = ''; End1: IView = nil; End2: IView = nil): IView;
  protected
    function CreateModel(const AOwner: IUMLNamespace): IUMLModel; safecall;
    function CreateSubsystem(const AOwner: IUMLNamespace): IUMLSubsystem; safecall;
    function CreatePackage(const AOwner: IUMLNamespace): IUMLPackage; safecall;
    function CreateClass(const AOwner: IUMLNamespace): IUMLClass; safecall;
    function CreateInterface(const AOwner: IUMLNamespace): IUMLInterface; safecall;
    function CreateEnumeration(const AOwner: IUMLNamespace): IUMLEnumeration; safecall;
    function CreateSignal(const AOwner: IUMLNamespace): IUMLSignal; safecall;
    function CreateException(const AOwner: IUMLNamespace): IUMLException; safecall;
    function CreateComponent(const AOwner: IUMLNamespace): IUMLComponent; safecall;
    function CreateComponentInstance(const AOwner: IUMLNamespace): IUMLComponentInstance; safecall;
    function CreateNode(const AOwner: IUMLNamespace): IUMLNode; safecall;
    function CreateNodeInstance(const AOwner: IUMLNamespace): IUMLNodeInstance; safecall;
    function CreateUseCase(const AOwner: IUMLNamespace): IUMLUseCase; safecall;
    function CreateActor(const AOwner: IUMLNamespace): IUMLActor; safecall;
    function CreateActivityGraph(const AContext: IUMLModelElement): IUMLActivityGraph; safecall;
    function CreateStateMachine(const AContext: IUMLModelElement): IUMLStateMachine; safecall;
    function CreateCompositeState(const AOwnerState: IUMLCompositeState): IUMLCompositeState; safecall;
    function CreateCollaboration(const AOwner: IUMLClassifier): IUMLCollaboration; safecall;
    function CreateCollaboration2(const AOwner: IUMLOperation): IUMLCollaboration; safecall;
    function CreateCollaborationInstanceSet(const AOwner: IUMLClassifier): IUMLCollaborationInstanceSet; safecall;
    function CreateCollaborationInstanceSet2(const AOwner: IUMLOperation): IUMLCollaborationInstanceSet; safecall;
    function CreateInteraction(const ACollaboration: IUMLCollaboration): IUMLInteraction; safecall;
    function CreateInteractionInstanceSet(const ACollaborationInstanceSet: IUMLCollaborationInstanceSet): IUMLInteractionInstanceSet; safecall;
    function CreateActionState(const AOwnerState: IUMLCompositeState): IUMLActionState; safecall;
    function CreateSubactivityState(const AOwnerState: IUMLCompositeState): IUMLSubactivityState; safecall;
    function CreatePseudostate(const AOwnerState: IUMLCompositeState): IUMLPseudostate; safecall;
    function CreateFinalState(const AOwnerState: IUMLCompositeState): IUMLFinalState; safecall;
    function CreatePartition(const AActivityGraph: IUMLActivityGraph): IUMLPartition; safecall;
    function CreateSubmachineState(const AOwnerState: IUMLCompositeState): IUMLSubmachineState; safecall;
    function CreateAttribute(const AClassifier: IUMLClassifier): IUMLAttribute; safecall;
    function CreateQualifier(const AAssociationEnd: IUMLAssociationEnd): IUMLAttribute; safecall;
    function CreateOperation(const AClassifier: IUMLClassifier): IUMLOperation; safecall;
    function CreateParameter(const ABehavioralFeature: IUMLBehavioralFeature): IUMLParameter; safecall;
    function CreateTemplateParameter(const AClass: IUMLClass): IUMLTemplateParameter; safecall;
    function CreateTemplateParameter2(const ACollaboration: IUMLCollaboration): IUMLTemplateParameter; safecall;
    function CreateEnumerationLiteral(const AEnumeration: IUMLEnumeration): IUMLEnumerationLiteral; safecall;
    function CreateEntryAction(const AState: IUMLState): IUMLUninterpretedAction; safecall;
    function CreateDoAction(const AState: IUMLState): IUMLUninterpretedAction; safecall;
    function CreateExitAction(const AState: IUMLState): IUMLUninterpretedAction; safecall;
    function CreateEffect(const ATransition: IUMLTransition): IUMLUninterpretedAction; safecall;
    function CreateSignalEvent(const ATransition: IUMLTransition): IUMLSignalEvent; safecall;
    function CreateCallEvent(const ATransition: IUMLTransition): IUMLCallEvent; safecall;
    function CreateTimeEvent(const ATransition: IUMLTransition): IUMLTimeEvent; safecall;
    function CreateChangeEvent(const ATransition: IUMLTransition): IUMLChangeEvent; safecall;
    function CreateClassifierRole(const ACollaboration: IUMLCollaboration): IUMLClassifierRole; safecall;
    function CreateObject(const ACollaborationInstanceSet: IUMLCollaborationInstanceSet): IUMLObject; safecall;
    function CreateObject2(const AOwner: IUMLNamespace): IUMLObject; safecall;
    function CreateTransition(const AStateMachine: IUMLStateMachine; const Source: IUMLStateVertex; const Target: IUMLStateVertex): IUMLTransition; safecall;
    function CreateDependency(const AOwner: IUMLNamespace; const Client: IUMLModelElement; const Supplier: IUMLModelElement): IUMLDependency; safecall;
    function CreateAssociation(const AOwner: IUMLNamespace; const End1: IUMLClassifier; const End2: IUMLClassifier): IUMLAssociation; safecall;
    function CreateAssociationClass(const AOwner: IUMLNamespace; const AAssociation: IUMLAssociation; const AClass: IUMLClass): IUMLAssociationClass; safecall;
    function CreateGeneralization(const AOwner: IUMLNamespace; const Parent: IUMLGeneralizableElement; const Child: IUMLGeneralizableElement): IUMLGeneralization; safecall;
    function CreateLink(const ACollaborationInstanceSet: IUMLCollaborationInstanceSet; const End1: IUMLInstance; const End2: IUMLInstance): IUMLLink; safecall;
    function CreateLink2(const ANamespace: IUMLNamespace; const End1: IUMLInstance; const End2: IUMLInstance): IUMLLink; safecall;
    function CreateAssociationRole(const ACollaboration: IUMLCollaboration; const End1: IUMLClassifierRole; const End2: IUMLClassifierRole): IUMLAssociationRole; safecall;
    function CreateStimulus(const AInteractionInstanceSet: IUMLInteractionInstanceSet; const Sender: IUMLInstance; const Receiver: IUMLInstance; Kind: UMLFactoryMessageKind): IUMLStimulus; safecall;
    function CreateStimulus2(const AInteractionInstanceSet: IUMLInteractionInstanceSet; const Sender: IUMLInstance; const Receiver: IUMLInstance; const CommunicationLink: IUMLLink; Kind: UMLFactoryMessageKind): IUMLStimulus; safecall;
    function CreateMessage(const AInteraction: IUMLInteraction; const Sender: IUMLClassifierRole; const Receiver: IUMLClassifierRole; Kind: UMLFactoryMessageKind): IUMLMessage; safecall;
    function CreateMessage2(const AInteraction: IUMLInteraction; const Sender: IUMLClassifierRole; const Receiver: IUMLClassifierRole; const CommunicationConnection: IUMLAssociationRole; Kind: UMLFactoryMessageKind): IUMLMessage; safecall;
    function CreateInclude(const AOwner: IUMLNamespace; const Includer: IUMLUseCase; const Includee: IUMLUseCase): IUMLInclude; safecall;
    function CreateExtend(const AOwner: IUMLNamespace; const Extender: IUMLUseCase; const Extendee: IUMLUseCase): IUMLExtend; safecall;
    function CreateRealization(const AOwner: IUMLNamespace; const Client: IUMLModelElement; const Supplier: IUMLModelElement): IUMLRealization; safecall;
    function CreateClassDiagram(const AOwner: IModel): IUMLClassDiagram; safecall;
    function CreateUseCaseDiagram(const AOwner: IModel): IUMLUseCaseDiagram; safecall;
    function CreateSequenceDiagram(const AOwner: IUMLInteractionInstanceSet): IUMLSequenceDiagram; safecall;
    function CreateSequenceRoleDiagram(const AOwner: IUMLInteraction): IUMLSequenceRoleDiagram; safecall;
    function CreateCollaborationDiagram(const AOwner: IUMLInteractionInstanceSet): IUMLCollaborationDiagram; safecall;
    function CreateCollaborationRoleDiagram(const AOwner: IUMLInteraction): IUMLCollaborationRoleDiagram; safecall;
    function CreateStatechartDiagram(const AOwner: IUMLStateMachine): IUMLStatechartDiagram; safecall;
    function CreateActivityDiagram(const AOwner: IUMLActivityGraph): IUMLActivityDiagram; safecall;
    function CreateComponentDiagram(const AOwner: IModel): IUMLComponentDiagram; safecall;
    function CreateDeploymentDiagram(const AOwner: IModel): IUMLDeploymentDiagram; safecall;
    function CreateNoteView(const ADiagramView: IDiagramView): IUMLNoteView; safecall;
    function CreateNoteLinkView(const ADiagramView: IDiagramView; const ANote: IUMLNoteView; const LinkTo: IView): IUMLNoteLinkView; safecall;
    function CreateTextView(const ADiagramView: IDiagramView): IUMLTextView; safecall;
    function CreateModelView(const ADiagramView: IDiagramView; const AModel: IUMLModel): IUMLModelView; safecall;
    function CreateSubsystemView(const ADiagramView: IDiagramView; const AModel: IUMLSubsystem): IUMLSubsystemView; safecall;
    function CreatePackageView(const ADiagramView: IDiagramView; const AModel: IUMLPackage): IUMLPackageView; safecall;
    function CreateClassView(const ADiagramView: IDiagramView; const AModel: IUMLClass): IUMLClassView; safecall;
    function CreateInterfaceView(const ADiagramView: IDiagramView; const AModel: IUMLInterface): IUMLInterfaceView; safecall;
    function CreateEnumerationView(const ADiagramView: IDiagramView; const AModel: IUMLEnumeration): IUMLEnumerationView; safecall;
    function CreateSignalView(const ADiagramView: IDiagramView; const AModel: IUMLSignal): IUMLSignalView; safecall;
    function CreateExceptionView(const ADiagramView: IDiagramView; const AModel: IUMLException): IUMLExceptionView; safecall;
    function CreateComponentView(const ADiagramView: IDiagramView; const AModel: IUMLComponent): IUMLComponentView; safecall;
    function CreateComponentInstanceView(const ADiagramView: IDiagramView; const AModel: IUMLComponentInstance): IUMLComponentInstanceView; safecall;
    function CreateNodeView(const ADiagramView: IDiagramView; const AModel: IUMLNode): IUMLNodeView; safecall;
    function CreateNodeInstanceView(const ADiagramView: IDiagramView; const AModel: IUMLNodeInstance): IUMLNodeInstanceView; safecall;
    function CreateActorView(const ADiagramView: IDiagramView; const AModel: IUMLActor): IUMLActorView; safecall;
    function CreateUseCaseView(const ADiagramView: IDiagramView; const AModel: IUMLUseCase): IUMLUseCaseView; safecall;
    function CreateCollaborationView(const ADiagramView: IDiagramView; const AModel: IUMLCollaboration): IUMLCollaborationView; safecall;
    function CreateCollaborationInstanceSetView(const ADiagramView: IDiagramView; const AModel: IUMLCollaborationInstanceSet): IUMLCollaborationInstanceSetView; safecall;
    function CreateGeneralizationView(const ADiagramView: IDiagramView; const AModel: IUMLGeneralization; const Parent: IView; const Child: IView): IUMLGeneralizationView; safecall;
    function CreateAssociationView(const ADiagramView: IDiagramView; const AModel: IUMLAssociation; const End1: IView; const End2: IView): IUMLAssociationView; safecall;
    function CreateAssociationClassView(const ADiagramView: IDiagramView; const AModel: IUMLAssociationClass; const AssociationView: IView; const ClassView: IView): IUMLAssociationClassView; safecall;
    function CreateDependencyView(const ADiagramView: IDiagramView; const AModel: IUMLDependency; const Client: IView; const Supplier: IView): IUMLDependencyView; safecall;
    function CreateRealizationView(const ADiagramView: IDiagramView; const AModel: IUMLRealization; const Client: IView; const Supplier: IView): IUMLRealizationView; safecall;
    function CreateIncludeView(const ADiagramView: IDiagramView; const AModel: IUMLInclude; const Base: IView; const Addition: IView): IUMLIncludeView; safecall;
    function CreateExtendView(const ADiagramView: IDiagramView; const AModel: IUMLExtend; const Base: IView; const Extension: IView): IUMLExtendView; safecall;
    function CreateObjectView(const ADiagramView: IDiagramView; const AModel: IUMLObject): IUMLColObjectView; safecall;
    function CreateSeqObjectView(const ADiagramView: IUMLSequenceDiagramView; const AModel: IUMLObject): IUMLSeqObjectView; safecall;
    function CreateClassifierRoleView(const ADiagramView: IDiagramView; const AModel: IUMLClassifierRole): IUMLColClassifierRoleView; safecall;
    function CreateSeqClassifierRoleView(const ADiagramView: IUMLSequenceRoleDiagramView; const AModel: IUMLClassifierRole): IUMLSeqClassifierRoleView; safecall;
    function CreateLinkView(const ADiagramView: IDiagramView; const AModel: IUMLLink; const End1: IView; const End2: IView): IUMLLinkView; safecall;
    function CreateAssociationRoleView(const ADiagramView: IDiagramView; const AModel: IUMLAssociationRole; const End1: IView; const End2: IView): IUMLAssociationRoleView; safecall;
    function CreateStimulusView(const ADiagramView: IUMLCollaborationDiagramView; const AModel: IUMLStimulus; const LinkView: IView): IUMLColStimulusView; safecall;
    function CreateSeqStimulusView(const ADiagramView: IUMLSequenceDiagramView; const AModel: IUMLStimulus; const Sender: IView; const Receiver: IView): IUMLSeqStimulusView; safecall;
    function CreateMessageView(const ADiagramView: IUMLCollaborationRoleDiagramView; const AModel: IUMLMessage; const AssociationRoleView: IView): IUMLColMessageView; safecall;
    function CreateSeqMessageView(const ADiagramView: IUMLSequenceRoleDiagramView; const AModel: IUMLMessage; const Sender: IView; const Receiver: IView): IUMLSeqMessageView; safecall;
    function CreateStateView(const ADiagramView: IUMLStatechartDiagramView; const AModel: IUMLCompositeState): IUMLStateView; safecall;
    function CreateSubmachineStateView(const ADiagramView: IUMLStatechartDiagramView; const AModel: IUMLSubmachineState): IUMLSubmachineStateView; safecall;
    function CreatePseudostateView(const ADiagramView: IDiagramView; const AModel: IUMLPseudostate): IUMLPseudostateView; safecall;
    function CreateFinalStateView(const ADiagramView: IDiagramView; const AModel: IUMLFinalState): IUMLFinalStateView; safecall;
    function CreateActionStateView(const ADiagramView: IUMLActivityDiagramView; const AModel: IUMLActionState): IUMLActionStateView; safecall;
    function CreateSubactivityStateView(const ADiagramView: IUMLActivityDiagramView; const AModel: IUMLSubactivityState): IUMLSubactivityStateView; safecall;
    function CreateSwimlaneView(const ADiagramView: IUMLActivityDiagramView; const AModel: IUMLPartition): IUMLSwimlaneView; safecall;
    function CreateTransitionView(const ADiagramView: IDiagramView; const AModel: IUMLTransition; const Source: IView; const Target: IView): IUMLTransitionView; safecall;
  end;

  // PSelectionManagerAuto
  PSelectionManagerAuto = class(PAutoObject, ISelectionManager)
  protected
    function GetSelectedModelAt(Index: Integer): IModel; safecall;
    function GetSelectedModelCount: Integer; safecall;
    function GetSelectedViewAt(Index: Integer): IView; safecall;
    function GetSelectedViewCount: Integer; safecall;
    function Get_ActiveDiagram: IDiagram; safecall;
    function Get_ActiveDiagramView: IDiagramView; safecall;
    procedure SelectAll; safecall;
    procedure DeselectAll; safecall;
    procedure SelectModel(const AModel: IModel); safecall;
    procedure SelectView(const AView: IView); safecall;
    procedure SelectAdditionalModel(const AModel: IModel); safecall;
    procedure SelectAdditionalView(const AView: IView); safecall;
    procedure SelectArea(X1: Integer; Y1: Integer; X2: Integer; Y2: Integer); safecall;
    procedure SelectAdditionalArea(X1: Integer; Y1: Integer; X2: Integer; Y2: Integer); safecall;
    procedure DeselectModel(const AModel: IModel); safecall;
    procedure DeselectView(const AView: IView); safecall;
    procedure DeselectAllModels; safecall;
    procedure DeselectAllViews; safecall;
  end;

  // PProjectManagerAuto
  PProjectManagerAuto = class(PAutoObject, IProjectManager)
  protected
    function Get_FileName: WideString; safecall;
    function Get_Modified: WordBool; safecall;
    function Get_UnitsModified: WordBool; safecall;
    function Get_Project: IUMLProject; safecall;
    function GetUnitDocumentCount: Integer; safecall;
    function GetUnitDocumentAt(Index: Integer): IUMLUnitDocument; safecall;
    function Get_ProjectDocument: IUMLProjectDocument; safecall;
    procedure NewProject; safecall;
    procedure NewProjectByApproach(const ApproachName: WideString); safecall;
    procedure OpenProject(const FileName: WideString); safecall;
    procedure SaveProject; safecall;
    procedure SaveProjectAs(const FileName: WideString); safecall;
    procedure SaveAllUnits; safecall;
    procedure CloseProject; safecall;
    procedure ImportFramework(const OwnerPackage: IUMLPackage; const FrameworkName: WideString); safecall;
    procedure ImportModelFragment(const OwnerPackage: IUMLPackage; const FileName: WideString); safecall;
    procedure ExportModelFragment(const APackage: IUMLPackage; const FileName: WideString); safecall;
    function SeparateUnit(const APackage: IUMLPackage; const FileName: WideString): IUMLUnitDocument; safecall;
    procedure MergeUnit(const APackage: IUMLPackage); safecall;
    function OpenUnit(const ABasePackage: IUMLPackage; const FileName: WideString): IUMLUnitDocument; safecall;
    procedure DeleteUnit(const APackage: IUMLPackage); safecall;
    procedure UpdateDocuments; safecall;
    function GetAvailableFrameworkAt(Index: Integer): WideString; safecall;
    function GetAvailableFrameworkCount: Integer; safecall;
    function GetAvailableApproachAt(Index: Integer): WideString; safecall;
    function GetAvailableApproachCount: Integer; safecall;
  end;

  // PElementSelectorAuto
  PElementSelectorAuto = class(PAutoObject, IElementSelector)
  protected
    function Get_AllowNull: WordBool; safecall;
    procedure Set_AllowNull(Value: WordBool); safecall;
    procedure Filter(Filtering: ElementFilteringKind); safecall;
    procedure ClearSelectableModels; safecall;
    procedure AddSelectableModel(const ClassName: WideString); safecall;
    procedure RemoveSelectableModel(const ClassName: WideString); safecall;
    function Execute(const Title: WideString): WordBool; safecall;
    function GetSelectedModel: IModel; safecall;
  end;

  // PElementListSelectorAuto
  PElementListSelectorAuto = class(PAutoObject, IElementListSelector)
  protected
    function Get_AllowNull: WordBool; safecall;
    procedure Set_AllowNull(Value: WordBool); safecall;
    procedure ClearListElements; safecall;
    procedure AddListElement(const AModel: IModel); safecall;
    procedure AddListElementsByCollection(const AModel: IModel; const CollectionName: WideString; ShowInherited: WordBool); safecall;
    procedure AddListElementsByClass(const MetaClassName: WideString; IncludeChildInstances: WordBool); safecall;
    function Execute(const Title: WideString): WordBool; safecall;
    function GetSelectedModel: IModel; safecall;
  end;

  // PEventPublisherAuto
  PEventPublisherAuto = class(PAutoObject, IEventPublisher)
  protected
    procedure Subscribe(const ASubscriber: IEventSubscriber; AEvent: EventKind); safecall;
    procedure SubscribeAll(const ASubscriber: IEventSubscriber); safecall;
    procedure Unsubscribe(const ASubscriber: IEventSubscriber; AEvent: EventKind); safecall;
    procedure UnsubscribeAll(const ASubscriber: IEventSubscriber); safecall;
    function GetEventArgModelAt(Index: Integer): IModel; safecall;
    function GetEventArgModelCount: Integer; safecall;
    function GetEventArgViewAt(Index: Integer): IView; safecall;
    function GetEventArgViewCount: Integer; safecall;
    function GetEventArgDocument: IDocument; safecall;
    function GetEventArgUnit: IUMLUnitDocument; safecall;
  end;

implementation

uses
  ExtCore, UMLModels, UMLAux, StarUMLApp, LogMgr, UMLFacto, FrwMgr, ApprMgr,
  MainFrm, InspectorFrm, ElemSelFrm, ElemLstFrm, ModelExplorerFrame, MessageFrame,
  OptionDeps, ComServ, Main, EventPub;

var
  UMLFactoryAuto: PUMLFactoryAuto;
  ProjectManagerAuto: PProjectManagerAuto;
  SelectionManagerAuto: PSelectionManagerAuto;
  ElementSelectorAuto: PElementSelectorAuto;
  ElementListSelectorAuto: PElementListSelectorAuto;
  EventPublisherAuto: PEventPublisherAuto;

////////////////////////////////////////////////////////////////////////////////
// PStarUMLApplicationAuto

function PStarUMLApplicationAuto.Get_Visible: WordBool;
begin
  Result := MainForm.Visible;
end;

procedure PStarUMLApplicationAuto.Set_Visible(Value: WordBool);
begin
  MainForm.Visible := Value;
end;

function PStarUMLApplicationAuto.Get_Handle: Integer; safecall;
begin
  Result := Application.Handle;
end;

function PStarUMLApplicationAuto.Get_UMLFactory: IUMLFactory;
begin
  if UMLFactoryAuto = nil then
  begin
    UMLFactoryAuto := PUMLFactoryAuto.Create(ComServer.TypeLib, IID_IUMLFactory);
    UMLFactoryAuto._AddRef;
  end;
  Result := UMLFactoryAuto;
end;

function PStarUMLApplicationAuto.Get_ProjectManager: IProjectManager;
begin
  if ProjectManagerAuto = nil then
  begin
    ProjectManagerAuto := PProjectManagerAuto.Create(ComServer.TypeLib, IID_IProjectManager);
    ProjectManagerAuto._AddRef;
  end;
  Result := ProjectManagerAuto;
end;

function PStarUMLApplicationAuto.Get_SelectionManager: ISelectionManager;
begin
  if SelectionManagerAuto = nil then
  begin
    SelectionManagerAuto := PSelectionManagerAuto.Create(ComServer.TypeLib, IID_ISelectionManager);
    SelectionManagerAuto._AddRef;
  end;
  Result := SelectionManagerAuto;
end;

function PStarUMLApplicationAuto.Get_MetaModel: IMetaModel;
begin
  Result := MetaModel.GetAutomationObject as IMetaModel;
end;

function PStarUMLApplicationAuto.Get_ExtensionManager: IExtensionManager;
begin
  Result := ExtensionManager.GetAutomationObject as IExtensionManager;
end;

function PStarUMLApplicationAuto.Get_ElementSelector: IElementSelector;
begin
  if ElementSelectorAuto = nil then begin
    ElementSelectorAuto := PElementSelectorAuto.Create(ComServer.TypeLib, IID_IElementSelector);
    ElementSelectorAuto._AddRef;
  end;
  Result := ElementSelectorAuto;
end;

function PStarUMLApplicationAuto.Get_ElementListSelector: IElementListSelector;
begin
  if ElementListSelectorAuto = nil then begin
    ElementListSelectorAuto := PElementListSelectorAuto.Create(ComServer.TypeLib, IID_IElementListSelector);
    ElementListSelectorAuto._AddRef;
  end;
  Result := ElementListSelectorAuto;
end;

function PStarUMLApplicationAuto.Get_EventPublisher: IEventPublisher;
begin
  if EventPublisherAuto = nil then begin
    EventPublisherAuto := PEventPublisherAuto.Create(ComServer.TypeLib, IID_IEventPublisher);
    EventPublisherAuto._AddRef;
  end;
  Result := EventPublisherAuto;
end;

function PStarUMLApplicationAuto.GetProject: IUMLProject;
begin
  if StarUMLApplication.Project <> nil then
    Result := StarUMLApplication.Project.GetAutomationObject as IUMLProject
  else
    Result := nil;
end;

function PStarUMLApplicationAuto.FindByPathname(const Pathname: WideString): IElement;
var
  E: PElement;
begin
  E := StarUMLApplication.Project.FindByRelativePathname(ExtractTailPath(Pathname));
  if E <> nil then
    Result := E.GetAutomationObject as IElement
  else
    Result := nil;
end;

procedure PStarUMLApplicationAuto.ClearHistory;
begin
  StarUMLApplication.ClearHistory;
end;

procedure PStarUMLApplicationAuto.Undo;
begin
  StarUMLApplication.Undo;
end;

procedure PStarUMLApplicationAuto.Redo;
begin
  StarUMLApplication.Redo;
end;

function PStarUMLApplicationAuto.CanUndo: WordBool;
begin
  Result := StarUMLApplication.CanUndo;
end;

function PStarUMLApplicationAuto.CanRedo: WordBool;
begin
  Result := StarUMLApplication.CanRedo;
end;

procedure PStarUMLApplicationAuto.Copy;
begin
  StarUMLApplication.Copy;
end;

procedure PStarUMLApplicationAuto.Cut;
begin
  StarUMLApplication.Cut;
end;

procedure PStarUMLApplicationAuto.Paste;
begin
  StarUMLApplication.Paste;
end;

procedure PStarUMLApplicationAuto.DeleteModel(const AModel: IModel);
var
  E: PElement;
begin
  if AModel = nil then Exit;
  E := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.DeleteModel(E as PModel);
end;

procedure PStarUMLApplicationAuto.DeleteView(const AView: IView);
var
  E: PElement;
begin
  if AView = nil then Exit;
  E := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(AView.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.DeleteView(E as PView);
end;

procedure PStarUMLApplicationAuto.DeleteSelectedModels;
begin
  StarUMLApplication.DeleteSelectedModels;
end;

procedure PStarUMLApplicationAuto.DeleteSelectedViews;
begin
  StarUMLApplication.DeleteSelectedViews;
end;

procedure PStarUMLApplicationAuto.DeleteSelectedModelsAndViews;
begin
  StarUMLApplication.DeleteSelectedViewsWithModels;
end;

procedure PStarUMLApplicationAuto.RelocateModel(const AModel: IModel; const RelocateTo: IModel);
var
  E, ER: PElement;
begin
  if (AModel = nil) or (RelocateTo = nil) then Exit;
  E := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  ER := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(RelocateTo.GetGuid);
  // ASSERTIONS
  Assert(ER <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.RelocateModel(E as PModel, ER as PModel);
end;

function PStarUMLApplicationAuto.GetOptionValue(const SchemaID: WideString; const Key: WideString): OleVariant;
begin
  Result := OptionDepository.GetOptionValue(SchemaID, Key);
end;

procedure PStarUMLApplicationAuto.Log(const Text: WideString);
begin
  StarUMLApplication.Log(Text);
end;

procedure PStarUMLApplicationAuto.BeginUpdate;
begin
  StarUMLApplication.BeginUpdate;
end;

procedure PStarUMLApplicationAuto.EndUpdate;
begin
  StarUMLApplication.EndUpdate;
end;

procedure PStarUMLApplicationAuto.EndUpdate2(CompletelyRebuild: WordBool; UseUpdateLock: WordBool);
begin
  StarUMLApplication.EndUpdate(CompletelyRebuild, UseUpdateLock);
end;

procedure PStarUMLApplicationAuto.BeginGroupAction;
begin
  StarUMLApplication.BeginGrouping;
end;

procedure PStarUMLApplicationAuto.EndGroupAction;
begin
  StarUMLApplication.EndGrouping;
end;

procedure PStarUMLApplicationAuto.EnableGeneralEditMenu;
begin
  MenuStateHandler.GeneralEditMenuEnabled := True;
end;

procedure PStarUMLApplicationAuto.DisableGeneralEditMenu;
begin
  MenuStateHandler.GeneralEditMenuEnabled := False;
end;

procedure PStarUMLApplicationAuto.OpenDiagram(const ADiagram: IDiagram);
var
  D: PDiagram;
begin
  D := MetaModel.FindMetaClass('Diagram').FindInstanceByGuidRecurse(ADiagram.GetGuid) as PDiagram;
  if D <> nil then
    MainForm.WorkingAreaFrame.OpenDiagram(D);
end;

procedure PStarUMLApplicationAuto.CloseDiagram(const ADiagram: IDiagram);
var
  D: PDiagram;
begin
  D := MetaModel.FindMetaClass('Diagram').FindInstanceByGuidRecurse(ADiagram.GetGuid) as PDiagram;
  if D <> nil then
    MainForm.WorkingAreaFrame.CloseDiagram(D);
end;

procedure PStarUMLApplicationAuto.CloseActiveDiagram;
begin
  MainForm.WorkingAreaFrame.CloseActiveDiagram;
end;

procedure PStarUMLApplicationAuto.CloseAllDiagrams;
begin
  MainForm.WorkingAreaFrame.CloseAllDiagrams;
end;

function PStarUMLApplicationAuto.GetOpenedDiagramAt(Index: Integer): IDiagram;
begin
  Result := MainForm.WorkingAreaFrame.OpenedDiagrams[Index].GetAutomationObject as IDiagram;
end;

function PStarUMLApplicationAuto.GetOpenedDiagramCount: Integer;
begin
  Result := MainForm.WorkingAreaFrame.OpenedDiagramCount;
end;

procedure PStarUMLApplicationAuto.SelectInModelExplorer(const AModel: IModel);
var
  M: PModel;
begin
  M := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid) as PModel;
  if (M <> nil) and MainForm.Visible and MainForm.ModelExplorerDockPanel.Visible then
    //--MainForm.BrowserFrame.SelectInModelExplorer(M);
    MainForm.ModelExplorer.SelectWithFocus(M);
end;

procedure PStarUMLApplicationAuto.ClearAllMessages;
begin
  MainForm.MessagePanel.ClearAllMessages;
end;

procedure PStarUMLApplicationAuto.ClearMessages(Kind: InformationMessageKind);
begin
  MainForm.MessagePanel.ClearMessages(PInfoMessageKind(Kind));
end;

procedure PStarUMLApplicationAuto.AddMessageItem(Kind: InformationMessageKind; const Text: WideString; const ElementLink: IElement);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('Element').FindInstanceByGuidRecurse(ElementLink.GetGuid) as PElement;
  MainForm.MessagePanel.AddMessage(PInfoMessageKind(Kind), Text, E);
end;

procedure PStarUMLApplicationAuto.NavigateWeb(const URL: WideString);
begin
  StarUMLApplication.OpenURL(URL);
end;

procedure PStarUMLApplicationAuto.Exit;
begin
  MainForm.Close;
end;

// PStarUMLApplicationAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PUMLFactoryAuto

function PUMLFactoryAuto.InstantiateModel(Owner: IModel; ModelKind: string; Argument: Integer = 0; End1: IModel = nil; End2: IModel = nil; AuxArg: IModel = nil): IModel;
var
  E, E1, E2, E3: PElement;
  M: PModel;
begin
  E := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(Owner.GetGuid);
  E1 := nil;
  E2 := nil;
  E3 := nil;
  if E <> nil then begin
    if End1 <> nil then E1 := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(End1.GetGuid);
    if End2 <> nil then E2 := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(End2.GetGuid);
    if AuxArg <> nil then E3 := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AuxArg.GetGuid);
    M := StarUMLApplication.NewModel(E as PModel, ModelKind, Argument, E1 as PModel, E2 as PModel, -1, E3 as PModel);
    Result := M.GetAutomationObject as IModel;
  end
  else begin
    Result := nil;
  end;
end;

function PUMLFactoryAuto.InstantiateDiagram(Owner: IModel; DiagramKind: string): IDiagram;
var
  E: PElement;
  D: PDiagram;
begin
  E := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(Owner.GetGuid);
  if E <> nil then begin
    D := StarUMLApplication.NewDiagram(E as PModel, DiagramKind, False);
    Result := D.GetAutomationObject as IDiagram;
  end
  else begin
    Result := nil;
  end;
end;

function PUMLFactoryAuto.InstantiateView(DiagramView: IDiagramView; Model: IModel; ViewKind: string = ''; End1: IView = nil; End2: IView = nil): IView;
var
  E, M, E1, E2: PElement;
  V: PView;
begin
  E := MetaModel.FindMetaClass('DiagramView').FindInstanceByGuidRecurse(DiagramView.GetGuid);
  M := nil;
  E1 := nil;
  E2 := nil;
  if E <> nil then begin
    if Model <> nil then M := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(Model.GetGuid);
    if End1 <> nil then E1 := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(End1.GetGuid);
    if End2 <> nil then E2 := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(End2.GetGuid);
    V := StarUMLApplication.NewView(E as PDiagramView, M as PModel, ViewKind, E1 as PView, E2 as PView);
    Result := V.GetAutomationObject as IView;
  end
  else begin
    Result := nil;
  end;
end;

function PUMLFactoryAuto.CreateModel(const AOwner: IUMLNamespace): IUMLModel;
begin
  Result := InstantiateModel(AOwner, 'Model') as IUMLModel;
end;

function PUMLFactoryAuto.CreateSubsystem(const AOwner: IUMLNamespace): IUMLSubsystem;
begin
  Result := InstantiateModel(AOwner, 'Subsystem') as IUMLSubsystem;
end;

function PUMLFactoryAuto.CreatePackage(const AOwner: IUMLNamespace): IUMLPackage;
begin
  Result := InstantiateModel(AOwner, 'Package') as IUMLPackage;
end;

function PUMLFactoryAuto.CreateClass(const AOwner: IUMLNamespace): IUMLClass;
begin
  Result := InstantiateModel(AOwner, 'Class') as IUMLClass;
end;

function PUMLFactoryAuto.CreateInterface(const AOwner: IUMLNamespace): IUMLInterface;
begin
  Result := InstantiateModel(AOwner, 'Interface') as IUMLInterface;
end;

function PUMLFactoryAuto.CreateEnumeration(const AOwner: IUMLNamespace): IUMLEnumeration;
begin
  Result := InstantiateModel(AOwner, 'Enumeration') as IUMLEnumeration;
end;

function PUMLFactoryAuto.CreateSignal(const AOwner: IUMLNamespace): IUMLSignal;
begin
  Result := InstantiateModel(AOwner, 'Signal') as IUMLSignal;
end;

function PUMLFactoryAuto.CreateException(const AOwner: IUMLNamespace): IUMLException;
begin
  Result := InstantiateModel(AOwner, 'Exception') as IUMLException;
end;

function PUMLFactoryAuto.CreateComponent(const AOwner: IUMLNamespace): IUMLComponent;
begin
  Result := InstantiateModel(AOwner, 'Component') as IUMLComponent;
end;

function PUMLFactoryAuto.CreateComponentInstance(const AOwner: IUMLNamespace): IUMLComponentInstance;
begin
  Result := InstantiateModel(AOwner, 'ComponentInstance') as IUMLComponentInstance;
end;

function PUMLFactoryAuto.CreateNode(const AOwner: IUMLNamespace): IUMLNode;
begin
  Result := InstantiateModel(AOwner, 'Node') as IUMLNode;
end;

function PUMLFactoryAuto.CreateNodeInstance(const AOwner: IUMLNamespace): IUMLNodeInstance;
begin
  Result := InstantiateModel(AOwner, 'NodeInstance') as IUMLNodeInstance;
end;

function PUMLFactoryAuto.CreateUseCase(const AOwner: IUMLNamespace): IUMLUseCase;
begin
  Result := InstantiateModel(AOwner, 'UseCase') as IUMLUseCase;
end;

function PUMLFactoryAuto.CreateActor(const AOwner: IUMLNamespace): IUMLActor;
begin
  Result := InstantiateModel(AOwner, 'Actor') as IUMLActor;
end;

function PUMLFactoryAuto.CreateActivityGraph(const AContext: IUMLModelElement): IUMLActivityGraph;
begin
  Result := InstantiateModel(AContext, 'ActivityGraph') as IUMLActivityGraph;
end;

function PUMLFactoryAuto.CreateStateMachine(const AContext: IUMLModelElement): IUMLStateMachine;
begin
  Result := InstantiateModel(AContext, 'StateMachine') as IUMLStateMachine;
end;

function PUMLFactoryAuto.CreateCompositeState(const AOwnerState: IUMLCompositeState): IUMLCompositeState;
begin
  Result := InstantiateModel(AOwnerState, 'CompositeState') as IUMLCompositeState;
end;

function PUMLFactoryAuto.CreateCollaboration(const AOwner: IUMLClassifier): IUMLCollaboration;
begin
  Result := InstantiateModel(AOwner, 'Collaboration') as IUMLCollaboration;
end;

function PUMLFactoryAuto.CreateCollaboration2(const AOwner: IUMLOperation): IUMLCollaboration;
begin
  Result := InstantiateModel(AOwner, 'Collaboration') as IUMLCollaboration;
end;

function PUMLFactoryAuto.CreateCollaborationInstanceSet(const AOwner: IUMLClassifier): IUMLCollaborationInstanceSet;
begin
  Result := InstantiateModel(AOwner, 'CollaborationInstanceSet') as IUMLCollaborationInstanceSet;
end;

function PUMLFactoryAuto.CreateCollaborationInstanceSet2(const AOwner: IUMLOperation): IUMLCollaborationInstanceSet;
begin
  Result := InstantiateModel(AOwner, 'CollaborationInstanceSet') as IUMLCollaborationInstanceSet;
end;

function PUMLFactoryAuto.CreateInteraction(const ACollaboration: IUMLCollaboration): IUMLInteraction;
begin
  Result := InstantiateModel(ACollaboration, 'Interaction') as IUMLInteraction;
end;

function PUMLFactoryAuto.CreateInteractionInstanceSet(const ACollaborationInstanceSet: IUMLCollaborationInstanceSet): IUMLInteractionInstanceSet;
begin
  Result := InstantiateModel(ACollaborationInstanceSet, 'InteractionInstanceSet') as IUMLInteractionInstanceSet;
end;

function PUMLFactoryAuto.CreateActionState(const AOwnerState: IUMLCompositeState): IUMLActionState;
begin
  Result := InstantiateModel(AOwnerState, 'ActionState') as IUMLActionState;
end;

function PUMLFactoryAuto.CreateSubactivityState(const AOwnerState: IUMLCompositeState): IUMLSubactivityState;
begin
  Result := InstantiateModel(AOwnerState, 'SubactivityState') as IUMLSubactivityState;
end;

function PUMLFactoryAuto.CreatePseudostate(const AOwnerState: IUMLCompositeState): IUMLPseudostate;
begin
  Result := InstantiateModel(AOwnerState, 'Pseudostate') as IUMLPseudostate;
end;

function PUMLFactoryAuto.CreateFinalState(const AOwnerState: IUMLCompositeState): IUMLFinalState;
begin
  Result := InstantiateModel(AOwnerState, 'FinalState') as IUMLFinalState;
end;

function PUMLFactoryAuto.CreatePartition(const AActivityGraph: IUMLActivityGraph): IUMLPartition;
begin
  Result := InstantiateModel(AActivityGraph, 'Partition') as IUMLPartition;
end;

function PUMLFactoryAuto.CreateSubmachineState(const AOwnerState: IUMLCompositeState): IUMLSubmachineState;
begin
  Result := InstantiateModel(AOwnerState, 'SubmachineState') as IUMLSubmachineState;
end;

function PUMLFactoryAuto.CreateAttribute(const AClassifier: IUMLClassifier): IUMLAttribute;
begin
  Result := InstantiateModel(AClassifier, 'Attribute') as IUMLAttribute;
end;

function PUMLFactoryAuto.CreateQualifier(const AAssociationEnd: IUMLAssociationEnd): IUMLAttribute;
begin
  Result := InstantiateModel(AAssociationEnd, 'Attribute') as IUMLAttribute;
end;

function PUMLFactoryAuto.CreateOperation(const AClassifier: IUMLClassifier): IUMLOperation;
begin
  Result := InstantiateModel(AClassifier, 'Operation') as IUMLOperation;
end;

function PUMLFactoryAuto.CreateParameter(const ABehavioralFeature: IUMLBehavioralFeature): IUMLParameter;
begin
  Result := InstantiateModel(ABehavioralFeature, 'Parameter') as IUMLParameter;
end;

function PUMLFactoryAuto.CreateTemplateParameter(const AClass: IUMLClass): IUMLTemplateParameter;
begin
  Result := InstantiateModel(AClass, 'TemplateParameter') as IUMLTemplateParameter;
end;

function PUMLFactoryAuto.CreateTemplateParameter2(const ACollaboration: IUMLCollaboration): IUMLTemplateParameter;
begin
  Result := InstantiateModel(ACollaboration, 'TemplateParameter') as IUMLTemplateParameter;
end;

function PUMLFactoryAuto.CreateEnumerationLiteral(const AEnumeration: IUMLEnumeration): IUMLEnumerationLiteral;
begin
  Result := InstantiateModel(AEnumeration, 'EnumerationLiteral') as IUMLEnumerationLiteral;
end;

function PUMLFactoryAuto.CreateEntryAction(const AState: IUMLState): IUMLUninterpretedAction;
begin
  Result := InstantiateModel(AState, 'UninterpretedAction', FA_UNINTERPRETEDACTION_ENTRY) as IUMLUninterpretedAction;
end;

function PUMLFactoryAuto.CreateDoAction(const AState: IUMLState): IUMLUninterpretedAction;
begin
  Result := InstantiateModel(AState, 'UninterpretedAction', FA_UNINTERPRETEDACTION_DO) as IUMLUninterpretedAction;
end;

function PUMLFactoryAuto.CreateExitAction(const AState: IUMLState): IUMLUninterpretedAction;
begin
  Result := InstantiateModel(AState, 'UninterpretedAction', FA_UNINTERPRETEDACTION_EXIT) as IUMLUninterpretedAction;
end;

function PUMLFactoryAuto.CreateEffect(const ATransition: IUMLTransition): IUMLUninterpretedAction;
begin
  Result := InstantiateModel(ATransition, 'UninterpretedAction') as IUMLUninterpretedAction;
end;

function PUMLFactoryAuto.CreateSignalEvent(const ATransition: IUMLTransition): IUMLSignalEvent;
begin
  Result := InstantiateModel(ATransition, 'SignalEvent') as IUMLSignalEvent;
end;

function PUMLFactoryAuto.CreateCallEvent(const ATransition: IUMLTransition): IUMLCallEvent;
begin
  Result := InstantiateModel(ATransition, 'CallEvent') as IUMLCallEvent;
end;

function PUMLFactoryAuto.CreateTimeEvent(const ATransition: IUMLTransition): IUMLTimeEvent;
begin
  Result := InstantiateModel(ATransition, 'TimeEvent') as IUMLTimeEvent;
end;

function PUMLFactoryAuto.CreateChangeEvent(const ATransition: IUMLTransition): IUMLChangeEvent;
begin
  Result := InstantiateModel(ATransition, 'ChangeEvent') as IUMLChangeEvent;
end;

function PUMLFactoryAuto.CreateClassifierRole(const ACollaboration: IUMLCollaboration): IUMLClassifierRole;
begin
  Result := InstantiateModel(ACollaboration, 'ClassifierRole') as IUMLClassifierRole;
end;

function PUMLFactoryAuto.CreateObject(const ACollaborationInstanceSet: IUMLCollaborationInstanceSet): IUMLObject;
begin
  Result := InstantiateModel(ACollaborationInstanceSet, 'Object') as IUMLObject;
end;

function PUMLFactoryAuto.CreateObject2(const AOwner: IUMLNamespace): IUMLObject;
begin
  Result := InstantiateModel(AOwner, 'Object') as IUMLObject;
end;

function PUMLFactoryAuto.CreateTransition(const AStateMachine: IUMLStateMachine; const Source: IUMLStateVertex; const Target: IUMLStateVertex): IUMLTransition;
begin
  Result := InstantiateModel(AStateMachine, 'Transition', 0, Source, Target) as IUMLTransition;
end;

function PUMLFactoryAuto.CreateDependency(const AOwner: IUMLNamespace; const Client: IUMLModelElement; const Supplier: IUMLModelElement): IUMLDependency;
begin
  Result := InstantiateModel(AOwner, 'Dependency', 0, Client, Supplier) as IUMLDependency;
end;

function PUMLFactoryAuto.CreateAssociation(const AOwner: IUMLNamespace; const End1: IUMLClassifier; const End2: IUMLClassifier): IUMLAssociation;
begin
  Result := InstantiateModel(AOwner, 'Association', 0, End1, End2) as IUMLAssociation;
end;

function PUMLFactoryAuto.CreateAssociationClass(const AOwner: IUMLNamespace; const AAssociation: IUMLAssociation; const AClass: IUMLClass): IUMLAssociationClass;
begin
  Result := InstantiateModel(AOwner, 'AssociationClass', 0, AAssociation, AClass) as IUMLAssociationClass;
end;

function PUMLFactoryAuto.CreateGeneralization(const AOwner: IUMLNamespace; const Parent: IUMLGeneralizableElement; const Child: IUMLGeneralizableElement): IUMLGeneralization;
begin
  Result := InstantiateModel(AOwner, 'Generalization', 0, Child, Parent) as IUMLGeneralization;
end;

function PUMLFactoryAuto.CreateLink(const ACollaborationInstanceSet: IUMLCollaborationInstanceSet; const End1: IUMLInstance; const End2: IUMLInstance): IUMLLink;
begin
  Result := InstantiateModel(ACollaborationInstanceSet, 'Link', 0, End1, End2) as IUMLLink;
end;

function PUMLFactoryAuto.CreateLink2(const ANamespace: IUMLNamespace; const End1: IUMLInstance; const End2: IUMLInstance): IUMLLink; safecall;
begin
  Result := InstantiateModel(ANamespace, 'Link', 0, End1, End2) as IUMLLink;
end;

function PUMLFactoryAuto.CreateAssociationRole(const ACollaboration: IUMLCollaboration; const End1: IUMLClassifierRole; const End2: IUMLClassifierRole): IUMLAssociationRole;
begin
  Result := InstantiateModel(ACollaboration, 'AssociationRole', 0, End1, End2) as IUMLAssociationRole;
end;

function PUMLFactoryAuto.CreateStimulus(const AInteractionInstanceSet: IUMLInteractionInstanceSet; const Sender: IUMLInstance; const Receiver: IUMLInstance; Kind: UMLFactoryMessageKind): IUMLStimulus;
begin
  Result := InstantiateModel(AInteractionInstanceSet, 'Stimulus', Ord(Kind), Sender, Receiver) as IUMLStimulus;
end;

function PUMLFactoryAuto.CreateStimulus2(const AInteractionInstanceSet: IUMLInteractionInstanceSet; const Sender: IUMLInstance; const Receiver: IUMLInstance; const CommunicationLink: IUMLLink; Kind: UMLFactoryMessageKind): IUMLStimulus; safecall;
begin
  Result := InstantiateModel(AInteractionInstanceSet, 'Stimulus', Ord(Kind), Sender, Receiver, CommunicationLink) as IUMLStimulus;
end;

function PUMLFactoryAuto.CreateMessage(const AInteraction: IUMLInteraction; const Sender: IUMLClassifierRole; const Receiver: IUMLClassifierRole; Kind: UMLFactoryMessageKind): IUMLMessage;
begin
  Result := InstantiateModel(AInteraction, 'Message', Ord(Kind), Sender, Receiver) as IUMLMessage;
end;

function PUMLFactoryAuto.CreateMessage2(const AInteraction: IUMLInteraction; const Sender: IUMLClassifierRole; const Receiver: IUMLClassifierRole; const CommunicationConnection: IUMLAssociationRole; Kind: UMLFactoryMessageKind): IUMLMessage;
begin
  Result := InstantiateModel(AInteraction, 'Message', Ord(Kind), Sender, Receiver, CommunicationConnection) as IUMLMessage;
end;

function PUMLFactoryAuto.CreateInclude(const AOwner: IUMLNamespace; const Includer: IUMLUseCase; const Includee: IUMLUseCase): IUMLInclude;
begin
  Result := InstantiateModel(AOwner, 'Include', 0, Includer, Includee) as IUMLInclude;
end;

function PUMLFactoryAuto.CreateExtend(const AOwner: IUMLNamespace; const Extender: IUMLUseCase; const Extendee: IUMLUseCase): IUMLExtend;
begin
  Result := InstantiateModel(AOwner, 'Extend', 0, Extender, Extendee) as IUMLExtend;
end;

function PUMLFactoryAuto.CreateRealization(const AOwner: IUMLNamespace; const Client: IUMLModelElement; const Supplier: IUMLModelElement): IUMLRealization;
begin
  Result := InstantiateModel(AOwner, 'Realization', 0, Client, Supplier) as IUMLRealization;
end;

function PUMLFactoryAuto.CreateClassDiagram(const AOwner: IModel): IUMLClassDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'ClassDiagram') as IUMLClassDiagram;
end;

function PUMLFactoryAuto.CreateUseCaseDiagram(const AOwner: IModel): IUMLUseCaseDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'UseCaseDiagram') as IUMLUseCaseDiagram;
end;

function PUMLFactoryAuto.CreateSequenceDiagram(const AOwner: IUMLInteractionInstanceSet): IUMLSequenceDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'SequenceDiagram') as IUMLSequenceDiagram;
end;

function PUMLFactoryAuto.CreateSequenceRoleDiagram(const AOwner: IUMLInteraction): IUMLSequenceRoleDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'SequenceRoleDiagram') as IUMLSequenceRoleDiagram;
end;

function PUMLFactoryAuto.CreateCollaborationDiagram(const AOwner: IUMLInteractionInstanceSet): IUMLCollaborationDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'CollaborationDiagram') as IUMLCollaborationDiagram;
end;

function PUMLFactoryAuto.CreateCollaborationRoleDiagram(const AOwner: IUMLInteraction): IUMLCollaborationRoleDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'CollaborationRoleDiagram') as IUMLCollaborationRoleDiagram;
end;

function PUMLFactoryAuto.CreateStatechartDiagram(const AOwner: IUMLStateMachine): IUMLStatechartDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'StatechartDiagram') as IUMLStatechartDiagram;
end;

function PUMLFactoryAuto.CreateActivityDiagram(const AOwner: IUMLActivityGraph): IUMLActivityDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'ActivityDiagram') as IUMLActivityDiagram;
end;

function PUMLFactoryAuto.CreateComponentDiagram(const AOwner: IModel): IUMLComponentDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'ComponentDiagram') as IUMLComponentDiagram;
end;

function PUMLFactoryAuto.CreateDeploymentDiagram(const AOwner: IModel): IUMLDeploymentDiagram;
begin
  Result := InstantiateDiagram(AOwner, 'DeploymentDiagram') as IUMLDeploymentDiagram;
end;

function PUMLFactoryAuto.CreateNoteView(const ADiagramView: IDiagramView): IUMLNoteView;
begin
  Result := InstantiateView(ADiagramView, nil, 'NoteView') as IUMLNoteView;
end;

function PUMLFactoryAuto.CreateNoteLinkView(const ADiagramView: IDiagramView; const ANote: IUMLNoteView; const LinkTo: IView): IUMLNoteLinkView;
begin
  Result := InstantiateView(ADiagramView, nil, 'NoteLinkView', LinkTo, ANote) as IUMLNoteLinkView;
end;

function PUMLFactoryAuto.CreateTextView(const ADiagramView: IDiagramView): IUMLTextView;
begin
  Result := InstantiateView(ADiagramView, nil, 'TextView') as IUMLTextView;
end;

function PUMLFactoryAuto.CreateModelView(const ADiagramView: IDiagramView; const AModel: IUMLModel): IUMLModelView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLModelView;
end;

function PUMLFactoryAuto.CreateSubsystemView(const ADiagramView: IDiagramView; const AModel: IUMLSubsystem): IUMLSubsystemView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLSubsystemView;
end;

function PUMLFactoryAuto.CreatePackageView(const ADiagramView: IDiagramView; const AModel: IUMLPackage): IUMLPackageView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLPackageView;
end;

function PUMLFactoryAuto.CreateClassView(const ADiagramView: IDiagramView; const AModel: IUMLClass): IUMLClassView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLClassView;
end;

function PUMLFactoryAuto.CreateInterfaceView(const ADiagramView: IDiagramView; const AModel: IUMLInterface): IUMLInterfaceView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLInterfaceView;
end;

function PUMLFactoryAuto.CreateEnumerationView(const ADiagramView: IDiagramView; const AModel: IUMLEnumeration): IUMLEnumerationView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLEnumerationView;
end;

function PUMLFactoryAuto.CreateSignalView(const ADiagramView: IDiagramView; const AModel: IUMLSignal): IUMLSignalView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLSignalView;
end;

function PUMLFactoryAuto.CreateExceptionView(const ADiagramView: IDiagramView; const AModel: IUMLException): IUMLExceptionView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLExceptionView;
end;

function PUMLFactoryAuto.CreateComponentView(const ADiagramView: IDiagramView; const AModel: IUMLComponent): IUMLComponentView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLComponentView;
end;

function PUMLFactoryAuto.CreateComponentInstanceView(const ADiagramView: IDiagramView; const AModel: IUMLComponentInstance): IUMLComponentInstanceView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLComponentInstanceView;
end;

function PUMLFactoryAuto.CreateNodeView(const ADiagramView: IDiagramView; const AModel: IUMLNode): IUMLNodeView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLNodeView;
end;

function PUMLFactoryAuto.CreateNodeInstanceView(const ADiagramView: IDiagramView; const AModel: IUMLNodeInstance): IUMLNodeInstanceView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLNodeInstanceView;
end;

function PUMLFactoryAuto.CreateActorView(const ADiagramView: IDiagramView; const AModel: IUMLActor): IUMLActorView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLActorView;
end;

function PUMLFactoryAuto.CreateUseCaseView(const ADiagramView: IDiagramView; const AModel: IUMLUseCase): IUMLUseCaseView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLUseCaseView;
end;

function PUMLFactoryAuto.CreateCollaborationView(const ADiagramView: IDiagramView; const AModel: IUMLCollaboration): IUMLCollaborationView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLCollaborationView;
end;

function PUMLFactoryAuto.CreateCollaborationInstanceSetView(const ADiagramView: IDiagramView; const AModel: IUMLCollaborationInstanceSet): IUMLCollaborationInstanceSetView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLCollaborationInstanceSetView;
end;

function PUMLFactoryAuto.CreateGeneralizationView(const ADiagramView: IDiagramView; const AModel: IUMLGeneralization; const Parent: IView; const Child: IView): IUMLGeneralizationView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', Child, Parent) as IUMLGeneralizationView;
end;

function PUMLFactoryAuto.CreateAssociationView(const ADiagramView: IDiagramView; const AModel: IUMLAssociation; const End1: IView; const End2: IView): IUMLAssociationView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', End1, End2) as IUMLAssociationView;
end;

function PUMLFactoryAuto.CreateAssociationClassView(const ADiagramView: IDiagramView; const AModel: IUMLAssociationClass; const AssociationView: IView; const ClassView: IView): IUMLAssociationClassView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', AssociationView, ClassView) as IUMLAssociationClassView;
end;

function PUMLFactoryAuto.CreateDependencyView(const ADiagramView: IDiagramView; const AModel: IUMLDependency; const Client: IView; const Supplier: IView): IUMLDependencyView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', Client, Supplier) as IUMLDependencyView;
end;

function PUMLFactoryAuto.CreateRealizationView(const ADiagramView: IDiagramView; const AModel: IUMLRealization; const Client: IView; const Supplier: IView): IUMLRealizationView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', Client, Supplier) as IUMLRealizationView;
end;

function PUMLFactoryAuto.CreateIncludeView(const ADiagramView: IDiagramView; const AModel: IUMLInclude; const Base: IView; const Addition: IView): IUMLIncludeView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', Base, Addition) as IUMLIncludeView;
end;

function PUMLFactoryAuto.CreateExtendView(const ADiagramView: IDiagramView; const AModel: IUMLExtend; const Base: IView; const Extension: IView): IUMLExtendView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', Extension, Base) as IUMLExtendView;
end;

function PUMLFactoryAuto.CreateObjectView(const ADiagramView: IDiagramView; const AModel: IUMLObject): IUMLColObjectView;
begin
  Result := InstantiateView(ADiagramView, AModel, '') as IUMLColObjectView;
end;

function PUMLFactoryAuto.CreateSeqObjectView(const ADiagramView: IUMLSequenceDiagramView; const AModel: IUMLObject): IUMLSeqObjectView;
begin
  Result := InstantiateView(ADiagramView, AModel, '') as IUMLSeqObjectView;
end;

function PUMLFactoryAuto.CreateClassifierRoleView(const ADiagramView: IDiagramView; const AModel: IUMLClassifierRole): IUMLColClassifierRoleView;
begin
  Result := InstantiateView(ADiagramView, AModel, '') as IUMLColClassifierRoleView;
end;

function PUMLFactoryAuto.CreateSeqClassifierRoleView(const ADiagramView: IUMLSequenceRoleDiagramView; const AModel: IUMLClassifierRole): IUMLSeqClassifierRoleView;
begin
  Result := InstantiateView(ADiagramView, AModel, '') as IUMLSeqClassifierRoleView;
end;

function PUMLFactoryAuto.CreateLinkView(const ADiagramView: IDiagramView; const AModel: IUMLLink; const End1: IView; const End2: IView): IUMLLinkView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', End1, End2) as IUMLLinkView;
end;

function PUMLFactoryAuto.CreateAssociationRoleView(const ADiagramView: IDiagramView; const AModel: IUMLAssociationRole; const End1: IView; const End2: IView): IUMLAssociationRoleView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', End1, End2) as IUMLAssociationRoleView;
end;

function PUMLFactoryAuto.CreateStimulusView(const ADiagramView: IUMLCollaborationDiagramView; const AModel: IUMLStimulus; const LinkView: IView): IUMLColStimulusView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', LinkView, nil) as IUMLColStimulusView;
end;

function PUMLFactoryAuto.CreateSeqStimulusView(const ADiagramView: IUMLSequenceDiagramView; const AModel: IUMLStimulus; const Sender: IView; const Receiver: IView): IUMLSeqStimulusView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', Sender, Receiver) as IUMLSeqStimulusView;
end;

function PUMLFactoryAuto.CreateMessageView(const ADiagramView: IUMLCollaborationRoleDiagramView; const AModel: IUMLMessage; const AssociationRoleView: IView): IUMLColMessageView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', AssociationRoleView, nil) as IUMLColMessageView;
end;

function PUMLFactoryAuto.CreateSeqMessageView(const ADiagramView: IUMLSequenceRoleDiagramView; const AModel: IUMLMessage; const Sender: IView; const Receiver: IView): IUMLSeqMessageView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', Sender, Receiver) as IUMLSeqMessageView;
end;

function PUMLFactoryAuto.CreateStateView(const ADiagramView: IUMLStatechartDiagramView; const AModel: IUMLCompositeState): IUMLStateView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLStateView;
end;

function PUMLFactoryAuto.CreateSubmachineStateView(const ADiagramView: IUMLStatechartDiagramView; const AModel: IUMLSubmachineState): IUMLSubmachineStateView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLSubmachineStateView;
end;

function PUMLFactoryAuto.CreatePseudostateView(const ADiagramView: IDiagramView; const AModel: IUMLPseudostate): IUMLPseudostateView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLPseudostateView;
end;

function PUMLFactoryAuto.CreateFinalStateView(const ADiagramView: IDiagramView; const AModel: IUMLFinalState): IUMLFinalStateView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLFinalStateView;
end;

function PUMLFactoryAuto.CreateActionStateView(const ADiagramView: IUMLActivityDiagramView; const AModel: IUMLActionState): IUMLActionStateView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLActionStateView;
end;

function PUMLFactoryAuto.CreateSubactivityStateView(const ADiagramView: IUMLActivityDiagramView; const AModel: IUMLSubactivityState): IUMLSubactivityStateView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLSubactivityStateView;
end;

function PUMLFactoryAuto.CreateSwimlaneView(const ADiagramView: IUMLActivityDiagramView; const AModel: IUMLPartition): IUMLSwimlaneView;
begin
  Result := InstantiateView(ADiagramView, AModel) as IUMLSwimlaneView;
end;

function PUMLFactoryAuto.CreateTransitionView(const ADiagramView: IDiagramView; const AModel: IUMLTransition; const Source: IView; const Target: IView): IUMLTransitionView;
begin
  Result := InstantiateView(ADiagramView, AModel, '', Source, Target) as IUMLTransitionView;
end;

// PUMLFactoryAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PSelectionManagerAuto

function PSelectionManagerAuto.GetSelectedModelAt(Index: Integer): IModel;
var
  M: PModel;
begin
  M := StarUMLApplication.SelectedModels[Index];
  if M = nil then Result := nil
  else Result := M.GetAutomationObject as PModelAuto;
end;

function PSelectionManagerAuto.GetSelectedModelCount: Integer;
begin
  Result := StarUMLApplication.SelectedModelCount;
end;

function PSelectionManagerAuto.GetSelectedViewAt(Index: Integer): IView;
var
  V: PView;
begin
  V := StarUMLApplication.SelectedViews[Index];
  if V = nil then Result := nil
  else Result := V.GetAutomationObject as PViewAuto;
end;

function PSelectionManagerAuto.GetSelectedViewCount: Integer;
begin
  Result := StarUMLApplication.SelectedViewCount;
end;

function PSelectionManagerAuto.Get_ActiveDiagram: IDiagram;
var
  V: PDiagramView;
  M: PDiagram;
begin
  V := StarUMLApplication.ActiveDiagram;
  if V = nil then Result := nil
  else begin
    M := V.Diagram;
    if M = nil then Result := nil
    else Result := M.GetAutomationObject as PDiagramAuto;
  end;
end;

function PSelectionManagerAuto.Get_ActiveDiagramView: IDiagramView;
var
  V: PDiagramView;
begin
  V := StarUMLApplication.ActiveDiagram;
  if V = nil then Result := nil
  else Result := V.GetAutomationObject as PDiagramViewAuto;
end;

procedure PSelectionManagerAuto.SelectAll;
begin
  StarUMLApplication.SelectAll;
end;

procedure PSelectionManagerAuto.DeselectAll;
begin
  StarUMLApplication.DeselectAll;
end;

procedure PSelectionManagerAuto.SelectModel(const AModel: IModel);
var
  E: PElement;
begin
  if AModel = nil then Exit;
  E := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.SelectModel(E as PModel);
end;

procedure PSelectionManagerAuto.SelectView(const AView: IView);
var
  E: PElement;
begin
  if AView = nil then Exit;
  E := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(AView.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.SelectView(E as PView);
end;

procedure PSelectionManagerAuto.SelectAdditionalModel(const AModel: IModel);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.SelectAdditionalModel(E as PModel);
end;

procedure PSelectionManagerAuto.SelectAdditionalView(const AView: IView);
var
  E: PElement;
begin
  if AView = nil then Exit;
  E := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(AView.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.SelectAdditionalView(E as PView);
end;

procedure PSelectionManagerAuto.SelectArea(X1: Integer; Y1: Integer; X2: Integer; Y2: Integer);
begin
  StarUMLApplication.SelectArea(X1, Y1, X2, Y2);
end;

procedure PSelectionManagerAuto.SelectAdditionalArea(X1: Integer; Y1: Integer; X2: Integer; Y2: Integer);
begin
  StarUMLApplication.SelectAdditionalArea(X1, Y1, X2, Y2);
end;

procedure PSelectionManagerAuto.DeselectModel(const AModel: IModel);
var
  E: PElement;
begin
  if AModel = nil then Exit;
  E := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.DeselectModel(E as PModel);
end;

procedure PSelectionManagerAuto.DeselectView(const AView: IView);
var
  E: PElement;
begin
  if AView = nil then Exit;
  E := MetaModel.FindMetaClass('View').FindInstanceByGuidRecurse(AView.GetGuid);
  // ASSERTIONS
  Assert(E <> nil, 'Unmanaged element found.');
  // ASSERTIONS
  StarUMLApplication.DeselectView(E as PView);
end;

procedure PSelectionManagerAuto.DeselectAllModels;
begin
  StarUMLApplication.DeselectAllModels;
end;

procedure PSelectionManagerAuto.DeselectAllViews;
begin
  StarUMLApplication.DeselectAllViews;
end;

// PSelectionManagerAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PProjectManagerAuto

function PProjectManagerAuto.Get_FileName: WideString;
begin
  Result := StarUMLApplication.FileName;
end;

function PProjectManagerAuto.Get_Modified: WordBool;
begin
  Result := StarUMLApplication.Modified;
end;

function PProjectManagerAuto.Get_UnitsModified: WordBool;
begin
  Result := StarUMLApplication.UnitsModified;
end;

function PProjectManagerAuto.Get_Project: IUMLProject;
begin
  if StarUMLApplication.Project = nil then
    Result := nil
  else
    Result := StarUMLApplication.Project.GetAutomationObject as IUMLProject;
end;

function PProjectManagerAuto.GetUnitDocumentCount: Integer;
begin
  Result := StarUMLApplication.UnitDocumentCount;
end;

function PProjectManagerAuto.GetUnitDocumentAt(Index: Integer): IUMLUnitDocument;
begin
  Result := StarUMLApplication.UnitDocuments[Index].GetAutomationObject as IUMLUnitDocument;
end;

function PProjectManagerAuto.Get_ProjectDocument: IUMLProjectDocument;
begin
  Result := StarUMLApplication.ProjectDocument.GetAutomationObject as IUMLProjectDocument;
end;

procedure PProjectManagerAuto.NewProject;
begin
  StarUMLApplication.NewProject;
end;

procedure PProjectManagerAuto.NewProjectByApproach(const ApproachName: WideString);
begin
  StarUMLApplication.NewProject(ApproachName);
end;

procedure PProjectManagerAuto.OpenProject(const FileName: WideString);
begin
  StarUMLApplication.OpenProject(FileName);
  MainForm.WorkingAreaFrame.OpenAllDefaultDiagrams;
end;

procedure PProjectManagerAuto.SaveProject;
begin
  StarUMLApplication.SaveProject;
end;

procedure PProjectManagerAuto.SaveProjectAs(const FileName: WideString);
begin
  StarUMLApplication.SaveProjectAs(FileName);
end;

procedure PProjectManagerAuto.SaveAllUnits;
begin
  StarUMLApplication.SaveAllUnits;
end;

procedure PProjectManagerAuto.CloseProject;
begin
  StarUMLApplication.CloseProject;
end;

procedure PProjectManagerAuto.ImportFramework(const OwnerPackage: IUMLPackage; const FrameworkName: WideString);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('UMLPackage').FindInstanceByGuidRecurse(OwnerPackage.GetGuid);
  if E <> nil then
    StarUMLApplication.ImportFramework(E as PUMLPackage, FrameworkName);
end;

procedure PProjectManagerAuto.ImportModelFragment(const OwnerPackage: IUMLPackage; const FileName: WideString);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('UMLPackage').FindInstanceByGuidRecurse(OwnerPackage.GetGuid);
  if E <> nil then
    StarUMLApplication.ImportModelFragment(E as PUMLPackage, FileName);
end;

procedure PProjectManagerAuto.ExportModelFragment(const APackage: IUMLPackage; const FileName: WideString);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('UMLPackage').FindInstanceByGuidRecurse(APackage.GetGuid);
  if E <> nil then
    StarUMLApplication.ExportModelFragment(E as PUMLPackage, FileName);
end;

function PProjectManagerAuto.SeparateUnit(const APackage: IUMLPackage; const FileName: WideString): IUMLUnitDocument; safecall;
var
  E: PElement;
  AUnit: PUMLUnitDocument;
begin
  E := MetaModel.FindMetaClass('UMLPackage').FindInstanceByGuidRecurse(APackage.GetGuid);
  if E <> nil then
  begin
    AUnit := StarUMLApplication.SeparateUnit(E as PUMLPackage, FileName);
    Result := AUnit.GetAutomationObject as IUMLUnitDocument;
  end
  else
    Result := nil;
end;

procedure PProjectManagerAuto.MergeUnit(const APackage: IUMLPackage);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('UMLPackage').FindInstanceByGuidRecurse(APackage.GetGuid);
  if E <> nil then
    StarUMLApplication.MergeUnit(E as PUMLPackage);
end;

function PProjectManagerAuto.OpenUnit(const ABasePackage: IUMLPackage; const FileName: WideString): IUMLUnitDocument;
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('UMLPackage').FindInstanceByGuidRecurse(ABasePackage.GetGuid);
  if E <> nil then
    StarUMLApplication.OpenUnit(E as PUMLPackage, FileName);
end;

procedure PProjectManagerAuto.DeleteUnit(const APackage: IUMLPackage);
var
  E: PElement;
begin
  E := MetaModel.FindMetaClass('UMLPackage').FindInstanceByGuidRecurse(APackage.GetGuid);
  if E <> nil then
    StarUMLApplication.DeleteUnit(E as PUMLPackage);
end;

procedure PProjectManagerAuto.UpdateDocuments;
begin
  StarUMLApplication.UpdateDocuments;
  ReloadDocumentElements;
  UpdateDocumentElements;
  MenuStateHandler.BeginUpdate;
  MenuStateHandler.UpdateEditMenus;
  MenuStateHandler.EndUpdate;
end;

function PProjectManagerAuto.GetAvailableFrameworkAt(Index: Integer): WideString;
begin
  Result := FrameworkManager.Frameworks[Index].Name;
end;

function PProjectManagerAuto.GetAvailableFrameworkCount: Integer;
begin
  Result := FrameworkManager.FrameworkCount;
end;

function PProjectManagerAuto.GetAvailableApproachAt(Index: Integer): WideString;
begin
  Result := ApproachManager.Approaches[Index].Name;
end;

function PProjectManagerAuto.GetAvailableApproachCount: Integer;
begin
  Result := ApproachManager.ApproachCount;
end;

// PProjectManagerAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PElementSelectorAuto

function PElementSelectorAuto.Get_AllowNull: WordBool;
begin
  Result := ElementSelectorForm.AllowNull;
end;

procedure PElementSelectorAuto.Set_AllowNull(Value: WordBool);
begin
  ElementSelectorForm.AllowNull := Value;
end;

procedure PElementSelectorAuto.Filter(Filtering: ElementFilteringKind);
begin
  case Filtering of
    fkAll: ElementSelectorForm.Filter(FULL_FILTERINGSET);
    fkPackages: ElementSelectorForm.Filter([PUMLModel, PUMLSubsystem, PUMLPackage]);
    fkClassifiers: ElementSelectorForm.Filter(CLASSIFIER_FILTERINGSET);
  end;
end;

procedure PElementSelectorAuto.ClearSelectableModels;
begin
  ElementSelectorForm.ClearSelectableModels;
end;

procedure PElementSelectorAuto.AddSelectableModel(const ClassName: WideString);
var
  M: PMetaClass;
begin
  M := MetaModel.FindMetaClass(ClassName);
  if M <> nil then
    ElementSelectorForm.AddSelectableModel(M.ElementClass);
end;

procedure PElementSelectorAuto.RemoveSelectableModel(const ClassName: WideString);
var
  M: PMetaClass;
begin
  M := MetaModel.FindMetaClass(ClassName);
  if M <> nil then
    ElementSelectorForm.RemoveSelectableModel(M.ElementClass);
end;

function PElementSelectorAuto.Execute(const Title: WideString): WordBool;
begin
  Result := ElementSelectorForm.Execute(Title);
end;

function PElementSelectorAuto.GetSelectedModel: IModel;
var
  M: PModel;
begin
  M := ElementSelectorForm.SelectedModel;
  if M <> nil then
    Result := M.GetAutomationObject as IModel
  else
    Result := nil;
end;

// PElementSelectorAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PElementListSelectorAuto

function PElementListSelectorAuto.Get_AllowNull: WordBool;
begin
  Result := ElementListForm.AllowNull;
end;

procedure PElementListSelectorAuto.Set_AllowNull(Value: WordBool);
begin
  ElementListForm.AllowNull := Value;
end;

procedure PElementListSelectorAuto.ClearListElements;
begin
  ElementListForm.ClearListElements;
end;

procedure PElementListSelectorAuto.AddListElement(const AModel: IModel);
var
  M: PModel;
begin
  M := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid) as PModel;
  if M <> nil then
    ElementListForm.AddListElement(M);
end;

procedure PElementListSelectorAuto.AddListElementsByCollection(const AModel: IModel; const CollectionName: WideString; ShowInherited: WordBool);
var
  M: PModel;
begin
  M := MetaModel.FindMetaClass('Model').FindInstanceByGuidRecurse(AModel.GetGuid) as PModel;
  if M <> nil then
    ElementListForm.AddListElementsByCollection(M, CollectionName, ShowInherited);
end;

procedure PElementListSelectorAuto.AddListElementsByClass(const MetaClassName: WideString; IncludeChildInstances: WordBool);
begin
  ElementListForm.AddListElementsByClass(MetaClassName, IncludeChildInstances);
end;

function PElementListSelectorAuto.Execute(const Title: WideString): WordBool;
begin
  Result := ElementListForm.Execute(Title);
end;

function PElementListSelectorAuto.GetSelectedModel: IModel;
begin
  if ElementListForm.SelectedModel <> nil then
    Result := ElementListForm.SelectedModel.GetAutomationObject as IModel
  else
    Result := nil;
end;

// PElementListSelectorAuto
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PEventPublisherAuto

procedure PEventPublisherAuto.Subscribe(const ASubscriber: IEventSubscriber; AEvent: EventKind);
begin
  EventPublisher.Subscribe(ASubscriber, AEvent);
end;

procedure PEventPublisherAuto.SubscribeAll(const ASubscriber: IEventSubscriber);
begin
  EventPublisher.SubscribeAll(ASubscriber);
end;

procedure PEventPublisherAuto.Unsubscribe(const ASubscriber: IEventSubscriber; AEvent: EventKind);
begin
  EventPublisher.Unsubscribe(ASubscriber, AEvent);
end;

procedure PEventPublisherAuto.UnsubscribeAll(const ASubscriber: IEventSubscriber);
begin
  EventPublisher.UnsubscribeAll(ASubscriber);
end;

function PEventPublisherAuto.GetEventArgModelAt(Index: Integer): IModel;
begin
  Result := EventPublisher.GetEventArgModelAt(Index).GetAutomationObject as IModel;
end;

function PEventPublisherAuto.GetEventArgModelCount: Integer;
begin
  Result := EventPublisher.GetEventArgModelCount;
end;

function PEventPublisherAuto.GetEventArgViewAt(Index: Integer): IView;
begin
  Result := EventPublisher.GetEventArgViewAt(Index).GetAutomationObject as IView;
end;

function PEventPublisherAuto.GetEventArgViewCount: Integer;
begin
  Result := EventPublisher.GetEventArgViewCount;
end;

function PEventPublisherAuto.GetEventArgDocument: IDocument;
begin
  Result := EventPublisher.GetEventArgDocument.GetAutomationObject as IDocument;
end;

function PEventPublisherAuto.GetEventArgUnit: IUMLUnitDocument;
begin
  Result := EventPublisher.GetEventArgUnit.GetAutomationObject as IUMLUnitDocument;
end;

// PEventPublisherAuto
////////////////////////////////////////////////////////////////////////////////

initialization
  UMLFactoryAuto := nil;
  ProjectManagerAuto := nil;
  SelectionManagerAuto := nil;
  ElementSelectorAuto := nil;
  ElementListSelectorAuto := nil;
  EventPublisherAuto := nil;
  TAutoObjectFactory.Create(ComServer, PStarUMLApplicationAuto, CLASS_WhiteStarUMLApplication,
    ciMultiInstance, tmApartment);
finalization
  if UMLFactoryAuto <> nil then begin
    UMLFactoryAuto._Release;
    UMLFactoryAuto := nil;
  end;
  if ProjectManagerAuto <> nil then begin
    ProjectManagerAuto._Release;
    ProjectManagerAuto := nil;
  end;
  if SelectionManagerAuto <> nil then begin
    SelectionManagerAuto._Release;
    SelectionManagerAuto := nil;
  end;
  if ElementSelectorAuto <> nil then begin
    ElementSelectorAuto._Release;
    ElementSelectorAuto := nil;
  end;
  if ElementListSelectorAuto <> nil then begin
    ElementListSelectorAuto._Release;
    ElementListSelectorAuto := nil;
  end;
  if EventPublisherAuto <> nil then begin
    EventPublisherAuto._Release;
    EventPublisherAuto := nil;
  end;
end.

