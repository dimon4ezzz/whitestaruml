unit PetalElements;

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
  GmrNodes,
  Classes, Types;

type
	// Forward declarations
	RPetalObject = class;
	RPetalIdentifier = class;
	RPetalModel = class;
	RActionTime = class;
	RPetalDiagram = class;
	RClassDiagram = class;
	RUseCaseDiagram = class;
	RInteractionDiagram = class;
	RObjectDiagram = class;
	RModule_Diagram = class;
	RProcess_Diagram = class;
	RTier_Diagram = class;
	RAbstractStateDiagaram = class;
	RState_Diagram = class;
	RActivityDiagram = class;
	RAssociation = class;
	RClass = class;
	RClass_Utility = class;
	RInstantiated_Class = class;
	RInstantiated_Class_Utility = class;
	RMetaclass = class;
	RParameterized_Class = class;
	RParameterized_Class_Utility = class;
	RClassAttribute = class;
	RClass_Category = class;
	REvent = class;
	RMessage = class;
	RObject = class;
	ROperation = class;
	RPartition = class;
	RState_Machine = class;
	RUseCase = class;
	RModule = class;
	RPetalDeploymentNode = class;
	RDevice = class;
	RProcessor = class;
	RParameter = class;
	RProcess = class;
	RProcesses = class;
	RPetalRelationship = class;
	RUses_Relationship = class;
	RDependency_Relationship = class;
	RConnection_Relationship = class;
	RInheritance_Relationship = class;
	RModule_Visibility_Relationship = class;
	RRealize_Relationship = class;
	RState_Transition = class;
	RVisibility_Relationship = class;
	RRole = class;
	RLink = class;
	RPetalStateVertex = class;
	RState = class;
	RActivityState = class;
	RSynchronizationState = class;
	RDecision = class;
	RSubSystem = class;
	RSendEvent = class;
	RAction = class;
	RMechanism = class;
	RPetalView = class;
	RPetalNodeView = class;
	RClassView = class;
	RCategoryView = class;
	RUseCaseView = class;
	RActivityStateView = class;
	RClassInstanceView = class;
	RCompartment = class;
	RDecisionView = class;
	RDestruction_Marker = class;
	RDeviceView = class;
	RInterObjView = class;
	RModView = class;
	RObjectView = class;
	RProcessorView = class;
	RStateView = class;
	RSubSysView = class;
	RFocus_Of_Control = class;
	RInterfaceView = class;
	RNoteView = class;
	RSwimlane = class;
	RSynchronizationView = class;
	RTierView = class;
	RPetalLabelView = class;
	RItemLabel = class;
	RLabel = class;
	RSegLabel = class;
	RMessView = class;
	RPetalEdgeView = class;
	RAssocAttachView = class;
	RAssociationViewNew = class;
	RAttachView = class;
	RConnectionView = class;
	RDependencyView = class;
	RImportView = class;
	RInheritView = class;
	RLinkView = class;
	RLinkSelfView = class;
	RModVisView = class;
	RRealizeView = class;
	RTransView = class;
	RUsesView = class;
	RInterMessView = class;
	RRoleView = class;
	RSelfTransView = class;
	RSelfMessView = class;
	RInheritTreeView = class;
	RDataFlowView = class;
	RDesign = class;
	RProperties = class;
	RPetal = class;
	RFont = class;
	RAttribute = class;
	RDefaults = class;
	RSemantic_Info = class;
	RExternal_doc = class;
	RPoint = class;

	// Enumerations
	RNotationKind = (nkUnified, nkBooch, nkOMT);
	RTimePointKind = (tkEntry, tkExit, tkActivity, tkUponEvent);
	RConcurrencyKind = (ckSequential, ckGuarded, ckSynchronous, ckActive);
	RPersistenceKind = (pkPersistent, pkTransient, pkStatic);
	RContainmentKind = (ckUnspecifed, ckByValue, ckByReference);
	RExportControlKind = (ekPublic, ekProtected, ekPrivate, ekImplementation);
	RLinkVisibilityKind = (vkField, vkParameter, vkLocal, vkGlobal);
	RMessageDirectionKind = (dkSupplierToClient, dkClientToSupplier);
	RMessageFrequencyKind = (fkPeriodic, fkAperiodic);
	RMessageSynchronizationKind = (skSimple, skSynchronous, skBalking, skTimeout, skProcedureCall, skAsynchronous, skReturn);
	RProcessorSchedulingKind = (skPreemptive, skNonPreemptive, skCyclic, skExecutive, skManual);
	RStateKind = (skNormal, skStartState, skEndState, skHistory, skHistoryAll);
	RIconStyleKind = (ikNone, ikLabel, ikDecoration, ikIcon);
	RLineStyleKind = (lkOblique, lkRectlinear, lkSelf);
	RDataFlowDirectionKind = (dkForward, dkReverse);
	RSynchFlowDirectionKind = (dkVertical, dkHorizontal);
	RMessViewDirectionKind = (mdkForward, mdkReverse);

	// RPetalObject
	RPetalObject = class
  private
		{ Member Fields }
		FObjectName: string;
		FInterfaceObj: IUnknown;
		FASTObject: NObject;
		FParent: RPetalObject;
		FChildren: TList;
		{ Getter/Setter }
		procedure Set_ObjectName(Value: string);
		procedure Set_InterfaceObj(Value: IUnknown);
		procedure Set_ASTObject(Value: NObject);
		procedure Set_Parent(Value: RPetalObject);
		function Get_ChildCount: Integer;
		function Get_Child(Index: Integer): RPetalObject;
  public
		{ Constructor/Destructor }
		constructor Create; virtual;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Child(Value: RPetalObject);
		procedure Remove_Child(Value: RPetalObject);
		procedure Insert_Child(Index: Integer; Value: RPetalObject);
		procedure Delete_Child(Index: Integer);
		{ Properties }
		property ObjectName: string read FObjectName write Set_ObjectName;
		property InterfaceObj: IUnknown read FInterfaceObj write Set_InterfaceObj;
		property ASTObject: NObject read FASTObject write Set_ASTObject;
		property Parent: RPetalObject read FParent write Set_Parent;
		property ChildCount: Integer read Get_ChildCount;
		property Children[Index: Integer]: RPetalObject read Get_Child;
  end;

	// RPetalIdentifier
	RPetalIdentifier = class(RPetalObject)
  private
		{ Member Fields }
		FQuid: string;
		FName: string;
		FParams: TStringList;
		{ Getter/Setter }
		procedure Set_Quid(Value: string);
		procedure Set_Name(Value: string);
		function Get_ParamCount: Integer;
		function Get_Param(Index: Integer): string;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Param(Value: string);
		procedure Insert_Param(Index: Integer; Value: string);
		procedure Delete_Param(Index: Integer);
		{ Properties }
		property Quid: string read FQuid write Set_Quid;
		property Name: string read FName write Set_Name;
		property ParamCount: Integer read Get_ParamCount;
		property Params[Index: Integer]: string read Get_Param;
  end;

	// RPetalModel
	RPetalModel = class(RPetalIdentifier)
  private
		{ Member Fields }
		FDocumentation: string;
		FStereotype: string;
		FUid: Integer;
		FExportControl: RExportControlKind;
		FAttributes: TList;
		FExternal_docs: TList;
		{ Getter/Setter }
		procedure Set_Documentation(Value: string);
		procedure Set_Stereotype(Value: string);
		procedure Set_Uid(Value: Integer);
		procedure Set_ExportControl(Value: RExportControlKind);
		function Get_AttributeCount: Integer;
		function Get_Attribute(Index: Integer): RAttribute;
		function Get_External_docCount: Integer;
		function Get_External_doc(Index: Integer): RExternal_doc;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Attribute(Value: RAttribute);
		procedure Remove_Attribute(Value: RAttribute);
		procedure Insert_Attribute(Index: Integer; Value: RAttribute);
		procedure Delete_Attribute(Index: Integer);
		procedure Add_External_doc(Value: RExternal_doc);
		procedure Remove_External_doc(Value: RExternal_doc);
		procedure Insert_External_doc(Index: Integer; Value: RExternal_doc);
		procedure Delete_External_doc(Index: Integer);
		{ Properties }
		property Documentation: string read FDocumentation write Set_Documentation;
		property Stereotype: string read FStereotype write Set_Stereotype;
		property Uid: Integer read FUid write Set_Uid;
		property ExportControl: RExportControlKind read FExportControl write Set_ExportControl;
		property AttributeCount: Integer read Get_AttributeCount;
		property Attributes[Index: Integer]: RAttribute read Get_Attribute;
		property External_docCount: Integer read Get_External_docCount;
		property External_docs[Index: Integer]: RExternal_doc read Get_External_doc;
  end;

	// RActionTime
	RActionTime = class(RPetalModel)
  private
		{ Member Fields }
		FWhen: RTimePointKind;
		FCondition: string;
		FEvent: REvent;
		{ Getter/Setter }
		procedure Set_When(Value: RTimePointKind);
		procedure Set_Condition(Value: string);
		procedure Set_Event(Value: REvent);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property When: RTimePointKind read FWhen write Set_When;
		property Condition: string read FCondition write Set_Condition;
		property Event: REvent read FEvent write Set_Event;
  end;

	// RPetalDiagram
	RPetalDiagram = class(RPetalModel)
  private
		{ Member Fields }
		FTitle: string;
		FMax_width: Integer;
		FMax_height: Integer;
		FOrigin_x: Integer;
		FOrigin_y: Integer;
		FZoom: Integer;
		FItems: TList;
		{ Getter/Setter }
		procedure Set_Title(Value: string);
		procedure Set_Max_width(Value: Integer);
		procedure Set_Max_height(Value: Integer);
		procedure Set_Origin_x(Value: Integer);
		procedure Set_Origin_y(Value: Integer);
		procedure Set_Zoom(Value: Integer);
		function Get_ItemCount: Integer;
		function Get_Item(Index: Integer): RPetalView;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Item(Value: RPetalView);
		procedure Remove_Item(Value: RPetalView);
		procedure Insert_Item(Index: Integer; Value: RPetalView);
		procedure Delete_Item(Index: Integer);
		{ Properties }
		property Title: string read FTitle write Set_Title;
		property Max_width: Integer read FMax_width write Set_Max_width;
		property Max_height: Integer read FMax_height write Set_Max_height;
		property Origin_x: Integer read FOrigin_x write Set_Origin_x;
		property Origin_y: Integer read FOrigin_y write Set_Origin_y;
		property Zoom: Integer read FZoom write Set_Zoom;
		property ItemCount: Integer read Get_ItemCount;
		property Items[Index: Integer]: RPetalView read Get_Item;
  end;

	// RClassDiagram
	RClassDiagram = class(RPetalDiagram)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RUseCaseDiagram
	RUseCaseDiagram = class(RPetalDiagram)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RInteractionDiagram
	RInteractionDiagram = class(RPetalDiagram)
  private
		{ Member Fields }
		FMechanism_ref: RMechanism;
		{ Getter/Setter }
		procedure Set_Mechanism_ref(Value: RMechanism);
  public
		{ Properties }
		property Mechanism_ref: RMechanism read FMechanism_ref write Set_Mechanism_ref;
  end;

	// RObjectDiagram
	RObjectDiagram = class(RPetalDiagram)
  private
		{ Member Fields }
		FMechanism_ref: RMechanism;
		{ Getter/Setter }
		procedure Set_Mechanism_ref(Value: RMechanism);
  public
		{ Properties }
		property Mechanism_ref: RMechanism read FMechanism_ref write Set_Mechanism_ref;
  end;

	// RModule_Diagram
	RModule_Diagram = class(RPetalDiagram)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RProcess_Diagram
	RProcess_Diagram = class(RPetalDiagram)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RTier_Diagram
	RTier_Diagram = class(RPetalDiagram)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RAbstractStateDiagaram
	RAbstractStateDiagaram = class(RPetalDiagram)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RState_Diagram
	RState_Diagram = class(RAbstractStateDiagaram)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RActivityDiagram
	RActivityDiagram = class(RAbstractStateDiagaram)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RAssociation
	RAssociation = class(RPetalModel)
  private
		{ Member Fields }
		FConstraints: string;
		FDerived: Boolean;
		FRoles: TList;
		FAssociationClass: RClass;
		{ Getter/Setter }
		procedure Set_Constraints(Value: string);
		procedure Set_Derived(Value: Boolean);
		function Get_RoleCount: Integer;
		function Get_Role(Index: Integer): RRole;
		procedure Set_AssociationClass(Value: RClass);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Role(Value: RRole);
		procedure Remove_Role(Value: RRole);
		procedure Insert_Role(Index: Integer; Value: RRole);
		procedure Delete_Role(Index: Integer);
		{ Properties }
		property Constraints: string read FConstraints write Set_Constraints;
		property Derived: Boolean read FDerived write Set_Derived;
		property RoleCount: Integer read Get_RoleCount;
		property Roles[Index: Integer]: RRole read Get_Role;
		property AssociationClass: RClass read FAssociationClass write Set_AssociationClass;
  end;

	// RClass
	RClass = class(RPetalModel)
  private
		{ Member Fields }
		FAbstract: Boolean;
		FConcurrency: RConcurrencyKind;
		FLanguage: string;
		FPersistence: RPersistenceKind;
		FSpace: string;
		FCardinality: string;
		FModules: TList;
		FNestedClasses: TList;
		FOperations: TList;
		FRealized_interfaces: TList;
		FStatemachine: RState_Machine;
		FSuperclasses: TList;
		FUsed_nodes: TList;
		FClass_attributes: TList;
		{ Getter/Setter }
		procedure Set_Abstract(Value: Boolean);
		procedure Set_Concurrency(Value: RConcurrencyKind);
		procedure Set_Language(Value: string);
		procedure Set_Persistence(Value: RPersistenceKind);
		procedure Set_Space(Value: string);
		procedure Set_Cardinality(Value: string);
		function Get_ModuleCount: Integer;
		function Get_Module(Index: Integer): RModule;
		function Get_NestedClassCount: Integer;
		function Get_NestedClass(Index: Integer): RClass;
		function Get_OperationCount: Integer;
		function Get_Operation(Index: Integer): ROperation;
		function Get_Realized_interfaceCount: Integer;
		function Get_Realized_interface(Index: Integer): RRealize_Relationship;
		procedure Set_Statemachine(Value: RState_Machine);
		function Get_SuperclassCount: Integer;
		function Get_Superclass(Index: Integer): RInheritance_Relationship;
		function Get_Used_nodeCount: Integer;
		function Get_Used_node(Index: Integer): RUses_Relationship;
		function Get_Class_attributeCount: Integer;
		function Get_Class_attribute(Index: Integer): RClassAttribute;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Module(Value: RModule);
		procedure Remove_Module(Value: RModule);
		procedure Insert_Module(Index: Integer; Value: RModule);
		procedure Delete_Module(Index: Integer);
		procedure Add_NestedClass(Value: RClass);
		procedure Remove_NestedClass(Value: RClass);
		procedure Insert_NestedClass(Index: Integer; Value: RClass);
		procedure Delete_NestedClass(Index: Integer);
		procedure Add_Operation(Value: ROperation);
		procedure Remove_Operation(Value: ROperation);
		procedure Insert_Operation(Index: Integer; Value: ROperation);
		procedure Delete_Operation(Index: Integer);
		procedure Add_Realized_interface(Value: RRealize_Relationship);
		procedure Remove_Realized_interface(Value: RRealize_Relationship);
		procedure Insert_Realized_interface(Index: Integer; Value: RRealize_Relationship);
		procedure Delete_Realized_interface(Index: Integer);
		procedure Add_Superclass(Value: RInheritance_Relationship);
		procedure Remove_Superclass(Value: RInheritance_Relationship);
		procedure Insert_Superclass(Index: Integer; Value: RInheritance_Relationship);
		procedure Delete_Superclass(Index: Integer);
		procedure Add_Used_node(Value: RUses_Relationship);
		procedure Remove_Used_node(Value: RUses_Relationship);
		procedure Insert_Used_node(Index: Integer; Value: RUses_Relationship);
		procedure Delete_Used_node(Index: Integer);
		procedure Add_Class_attribute(Value: RClassAttribute);
		procedure Remove_Class_attribute(Value: RClassAttribute);
		procedure Insert_Class_attribute(Index: Integer; Value: RClassAttribute);
		procedure Delete_Class_attribute(Index: Integer);
		{ Properties }
		property Abstract: Boolean read FAbstract write Set_Abstract;
		property Concurrency: RConcurrencyKind read FConcurrency write Set_Concurrency;
		property Language: string read FLanguage write Set_Language;
		property Persistence: RPersistenceKind read FPersistence write Set_Persistence;
		property Space: string read FSpace write Set_Space;
		property Cardinality: string read FCardinality write Set_Cardinality;
		property ModuleCount: Integer read Get_ModuleCount;
		property Modules[Index: Integer]: RModule read Get_Module;
		property NestedClassCount: Integer read Get_NestedClassCount;
		property NestedClasses[Index: Integer]: RClass read Get_NestedClass;
		property OperationCount: Integer read Get_OperationCount;
		property Operations[Index: Integer]: ROperation read Get_Operation;
		property Realized_interfaceCount: Integer read Get_Realized_interfaceCount;
		property Realized_interfaces[Index: Integer]: RRealize_Relationship read Get_Realized_interface;
		property Statemachine: RState_Machine read FStatemachine write Set_Statemachine;
		property SuperclassCount: Integer read Get_SuperclassCount;
		property Superclasses[Index: Integer]: RInheritance_Relationship read Get_Superclass;
		property Used_nodeCount: Integer read Get_Used_nodeCount;
		property Used_nodes[Index: Integer]: RUses_Relationship read Get_Used_node;
		property Class_attributeCount: Integer read Get_Class_attributeCount;
		property Class_attributes[Index: Integer]: RClassAttribute read Get_Class_attribute;
  end;

	// RClass_Utility
	RClass_Utility = class(RClass)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RInstantiated_Class
	RInstantiated_Class = class(RClass)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RInstantiated_Class_Utility
	RInstantiated_Class_Utility = class(RClass)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RMetaclass
	RMetaclass = class(RClass)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RParameterized_Class
	RParameterized_Class = class(RClass)
  private
		{ Member Fields }
		FParameters: TList;
		{ Getter/Setter }
		function Get_ParameterCount: Integer;
		function Get_Parameter(Index: Integer): RParameter;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Parameter(Value: RParameter);
		procedure Remove_Parameter(Value: RParameter);
		procedure Insert_Parameter(Index: Integer; Value: RParameter);
		procedure Delete_Parameter(Index: Integer);
		{ Properties }
		property ParameterCount: Integer read Get_ParameterCount;
		property Parameters[Index: Integer]: RParameter read Get_Parameter;
  end;

	// RParameterized_Class_Utility
	RParameterized_Class_Utility = class(RParameterized_Class)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RClassAttribute
	RClassAttribute = class(RPetalModel)
  private
		{ Member Fields }
		FContainment: RContainmentKind;
		FDerived: Boolean;
		FInitv: string;
		FStatic: Boolean;
		FTypeExpression: string;
		FType_: RClass;
		{ Getter/Setter }
		procedure Set_Containment(Value: RContainmentKind);
		procedure Set_Derived(Value: Boolean);
		procedure Set_Initv(Value: string);
		procedure Set_Static(Value: Boolean);
		procedure Set_TypeExpression(Value: string);
		procedure Set_Type_(Value: RClass);
  public
		{ Properties }
		property Containment: RContainmentKind read FContainment write Set_Containment;
		property Derived: Boolean read FDerived write Set_Derived;
		property Initv: string read FInitv write Set_Initv;
		property Static: Boolean read FStatic write Set_Static;
		property TypeExpression: string read FTypeExpression write Set_TypeExpression;
		property Type_: RClass read FType_ write Set_Type_;
  end;

	// RClass_Category
	RClass_Category = class(RPetalModel)
  private
		{ Member Fields }
		FGlobal: Boolean;
		FLogical_models: TList;
		FLogical_presentations: TList;
		FStatemachine: RState_Machine;
		FVisible_categories: TList;
		FVisible_modules: TList;
		FSubsystem: RSubSystem;
		{ Getter/Setter }
		procedure Set_Global(Value: Boolean);
		function Get_Logical_modelCount: Integer;
		function Get_Logical_model(Index: Integer): RPetalModel;
		function Get_Logical_presentationCount: Integer;
		function Get_Logical_presentation(Index: Integer): RPetalDiagram;
		procedure Set_Statemachine(Value: RState_Machine);
		function Get_Visible_categoryCount: Integer;
		function Get_Visible_category(Index: Integer): RVisibility_Relationship;
		function Get_Visible_moduleCount: Integer;
		function Get_Visible_module(Index: Integer): RDependency_Relationship;
		procedure Set_Subsystem(Value: RSubSystem);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Logical_model(Value: RPetalModel);
		procedure Remove_Logical_model(Value: RPetalModel);
		procedure Insert_Logical_model(Index: Integer; Value: RPetalModel);
		procedure Delete_Logical_model(Index: Integer);
		procedure Add_Logical_presentation(Value: RPetalDiagram);
		procedure Remove_Logical_presentation(Value: RPetalDiagram);
		procedure Insert_Logical_presentation(Index: Integer; Value: RPetalDiagram);
		procedure Delete_Logical_presentation(Index: Integer);
		procedure Add_Visible_category(Value: RVisibility_Relationship);
		procedure Remove_Visible_category(Value: RVisibility_Relationship);
		procedure Insert_Visible_category(Index: Integer; Value: RVisibility_Relationship);
		procedure Delete_Visible_category(Index: Integer);
		procedure Add_Visible_module(Value: RDependency_Relationship);
		procedure Remove_Visible_module(Value: RDependency_Relationship);
		procedure Insert_Visible_module(Index: Integer; Value: RDependency_Relationship);
		procedure Delete_Visible_module(Index: Integer);
		{ Properties }
		property Global: Boolean read FGlobal write Set_Global;
		property Logical_modelCount: Integer read Get_Logical_modelCount;
		property Logical_models[Index: Integer]: RPetalModel read Get_Logical_model;
		property Logical_presentationCount: Integer read Get_Logical_presentationCount;
		property Logical_presentations[Index: Integer]: RPetalDiagram read Get_Logical_presentation;
		property Statemachine: RState_Machine read FStatemachine write Set_Statemachine;
		property Visible_categoryCount: Integer read Get_Visible_categoryCount;
		property Visible_categories[Index: Integer]: RVisibility_Relationship read Get_Visible_category;
		property Visible_moduleCount: Integer read Get_Visible_moduleCount;
		property Visible_modules[Index: Integer]: RDependency_Relationship read Get_Visible_module;
		property Subsystem: RSubSystem read FSubsystem write Set_Subsystem;
  end;

	// REvent
	REvent = class(RPetalModel)
  private
		{ Member Fields }
		FParameters: string;
		{ Getter/Setter }
		procedure Set_Parameters(Value: string);
  public
		{ Properties }
		property Parameters: string read FParameters write Set_Parameters;
  end;

	// RMessage
	RMessage = class(RPetalModel)
  private
		{ Member Fields }
		FCreation: Boolean;
		FDir: RMessageDirectionKind;
		FFrequency: RMessageFrequencyKind;
		FOrdinal: Integer;
		FSequence: string;
		FSynchronization: RMessageSynchronizationKind;
		FOperation: ROperation;
		{ Getter/Setter }
		procedure Set_Creation(Value: Boolean);
		procedure Set_Dir(Value: RMessageDirectionKind);
		procedure Set_Frequency(Value: RMessageFrequencyKind);
		procedure Set_Ordinal(Value: Integer);
		procedure Set_Sequence(Value: string);
		procedure Set_Synchronization(Value: RMessageSynchronizationKind);
		procedure Set_Operation(Value: ROperation);
  public
		{ Properties }
		property Creation: Boolean read FCreation write Set_Creation;
		property Dir: RMessageDirectionKind read FDir write Set_Dir;
		property Frequency: RMessageFrequencyKind read FFrequency write Set_Frequency;
		property Ordinal: Integer read FOrdinal write Set_Ordinal;
		property Sequence: string read FSequence write Set_Sequence;
		property Synchronization: RMessageSynchronizationKind read FSynchronization write Set_Synchronization;
		property Operation: ROperation read FOperation write Set_Operation;
  end;

	// RObject
	RObject = class(RPetalModel)
  private
		{ Member Fields }
		FCreationObj: Boolean;
		FMulti: Boolean;
		FPersistence: RPersistenceKind;
		FCollaborators: TList;
		FClass: RClass;
		{ Getter/Setter }
		procedure Set_CreationObj(Value: Boolean);
		procedure Set_Multi(Value: Boolean);
		procedure Set_Persistence(Value: RPersistenceKind);
		function Get_CollaboratorCount: Integer;
		function Get_Collaborator(Index: Integer): RLink;
		procedure Set_Class(Value: RClass);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Collaborator(Value: RLink);
		procedure Remove_Collaborator(Value: RLink);
		procedure Insert_Collaborator(Index: Integer; Value: RLink);
		procedure Delete_Collaborator(Index: Integer);
		{ Properties }
		property CreationObj: Boolean read FCreationObj write Set_CreationObj;
		property Multi: Boolean read FMulti write Set_Multi;
		property Persistence: RPersistenceKind read FPersistence write Set_Persistence;
		property CollaboratorCount: Integer read Get_CollaboratorCount;
		property Collaborators[Index: Integer]: RLink read Get_Collaborator;
		property Class_: RClass read FClass write Set_Class;
  end;

	// ROperation
	ROperation = class(RPetalModel)
  private
		{ Member Fields }
		FAbstract: Boolean;
		FConcurrency: RConcurrencyKind;
		FExceptions: string;
		FProtocol: string;
		FQualification: string;
		FResultExpression: string;
		FSpace: string;
		FTime_complexity: string;
		FPost_condition: RSemantic_Info;
		FPre_condition: RSemantic_Info;
		FSemantics: RSemantic_Info;
		FParameters: TList;
		FResult: RClass;
		{ Getter/Setter }
		procedure Set_Abstract(Value: Boolean);
		procedure Set_Concurrency(Value: RConcurrencyKind);
		procedure Set_Exceptions(Value: string);
		procedure Set_Protocol(Value: string);
		procedure Set_Qualification(Value: string);
		procedure Set_ResultExpression(Value: string);
		procedure Set_Space(Value: string);
		procedure Set_Time_complexity(Value: string);
		procedure Set_Post_condition(Value: RSemantic_Info);
		procedure Set_Pre_condition(Value: RSemantic_Info);
		procedure Set_Semantics(Value: RSemantic_Info);
		function Get_ParameterCount: Integer;
		function Get_Parameter(Index: Integer): RParameter;
		procedure Set_Result(Value: RClass);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Parameter(Value: RParameter);
		procedure Remove_Parameter(Value: RParameter);
		procedure Insert_Parameter(Index: Integer; Value: RParameter);
		procedure Delete_Parameter(Index: Integer);
		{ Properties }
		property Abstract: Boolean read FAbstract write Set_Abstract;
		property Concurrency: RConcurrencyKind read FConcurrency write Set_Concurrency;
		property Exceptions: string read FExceptions write Set_Exceptions;
		property Protocol: string read FProtocol write Set_Protocol;
		property Qualification: string read FQualification write Set_Qualification;
		property ResultExpression: string read FResultExpression write Set_ResultExpression;
		property Space: string read FSpace write Set_Space;
		property Time_complexity: string read FTime_complexity write Set_Time_complexity;
		property Post_condition: RSemantic_Info read FPost_condition write Set_Post_condition;
		property Pre_condition: RSemantic_Info read FPre_condition write Set_Pre_condition;
		property Semantics: RSemantic_Info read FSemantics write Set_Semantics;
		property ParameterCount: Integer read Get_ParameterCount;
		property Parameters[Index: Integer]: RParameter read Get_Parameter;
		property Result: RClass read FResult write Set_Result;
  end;

	// RPartition
	RPartition = class(RPetalModel)
  private
		{ Member Fields }
		FCreationObj: Boolean;
		FMulti: Boolean;
		FPersistence: RPersistenceKind;
		FClass: RClass;
		{ Getter/Setter }
		procedure Set_CreationObj(Value: Boolean);
		procedure Set_Multi(Value: Boolean);
		procedure Set_Persistence(Value: RPersistenceKind);
		procedure Set_Class(Value: RClass);
  public
		{ Properties }
		property CreationObj: Boolean read FCreationObj write Set_CreationObj;
		property Multi: Boolean read FMulti write Set_Multi;
		property Persistence: RPersistenceKind read FPersistence write Set_Persistence;
		property Class_: RClass read FClass write Set_Class;
  end;

	// RState_Machine
	RState_Machine = class(RPetalModel)
  private
		{ Member Fields }
		FObjects: TList;
		FPartitions: TList;
		FStates: TList;
		FStatediagrams: TList;
		{ Getter/Setter }
		function Get_ObjectCount: Integer;
		function Get_Object(Index: Integer): RObject;
		function Get_PartitionCount: Integer;
		function Get_Partition(Index: Integer): RPartition;
		function Get_StateCount: Integer;
		function Get_State(Index: Integer): RPetalStateVertex;
		function Get_StatediagramCount: Integer;
		function Get_Statediagram(Index: Integer): RAbstractStateDiagaram;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Object(Value: RObject);
		procedure Remove_Object(Value: RObject);
		procedure Insert_Object(Index: Integer; Value: RObject);
		procedure Delete_Object(Index: Integer);
		procedure Add_Partition(Value: RPartition);
		procedure Remove_Partition(Value: RPartition);
		procedure Insert_Partition(Index: Integer; Value: RPartition);
		procedure Delete_Partition(Index: Integer);
		procedure Add_State(Value: RPetalStateVertex);
		procedure Remove_State(Value: RPetalStateVertex);
		procedure Insert_State(Index: Integer; Value: RPetalStateVertex);
		procedure Delete_State(Index: Integer);
		procedure Add_Statediagram(Value: RAbstractStateDiagaram);
		procedure Remove_Statediagram(Value: RAbstractStateDiagaram);
		procedure Insert_Statediagram(Index: Integer; Value: RAbstractStateDiagaram);
		procedure Delete_Statediagram(Index: Integer);
		{ Properties }
		property ObjectCount: Integer read Get_ObjectCount;
		property Objects[Index: Integer]: RObject read Get_Object;
		property PartitionCount: Integer read Get_PartitionCount;
		property Partitions[Index: Integer]: RPartition read Get_Partition;
		property StateCount: Integer read Get_StateCount;
		property States[Index: Integer]: RPetalStateVertex read Get_State;
		property StatediagramCount: Integer read Get_StatediagramCount;
		property Statediagrams[Index: Integer]: RAbstractStateDiagaram read Get_Statediagram;
  end;

	// RUseCase
	RUseCase = class(RPetalModel)
  private
		{ Member Fields }
		FAbstract: Boolean;
		FRank: string;
		FLogical_models: TList;
		FLogical_presentations: TList;
		FStatemachine: RState_Machine;
		FSuperclasses: TList;
		FVisible_modules: TList;
		{ Getter/Setter }
		procedure Set_Abstract(Value: Boolean);
		procedure Set_Rank(Value: string);
		function Get_Logical_modelCount: Integer;
		function Get_Logical_model(Index: Integer): RPetalModel;
		function Get_Logical_presentationCount: Integer;
		function Get_Logical_presentation(Index: Integer): RPetalDiagram;
		procedure Set_Statemachine(Value: RState_Machine);
		function Get_SuperclassCount: Integer;
		function Get_Superclass(Index: Integer): RInheritance_Relationship;
		function Get_Visible_moduleCount: Integer;
		function Get_Visible_module(Index: Integer): RDependency_Relationship;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Logical_model(Value: RPetalModel);
		procedure Remove_Logical_model(Value: RPetalModel);
		procedure Insert_Logical_model(Index: Integer; Value: RPetalModel);
		procedure Delete_Logical_model(Index: Integer);
		procedure Add_Logical_presentation(Value: RPetalDiagram);
		procedure Remove_Logical_presentation(Value: RPetalDiagram);
		procedure Insert_Logical_presentation(Index: Integer; Value: RPetalDiagram);
		procedure Delete_Logical_presentation(Index: Integer);
		procedure Add_Superclass(Value: RInheritance_Relationship);
		procedure Remove_Superclass(Value: RInheritance_Relationship);
		procedure Insert_Superclass(Index: Integer; Value: RInheritance_Relationship);
		procedure Delete_Superclass(Index: Integer);
		procedure Add_Visible_module(Value: RDependency_Relationship);
		procedure Remove_Visible_module(Value: RDependency_Relationship);
		procedure Insert_Visible_module(Index: Integer; Value: RDependency_Relationship);
		procedure Delete_Visible_module(Index: Integer);
		{ Properties }
		property Abstract: Boolean read FAbstract write Set_Abstract;
		property Rank: string read FRank write Set_Rank;
		property Logical_modelCount: Integer read Get_Logical_modelCount;
		property Logical_models[Index: Integer]: RPetalModel read Get_Logical_model;
		property Logical_presentationCount: Integer read Get_Logical_presentationCount;
		property Logical_presentations[Index: Integer]: RPetalDiagram read Get_Logical_presentation;
		property Statemachine: RState_Machine read FStatemachine write Set_Statemachine;
		property SuperclassCount: Integer read Get_SuperclassCount;
		property Superclasses[Index: Integer]: RInheritance_Relationship read Get_Superclass;
		property Visible_moduleCount: Integer read Get_Visible_moduleCount;
		property Visible_modules[Index: Integer]: RDependency_Relationship read Get_Visible_module;
  end;

	// RModule
	RModule = class(RPetalModel)
  private
		{ Member Fields }
		FDeclarations: string;
		FLanguage: string;
		FVisible_modules: TList;
		FRealized_interfaces: TList;
		{ Getter/Setter }
		procedure Set_Declarations(Value: string);
		procedure Set_Language(Value: string);
		function Get_Visible_moduleCount: Integer;
		function Get_Visible_module(Index: Integer): RModule_Visibility_Relationship;
		function Get_Realized_interfaceCount: Integer;
		function Get_Realized_interface(Index: Integer): RRealize_Relationship;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Visible_module(Value: RModule_Visibility_Relationship);
		procedure Remove_Visible_module(Value: RModule_Visibility_Relationship);
		procedure Insert_Visible_module(Index: Integer; Value: RModule_Visibility_Relationship);
		procedure Delete_Visible_module(Index: Integer);
		procedure Add_Realized_interface(Value: RRealize_Relationship);
		procedure Remove_Realized_interface(Value: RRealize_Relationship);
		procedure Insert_Realized_interface(Index: Integer; Value: RRealize_Relationship);
		procedure Delete_Realized_interface(Index: Integer);
		{ Properties }
		property Declarations: string read FDeclarations write Set_Declarations;
		property Language: string read FLanguage write Set_Language;
		property Visible_moduleCount: Integer read Get_Visible_moduleCount;
		property Visible_modules[Index: Integer]: RModule_Visibility_Relationship read Get_Visible_module;
		property Realized_interfaceCount: Integer read Get_Realized_interfaceCount;
		property Realized_interfaces[Index: Integer]: RRealize_Relationship read Get_Realized_interface;
  end;

	// RPetalDeploymentNode
	RPetalDeploymentNode = class(RPetalModel)
  private
		{ Member Fields }
		FCharacteristics: string;
		FConnections: TList;
		{ Getter/Setter }
		procedure Set_Characteristics(Value: string);
		function Get_ConnectionCount: Integer;
		function Get_Connection(Index: Integer): RConnection_Relationship;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Connection(Value: RConnection_Relationship);
		procedure Remove_Connection(Value: RConnection_Relationship);
		procedure Insert_Connection(Index: Integer; Value: RConnection_Relationship);
		procedure Delete_Connection(Index: Integer);
		{ Properties }
		property Characteristics: string read FCharacteristics write Set_Characteristics;
		property ConnectionCount: Integer read Get_ConnectionCount;
		property Connections[Index: Integer]: RConnection_Relationship read Get_Connection;
  end;

	// RDevice
	RDevice = class(RPetalDeploymentNode)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RProcessor
	RProcessor = class(RPetalDeploymentNode)
  private
		{ Member Fields }
		FScheduling: RProcessorSchedulingKind;
		FProcesses: TList;
		{ Getter/Setter }
		procedure Set_Scheduling(Value: RProcessorSchedulingKind);
		function Get_ProcessCount: Integer;
		function Get_Process(Index: Integer): RProcess;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Process(Value: RProcess);
		procedure Remove_Process(Value: RProcess);
		procedure Insert_Process(Index: Integer; Value: RProcess);
		procedure Delete_Process(Index: Integer);
		{ Properties }
		property Scheduling: RProcessorSchedulingKind read FScheduling write Set_Scheduling;
		property ProcessCount: Integer read Get_ProcessCount;
		property Processes[Index: Integer]: RProcess read Get_Process;
  end;

	// RParameter
	RParameter = class(RPetalModel)
  private
		{ Member Fields }
		FInitv: string;
		FTypeExpression: string;
		FType_: RClass;
		{ Getter/Setter }
		procedure Set_Initv(Value: string);
		procedure Set_TypeExpression(Value: string);
		procedure Set_Type_(Value: RClass);
  public
		{ Properties }
		property Initv: string read FInitv write Set_Initv;
		property TypeExpression: string read FTypeExpression write Set_TypeExpression;
		property Type_: RClass read FType_ write Set_Type_;
  end;

	// RProcess
	RProcess = class(RPetalModel)
  private
		{ Member Fields }
		FPriority: string;
		{ Getter/Setter }
		procedure Set_Priority(Value: string);
  public
		{ Properties }
		property Priority: string read FPriority write Set_Priority;
  end;

	// RProcesses
	RProcesses = class(RPetalModel)
  private
		{ Member Fields }
		FProcsNDevs: TList;
		{ Getter/Setter }
		function Get_ProcsNDevCount: Integer;
		function Get_ProcsNDev(Index: Integer): RPetalModel;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_ProcsNDev(Value: RPetalModel);
		procedure Remove_ProcsNDev(Value: RPetalModel);
		procedure Insert_ProcsNDev(Index: Integer; Value: RPetalModel);
		procedure Delete_ProcsNDev(Index: Integer);
		{ Properties }
		property ProcsNDevCount: Integer read Get_ProcsNDevCount;
		property ProcsNDevs[Index: Integer]: RPetalModel read Get_ProcsNDev;
  end;

	// RPetalRelationship
	RPetalRelationship = class(RPetalModel)
  private
		{ Member Fields }
		FLabel_: string;
		FSupplier: RPetalModel;
		{ Getter/Setter }
		procedure Set_Label_(Value: string);
		procedure Set_Supplier(Value: RPetalModel);
  public
		{ Properties }
		property Label_: string read FLabel_ write Set_Label_;
		property Supplier: RPetalModel read FSupplier write Set_Supplier;
  end;

	// RUses_Relationship
	RUses_Relationship = class(RPetalRelationship)
  private
		{ Member Fields }
		FFriend: Boolean;
		FClient_cardinality: string;
		FSupplier_cardinality: string;
		{ Getter/Setter }
		procedure Set_Friend(Value: Boolean);
		procedure Set_Client_cardinality(Value: string);
		procedure Set_Supplier_cardinality(Value: string);
  public
		{ Properties }
		property Friend: Boolean read FFriend write Set_Friend;
		property Client_cardinality: string read FClient_cardinality write Set_Client_cardinality;
		property Supplier_cardinality: string read FSupplier_cardinality write Set_Supplier_cardinality;
  end;

	// RDependency_Relationship
	RDependency_Relationship = class(RPetalRelationship)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RConnection_Relationship
	RConnection_Relationship = class(RPetalRelationship)
  private
		{ Member Fields }
		FSupplier_is_device: Boolean;
		FCharacteristics: string;
		{ Getter/Setter }
		procedure Set_Supplier_is_device(Value: Boolean);
		procedure Set_Characteristics(Value: string);
  public
		{ Properties }
		property Supplier_is_device: Boolean read FSupplier_is_device write Set_Supplier_is_device;
		property Characteristics: string read FCharacteristics write Set_Characteristics;
  end;

	// RInheritance_Relationship
	RInheritance_Relationship = class(RPetalRelationship)
  private
		{ Member Fields }
		FFriend: Boolean;
		FVirtual: Boolean;
		{ Getter/Setter }
		procedure Set_Friend(Value: Boolean);
		procedure Set_Virtual(Value: Boolean);
  public
		{ Properties }
		property Friend: Boolean read FFriend write Set_Friend;
		property Virtual: Boolean read FVirtual write Set_Virtual;
  end;

	// RModule_Visibility_Relationship
	RModule_Visibility_Relationship = class(RPetalRelationship)
  private
		{ Member Fields }
		FSupplier_is_spec: Boolean;
		FSupplier_is_subsystem: Boolean;
		{ Getter/Setter }
		procedure Set_Supplier_is_spec(Value: Boolean);
		procedure Set_Supplier_is_subsystem(Value: Boolean);
  public
		{ Properties }
		property Supplier_is_spec: Boolean read FSupplier_is_spec write Set_Supplier_is_spec;
		property Supplier_is_subsystem: Boolean read FSupplier_is_subsystem write Set_Supplier_is_subsystem;
  end;

	// RRealize_Relationship
	RRealize_Relationship = class(RPetalRelationship)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RState_Transition
	RState_Transition = class(RPetalRelationship)
  private
		{ Member Fields }
		FCondition: string;
		FEvent: REvent;
		FAction: RAction;
		FSendEvent: RSendEvent;
		{ Getter/Setter }
		procedure Set_Condition(Value: string);
		procedure Set_Event(Value: REvent);
		procedure Set_Action(Value: RAction);
		procedure Set_SendEvent(Value: RSendEvent);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property Condition: string read FCondition write Set_Condition;
		property Event: REvent read FEvent write Set_Event;
		property Action: RAction read FAction write Set_Action;
		property SendEvent: RSendEvent read FSendEvent write Set_SendEvent;
  end;

	// RVisibility_Relationship
	RVisibility_Relationship = class(RPetalRelationship)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RRole
	RRole = class(RPetalRelationship)
  private
		{ Member Fields }
		FContainment: RContainmentKind;
		FFriend: Boolean;
		FIs_aggregate: Boolean;
		FIs_navigable: Boolean;
		FIs_principal: Boolean;
		FStatic: Boolean;
		FConstraints: string;
		Fclient_cardinality: string;
		FKeies: TList;
		{ Getter/Setter }
		procedure Set_Containment(Value: RContainmentKind);
		procedure Set_Friend(Value: Boolean);
		procedure Set_Is_aggregate(Value: Boolean);
		procedure Set_Is_navigable(Value: Boolean);
		procedure Set_Is_principal(Value: Boolean);
		procedure Set_Static(Value: Boolean);
		procedure Set_Constraints(Value: string);
		procedure Set_client_cardinality(Value: string);
		function Get_KeyCount: Integer;
		function Get_Key(Index: Integer): RClassAttribute;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Key(Value: RClassAttribute);
		procedure Remove_Key(Value: RClassAttribute);
		procedure Insert_Key(Index: Integer; Value: RClassAttribute);
		procedure Delete_Key(Index: Integer);
		{ Properties }
		property Containment: RContainmentKind read FContainment write Set_Containment;
		property Friend: Boolean read FFriend write Set_Friend;
		property Is_aggregate: Boolean read FIs_aggregate write Set_Is_aggregate;
		property Is_navigable: Boolean read FIs_navigable write Set_Is_navigable;
		property Is_principal: Boolean read FIs_principal write Set_Is_principal;
		property Static: Boolean read FStatic write Set_Static;
		property Constraints: string read FConstraints write Set_Constraints;
		property client_cardinality: string read Fclient_cardinality write Set_client_cardinality;
		property KeyCount: Integer read Get_KeyCount;
		property Keies[Index: Integer]: RClassAttribute read Get_Key;
  end;

	// RLink
	RLink = class(RPetalRelationship)
  private
		{ Member Fields }
		FClient_containment: RContainmentKind;
		FClient_visibility: RLinkVisibilityKind;
		FSupplier_containment: RContainmentKind;
		FSupplier_visibility: RLinkVisibilityKind;
		FAssociation: RAssociation;
		FMessages: TList;
		{ Getter/Setter }
		procedure Set_Client_containment(Value: RContainmentKind);
		procedure Set_Client_visibility(Value: RLinkVisibilityKind);
		procedure Set_Supplier_containment(Value: RContainmentKind);
		procedure Set_Supplier_visibility(Value: RLinkVisibilityKind);
		procedure Set_Association(Value: RAssociation);
		function Get_MessageCount: Integer;
		function Get_Message(Index: Integer): RMessage;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Message(Value: RMessage);
		procedure Remove_Message(Value: RMessage);
		procedure Insert_Message(Index: Integer; Value: RMessage);
		procedure Delete_Message(Index: Integer);
		{ Properties }
		property Client_containment: RContainmentKind read FClient_containment write Set_Client_containment;
		property Client_visibility: RLinkVisibilityKind read FClient_visibility write Set_Client_visibility;
		property Supplier_containment: RContainmentKind read FSupplier_containment write Set_Supplier_containment;
		property Supplier_visibility: RLinkVisibilityKind read FSupplier_visibility write Set_Supplier_visibility;
		property Association: RAssociation read FAssociation write Set_Association;
		property MessageCount: Integer read Get_MessageCount;
		property Messages[Index: Integer]: RMessage read Get_Message;
  end;

	// RPetalStateVertex
	RPetalStateVertex = class(RPetalModel)
  private
		{ Member Fields }
		FTransitions: TList;
		{ Getter/Setter }
		function Get_TransitionCount: Integer;
		function Get_Transition(Index: Integer): RState_Transition;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Transition(Value: RState_Transition);
		procedure Remove_Transition(Value: RState_Transition);
		procedure Insert_Transition(Index: Integer; Value: RState_Transition);
		procedure Delete_Transition(Index: Integer);
		{ Properties }
		property TransitionCount: Integer read Get_TransitionCount;
		property Transitions[Index: Integer]: RState_Transition read Get_Transition;
  end;

	// RState
	RState = class(RPetalStateVertex)
  private
		{ Member Fields }
		FType_: RStateKind;
		FStatemachine: RState_Machine;
		FActions: TList;
		{ Getter/Setter }
		procedure Set_Type_(Value: RStateKind);
		procedure Set_Statemachine(Value: RState_Machine);
		function Get_ActionCount: Integer;
		function Get_Action(Index: Integer): RAction;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Action(Value: RAction);
		procedure Remove_Action(Value: RAction);
		procedure Insert_Action(Index: Integer; Value: RAction);
		procedure Delete_Action(Index: Integer);
		{ Properties }
		property Type_: RStateKind read FType_ write Set_Type_;
		property Statemachine: RState_Machine read FStatemachine write Set_Statemachine;
		property ActionCount: Integer read Get_ActionCount;
		property Actions[Index: Integer]: RAction read Get_Action;
  end;

	// RActivityState
	RActivityState = class(RPetalStateVertex)
  private
		{ Member Fields }
		FStatemachine: RState_Machine;
		FActions: TList;
		{ Getter/Setter }
		procedure Set_Statemachine(Value: RState_Machine);
		function Get_ActionCount: Integer;
		function Get_Action(Index: Integer): RAction;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Action(Value: RAction);
		procedure Remove_Action(Value: RAction);
		procedure Insert_Action(Index: Integer; Value: RAction);
		procedure Delete_Action(Index: Integer);
		{ Properties }
		property Statemachine: RState_Machine read FStatemachine write Set_Statemachine;
		property ActionCount: Integer read Get_ActionCount;
		property Actions[Index: Integer]: RAction read Get_Action;
  end;

	// RSynchronizationState
	RSynchronizationState = class(RPetalStateVertex)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RDecision
	RDecision = class(RPetalStateVertex)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RSubSystem
	RSubSystem = class(RPetalModel)
  private
		{ Member Fields }
		FPhysical_models: TList;
		FPhysical_presentations: TList;
		FVisible_modules: TList;
		{ Getter/Setter }
		function Get_Physical_modelCount: Integer;
		function Get_Physical_model(Index: Integer): RPetalModel;
		function Get_Physical_presentationCount: Integer;
		function Get_Physical_presentation(Index: Integer): RModule_Diagram;
		function Get_Visible_moduleCount: Integer;
		function Get_Visible_module(Index: Integer): RModule_Visibility_Relationship;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Physical_model(Value: RPetalModel);
		procedure Remove_Physical_model(Value: RPetalModel);
		procedure Insert_Physical_model(Index: Integer; Value: RPetalModel);
		procedure Delete_Physical_model(Index: Integer);
		procedure Add_Physical_presentation(Value: RModule_Diagram);
		procedure Remove_Physical_presentation(Value: RModule_Diagram);
		procedure Insert_Physical_presentation(Index: Integer; Value: RModule_Diagram);
		procedure Delete_Physical_presentation(Index: Integer);
		procedure Add_Visible_module(Value: RModule_Visibility_Relationship);
		procedure Remove_Visible_module(Value: RModule_Visibility_Relationship);
		procedure Insert_Visible_module(Index: Integer; Value: RModule_Visibility_Relationship);
		procedure Delete_Visible_module(Index: Integer);
		{ Properties }
		property Physical_modelCount: Integer read Get_Physical_modelCount;
		property Physical_models[Index: Integer]: RPetalModel read Get_Physical_model;
		property Physical_presentationCount: Integer read Get_Physical_presentationCount;
		property Physical_presentations[Index: Integer]: RModule_Diagram read Get_Physical_presentation;
		property Visible_moduleCount: Integer read Get_Visible_moduleCount;
		property Visible_modules[Index: Integer]: RModule_Visibility_Relationship read Get_Visible_module;
  end;

	// RSendEvent
	RSendEvent = class(RPetalModel)
  private
		{ Member Fields }
		FParameters: string;
		FTarget: string;
		FActionTime: RActionTime;
		FEvent: REvent;
		{ Getter/Setter }
		procedure Set_Parameters(Value: string);
		procedure Set_Target(Value: string);
		procedure Set_ActionTime(Value: RActionTime);
		procedure Set_Event(Value: REvent);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property Parameters: string read FParameters write Set_Parameters;
		property Target: string read FTarget write Set_Target;
		property ActionTime: RActionTime read FActionTime write Set_ActionTime;
		property Event: REvent read FEvent write Set_Event;
  end;

	// RAction
	RAction = class(RPetalModel)
  private
		{ Member Fields }
		FQuid: string;
		FActionTime: RActionTime;
		{ Getter/Setter }
		procedure Set_Quid(Value: string);
		procedure Set_ActionTime(Value: RActionTime);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property Quid: string read FQuid write Set_Quid;
		property ActionTime: RActionTime read FActionTime write Set_ActionTime;
  end;

	// RMechanism
	RMechanism = class(RPetalModel)
  private
		{ Member Fields }
		FTag: Integer;
		FLogical_models: TList;
		{ Getter/Setter }
		procedure Set_Tag(Value: Integer);
		function Get_Logical_modelCount: Integer;
		function Get_Logical_model(Index: Integer): RObject;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Logical_model(Value: RObject);
		procedure Remove_Logical_model(Value: RObject);
		procedure Insert_Logical_model(Index: Integer; Value: RObject);
		procedure Delete_Logical_model(Index: Integer);
		{ Properties }
		property Tag: Integer read FTag write Set_Tag;
		property Logical_modelCount: Integer read Get_Logical_modelCount;
		property Logical_models[Index: Integer]: RObject read Get_Logical_model;
  end;

	// RPetalView
	RPetalView = class(RPetalIdentifier)
  private
		{ Member Fields }
		FTag: Integer;
		FLine_color: Integer;
		FFill_color: Integer;
		FFont: RFont;
		FModel: RPetalModel;
		FParent_View: RPetalView;
		FLabel_s: TList;
		FStereotype: RPetalLabelView;
		FVertices: TList;
		{ Getter/Setter }
		procedure Set_Tag(Value: Integer);
		procedure Set_Line_color(Value: Integer);
		procedure Set_Fill_color(Value: Integer);
		procedure Set_Font(Value: RFont);
		procedure Set_Model(Value: RPetalModel);
		procedure Set_Parent_View(Value: RPetalView);
		function Get_Label_Count: Integer;
		function Get_Label_(Index: Integer): RPetalLabelView;
		procedure Set_Stereotype(Value: RPetalLabelView);
		function Get_VertexCount: Integer;
		function Get_Vertex(Index: Integer): RPoint;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Label_(Value: RPetalLabelView);
		procedure Remove_Label_(Value: RPetalLabelView);
		procedure Insert_Label_(Index: Integer; Value: RPetalLabelView);
		procedure Delete_Label_(Index: Integer);
		procedure Add_Vertex(Value: RPoint);
		procedure Remove_Vertex(Value: RPoint);
		procedure Insert_Vertex(Index: Integer; Value: RPoint);
		procedure Delete_Vertex(Index: Integer);
		{ Properties }
		property Tag: Integer read FTag write Set_Tag;
		property Line_color: Integer read FLine_color write Set_Line_color;
		property Fill_color: Integer read FFill_color write Set_Fill_color;
		property Font: RFont read FFont write Set_Font;
		property Model: RPetalModel read FModel write Set_Model;
		property Parent_View: RPetalView read FParent_View write Set_Parent_View;
		property Label_Count: Integer read Get_Label_Count;
		property Label_s[Index: Integer]: RPetalLabelView read Get_Label_;
		property Stereotype: RPetalLabelView read FStereotype write Set_Stereotype;
		property VertexCount: Integer read Get_VertexCount;
		property Vertices[Index: Integer]: RPoint read Get_Vertex;
  end;

	// RPetalNodeView
	RPetalNodeView = class(RPetalView)
  private
		{ Member Fields }
		FAutoResize: Boolean;
		FIcon_style: RIconStyleKind;
		FLocation: TPoint;
		FHeight: Integer;
		FWidth: Integer;
		{ Getter/Setter }
		procedure Set_AutoResize(Value: Boolean);
		procedure Set_Icon_style(Value: RIconStyleKind);
		procedure Set_Location(Value: TPoint);
		procedure Set_Height(Value: Integer);
		procedure Set_Width(Value: Integer);
  public
		{ Properties }
		property AutoResize: Boolean read FAutoResize write Set_AutoResize;
		property Icon_style: RIconStyleKind read FIcon_style write Set_Icon_style;
		property Location: TPoint read FLocation write Set_Location;
		property Height: Integer read FHeight write Set_Height;
		property Width: Integer read FWidth write Set_Width;
  end;

	// RClassView
	RClassView = class(RPetalNodeView)
  private
		{ Member Fields }
		FIncludeAttribute: Boolean;
		FIncludeOperation: Boolean;
		FShowCompartmentStereotypes: Boolean;
		FShowOperationSignature: Boolean;
		FAnnotation: Integer;
		FIcon: string;
		FSuppressAttribute: Boolean;
		FSuppressOperation: Boolean;
		FCompartment: RCompartment;
		{ Getter/Setter }
		procedure Set_IncludeAttribute(Value: Boolean);
		procedure Set_IncludeOperation(Value: Boolean);
		procedure Set_ShowCompartmentStereotypes(Value: Boolean);
		procedure Set_ShowOperationSignature(Value: Boolean);
		procedure Set_Annotation(Value: Integer);
		procedure Set_Icon(Value: string);
		procedure Set_SuppressAttribute(Value: Boolean);
		procedure Set_SuppressOperation(Value: Boolean);
		procedure Set_Compartment(Value: RCompartment);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property IncludeAttribute: Boolean read FIncludeAttribute write Set_IncludeAttribute;
		property IncludeOperation: Boolean read FIncludeOperation write Set_IncludeOperation;
		property ShowCompartmentStereotypes: Boolean read FShowCompartmentStereotypes write Set_ShowCompartmentStereotypes;
		property ShowOperationSignature: Boolean read FShowOperationSignature write Set_ShowOperationSignature;
		property Annotation: Integer read FAnnotation write Set_Annotation;
		property Icon: string read FIcon write Set_Icon;
		property SuppressAttribute: Boolean read FSuppressAttribute write Set_SuppressAttribute;
		property SuppressOperation: Boolean read FSuppressOperation write Set_SuppressOperation;
		property Compartment: RCompartment read FCompartment write Set_Compartment;
  end;

	// RCategoryView
	RCategoryView = class(RPetalNodeView)
  private
		{ Member Fields }
		FIcon: string;
		{ Getter/Setter }
		procedure Set_Icon(Value: string);
  public
		{ Properties }
		property Icon: string read FIcon write Set_Icon;
  end;

	// RUseCaseView
	RUseCaseView = class(RPetalNodeView)
  private
		{ Member Fields }
		FIcon: string;
		{ Getter/Setter }
		procedure Set_Icon(Value: string);
  public
		{ Properties }
		property Icon: string read FIcon write Set_Icon;
  end;

	// RActivityStateView
	RActivityStateView = class(RPetalNodeView)
  private
		{ Member Fields }
		FAnnotation: Integer;
		FCompartment: RCompartment;
		{ Getter/Setter }
		procedure Set_Annotation(Value: Integer);
		procedure Set_Compartment(Value: RCompartment);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property Annotation: Integer read FAnnotation write Set_Annotation;
		property Compartment: RCompartment read FCompartment write Set_Compartment;
  end;

	// RClassInstanceView
	RClassInstanceView = class(RPetalNodeView)
  private
		{ Member Fields }
		FAnnotation: Integer;
		FIcon: string;
		{ Getter/Setter }
		procedure Set_Annotation(Value: Integer);
		procedure Set_Icon(Value: string);
  public
		{ Properties }
		property Annotation: Integer read FAnnotation write Set_Annotation;
		property Icon: string read FIcon write Set_Icon;
  end;

	// RCompartment
	RCompartment = class(RPetalNodeView)
  private
		{ Member Fields }
		FAnchor: Integer;
		FJustify: Integer;
		FMax_width: Integer;
		FNlines: Integer;
		FCompartmentItems: TList;
		{ Getter/Setter }
		procedure Set_Anchor(Value: Integer);
		procedure Set_Justify(Value: Integer);
		procedure Set_Max_width(Value: Integer);
		procedure Set_Nlines(Value: Integer);
		function Get_CompartmentItemCount: Integer;
		function Get_CompartmentItem(Index: Integer): RCompartment;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_CompartmentItem(Value: RCompartment);
		procedure Remove_CompartmentItem(Value: RCompartment);
		procedure Insert_CompartmentItem(Index: Integer; Value: RCompartment);
		procedure Delete_CompartmentItem(Index: Integer);
		{ Properties }
		property Anchor: Integer read FAnchor write Set_Anchor;
		property Justify: Integer read FJustify write Set_Justify;
		property Max_width: Integer read FMax_width write Set_Max_width;
		property Nlines: Integer read FNlines write Set_Nlines;
		property CompartmentItemCount: Integer read Get_CompartmentItemCount;
		property CompartmentItems[Index: Integer]: RCompartment read Get_CompartmentItem;
  end;

	// RDecisionView
	RDecisionView = class(RPetalNodeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RDestruction_Marker
	RDestruction_Marker = class(RPetalNodeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RDeviceView
	RDeviceView = class(RPetalNodeView)
  private
		{ Member Fields }
		FAnnotation: Integer;
		{ Getter/Setter }
		procedure Set_Annotation(Value: Integer);
  public
		{ Properties }
		property Annotation: Integer read FAnnotation write Set_Annotation;
  end;

	// RInterObjView
	RInterObjView = class(RPetalNodeView)
  private
		{ Member Fields }
		FAnnotation: Integer;
		FIcon: string;
		FIcon_height: Integer;
		FIcon_width: Integer;
		FIcon_y_offset: Integer;
		FFocus_Of_Controls: TList;
		{ Getter/Setter }
		procedure Set_Annotation(Value: Integer);
		procedure Set_Icon(Value: string);
		procedure Set_Icon_height(Value: Integer);
		procedure Set_Icon_width(Value: Integer);
		procedure Set_Icon_y_offset(Value: Integer);
		function Get_Focus_Of_ControlCount: Integer;
		function Get_Focus_Of_Control(Index: Integer): RFocus_Of_Control;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Focus_Of_Control(Value: RFocus_Of_Control);
		procedure Remove_Focus_Of_Control(Value: RFocus_Of_Control);
		procedure Insert_Focus_Of_Control(Index: Integer; Value: RFocus_Of_Control);
		procedure Delete_Focus_Of_Control(Index: Integer);
		{ Properties }
		property Annotation: Integer read FAnnotation write Set_Annotation;
		property Icon: string read FIcon write Set_Icon;
		property Icon_height: Integer read FIcon_height write Set_Icon_height;
		property Icon_width: Integer read FIcon_width write Set_Icon_width;
		property Icon_y_offset: Integer read FIcon_y_offset write Set_Icon_y_offset;
		property Focus_Of_ControlCount: Integer read Get_Focus_Of_ControlCount;
		property Focus_Of_Controls[Index: Integer]: RFocus_Of_Control read Get_Focus_Of_Control;
  end;

	// RModView
	RModView = class(RPetalNodeView)
  private
		{ Member Fields }
		FIcon: string;
		{ Getter/Setter }
		procedure Set_Icon(Value: string);
  public
		{ Properties }
		property Icon: string read FIcon write Set_Icon;
  end;

	// RObjectView
	RObjectView = class(RPetalNodeView)
  private
		{ Member Fields }
		FAnnotation: Integer;
		FSubobjects: Integer;
		FX_offset: Real;
		FY_offset: Real;
		FIcon: string;
		FCompartment: RCompartment;
		{ Getter/Setter }
		procedure Set_Annotation(Value: Integer);
		procedure Set_Subobjects(Value: Integer);
		procedure Set_X_offset(Value: Real);
		procedure Set_Y_offset(Value: Real);
		procedure Set_Icon(Value: string);
		procedure Set_Compartment(Value: RCompartment);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property Annotation: Integer read FAnnotation write Set_Annotation;
		property Subobjects: Integer read FSubobjects write Set_Subobjects;
		property X_offset: Real read FX_offset write Set_X_offset;
		property Y_offset: Real read FY_offset write Set_Y_offset;
		property Icon: string read FIcon write Set_Icon;
		property Compartment: RCompartment read FCompartment write Set_Compartment;
  end;

	// RProcessorView
	RProcessorView = class(RPetalNodeView)
  private
		{ Member Fields }
		FAnnotation: Integer;
		{ Getter/Setter }
		procedure Set_Annotation(Value: Integer);
  public
		{ Properties }
		property Annotation: Integer read FAnnotation write Set_Annotation;
  end;

	// RStateView
	RStateView = class(RPetalNodeView)
  private
		{ Member Fields }
		FCompartment: RCompartment;
		{ Getter/Setter }
		procedure Set_Compartment(Value: RCompartment);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property Compartment: RCompartment read FCompartment write Set_Compartment;
  end;

	// RSubSysView
	RSubSysView = class(RPetalNodeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RFocus_Of_Control
	RFocus_Of_Control = class(RPetalNodeView)
  private
		{ Member Fields }
		FNested: Boolean;
		FY_coord: Integer;
		FInterObjView: RInterObjView;
		{ Getter/Setter }
		procedure Set_Nested(Value: Boolean);
		procedure Set_Y_coord(Value: Integer);
		procedure Set_InterObjView(Value: RInterObjView);
  public
		{ Properties }
		property Nested: Boolean read FNested write Set_Nested;
		property Y_coord: Integer read FY_coord write Set_Y_coord;
		property InterObjView: RInterObjView read FInterObjView write Set_InterObjView;
  end;

	// RInterfaceView
	RInterfaceView = class(RPetalNodeView)
  private
		{ Member Fields }
		FIcon: string;
		{ Getter/Setter }
		procedure Set_Icon(Value: string);
  public
		{ Properties }
		property Icon: string read FIcon write Set_Icon;
  end;

	// RNoteView
	RNoteView = class(RPetalNodeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RSwimlane
	RSwimlane = class(RPetalNodeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RSynchronizationView
	RSynchronizationView = class(RPetalNodeView)
  private
		{ Member Fields }
		FSync_flow_direction: RSynchFlowDirectionKind;
		FSync_is_horizontal: Boolean;
		{ Getter/Setter }
		procedure Set_Sync_flow_direction(Value: RSynchFlowDirectionKind);
		procedure Set_Sync_is_horizontal(Value: Boolean);
  public
		{ Properties }
		property Sync_flow_direction: RSynchFlowDirectionKind read FSync_flow_direction write Set_Sync_flow_direction;
		property Sync_is_horizontal: Boolean read FSync_is_horizontal write Set_Sync_is_horizontal;
  end;

	// RTierView
	RTierView = class(RPetalNodeView)
  private
		{ Member Fields }
		FHidden: Boolean;
		{ Getter/Setter }
		procedure Set_Hidden(Value: Boolean);
  public
		{ Properties }
		property Hidden: Boolean read FHidden write Set_Hidden;
  end;

	// RPetalLabelView
	RPetalLabelView = class(RPetalNodeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RItemLabel
	RItemLabel = class(RPetalLabelView)
  private
		{ Member Fields }
		FAnchor: Integer;
		FAnchor_loc: Integer;
		FHidden: Boolean;
		FJustify: Integer;
		FLabel_: string;
		FMax_width: Integer;
		FNlines: Integer;
		{ Getter/Setter }
		procedure Set_Anchor(Value: Integer);
		procedure Set_Anchor_loc(Value: Integer);
		procedure Set_Hidden(Value: Boolean);
		procedure Set_Justify(Value: Integer);
		procedure Set_Label_(Value: string);
		procedure Set_Max_width(Value: Integer);
		procedure Set_Nlines(Value: Integer);
  public
		{ Properties }
		property Anchor: Integer read FAnchor write Set_Anchor;
		property Anchor_loc: Integer read FAnchor_loc write Set_Anchor_loc;
		property Hidden: Boolean read FHidden write Set_Hidden;
		property Justify: Integer read FJustify write Set_Justify;
		property Label_: string read FLabel_ write Set_Label_;
		property Max_width: Integer read FMax_width write Set_Max_width;
		property Nlines: Integer read FNlines write Set_Nlines;
  end;

	// RLabel
	RLabel = class(RPetalLabelView)
  private
		{ Member Fields }
		FMax_width: Integer;
		FNlines: Integer;
		FLabel_: string;
		{ Getter/Setter }
		procedure Set_Max_width(Value: Integer);
		procedure Set_Nlines(Value: Integer);
		procedure Set_Label_(Value: string);
  public
		{ Properties }
		property Max_width: Integer read FMax_width write Set_Max_width;
		property Nlines: Integer read FNlines write Set_Nlines;
		property Label_: string read FLabel_ write Set_Label_;
  end;

	// RSegLabel
	RSegLabel = class(RPetalLabelView)
  private
		{ Member Fields }
		FAnchor: Integer;
		FAnchor_loc: Integer;
		FHidden: Boolean;
		FJustify: Integer;
		FLabel_: string;
		FMax_width: Integer;
		FNlines: Integer;
		FOrientation: Integer;
		FPctDist: Real;
		{ Getter/Setter }
		procedure Set_Anchor(Value: Integer);
		procedure Set_Anchor_loc(Value: Integer);
		procedure Set_Hidden(Value: Boolean);
		procedure Set_Justify(Value: Integer);
		procedure Set_Label_(Value: string);
		procedure Set_Max_width(Value: Integer);
		procedure Set_Nlines(Value: Integer);
		procedure Set_Orientation(Value: Integer);
		procedure Set_PctDist(Value: Real);
  public
		{ Properties }
		property Anchor: Integer read FAnchor write Set_Anchor;
		property Anchor_loc: Integer read FAnchor_loc write Set_Anchor_loc;
		property Hidden: Boolean read FHidden write Set_Hidden;
		property Justify: Integer read FJustify write Set_Justify;
		property Label_: string read FLabel_ write Set_Label_;
		property Max_width: Integer read FMax_width write Set_Max_width;
		property Nlines: Integer read FNlines write Set_Nlines;
		property Orientation: Integer read FOrientation write Set_Orientation;
		property PctDist: Real read FPctDist write Set_PctDist;
  end;

	// RMessView
	RMessView = class(RPetalNodeView)
  private
		{ Member Fields }
		FDir: RMessViewDirectionKind;
		FOrientation: Integer;
		FOrigin: TPoint;
		FPctDist: Real;
		FTerminus: TPoint;
		FDataFlowViews: TList;
		FObject_arc: RLinkView;
		{ Getter/Setter }
		procedure Set_Dir(Value: RMessViewDirectionKind);
		procedure Set_Orientation(Value: Integer);
		procedure Set_Origin(Value: TPoint);
		procedure Set_PctDist(Value: Real);
		procedure Set_Terminus(Value: TPoint);
		function Get_DataFlowViewCount: Integer;
		function Get_DataFlowView(Index: Integer): RDataFlowView;
		procedure Set_Object_arc(Value: RLinkView);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_DataFlowView(Value: RDataFlowView);
		procedure Remove_DataFlowView(Value: RDataFlowView);
		procedure Insert_DataFlowView(Index: Integer; Value: RDataFlowView);
		procedure Delete_DataFlowView(Index: Integer);
		{ Properties }
		property Dir: RMessViewDirectionKind read FDir write Set_Dir;
		property Orientation: Integer read FOrientation write Set_Orientation;
		property Origin: TPoint read FOrigin write Set_Origin;
		property PctDist: Real read FPctDist write Set_PctDist;
		property Terminus: TPoint read FTerminus write Set_Terminus;
		property DataFlowViewCount: Integer read Get_DataFlowViewCount;
		property DataFlowViews[Index: Integer]: RDataFlowView read Get_DataFlowView;
		property Object_arc: RLinkView read FObject_arc write Set_Object_arc;
  end;

	// RPetalEdgeView
	RPetalEdgeView = class(RPetalView)
  private
		{ Member Fields }
		FLine_style: RLineStyleKind;
		FStereotype: Boolean;
		FOrigin_attachment: TPoint;
		FTerminal_attachment: TPoint;
		FClient: RPetalView;
		FSupplier: RPetalView;
		{ Getter/Setter }
		procedure Set_Line_style(Value: RLineStyleKind);
		procedure Set_Stereotype(Value: Boolean);
		procedure Set_Origin_attachment(Value: TPoint);
		procedure Set_Terminal_attachment(Value: TPoint);
		procedure Set_Client(Value: RPetalView);
		procedure Set_Supplier(Value: RPetalView);
  public
		{ Properties }
		property Line_style: RLineStyleKind read FLine_style write Set_Line_style;
		property Stereotype: Boolean read FStereotype write Set_Stereotype;
		property Origin_attachment: TPoint read FOrigin_attachment write Set_Origin_attachment;
		property Terminal_attachment: TPoint read FTerminal_attachment write Set_Terminal_attachment;
		property Client: RPetalView read FClient write Set_Client;
		property Supplier: RPetalView read FSupplier write Set_Supplier;
  end;

	// RAssocAttachView
	RAssocAttachView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RAssociationViewNew
	RAssociationViewNew = class(RPetalEdgeView)
  private
		{ Member Fields }
		FLocation: TPoint;
		FRoleview_lists: TList;
		{ Getter/Setter }
		procedure Set_Location(Value: TPoint);
		function Get_Roleview_listCount: Integer;
		function Get_Roleview_list(Index: Integer): RRoleView;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Roleview_list(Value: RRoleView);
		procedure Remove_Roleview_list(Value: RRoleView);
		procedure Insert_Roleview_list(Index: Integer; Value: RRoleView);
		procedure Delete_Roleview_list(Index: Integer);
		{ Properties }
		property Location: TPoint read FLocation write Set_Location;
		property Roleview_listCount: Integer read Get_Roleview_listCount;
		property Roleview_lists[Index: Integer]: RRoleView read Get_Roleview_list;
  end;

	// RAttachView
	RAttachView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RConnectionView
	RConnectionView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RDependencyView
	RDependencyView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RImportView
	RImportView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RInheritView
	RInheritView = class(RPetalEdgeView)
  private
		{ Member Fields }
		FdrawSupplier: RInheritTreeView;
		{ Getter/Setter }
		procedure Set_drawSupplier(Value: RInheritTreeView);
  public
		{ Properties }
		property drawSupplier: RInheritTreeView read FdrawSupplier write Set_drawSupplier;
  end;

	// RLinkView
	RLinkView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RLinkSelfView
	RLinkSelfView = class(RLinkView)
  private
		{ Member Fields }
		FLocation: TPoint;
		{ Getter/Setter }
		procedure Set_Location(Value: TPoint);
  public
		{ Properties }
		property Location: TPoint read FLocation write Set_Location;
  end;

	// RModVisView
	RModVisView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RRealizeView
	RRealizeView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RTransView
	RTransView = class(RPetalEdgeView)
  private
		{ Member Fields }
		FX_offset: Boolean;
		{ Getter/Setter }
		procedure Set_X_offset(Value: Boolean);
  public
		{ Properties }
		property X_offset: Boolean read FX_offset write Set_X_offset;
  end;

	// RUsesView
	RUsesView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RInterMessView
	RInterMessView = class(RPetalEdgeView)
  private
		{ Member Fields }
		FLocation: TPoint;
		FOrdinal: Integer;
		FOrigin: TPoint;
		FTerminus: TPoint;
		FFocus_Src: RFocus_Of_Control;
		FFocus_Entry: RFocus_Of_Control;
		{ Getter/Setter }
		procedure Set_Location(Value: TPoint);
		procedure Set_Ordinal(Value: Integer);
		procedure Set_Origin(Value: TPoint);
		procedure Set_Terminus(Value: TPoint);
		procedure Set_Focus_Src(Value: RFocus_Of_Control);
		procedure Set_Focus_Entry(Value: RFocus_Of_Control);
  public
		{ Properties }
		property Location: TPoint read FLocation write Set_Location;
		property Ordinal: Integer read FOrdinal write Set_Ordinal;
		property Origin: TPoint read FOrigin write Set_Origin;
		property Terminus: TPoint read FTerminus write Set_Terminus;
		property Focus_Src: RFocus_Of_Control read FFocus_Src write Set_Focus_Src;
		property Focus_Entry: RFocus_Of_Control read FFocus_Entry write Set_Focus_Entry;
  end;

	// RRoleView
	RRoleView = class(RPetalEdgeView)
  private
		{ Member Fields }
		FLocation: TPoint;
		{ Getter/Setter }
		procedure Set_Location(Value: TPoint);
  public
		{ Properties }
		property Location: TPoint read FLocation write Set_Location;
  end;

	// RSelfTransView
	RSelfTransView = class(RPetalEdgeView)
  private
		{ Member Fields }
		FLocation: TPoint;
		{ Getter/Setter }
		procedure Set_Location(Value: TPoint);
  public
		{ Properties }
		property Location: TPoint read FLocation write Set_Location;
  end;

	// RSelfMessView
	RSelfMessView = class(RPetalEdgeView)
  private
		{ Member Fields }
		FOrdinal: Integer;
		FOrigin: TPoint;
		FTerminus: TPoint;
		FFocus_Src: RFocus_Of_Control;
		FFocus_Entry: RFocus_Of_Control;
		{ Getter/Setter }
		procedure Set_Ordinal(Value: Integer);
		procedure Set_Origin(Value: TPoint);
		procedure Set_Terminus(Value: TPoint);
		procedure Set_Focus_Src(Value: RFocus_Of_Control);
		procedure Set_Focus_Entry(Value: RFocus_Of_Control);
  public
		{ Properties }
		property Ordinal: Integer read FOrdinal write Set_Ordinal;
		property Origin: TPoint read FOrigin write Set_Origin;
		property Terminus: TPoint read FTerminus write Set_Terminus;
		property Focus_Src: RFocus_Of_Control read FFocus_Src write Set_Focus_Src;
		property Focus_Entry: RFocus_Of_Control read FFocus_Entry write Set_Focus_Entry;
  end;

	// RInheritTreeView
	RInheritTreeView = class(RPetalEdgeView)
  private
		{ Member Fields }
		{ Getter/Setter }
  public
		{ Properties }
  end;

	// RDataFlowView
	RDataFlowView = class(RPetalView)
  private
		{ Member Fields }
		FDir: RDataFlowDirectionKind;
		FHeight: Integer;
		FMessView: RMessView;
		{ Getter/Setter }
		procedure Set_Dir(Value: RDataFlowDirectionKind);
		procedure Set_Height(Value: Integer);
		procedure Set_MessView(Value: RMessView);
  public
		{ Properties }
		property Dir: RDataFlowDirectionKind read FDir write Set_Dir;
		property Height: Integer read FHeight write Set_Height;
		property MessView: RMessView read FMessView write Set_MessView;
  end;

	// RDesign
	RDesign = class(RPetalIdentifier)
  private
		{ Member Fields }
		FIs_loaded: Boolean;
		FIs_unit: Boolean;
		FAttributes: TList;
		FDefaults: RDefaults;
		FProperties: RProperties;
		FRoot_category: RClass_Category;
		FRoot_usecase_package: RClass_Category;
		FRoot_subsystem: RSubSystem;
		FProcess_structure: RProcesses;
		{ Getter/Setter }
		procedure Set_Is_loaded(Value: Boolean);
		procedure Set_Is_unit(Value: Boolean);
		function Get_AttributeCount: Integer;
		function Get_Attribute(Index: Integer): RAttribute;
		procedure Set_Defaults(Value: RDefaults);
		procedure Set_Properties(Value: RProperties);
		procedure Set_Root_category(Value: RClass_Category);
		procedure Set_Root_usecase_package(Value: RClass_Category);
		procedure Set_Root_subsystem(Value: RSubSystem);
		procedure Set_Process_structure(Value: RProcesses);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Attribute(Value: RAttribute);
		procedure Remove_Attribute(Value: RAttribute);
		procedure Insert_Attribute(Index: Integer; Value: RAttribute);
		procedure Delete_Attribute(Index: Integer);
		{ Properties }
		property Is_loaded: Boolean read FIs_loaded write Set_Is_loaded;
		property Is_unit: Boolean read FIs_unit write Set_Is_unit;
		property AttributeCount: Integer read Get_AttributeCount;
		property Attributes[Index: Integer]: RAttribute read Get_Attribute;
		property Defaults: RDefaults read FDefaults write Set_Defaults;
		property Properties: RProperties read FProperties write Set_Properties;
		property Root_category: RClass_Category read FRoot_category write Set_Root_category;
		property Root_usecase_package: RClass_Category read FRoot_usecase_package write Set_Root_usecase_package;
		property Root_subsystem: RSubSystem read FRoot_subsystem write Set_Root_subsystem;
		property Process_structure: RProcesses read FProcess_structure write Set_Process_structure;
  end;

	// RProperties
	RProperties = class(RPetalIdentifier)
  private
		{ Member Fields }
		FAttributes: TList;
		{ Getter/Setter }
		function Get_AttributeCount: Integer;
		function Get_Attribute(Index: Integer): RAttribute;
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ List Type Handling }
		procedure Add_Attribute(Value: RAttribute);
		procedure Remove_Attribute(Value: RAttribute);
		procedure Insert_Attribute(Index: Integer; Value: RAttribute);
		procedure Delete_Attribute(Index: Integer);
		{ Properties }
		property AttributeCount: Integer read Get_AttributeCount;
		property Attributes[Index: Integer]: RAttribute read Get_Attribute;
  end;

	// RPetal
	RPetal = class(RPetalObject)
  private
		{ Member Fields }
		F_written: string;
		FCharSet: Integer;
		FVersion: Integer;
		{ Getter/Setter }
		procedure Set__written(Value: string);
		procedure Set_CharSet(Value: Integer);
		procedure Set_Version(Value: Integer);
  public
		{ Properties }
		property _written: string read F_written write Set__written;
		property CharSet: Integer read FCharSet write Set_CharSet;
		property Version: Integer read FVersion write Set_Version;
  end;

	// RFont
	RFont = class(RPetalObject)
  private
		{ Member Fields }
		FBold: Boolean;
		FColor: Integer;
		FDefault_color: Boolean;
		FFace: string;
		FItalics: Boolean;
		FSize: Integer;
		FStrike: Boolean;
		FUnderline: Boolean;
		FCharSet: Integer;
		{ Getter/Setter }
		procedure Set_Bold(Value: Boolean);
		procedure Set_Color(Value: Integer);
		procedure Set_Default_color(Value: Boolean);
		procedure Set_Face(Value: string);
		procedure Set_Italics(Value: Boolean);
		procedure Set_Size(Value: Integer);
		procedure Set_Strike(Value: Boolean);
		procedure Set_Underline(Value: Boolean);
		procedure Set_CharSet(Value: Integer);
  public
		{ Properties }
		property Bold: Boolean read FBold write Set_Bold;
		property Color: Integer read FColor write Set_Color;
		property Default_color: Boolean read FDefault_color write Set_Default_color;
		property Face: string read FFace write Set_Face;
		property Italics: Boolean read FItalics write Set_Italics;
		property Size: Integer read FSize write Set_Size;
		property Strike: Boolean read FStrike write Set_Strike;
		property Underline: Boolean read FUnderline write Set_Underline;
		property CharSet: Integer read FCharSet write Set_CharSet;
  end;

	// RAttribute
	RAttribute = class(RPetalObject)
  private
		{ Member Fields }
		FName: string;
		FTool: string;
		FValue: string;
		{ Getter/Setter }
		procedure Set_Name(Value: string);
		procedure Set_Tool(Value: string);
		procedure Set_Value(Value: string);
  public
		{ Properties }
		property Name: string read FName write Set_Name;
		property Tool: string read FTool write Set_Tool;
		property Value: string read FValue write Set_Value;
  end;

	// RDefaults
	RDefaults = class(RPetalObject)
  private
		{ Member Fields }
		FAutoResize: Boolean;
		FBottomMargin: Real;
		FClipIconLabels: Boolean;
		FGridX: Integer;
		FGridY: Integer;
		FLeftMargin: Real;
		FNotation: RnotationKind;
		FPageOverlap: Real;
		FRightMargin: Real;
		FShowClassOfObject: Boolean;
		FShowMessageNum: Integer;
		FSnapToGrid: Boolean;
		FTopMargin: Real;
		FDefaultFont: RFont;
		{ Getter/Setter }
		procedure Set_AutoResize(Value: Boolean);
		procedure Set_BottomMargin(Value: Real);
		procedure Set_ClipIconLabels(Value: Boolean);
		procedure Set_GridX(Value: Integer);
		procedure Set_GridY(Value: Integer);
		procedure Set_LeftMargin(Value: Real);
		procedure Set_Notation(Value: RnotationKind);
		procedure Set_PageOverlap(Value: Real);
		procedure Set_RightMargin(Value: Real);
		procedure Set_ShowClassOfObject(Value: Boolean);
		procedure Set_ShowMessageNum(Value: Integer);
		procedure Set_SnapToGrid(Value: Boolean);
		procedure Set_TopMargin(Value: Real);
		procedure Set_DefaultFont(Value: RFont);
  public
		{ Constructor/Destructor }
		constructor Create; override;
		destructor Destroy; override;
		{ Properties }
		property AutoResize: Boolean read FAutoResize write Set_AutoResize;
		property BottomMargin: Real read FBottomMargin write Set_BottomMargin;
		property ClipIconLabels: Boolean read FClipIconLabels write Set_ClipIconLabels;
		property GridX: Integer read FGridX write Set_GridX;
		property GridY: Integer read FGridY write Set_GridY;
		property LeftMargin: Real read FLeftMargin write Set_LeftMargin;
		property Notation: RnotationKind read FNotation write Set_Notation;
		property PageOverlap: Real read FPageOverlap write Set_PageOverlap;
		property RightMargin: Real read FRightMargin write Set_RightMargin;
		property ShowClassOfObject: Boolean read FShowClassOfObject write Set_ShowClassOfObject;
		property ShowMessageNum: Integer read FShowMessageNum write Set_ShowMessageNum;
		property SnapToGrid: Boolean read FSnapToGrid write Set_SnapToGrid;
		property TopMargin: Real read FTopMargin write Set_TopMargin;
		property DefaultFont: RFont read FDefaultFont write Set_DefaultFont;
  end;

	// RSemantic_Info
	RSemantic_Info = class(RPetalObject)
  private
		{ Member Fields }
		FPDL: string;
		FDiagram_ref: RPetalDiagram;
		{ Getter/Setter }
		procedure Set_PDL(Value: string);
		procedure Set_Diagram_ref(Value: RPetalDiagram);
  public
		{ Properties }
		property PDL: string read FPDL write Set_PDL;
		property Diagram_ref: RPetalDiagram read FDiagram_ref write Set_Diagram_ref;
  end;

	// RExternal_doc
	RExternal_doc = class(RPetalObject)
  private
		{ Member Fields }
		FExternal_doc_path: string;
		FExternal_doc_url: string;
		{ Getter/Setter }
		procedure Set_External_doc_path(Value: string);
		procedure Set_External_doc_url(Value: string);
  public
		{ Properties }
		property External_doc_path: string read FExternal_doc_path write Set_External_doc_path;
		property External_doc_url: string read FExternal_doc_url write Set_External_doc_url;
  end;

	// RPoint
	RPoint = class
  private
		{ Member Fields }
		FX: Integer;
		FY: Integer;
		{ Getter/Setter }
		procedure Set_X(Value: Integer);
		procedure Set_Y(Value: Integer);
  public
		{ Properties }
		property X: Integer read FX write Set_X;
		property Y: Integer read FY write Set_Y;
  end;

implementation

/////////////////////////////////////////////////////////////////////////////
//  RPetalObject

constructor RPetalObject.Create;
begin
  inherited Create;
  FInterfaceObj := nil;
  FASTObject := nil;
	FParent := nil;
	FChildren := TList.Create;
end;

destructor RPetalObject.Destroy;
begin
  FInterfaceObj := nil;
	FChildren.Free;
	FChildren := nil;
	inherited;
end;

procedure RPetalObject.Set_ObjectName(Value: string);
begin
  FObjectName := Value;
end;

procedure RPetalObject.Set_InterfaceObj(Value: IUnknown);
begin
  FInterfaceObj := Value;
end;

procedure RPetalObject.Set_ASTObject(Value: NObject);
begin
  FASTObject := Value;
end;

procedure RPetalObject.Set_Parent(Value: RPetalObject);
begin
  if FParent <> Value then begin
    if Parent <> nil then FParent.FChildren.Remove(Self);
    FParent := Value;
    if FParent <> nil then FParent.FChildren.Add(Self);
  end;
end;

function RPetalObject.Get_ChildCount: Integer;
begin
  Result := FChildren.Count;
end;

function RPetalObject.Get_Child(Index: Integer): RPetalObject;
begin
  Result := FChildren[Index];
end;

procedure RPetalObject.Add_Child(Value: RPetalObject);
begin
  if FChildren.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FChildren.Add(Value);
    Value.FParent := Self;
  end;
end;

procedure RPetalObject.Remove_Child(Value: RPetalObject);
begin
  if FChildren.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FChildren.Remove(Value);
    Value.FParent := nil;
  end;
end;

procedure RPetalObject.Insert_Child(Index: Integer; Value: RPetalObject);
begin
  if FChildren.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FChildren.Insert(Index, Value);
    Value.FParent := Self;
  end;
end;

procedure RPetalObject.Delete_Child(Index: Integer);
begin
  Remove_Child(Get_Child(Index));
end;

//  RPetalObject
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalIdentifier

constructor RPetalIdentifier.Create;
begin
  inherited Create;
	FParams := TStringList.Create;
end;

destructor RPetalIdentifier.Destroy;
begin
	FParams.Free;
	FParams := nil;
	inherited;
end;

procedure RPetalIdentifier.Set_Quid(Value: string);
begin
  FQuid := Value;
end;

procedure RPetalIdentifier.Set_Name(Value: string);
begin
  FName := Value;
end;

function RPetalIdentifier.Get_ParamCount: Integer;
begin
  Result := FParams.Count;
end;

function RPetalIdentifier.Get_Param(Index: Integer): string;
begin
  Result := FParams[Index];
end;

procedure RPetalIdentifier.Add_Param(Value: string);
begin
  FParams.Add(Value);
end;

procedure RPetalIdentifier.Insert_Param(Index: Integer; Value: string);
begin
  FParams.Insert(Index, Value);
end;

procedure RPetalIdentifier.Delete_Param(Index: Integer);
begin
  FParams.Delete(Index);
end;

//  RPetalIdentifier
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalModel

constructor RPetalModel.Create;
begin
  inherited Create;
	FAttributes := TList.Create;
	FExternal_docs := TList.Create;
end;

destructor RPetalModel.Destroy;
var
  I: Integer;
begin
	for I := FAttributes.Count - 1 downto 0 do begin
		Get_Attribute(I).Free;
		FAttributes.Delete(I);
	end;
	FAttributes.Free;
	FAttributes := nil;
	for I := FExternal_docs.Count - 1 downto 0 do begin
		Get_External_doc(I).Free;
		FExternal_docs.Delete(I);
	end;
	FExternal_docs.Free;
	FExternal_docs := nil;
	inherited;
end;

procedure RPetalModel.Set_Documentation(Value: string);
begin
  FDocumentation := Value;
end;

procedure RPetalModel.Set_Stereotype(Value: string);
begin
  FStereotype := Value;
end;

procedure RPetalModel.Set_Uid(Value: Integer);
begin
  FUid := Value;
end;

procedure RPetalModel.Set_ExportControl(Value: RExportControlKind);
begin
  FExportControl := Value;
end;

function RPetalModel.Get_AttributeCount: Integer;
begin
  Result := FAttributes.Count;
end;

function RPetalModel.Get_Attribute(Index: Integer): RAttribute;
begin
  Result := FAttributes[Index];
end;

procedure RPetalModel.Add_Attribute(Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FAttributes.Add(Value);
  end;
end;

procedure RPetalModel.Remove_Attribute(Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FAttributes.Remove(Value);
  end;
end;

procedure RPetalModel.Insert_Attribute(Index: Integer; Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FAttributes.Insert(Index, Value);
  end;
end;

procedure RPetalModel.Delete_Attribute(Index: Integer);
begin
  Remove_Attribute(Get_Attribute(Index));
end;

function RPetalModel.Get_External_docCount: Integer;
begin
  Result := FExternal_docs.Count;
end;

function RPetalModel.Get_External_doc(Index: Integer): RExternal_doc;
begin
  Result := FExternal_docs[Index];
end;

procedure RPetalModel.Add_External_doc(Value: RExternal_doc);
begin
  if FExternal_docs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FExternal_docs.Add(Value);
  end;
end;

procedure RPetalModel.Remove_External_doc(Value: RExternal_doc);
begin
  if FExternal_docs.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FExternal_docs.Remove(Value);
  end;
end;

procedure RPetalModel.Insert_External_doc(Index: Integer; Value: RExternal_doc);
begin
  if FExternal_docs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FExternal_docs.Insert(Index, Value);
  end;
end;

procedure RPetalModel.Delete_External_doc(Index: Integer);
begin
  Remove_External_doc(Get_External_doc(Index));
end;

//  RPetalModel
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RActionTime

constructor RActionTime.Create;
begin
  inherited Create;
	FEvent := nil;
end;

destructor RActionTime.Destroy;
begin
	if FEvent <> nil then begin
		FEvent.Free;
		FEvent := nil;
	end;
	inherited;
end;

procedure RActionTime.Set_When(Value: RTimePointKind);
begin
  FWhen := Value;
end;

procedure RActionTime.Set_Condition(Value: string);
begin
  FCondition := Value;
end;

procedure RActionTime.Set_Event(Value: REvent);
begin
  if FEvent <> Value then begin
    FEvent := Value;
  end;
end;

//  RActionTime
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalDiagram

constructor RPetalDiagram.Create;
begin
  inherited Create;
	FItems := TList.Create;
end;

destructor RPetalDiagram.Destroy;
var
  I: Integer;
begin
	for I := FItems.Count - 1 downto 0 do begin
		Get_Item(I).Free;
		FItems.Delete(I);
	end;
	FItems.Free;
	FItems := nil;
	inherited;
end;

procedure RPetalDiagram.Set_Title(Value: string);
begin
  FTitle := Value;
end;

procedure RPetalDiagram.Set_Max_width(Value: Integer);
begin
  FMax_width := Value;
end;

procedure RPetalDiagram.Set_Max_height(Value: Integer);
begin
  FMax_height := Value;
end;

procedure RPetalDiagram.Set_Origin_x(Value: Integer);
begin
  FOrigin_x := Value;
end;

procedure RPetalDiagram.Set_Origin_y(Value: Integer);
begin
  FOrigin_y := Value;
end;

procedure RPetalDiagram.Set_Zoom(Value: Integer);
begin
  FZoom := Value;
end;

function RPetalDiagram.Get_ItemCount: Integer;
begin
  Result := FItems.Count;
end;

function RPetalDiagram.Get_Item(Index: Integer): RPetalView;
begin
  Result := FItems[Index];
end;

procedure RPetalDiagram.Add_Item(Value: RPetalView);
begin
  if FItems.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FItems.Add(Value);
  end;
end;

procedure RPetalDiagram.Remove_Item(Value: RPetalView);
begin
  if FItems.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FItems.Remove(Value);
  end;
end;

procedure RPetalDiagram.Insert_Item(Index: Integer; Value: RPetalView);
begin
  if FItems.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FItems.Insert(Index, Value);
  end;
end;

procedure RPetalDiagram.Delete_Item(Index: Integer);
begin
  Remove_Item(Get_Item(Index));
end;

//  RPetalDiagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RClassDiagram

//  RClassDiagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RUseCaseDiagram

//  RUseCaseDiagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInteractionDiagram

procedure RInteractionDiagram.Set_Mechanism_ref(Value: RMechanism);
begin
  if FMechanism_ref <> Value then begin
    FMechanism_ref := Value;
  end;
end;

//  RInteractionDiagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RObjectDiagram

procedure RObjectDiagram.Set_Mechanism_ref(Value: RMechanism);
begin
  if FMechanism_ref <> Value then begin
    FMechanism_ref := Value;
  end;
end;

//  RObjectDiagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RModule_Diagram

//  RModule_Diagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RProcess_Diagram

//  RProcess_Diagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RTier_Diagram

//  RTier_Diagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RAbstractStateDiagaram

//  RAbstractStateDiagaram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RState_Diagram

//  RState_Diagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RActivityDiagram

//  RActivityDiagram
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RAssociation

constructor RAssociation.Create;
begin
  inherited Create;
	FRoles := TList.Create;
	FAssociationClass := nil;
end;

destructor RAssociation.Destroy;
var
  I: Integer;
begin
	for I := FRoles.Count - 1 downto 0 do begin
		Get_Role(I).Free;
		FRoles.Delete(I);
	end;
	FRoles.Free;
	FRoles := nil;
	inherited;
end;

procedure RAssociation.Set_Constraints(Value: string);
begin
  FConstraints := Value;
end;

procedure RAssociation.Set_Derived(Value: Boolean);
begin
  FDerived := Value;
end;

function RAssociation.Get_RoleCount: Integer;
begin
  Result := FRoles.Count;
end;

function RAssociation.Get_Role(Index: Integer): RRole;
begin
  Result := FRoles[Index];
end;

procedure RAssociation.Add_Role(Value: RRole);
begin
  if FRoles.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FRoles.Add(Value);
  end;
end;

procedure RAssociation.Remove_Role(Value: RRole);
begin
  if FRoles.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FRoles.Remove(Value);
  end;
end;

procedure RAssociation.Insert_Role(Index: Integer; Value: RRole);
begin
  if FRoles.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FRoles.Insert(Index, Value);
  end;
end;

procedure RAssociation.Delete_Role(Index: Integer);
begin
  Remove_Role(Get_Role(Index));
end;

procedure RAssociation.Set_AssociationClass(Value: RClass);
begin
  if FAssociationClass <> Value then begin
    FAssociationClass := Value;
  end;
end;

//  RAssociation
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RClass

constructor RClass.Create;
begin
  inherited Create;
	FModules := TList.Create;
	FNestedClasses := TList.Create;
	FOperations := TList.Create;
	FRealized_interfaces := TList.Create;
	FStatemachine := nil;
	FSuperclasses := TList.Create;
	FUsed_nodes := TList.Create;
	FClass_attributes := TList.Create;
end;

destructor RClass.Destroy;
var
  I: Integer;
begin
	FModules.Free;
	FModules := nil;
	for I := FNestedClasses.Count - 1 downto 0 do begin
		Get_NestedClass(I).Free;
		FNestedClasses.Delete(I);
	end;
	FNestedClasses.Free;
	FNestedClasses := nil;
	for I := FOperations.Count - 1 downto 0 do begin
		Get_Operation(I).Free;
		FOperations.Delete(I);
	end;
	FOperations.Free;
	FOperations := nil;
	for I := FRealized_interfaces.Count - 1 downto 0 do begin
		Get_Realized_interface(I).Free;
		FRealized_interfaces.Delete(I);
	end;
	FRealized_interfaces.Free;
	FRealized_interfaces := nil;
	if FStatemachine <> nil then begin
		FStatemachine.Free;
		FStatemachine := nil;
	end;
	for I := FSuperclasses.Count - 1 downto 0 do begin
		Get_Superclass(I).Free;
		FSuperclasses.Delete(I);
	end;
	FSuperclasses.Free;
	FSuperclasses := nil;
	for I := FUsed_nodes.Count - 1 downto 0 do begin
		Get_Used_node(I).Free;
		FUsed_nodes.Delete(I);
	end;
	FUsed_nodes.Free;
	FUsed_nodes := nil;
	for I := FClass_attributes.Count - 1 downto 0 do begin
		Get_Class_attribute(I).Free;
		FClass_attributes.Delete(I);
	end;
	FClass_attributes.Free;
	FClass_attributes := nil;
	inherited;
end;

procedure RClass.Set_Abstract(Value: Boolean);
begin
  FAbstract := Value;
end;

procedure RClass.Set_Concurrency(Value: RConcurrencyKind);
begin
  FConcurrency := Value;
end;

procedure RClass.Set_Language(Value: string);
begin
  FLanguage := Value;
end;

procedure RClass.Set_Persistence(Value: RPersistenceKind);
begin
  FPersistence := Value;
end;

procedure RClass.Set_Space(Value: string);
begin
  FSpace := Value;
end;

procedure RClass.Set_Cardinality(Value: string);
begin
  FCardinality := Value;
end;

function RClass.Get_ModuleCount: Integer;
begin
  Result := FModules.Count;
end;

function RClass.Get_Module(Index: Integer): RModule;
begin
  Result := FModules[Index];
end;

procedure RClass.Add_Module(Value: RModule);
begin
  if FModules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FModules.Add(Value);
  end;
end;

procedure RClass.Remove_Module(Value: RModule);
begin
  if FModules.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FModules.Remove(Value);
  end;
end;

procedure RClass.Insert_Module(Index: Integer; Value: RModule);
begin
  if FModules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FModules.Insert(Index, Value);
  end;
end;

procedure RClass.Delete_Module(Index: Integer);
begin
  Remove_Module(Get_Module(Index));
end;

function RClass.Get_NestedClassCount: Integer;
begin
  Result := FNestedClasses.Count;
end;

function RClass.Get_NestedClass(Index: Integer): RClass;
begin
  Result := FNestedClasses[Index];
end;

procedure RClass.Add_NestedClass(Value: RClass);
begin
  if FNestedClasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FNestedClasses.Add(Value);
  end;
end;

procedure RClass.Remove_NestedClass(Value: RClass);
begin
  if FNestedClasses.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FNestedClasses.Remove(Value);
  end;
end;

procedure RClass.Insert_NestedClass(Index: Integer; Value: RClass);
begin
  if FNestedClasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FNestedClasses.Insert(Index, Value);
  end;
end;

procedure RClass.Delete_NestedClass(Index: Integer);
begin
  Remove_NestedClass(Get_NestedClass(Index));
end;

function RClass.Get_OperationCount: Integer;
begin
  Result := FOperations.Count;
end;

function RClass.Get_Operation(Index: Integer): ROperation;
begin
  Result := FOperations[Index];
end;

procedure RClass.Add_Operation(Value: ROperation);
begin
  if FOperations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FOperations.Add(Value);
  end;
end;

procedure RClass.Remove_Operation(Value: ROperation);
begin
  if FOperations.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FOperations.Remove(Value);
  end;
end;

procedure RClass.Insert_Operation(Index: Integer; Value: ROperation);
begin
  if FOperations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FOperations.Insert(Index, Value);
  end;
end;

procedure RClass.Delete_Operation(Index: Integer);
begin
  Remove_Operation(Get_Operation(Index));
end;

function RClass.Get_Realized_interfaceCount: Integer;
begin
  Result := FRealized_interfaces.Count;
end;

function RClass.Get_Realized_interface(Index: Integer): RRealize_Relationship;
begin
  Result := FRealized_interfaces[Index];
end;

procedure RClass.Add_Realized_interface(Value: RRealize_Relationship);
begin
  if FRealized_interfaces.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FRealized_interfaces.Add(Value);
  end;
end;

procedure RClass.Remove_Realized_interface(Value: RRealize_Relationship);
begin
  if FRealized_interfaces.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FRealized_interfaces.Remove(Value);
  end;
end;

procedure RClass.Insert_Realized_interface(Index: Integer; Value: RRealize_Relationship);
begin
  if FRealized_interfaces.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FRealized_interfaces.Insert(Index, Value);
  end;
end;

procedure RClass.Delete_Realized_interface(Index: Integer);
begin
  Remove_Realized_interface(Get_Realized_interface(Index));
end;

procedure RClass.Set_Statemachine(Value: RState_Machine);
begin
  if FStatemachine <> Value then begin
    FStatemachine := Value;
  end;
end;

function RClass.Get_SuperclassCount: Integer;
begin
  Result := FSuperclasses.Count;
end;

function RClass.Get_Superclass(Index: Integer): RInheritance_Relationship;
begin
  Result := FSuperclasses[Index];
end;

procedure RClass.Add_Superclass(Value: RInheritance_Relationship);
begin
  if FSuperclasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FSuperclasses.Add(Value);
  end;
end;

procedure RClass.Remove_Superclass(Value: RInheritance_Relationship);
begin
  if FSuperclasses.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FSuperclasses.Remove(Value);
  end;
end;

procedure RClass.Insert_Superclass(Index: Integer; Value: RInheritance_Relationship);
begin
  if FSuperclasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FSuperclasses.Insert(Index, Value);
  end;
end;

procedure RClass.Delete_Superclass(Index: Integer);
begin
  Remove_Superclass(Get_Superclass(Index));
end;

function RClass.Get_Used_nodeCount: Integer;
begin
  Result := FUsed_nodes.Count;
end;

function RClass.Get_Used_node(Index: Integer): RUses_Relationship;
begin
  Result := FUsed_nodes[Index];
end;

procedure RClass.Add_Used_node(Value: RUses_Relationship);
begin
  if FUsed_nodes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FUsed_nodes.Add(Value);
  end;
end;

procedure RClass.Remove_Used_node(Value: RUses_Relationship);
begin
  if FUsed_nodes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FUsed_nodes.Remove(Value);
  end;
end;

procedure RClass.Insert_Used_node(Index: Integer; Value: RUses_Relationship);
begin
  if FUsed_nodes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FUsed_nodes.Insert(Index, Value);
  end;
end;

procedure RClass.Delete_Used_node(Index: Integer);
begin
  Remove_Used_node(Get_Used_node(Index));
end;

function RClass.Get_Class_attributeCount: Integer;
begin
  Result := FClass_attributes.Count;
end;

function RClass.Get_Class_attribute(Index: Integer): RClassAttribute;
begin
  Result := FClass_attributes[Index];
end;

procedure RClass.Add_Class_attribute(Value: RClassAttribute);
begin
  if FClass_attributes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FClass_attributes.Add(Value);
  end;
end;

procedure RClass.Remove_Class_attribute(Value: RClassAttribute);
begin
  if FClass_attributes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FClass_attributes.Remove(Value);
  end;
end;

procedure RClass.Insert_Class_attribute(Index: Integer; Value: RClassAttribute);
begin
  if FClass_attributes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FClass_attributes.Insert(Index, Value);
  end;
end;

procedure RClass.Delete_Class_attribute(Index: Integer);
begin
  Remove_Class_attribute(Get_Class_attribute(Index));
end;

//  RClass
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RClass_Utility

//  RClass_Utility
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInstantiated_Class

//  RInstantiated_Class
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInstantiated_Class_Utility

//  RInstantiated_Class_Utility
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RMetaclass

//  RMetaclass
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RParameterized_Class

constructor RParameterized_Class.Create;
begin
  inherited Create;
	FParameters := TList.Create;
end;

destructor RParameterized_Class.Destroy;
var
  I: Integer;
begin
	for I := FParameters.Count - 1 downto 0 do begin
		Get_Parameter(I).Free;
		FParameters.Delete(I);
	end;
	FParameters.Free;
	FParameters := nil;
	inherited;
end;

function RParameterized_Class.Get_ParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function RParameterized_Class.Get_Parameter(Index: Integer): RParameter;
begin
  Result := FParameters[Index];
end;

procedure RParameterized_Class.Add_Parameter(Value: RParameter);
begin
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Add(Value);
  end;
end;

procedure RParameterized_Class.Remove_Parameter(Value: RParameter);
begin
  if FParameters.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FParameters.Remove(Value);
  end;
end;

procedure RParameterized_Class.Insert_Parameter(Index: Integer; Value: RParameter);
begin
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Insert(Index, Value);
  end;
end;

procedure RParameterized_Class.Delete_Parameter(Index: Integer);
begin
  Remove_Parameter(Get_Parameter(Index));
end;

//  RParameterized_Class
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RParameterized_Class_Utility

//  RParameterized_Class_Utility
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RClassAttribute

procedure RClassAttribute.Set_Containment(Value: RContainmentKind);
begin
  FContainment := Value;
end;

procedure RClassAttribute.Set_Derived(Value: Boolean);
begin
  FDerived := Value;
end;

procedure RClassAttribute.Set_Initv(Value: string);
begin
  FInitv := Value;
end;

procedure RClassAttribute.Set_Static(Value: Boolean);
begin
  FStatic := Value;
end;

procedure RClassAttribute.Set_TypeExpression(Value: string);
begin
  FTypeExpression := Value;
end;

procedure RClassAttribute.Set_Type_(Value: RClass);
begin
  if FType_ <> Value then begin
    FType_ := Value;
  end;
end;

//  RClassAttribute
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RClass_Category

constructor RClass_Category.Create;
begin
  inherited Create;
	FLogical_models := TList.Create;
	FLogical_presentations := TList.Create;
	FStatemachine := nil;
	FVisible_categories := TList.Create;
	FVisible_modules := TList.Create;
	FSubsystem := nil;
end;

destructor RClass_Category.Destroy;
var
  I: Integer;
begin
	for I := FLogical_models.Count - 1 downto 0 do begin
		Get_Logical_model(I).Free;
		FLogical_models.Delete(I);
	end;
	FLogical_models.Free;
	FLogical_models := nil;
	for I := FLogical_presentations.Count - 1 downto 0 do begin
		Get_Logical_presentation(I).Free;
		FLogical_presentations.Delete(I);
	end;
	FLogical_presentations.Free;
	FLogical_presentations := nil;
	if FStatemachine <> nil then begin
		FStatemachine.Free;
		FStatemachine := nil;
	end;
	for I := FVisible_categories.Count - 1 downto 0 do begin
		Get_Visible_category(I).Free;
		FVisible_categories.Delete(I);
	end;
	FVisible_categories.Free;
	FVisible_categories := nil;
	for I := FVisible_modules.Count - 1 downto 0 do begin
		Get_Visible_module(I).Free;
		FVisible_modules.Delete(I);
	end;
	FVisible_modules.Free;
	FVisible_modules := nil;
	inherited;
end;

procedure RClass_Category.Set_Global(Value: Boolean);
begin
  FGlobal := Value;
end;

function RClass_Category.Get_Logical_modelCount: Integer;
begin
  Result := FLogical_models.Count;
end;

function RClass_Category.Get_Logical_model(Index: Integer): RPetalModel;
begin
  Result := FLogical_models[Index];
end;

procedure RClass_Category.Add_Logical_model(Value: RPetalModel);
begin
  if FLogical_models.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Add(Value);
  end;
end;

procedure RClass_Category.Remove_Logical_model(Value: RPetalModel);
begin
  if FLogical_models.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Remove(Value);
  end;
end;

procedure RClass_Category.Insert_Logical_model(Index: Integer; Value: RPetalModel);
begin
  if FLogical_models.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Insert(Index, Value);
  end;
end;

procedure RClass_Category.Delete_Logical_model(Index: Integer);
begin
  Remove_Logical_model(Get_Logical_model(Index));
end;

function RClass_Category.Get_Logical_presentationCount: Integer;
begin
  Result := FLogical_presentations.Count;
end;

function RClass_Category.Get_Logical_presentation(Index: Integer): RPetalDiagram;
begin
  Result := FLogical_presentations[Index];
end;

procedure RClass_Category.Add_Logical_presentation(Value: RPetalDiagram);
begin
  if FLogical_presentations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_presentations.Add(Value);
  end;
end;

procedure RClass_Category.Remove_Logical_presentation(Value: RPetalDiagram);
begin
  if FLogical_presentations.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FLogical_presentations.Remove(Value);
  end;
end;

procedure RClass_Category.Insert_Logical_presentation(Index: Integer; Value: RPetalDiagram);
begin
  if FLogical_presentations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_presentations.Insert(Index, Value);
  end;
end;

procedure RClass_Category.Delete_Logical_presentation(Index: Integer);
begin
  Remove_Logical_presentation(Get_Logical_presentation(Index));
end;

procedure RClass_Category.Set_Statemachine(Value: RState_Machine);
begin
  if FStatemachine <> Value then begin
    FStatemachine := Value;
  end;
end;

function RClass_Category.Get_Visible_categoryCount: Integer;
begin
  Result := FVisible_categories.Count;
end;

function RClass_Category.Get_Visible_category(Index: Integer): RVisibility_Relationship;
begin
  Result := FVisible_categories[Index];
end;

procedure RClass_Category.Add_Visible_category(Value: RVisibility_Relationship);
begin
  if FVisible_categories.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_categories.Add(Value);
  end;
end;

procedure RClass_Category.Remove_Visible_category(Value: RVisibility_Relationship);
begin
  if FVisible_categories.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FVisible_categories.Remove(Value);
  end;
end;

procedure RClass_Category.Insert_Visible_category(Index: Integer; Value: RVisibility_Relationship);
begin
  if FVisible_categories.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_categories.Insert(Index, Value);
  end;
end;

procedure RClass_Category.Delete_Visible_category(Index: Integer);
begin
  Remove_Visible_category(Get_Visible_category(Index));
end;

function RClass_Category.Get_Visible_moduleCount: Integer;
begin
  Result := FVisible_modules.Count;
end;

function RClass_Category.Get_Visible_module(Index: Integer): RDependency_Relationship;
begin
  Result := FVisible_modules[Index];
end;

procedure RClass_Category.Add_Visible_module(Value: RDependency_Relationship);
begin
  if FVisible_modules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Add(Value);
  end;
end;

procedure RClass_Category.Remove_Visible_module(Value: RDependency_Relationship);
begin
  if FVisible_modules.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Remove(Value);
  end;
end;

procedure RClass_Category.Insert_Visible_module(Index: Integer; Value: RDependency_Relationship);
begin
  if FVisible_modules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Insert(Index, Value);
  end;
end;

procedure RClass_Category.Delete_Visible_module(Index: Integer);
begin
  Remove_Visible_module(Get_Visible_module(Index));
end;

procedure RClass_Category.Set_Subsystem(Value: RSubSystem);
begin
  if FSubsystem <> Value then begin
    FSubsystem := Value;
  end;
end;

//  RClass_Category
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  REvent

procedure REvent.Set_Parameters(Value: string);
begin
  FParameters := Value;
end;

//  REvent
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RMessage

procedure RMessage.Set_Creation(Value: Boolean);
begin
  FCreation := Value;
end;

procedure RMessage.Set_Dir(Value: RMessageDirectionKind);
begin
  FDir := Value;
end;

procedure RMessage.Set_Frequency(Value: RMessageFrequencyKind);
begin
  FFrequency := Value;
end;

procedure RMessage.Set_Ordinal(Value: Integer);
begin
  FOrdinal := Value;
end;

procedure RMessage.Set_Sequence(Value: string);
begin
  FSequence := Value;
end;

procedure RMessage.Set_Synchronization(Value: RMessageSynchronizationKind);
begin
  FSynchronization := Value;
end;

procedure RMessage.Set_Operation(Value: ROperation);
begin
  if FOperation <> Value then begin
    FOperation := Value;
  end;
end;

//  RMessage
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RObject

constructor RObject.Create;
begin
  inherited Create;
	FCollaborators := TList.Create;
	FClass := nil;
end;

destructor RObject.Destroy;
var
  I: Integer;
begin
	for I := FCollaborators.Count - 1 downto 0 do begin
		Get_Collaborator(I).Free;
		FCollaborators.Delete(I);
	end;
	FCollaborators.Free;
	FCollaborators := nil;
	inherited;
end;

procedure RObject.Set_CreationObj(Value: Boolean);
begin
  FCreationObj := Value;
end;

procedure RObject.Set_Multi(Value: Boolean);
begin
  FMulti := Value;
end;

procedure RObject.Set_Persistence(Value: RPersistenceKind);
begin
  FPersistence := Value;
end;

function RObject.Get_CollaboratorCount: Integer;
begin
  Result := FCollaborators.Count;
end;

function RObject.Get_Collaborator(Index: Integer): RLink;
begin
  Result := FCollaborators[Index];
end;

procedure RObject.Add_Collaborator(Value: RLink);
begin
  if FCollaborators.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FCollaborators.Add(Value);
  end;
end;

procedure RObject.Remove_Collaborator(Value: RLink);
begin
  if FCollaborators.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FCollaborators.Remove(Value);
  end;
end;

procedure RObject.Insert_Collaborator(Index: Integer; Value: RLink);
begin
  if FCollaborators.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FCollaborators.Insert(Index, Value);
  end;
end;

procedure RObject.Delete_Collaborator(Index: Integer);
begin
  Remove_Collaborator(Get_Collaborator(Index));
end;

procedure RObject.Set_Class(Value: RClass);
begin
  if FClass <> Value then begin
    FClass := Value;
  end;
end;

//  RObject
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  ROperation

constructor ROperation.Create;
begin
  inherited Create;
	FPost_condition := nil;
	FPre_condition := nil;
	FSemantics := nil;
	FParameters := TList.Create;
	FResult := nil;
end;

destructor ROperation.Destroy;
var
  I: Integer;
begin
	if FPost_condition <> nil then begin
		FPost_condition.Free;
		FPost_condition := nil;
	end;
	if FPre_condition <> nil then begin
		FPre_condition.Free;
		FPre_condition := nil;
	end;
	if FSemantics <> nil then begin
		FSemantics.Free;
		FSemantics := nil;
	end;
	for I := FParameters.Count - 1 downto 0 do begin
		Get_Parameter(I).Free;
		FParameters.Delete(I);
	end;
	FParameters.Free;
	FParameters := nil;
	inherited;
end;

procedure ROperation.Set_Abstract(Value: Boolean);
begin
  FAbstract := Value;
end;

procedure ROperation.Set_Concurrency(Value: RConcurrencyKind);
begin
  FConcurrency := Value;
end;

procedure ROperation.Set_Exceptions(Value: string);
begin
  FExceptions := Value;
end;

procedure ROperation.Set_Protocol(Value: string);
begin
  FProtocol := Value;
end;

procedure ROperation.Set_Qualification(Value: string);
begin
  FQualification := Value;
end;

procedure ROperation.Set_ResultExpression(Value: string);
begin
  FResultExpression := Value;
end;

procedure ROperation.Set_Space(Value: string);
begin
  FSpace := Value;
end;

procedure ROperation.Set_Time_complexity(Value: string);
begin
  FTime_complexity := Value;
end;

procedure ROperation.Set_Post_condition(Value: RSemantic_Info);
begin
  if FPost_condition <> Value then begin
    FPost_condition := Value;
  end;
end;

procedure ROperation.Set_Pre_condition(Value: RSemantic_Info);
begin
  if FPre_condition <> Value then begin
    FPre_condition := Value;
  end;
end;

procedure ROperation.Set_Semantics(Value: RSemantic_Info);
begin
  if FSemantics <> Value then begin
    FSemantics := Value;
  end;
end;

function ROperation.Get_ParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function ROperation.Get_Parameter(Index: Integer): RParameter;
begin
  Result := FParameters[Index];
end;

procedure ROperation.Add_Parameter(Value: RParameter);
begin
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Add(Value);
  end;
end;

procedure ROperation.Remove_Parameter(Value: RParameter);
begin
  if FParameters.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FParameters.Remove(Value);
  end;
end;

procedure ROperation.Insert_Parameter(Index: Integer; Value: RParameter);
begin
  if FParameters.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FParameters.Insert(Index, Value);
  end;
end;

procedure ROperation.Delete_Parameter(Index: Integer);
begin
  Remove_Parameter(Get_Parameter(Index));
end;

procedure ROperation.Set_Result(Value: RClass);
begin
  if FResult <> Value then begin
    FResult := Value;
  end;
end;

//  ROperation
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPartition

procedure RPartition.Set_CreationObj(Value: Boolean);
begin
  FCreationObj := Value;
end;

procedure RPartition.Set_Multi(Value: Boolean);
begin
  FMulti := Value;
end;

procedure RPartition.Set_Persistence(Value: RPersistenceKind);
begin
  FPersistence := Value;
end;

procedure RPartition.Set_Class(Value: RClass);
begin
  if FClass <> Value then begin
    FClass := Value;
  end;
end;

//  RPartition
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RState_Machine

constructor RState_Machine.Create;
begin
  inherited Create;
	FObjects := TList.Create;
	FPartitions := TList.Create;
	FStates := TList.Create;
	FStatediagrams := TList.Create;
end;

destructor RState_Machine.Destroy;
var
  I: Integer;
begin
	for I := FObjects.Count - 1 downto 0 do begin
		Get_Object(I).Free;
		FObjects.Delete(I);
	end;
	FObjects.Free;
	FObjects := nil;
	for I := FPartitions.Count - 1 downto 0 do begin
		Get_Partition(I).Free;
		FPartitions.Delete(I);
	end;
	FPartitions.Free;
	FPartitions := nil;
	for I := FStates.Count - 1 downto 0 do begin
		Get_State(I).Free;
		FStates.Delete(I);
	end;
	FStates.Free;
	FStates := nil;
	for I := FStatediagrams.Count - 1 downto 0 do begin
		Get_Statediagram(I).Free;
		FStatediagrams.Delete(I);
	end;
	FStatediagrams.Free;
	FStatediagrams := nil;
	inherited;
end;

function RState_Machine.Get_ObjectCount: Integer;
begin
  Result := FObjects.Count;
end;

function RState_Machine.Get_Object(Index: Integer): RObject;
begin
  Result := FObjects[Index];
end;

procedure RState_Machine.Add_Object(Value: RObject);
begin
  if FObjects.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FObjects.Add(Value);
  end;
end;

procedure RState_Machine.Remove_Object(Value: RObject);
begin
  if FObjects.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FObjects.Remove(Value);
  end;
end;

procedure RState_Machine.Insert_Object(Index: Integer; Value: RObject);
begin
  if FObjects.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FObjects.Insert(Index, Value);
  end;
end;

procedure RState_Machine.Delete_Object(Index: Integer);
begin
  Remove_Object(Get_Object(Index));
end;

function RState_Machine.Get_PartitionCount: Integer;
begin
  Result := FPartitions.Count;
end;

function RState_Machine.Get_Partition(Index: Integer): RPartition;
begin
  Result := FPartitions[Index];
end;

procedure RState_Machine.Add_Partition(Value: RPartition);
begin
  if FPartitions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FPartitions.Add(Value);
  end;
end;

procedure RState_Machine.Remove_Partition(Value: RPartition);
begin
  if FPartitions.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FPartitions.Remove(Value);
  end;
end;

procedure RState_Machine.Insert_Partition(Index: Integer; Value: RPartition);
begin
  if FPartitions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FPartitions.Insert(Index, Value);
  end;
end;

procedure RState_Machine.Delete_Partition(Index: Integer);
begin
  Remove_Partition(Get_Partition(Index));
end;

function RState_Machine.Get_StateCount: Integer;
begin
  Result := FStates.Count;
end;

function RState_Machine.Get_State(Index: Integer): RPetalStateVertex;
begin
  Result := FStates[Index];
end;

procedure RState_Machine.Add_State(Value: RPetalStateVertex);
begin
  if FStates.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FStates.Add(Value);
  end;
end;

procedure RState_Machine.Remove_State(Value: RPetalStateVertex);
begin
  if FStates.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FStates.Remove(Value);
  end;
end;

procedure RState_Machine.Insert_State(Index: Integer; Value: RPetalStateVertex);
begin
  if FStates.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FStates.Insert(Index, Value);
  end;
end;

procedure RState_Machine.Delete_State(Index: Integer);
begin
  Remove_State(Get_State(Index));
end;

function RState_Machine.Get_StatediagramCount: Integer;
begin
  Result := FStatediagrams.Count;
end;

function RState_Machine.Get_Statediagram(Index: Integer): RAbstractStateDiagaram;
begin
  Result := FStatediagrams[Index];
end;

procedure RState_Machine.Add_Statediagram(Value: RAbstractStateDiagaram);
begin
  if FStatediagrams.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FStatediagrams.Add(Value);
  end;
end;

procedure RState_Machine.Remove_Statediagram(Value: RAbstractStateDiagaram);
begin
  if FStatediagrams.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FStatediagrams.Remove(Value);
  end;
end;

procedure RState_Machine.Insert_Statediagram(Index: Integer; Value: RAbstractStateDiagaram);
begin
  if FStatediagrams.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FStatediagrams.Insert(Index, Value);
  end;
end;

procedure RState_Machine.Delete_Statediagram(Index: Integer);
begin
  Remove_Statediagram(Get_Statediagram(Index));
end;

//  RState_Machine
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RUseCase

constructor RUseCase.Create;
begin
  inherited Create;
	FLogical_models := TList.Create;
	FLogical_presentations := TList.Create;
	FStatemachine := nil;
	FSuperclasses := TList.Create;
	FVisible_modules := TList.Create;
end;

destructor RUseCase.Destroy;
var
  I: Integer;
begin
	for I := FLogical_models.Count - 1 downto 0 do begin
		Get_Logical_model(I).Free;
		FLogical_models.Delete(I);
	end;
	FLogical_models.Free;
	FLogical_models := nil;
	for I := FLogical_presentations.Count - 1 downto 0 do begin
		Get_Logical_presentation(I).Free;
		FLogical_presentations.Delete(I);
	end;
	FLogical_presentations.Free;
	FLogical_presentations := nil;
	if FStatemachine <> nil then begin
		FStatemachine.Free;
		FStatemachine := nil;
	end;
	for I := FSuperclasses.Count - 1 downto 0 do begin
		Get_Superclass(I).Free;
		FSuperclasses.Delete(I);
	end;
	FSuperclasses.Free;
	FSuperclasses := nil;
	for I := FVisible_modules.Count - 1 downto 0 do begin
		Get_Visible_module(I).Free;
		FVisible_modules.Delete(I);
	end;
	FVisible_modules.Free;
	FVisible_modules := nil;
	inherited;
end;

procedure RUseCase.Set_Abstract(Value: Boolean);
begin
  FAbstract := Value;
end;

procedure RUseCase.Set_Rank(Value: string);
begin
  FRank := Value;
end;

function RUseCase.Get_Logical_modelCount: Integer;
begin
  Result := FLogical_models.Count;
end;

function RUseCase.Get_Logical_model(Index: Integer): RPetalModel;
begin
  Result := FLogical_models[Index];
end;

procedure RUseCase.Add_Logical_model(Value: RPetalModel);
begin
  if FLogical_models.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Add(Value);
  end;
end;

procedure RUseCase.Remove_Logical_model(Value: RPetalModel);
begin
  if FLogical_models.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Remove(Value);
  end;
end;

procedure RUseCase.Insert_Logical_model(Index: Integer; Value: RPetalModel);
begin
  if FLogical_models.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Insert(Index, Value);
  end;
end;

procedure RUseCase.Delete_Logical_model(Index: Integer);
begin
  Remove_Logical_model(Get_Logical_model(Index));
end;

function RUseCase.Get_Logical_presentationCount: Integer;
begin
  Result := FLogical_presentations.Count;
end;

function RUseCase.Get_Logical_presentation(Index: Integer): RPetalDiagram;
begin
  Result := FLogical_presentations[Index];
end;

procedure RUseCase.Add_Logical_presentation(Value: RPetalDiagram);
begin
  if FLogical_presentations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_presentations.Add(Value);
  end;
end;

procedure RUseCase.Remove_Logical_presentation(Value: RPetalDiagram);
begin
  if FLogical_presentations.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FLogical_presentations.Remove(Value);
  end;
end;

procedure RUseCase.Insert_Logical_presentation(Index: Integer; Value: RPetalDiagram);
begin
  if FLogical_presentations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_presentations.Insert(Index, Value);
  end;
end;

procedure RUseCase.Delete_Logical_presentation(Index: Integer);
begin
  Remove_Logical_presentation(Get_Logical_presentation(Index));
end;

procedure RUseCase.Set_Statemachine(Value: RState_Machine);
begin
  if FStatemachine <> Value then begin
    FStatemachine := Value;
  end;
end;

function RUseCase.Get_SuperclassCount: Integer;
begin
  Result := FSuperclasses.Count;
end;

function RUseCase.Get_Superclass(Index: Integer): RInheritance_Relationship;
begin
  Result := FSuperclasses[Index];
end;

procedure RUseCase.Add_Superclass(Value: RInheritance_Relationship);
begin
  if FSuperclasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FSuperclasses.Add(Value);
  end;
end;

procedure RUseCase.Remove_Superclass(Value: RInheritance_Relationship);
begin
  if FSuperclasses.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FSuperclasses.Remove(Value);
  end;
end;

procedure RUseCase.Insert_Superclass(Index: Integer; Value: RInheritance_Relationship);
begin
  if FSuperclasses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FSuperclasses.Insert(Index, Value);
  end;
end;

procedure RUseCase.Delete_Superclass(Index: Integer);
begin
  Remove_Superclass(Get_Superclass(Index));
end;

function RUseCase.Get_Visible_moduleCount: Integer;
begin
  Result := FVisible_modules.Count;
end;

function RUseCase.Get_Visible_module(Index: Integer): RDependency_Relationship;
begin
  Result := FVisible_modules[Index];
end;

procedure RUseCase.Add_Visible_module(Value: RDependency_Relationship);
begin
  if FVisible_modules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Add(Value);
  end;
end;

procedure RUseCase.Remove_Visible_module(Value: RDependency_Relationship);
begin
  if FVisible_modules.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Remove(Value);
  end;
end;

procedure RUseCase.Insert_Visible_module(Index: Integer; Value: RDependency_Relationship);
begin
  if FVisible_modules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Insert(Index, Value);
  end;
end;

procedure RUseCase.Delete_Visible_module(Index: Integer);
begin
  Remove_Visible_module(Get_Visible_module(Index));
end;

//  RUseCase
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RModule

constructor RModule.Create;
begin
  inherited Create;
	FVisible_modules := TList.Create;
	FRealized_interfaces := TList.Create;
end;

destructor RModule.Destroy;
var
  I: Integer;
begin
	for I := FVisible_modules.Count - 1 downto 0 do begin
		Get_Visible_module(I).Free;
		FVisible_modules.Delete(I);
	end;
	FVisible_modules.Free;
	FVisible_modules := nil;
	for I := FRealized_interfaces.Count - 1 downto 0 do begin
		Get_Realized_interface(I).Free;
		FRealized_interfaces.Delete(I);
	end;
	FRealized_interfaces.Free;
	FRealized_interfaces := nil;
	inherited;
end;

procedure RModule.Set_Declarations(Value: string);
begin
  FDeclarations := Value;
end;

procedure RModule.Set_Language(Value: string);
begin
  FLanguage := Value;
end;

function RModule.Get_Visible_moduleCount: Integer;
begin
  Result := FVisible_modules.Count;
end;

function RModule.Get_Visible_module(Index: Integer): RModule_Visibility_Relationship;
begin
  Result := FVisible_modules[Index];
end;

procedure RModule.Add_Visible_module(Value: RModule_Visibility_Relationship);
begin
  if FVisible_modules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Add(Value);
  end;
end;

procedure RModule.Remove_Visible_module(Value: RModule_Visibility_Relationship);
begin
  if FVisible_modules.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Remove(Value);
  end;
end;

procedure RModule.Insert_Visible_module(Index: Integer; Value: RModule_Visibility_Relationship);
begin
  if FVisible_modules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Insert(Index, Value);
  end;
end;

procedure RModule.Delete_Visible_module(Index: Integer);
begin
  Remove_Visible_module(Get_Visible_module(Index));
end;

function RModule.Get_Realized_interfaceCount: Integer;
begin
  Result := FRealized_interfaces.Count;
end;

function RModule.Get_Realized_interface(Index: Integer): RRealize_Relationship;
begin
  Result := FRealized_interfaces[Index];
end;

procedure RModule.Add_Realized_interface(Value: RRealize_Relationship);
begin
  if FRealized_interfaces.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FRealized_interfaces.Add(Value);
  end;
end;

procedure RModule.Remove_Realized_interface(Value: RRealize_Relationship);
begin
  if FRealized_interfaces.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FRealized_interfaces.Remove(Value);
  end;
end;

procedure RModule.Insert_Realized_interface(Index: Integer; Value: RRealize_Relationship);
begin
  if FRealized_interfaces.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FRealized_interfaces.Insert(Index, Value);
  end;
end;

procedure RModule.Delete_Realized_interface(Index: Integer);
begin
  Remove_Realized_interface(Get_Realized_interface(Index));
end;

//  RModule
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalDeploymentNode

constructor RPetalDeploymentNode.Create;
begin
  inherited Create;
	FConnections := TList.Create;
end;

destructor RPetalDeploymentNode.Destroy;
var
  I: Integer;
begin
	for I := FConnections.Count - 1 downto 0 do begin
		Get_Connection(I).Free;
		FConnections.Delete(I);
	end;
	FConnections.Free;
	FConnections := nil;
	inherited;
end;

procedure RPetalDeploymentNode.Set_Characteristics(Value: string);
begin
  FCharacteristics := Value;
end;

function RPetalDeploymentNode.Get_ConnectionCount: Integer;
begin
  Result := FConnections.Count;
end;

function RPetalDeploymentNode.Get_Connection(Index: Integer): RConnection_Relationship;
begin
  Result := FConnections[Index];
end;

procedure RPetalDeploymentNode.Add_Connection(Value: RConnection_Relationship);
begin
  if FConnections.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FConnections.Add(Value);
  end;
end;

procedure RPetalDeploymentNode.Remove_Connection(Value: RConnection_Relationship);
begin
  if FConnections.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FConnections.Remove(Value);
  end;
end;

procedure RPetalDeploymentNode.Insert_Connection(Index: Integer; Value: RConnection_Relationship);
begin
  if FConnections.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FConnections.Insert(Index, Value);
  end;
end;

procedure RPetalDeploymentNode.Delete_Connection(Index: Integer);
begin
  Remove_Connection(Get_Connection(Index));
end;

//  RPetalDeploymentNode
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDevice

//  RDevice
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RProcessor

constructor RProcessor.Create;
begin
  inherited Create;
	FProcesses := TList.Create;
end;

destructor RProcessor.Destroy;
var
  I: Integer;
begin
	for I := FProcesses.Count - 1 downto 0 do begin
		Get_Process(I).Free;
		FProcesses.Delete(I);
	end;
	FProcesses.Free;
	FProcesses := nil;
	inherited;
end;

procedure RProcessor.Set_Scheduling(Value: RProcessorSchedulingKind);
begin
  FScheduling := Value;
end;

function RProcessor.Get_ProcessCount: Integer;
begin
  Result := FProcesses.Count;
end;

function RProcessor.Get_Process(Index: Integer): RProcess;
begin
  Result := FProcesses[Index];
end;

procedure RProcessor.Add_Process(Value: RProcess);
begin
  if FProcesses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FProcesses.Add(Value);
  end;
end;

procedure RProcessor.Remove_Process(Value: RProcess);
begin
  if FProcesses.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FProcesses.Remove(Value);
  end;
end;

procedure RProcessor.Insert_Process(Index: Integer; Value: RProcess);
begin
  if FProcesses.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FProcesses.Insert(Index, Value);
  end;
end;

procedure RProcessor.Delete_Process(Index: Integer);
begin
  Remove_Process(Get_Process(Index));
end;

//  RProcessor
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RParameter

procedure RParameter.Set_Initv(Value: string);
begin
  FInitv := Value;
end;

procedure RParameter.Set_TypeExpression(Value: string);
begin
  FTypeExpression := Value;
end;

procedure RParameter.Set_Type_(Value: RClass);
begin
  if FType_ <> Value then begin
    FType_ := Value;
  end;
end;

//  RParameter
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RProcess

procedure RProcess.Set_Priority(Value: string);
begin
  FPriority := Value;
end;

//  RProcess
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RProcesses

constructor RProcesses.Create;
begin
  inherited Create;
	FProcsNDevs := TList.Create;
end;

destructor RProcesses.Destroy;
var
  I: Integer;
begin
	for I := FProcsNDevs.Count - 1 downto 0 do begin
		Get_ProcsNDev(I).Free;
		FProcsNDevs.Delete(I);
	end;
	FProcsNDevs.Free;
	FProcsNDevs := nil;
	inherited;
end;

function RProcesses.Get_ProcsNDevCount: Integer;
begin
  Result := FProcsNDevs.Count;
end;

function RProcesses.Get_ProcsNDev(Index: Integer): RPetalModel;
begin
  Result := FProcsNDevs[Index];
end;

procedure RProcesses.Add_ProcsNDev(Value: RPetalModel);
begin
  if FProcsNDevs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FProcsNDevs.Add(Value);
  end;
end;

procedure RProcesses.Remove_ProcsNDev(Value: RPetalModel);
begin
  if FProcsNDevs.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FProcsNDevs.Remove(Value);
  end;
end;

procedure RProcesses.Insert_ProcsNDev(Index: Integer; Value: RPetalModel);
begin
  if FProcsNDevs.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FProcsNDevs.Insert(Index, Value);
  end;
end;

procedure RProcesses.Delete_ProcsNDev(Index: Integer);
begin
  Remove_ProcsNDev(Get_ProcsNDev(Index));
end;

//  RProcesses
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalRelationship

procedure RPetalRelationship.Set_Label_(Value: string);
begin
  FLabel_ := Value;
end;

procedure RPetalRelationship.Set_Supplier(Value: RPetalModel);
begin
  if FSupplier <> Value then begin
    FSupplier := Value;
  end;
end;

//  RPetalRelationship
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RUses_Relationship

procedure RUses_Relationship.Set_Friend(Value: Boolean);
begin
  FFriend := Value;
end;

procedure RUses_Relationship.Set_Client_cardinality(Value: string);
begin
  FClient_cardinality := Value;
end;

procedure RUses_Relationship.Set_Supplier_cardinality(Value: string);
begin
  FSupplier_cardinality := Value;
end;

//  RUses_Relationship
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDependency_Relationship

//  RDependency_Relationship
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RConnection_Relationship

procedure RConnection_Relationship.Set_Supplier_is_device(Value: Boolean);
begin
  FSupplier_is_device := Value;
end;

procedure RConnection_Relationship.Set_Characteristics(Value: string);
begin
  FCharacteristics := Value;
end;

//  RConnection_Relationship
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInheritance_Relationship

procedure RInheritance_Relationship.Set_Friend(Value: Boolean);
begin
  FFriend := Value;
end;

procedure RInheritance_Relationship.Set_Virtual(Value: Boolean);
begin
  FVirtual := Value;
end;

//  RInheritance_Relationship
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RModule_Visibility_Relationship

procedure RModule_Visibility_Relationship.Set_Supplier_is_spec(Value: Boolean);
begin
  FSupplier_is_spec := Value;
end;

procedure RModule_Visibility_Relationship.Set_Supplier_is_subsystem(Value: Boolean);
begin
  FSupplier_is_subsystem := Value;
end;

//  RModule_Visibility_Relationship
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RRealize_Relationship

//  RRealize_Relationship
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RState_Transition

constructor RState_Transition.Create;
begin
  inherited Create;
	FEvent := nil;
	FAction := nil;
	FSendEvent := nil;
end;

destructor RState_Transition.Destroy;
begin
	if FEvent <> nil then begin
		FEvent.Free;
		FEvent := nil;
	end;
	if FAction <> nil then begin
		FAction.Free;
		FAction := nil;
	end;
	if FSendEvent <> nil then begin
		FSendEvent.Free;
		FSendEvent := nil;
	end;
	inherited;
end;

procedure RState_Transition.Set_Condition(Value: string);
begin
  FCondition := Value;
end;

procedure RState_Transition.Set_Event(Value: REvent);
begin
  if FEvent <> Value then begin
    FEvent := Value;
  end;
end;

procedure RState_Transition.Set_Action(Value: RAction);
begin
  if FAction <> Value then begin
    FAction := Value;
  end;
end;

procedure RState_Transition.Set_SendEvent(Value: RSendEvent);
begin
  if FSendEvent <> Value then begin
    FSendEvent := Value;
  end;
end;

//  RState_Transition
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RVisibility_Relationship

//  RVisibility_Relationship
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RRole

constructor RRole.Create;
begin
  inherited Create;
	FKeies := TList.Create;
end;

destructor RRole.Destroy;
var
  I: Integer;
begin
	for I := FKeies.Count - 1 downto 0 do begin
		Get_Key(I).Free;
		FKeies.Delete(I);
	end;
	FKeies.Free;
	FKeies := nil;
	inherited;
end;

procedure RRole.Set_Containment(Value: RContainmentKind);
begin
  FContainment := Value;
end;

procedure RRole.Set_Friend(Value: Boolean);
begin
  FFriend := Value;
end;

procedure RRole.Set_Is_aggregate(Value: Boolean);
begin
  FIs_aggregate := Value;
end;

procedure RRole.Set_Is_navigable(Value: Boolean);
begin
  FIs_navigable := Value;
end;

procedure RRole.Set_Is_principal(Value: Boolean);
begin
  FIs_principal := Value;
end;

procedure RRole.Set_Static(Value: Boolean);
begin
  FStatic := Value;
end;

procedure RRole.Set_Constraints(Value: string);
begin
  FConstraints := Value;
end;

procedure RRole.Set_client_cardinality(Value: string);
begin
  Fclient_cardinality := Value;
end;

function RRole.Get_KeyCount: Integer;
begin
  Result := FKeies.Count;
end;

function RRole.Get_Key(Index: Integer): RClassAttribute;
begin
  Result := FKeies[Index];
end;

procedure RRole.Add_Key(Value: RClassAttribute);
begin
  if FKeies.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FKeies.Add(Value);
  end;
end;

procedure RRole.Remove_Key(Value: RClassAttribute);
begin
  if FKeies.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FKeies.Remove(Value);
  end;
end;

procedure RRole.Insert_Key(Index: Integer; Value: RClassAttribute);
begin
  if FKeies.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FKeies.Insert(Index, Value);
  end;
end;

procedure RRole.Delete_Key(Index: Integer);
begin
  Remove_Key(Get_Key(Index));
end;

//  RRole
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RLink

constructor RLink.Create;
begin
  inherited Create;
	FAssociation := nil;
	FMessages := TList.Create;
end;

destructor RLink.Destroy;
var
  I: Integer;
begin
	for I := FMessages.Count - 1 downto 0 do begin
		Get_Message(I).Free;
		FMessages.Delete(I);
	end;
	FMessages.Free;
	FMessages := nil;
	inherited;
end;

procedure RLink.Set_Client_containment(Value: RContainmentKind);
begin
  FClient_containment := Value;
end;

procedure RLink.Set_Client_visibility(Value: RLinkVisibilityKind);
begin
  FClient_visibility := Value;
end;

procedure RLink.Set_Supplier_containment(Value: RContainmentKind);
begin
  FSupplier_containment := Value;
end;

procedure RLink.Set_Supplier_visibility(Value: RLinkVisibilityKind);
begin
  FSupplier_visibility := Value;
end;

procedure RLink.Set_Association(Value: RAssociation);
begin
  if FAssociation <> Value then begin
    FAssociation := Value;
  end;
end;

function RLink.Get_MessageCount: Integer;
begin
  Result := FMessages.Count;
end;

function RLink.Get_Message(Index: Integer): RMessage;
begin
  Result := FMessages[Index];
end;

procedure RLink.Add_Message(Value: RMessage);
begin
  if FMessages.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FMessages.Add(Value);
  end;
end;

procedure RLink.Remove_Message(Value: RMessage);
begin
  if FMessages.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FMessages.Remove(Value);
  end;
end;

procedure RLink.Insert_Message(Index: Integer; Value: RMessage);
begin
  if FMessages.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FMessages.Insert(Index, Value);
  end;
end;

procedure RLink.Delete_Message(Index: Integer);
begin
  Remove_Message(Get_Message(Index));
end;

//  RLink
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalStateVertex

constructor RPetalStateVertex.Create;
begin
  inherited Create;
	FTransitions := TList.Create;
end;

destructor RPetalStateVertex.Destroy;
var
  I: Integer;
begin
	for I := FTransitions.Count - 1 downto 0 do begin
		Get_Transition(I).Free;
		FTransitions.Delete(I);
	end;
	FTransitions.Free;
	FTransitions := nil;
	inherited;
end;

function RPetalStateVertex.Get_TransitionCount: Integer;
begin
  Result := FTransitions.Count;
end;

function RPetalStateVertex.Get_Transition(Index: Integer): RState_Transition;
begin
  Result := FTransitions[Index];
end;

procedure RPetalStateVertex.Add_Transition(Value: RState_Transition);
begin
  if FTransitions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTransitions.Add(Value);
  end;
end;

procedure RPetalStateVertex.Remove_Transition(Value: RState_Transition);
begin
  if FTransitions.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FTransitions.Remove(Value);
  end;
end;

procedure RPetalStateVertex.Insert_Transition(Index: Integer; Value: RState_Transition);
begin
  if FTransitions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FTransitions.Insert(Index, Value);
  end;
end;

procedure RPetalStateVertex.Delete_Transition(Index: Integer);
begin
  Remove_Transition(Get_Transition(Index));
end;

//  RPetalStateVertex
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RState

constructor RState.Create;
begin
  inherited Create;
	FStatemachine := nil;
	FActions := TList.Create;
end;

destructor RState.Destroy;
var
  I: Integer;
begin
	if FStatemachine <> nil then begin
		FStatemachine.Free;
		FStatemachine := nil;
	end;
	for I := FActions.Count - 1 downto 0 do begin
		Get_Action(I).Free;
		FActions.Delete(I);
	end;
	FActions.Free;
	FActions := nil;
	inherited;
end;

procedure RState.Set_Type_(Value: RStateKind);
begin
  FType_ := Value;
end;

procedure RState.Set_Statemachine(Value: RState_Machine);
begin
  if FStatemachine <> Value then begin
    FStatemachine := Value;
  end;
end;

function RState.Get_ActionCount: Integer;
begin
  Result := FActions.Count;
end;

function RState.Get_Action(Index: Integer): RAction;
begin
  Result := FActions[Index];
end;

procedure RState.Add_Action(Value: RAction);
begin
  if FActions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FActions.Add(Value);
  end;
end;

procedure RState.Remove_Action(Value: RAction);
begin
  if FActions.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FActions.Remove(Value);
  end;
end;

procedure RState.Insert_Action(Index: Integer; Value: RAction);
begin
  if FActions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FActions.Insert(Index, Value);
  end;
end;

procedure RState.Delete_Action(Index: Integer);
begin
  Remove_Action(Get_Action(Index));
end;

//  RState
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RActivityState

constructor RActivityState.Create;
begin
  inherited Create;
	FStatemachine := nil;
	FActions := TList.Create;
end;

destructor RActivityState.Destroy;
var
  I: Integer;
begin
	if FStatemachine <> nil then begin
		FStatemachine.Free;
		FStatemachine := nil;
	end;
	for I := FActions.Count - 1 downto 0 do begin
		Get_Action(I).Free;
		FActions.Delete(I);
	end;
	FActions.Free;
	FActions := nil;
	inherited;
end;

procedure RActivityState.Set_Statemachine(Value: RState_Machine);
begin
  if FStatemachine <> Value then begin
    FStatemachine := Value;
  end;
end;

function RActivityState.Get_ActionCount: Integer;
begin
  Result := FActions.Count;
end;

function RActivityState.Get_Action(Index: Integer): RAction;
begin
  Result := FActions[Index];
end;

procedure RActivityState.Add_Action(Value: RAction);
begin
  if FActions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FActions.Add(Value);
  end;
end;

procedure RActivityState.Remove_Action(Value: RAction);
begin
  if FActions.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FActions.Remove(Value);
  end;
end;

procedure RActivityState.Insert_Action(Index: Integer; Value: RAction);
begin
  if FActions.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FActions.Insert(Index, Value);
  end;
end;

procedure RActivityState.Delete_Action(Index: Integer);
begin
  Remove_Action(Get_Action(Index));
end;

//  RActivityState
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSynchronizationState

//  RSynchronizationState
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDecision

//  RDecision
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSubSystem

constructor RSubSystem.Create;
begin
  inherited Create;
	FPhysical_models := TList.Create;
	FPhysical_presentations := TList.Create;
	FVisible_modules := TList.Create;
end;

destructor RSubSystem.Destroy;
var
  I: Integer;
begin
	for I := FPhysical_models.Count - 1 downto 0 do begin
		Get_Physical_model(I).Free;
		FPhysical_models.Delete(I);
	end;
	FPhysical_models.Free;
	FPhysical_models := nil;
	for I := FPhysical_presentations.Count - 1 downto 0 do begin
		Get_Physical_presentation(I).Free;
		FPhysical_presentations.Delete(I);
	end;
	FPhysical_presentations.Free;
	FPhysical_presentations := nil;
	for I := FVisible_modules.Count - 1 downto 0 do begin
		Get_Visible_module(I).Free;
		FVisible_modules.Delete(I);
	end;
	FVisible_modules.Free;
	FVisible_modules := nil;
	inherited;
end;

function RSubSystem.Get_Physical_modelCount: Integer;
begin
  Result := FPhysical_models.Count;
end;

function RSubSystem.Get_Physical_model(Index: Integer): RPetalModel;
begin
  Result := FPhysical_models[Index];
end;

procedure RSubSystem.Add_Physical_model(Value: RPetalModel);
begin
  if FPhysical_models.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FPhysical_models.Add(Value);
  end;
end;

procedure RSubSystem.Remove_Physical_model(Value: RPetalModel);
begin
  if FPhysical_models.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FPhysical_models.Remove(Value);
  end;
end;

procedure RSubSystem.Insert_Physical_model(Index: Integer; Value: RPetalModel);
begin
  if FPhysical_models.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FPhysical_models.Insert(Index, Value);
  end;
end;

procedure RSubSystem.Delete_Physical_model(Index: Integer);
begin
  Remove_Physical_model(Get_Physical_model(Index));
end;

function RSubSystem.Get_Physical_presentationCount: Integer;
begin
  Result := FPhysical_presentations.Count;
end;

function RSubSystem.Get_Physical_presentation(Index: Integer): RModule_Diagram;
begin
  Result := FPhysical_presentations[Index];
end;

procedure RSubSystem.Add_Physical_presentation(Value: RModule_Diagram);
begin
  if FPhysical_presentations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FPhysical_presentations.Add(Value);
  end;
end;

procedure RSubSystem.Remove_Physical_presentation(Value: RModule_Diagram);
begin
  if FPhysical_presentations.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FPhysical_presentations.Remove(Value);
  end;
end;

procedure RSubSystem.Insert_Physical_presentation(Index: Integer; Value: RModule_Diagram);
begin
  if FPhysical_presentations.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FPhysical_presentations.Insert(Index, Value);
  end;
end;

procedure RSubSystem.Delete_Physical_presentation(Index: Integer);
begin
  Remove_Physical_presentation(Get_Physical_presentation(Index));
end;

function RSubSystem.Get_Visible_moduleCount: Integer;
begin
  Result := FVisible_modules.Count;
end;

function RSubSystem.Get_Visible_module(Index: Integer): RModule_Visibility_Relationship;
begin
  Result := FVisible_modules[Index];
end;

procedure RSubSystem.Add_Visible_module(Value: RModule_Visibility_Relationship);
begin
  if FVisible_modules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Add(Value);
  end;
end;

procedure RSubSystem.Remove_Visible_module(Value: RModule_Visibility_Relationship);
begin
  if FVisible_modules.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Remove(Value);
  end;
end;

procedure RSubSystem.Insert_Visible_module(Index: Integer; Value: RModule_Visibility_Relationship);
begin
  if FVisible_modules.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVisible_modules.Insert(Index, Value);
  end;
end;

procedure RSubSystem.Delete_Visible_module(Index: Integer);
begin
  Remove_Visible_module(Get_Visible_module(Index));
end;

//  RSubSystem
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSendEvent

constructor RSendEvent.Create;
begin
  inherited Create;
	FActionTime := nil;
	FEvent := nil;
end;

destructor RSendEvent.Destroy;
begin
	if FActionTime <> nil then begin
		FActionTime.Free;
		FActionTime := nil;
	end;
	if FEvent <> nil then begin
		FEvent.Free;
		FEvent := nil;
	end;
	inherited;
end;

procedure RSendEvent.Set_Parameters(Value: string);
begin
  FParameters := Value;
end;

procedure RSendEvent.Set_Target(Value: string);
begin
  FTarget := Value;
end;

procedure RSendEvent.Set_ActionTime(Value: RActionTime);
begin
  if FActionTime <> Value then begin
    FActionTime := Value;
  end;
end;

procedure RSendEvent.Set_Event(Value: REvent);
begin
  if FEvent <> Value then begin
    FEvent := Value;
  end;
end;

//  RSendEvent
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RAction

constructor RAction.Create;
begin
  inherited Create;
	FActionTime := nil;
end;

destructor RAction.Destroy;
begin
	if FActionTime <> nil then begin
		FActionTime.Free;
		FActionTime := nil;
	end;
	inherited;
end;

procedure RAction.Set_Quid(Value: string);
begin
  FQuid := Value;
end;

procedure RAction.Set_ActionTime(Value: RActionTime);
begin
  if FActionTime <> Value then begin
    FActionTime := Value;
  end;
end;

//  RAction
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RMechanism

constructor RMechanism.Create;
begin
  inherited Create;
	FLogical_models := TList.Create;
end;

destructor RMechanism.Destroy;
var
  I: Integer;
begin
	for I := FLogical_models.Count - 1 downto 0 do begin
		Get_Logical_model(I).Free;
		FLogical_models.Delete(I);
	end;
	FLogical_models.Free;
	FLogical_models := nil;
	inherited;
end;

procedure RMechanism.Set_Tag(Value: Integer);
begin
  FTag := Value;
end;

function RMechanism.Get_Logical_modelCount: Integer;
begin
  Result := FLogical_models.Count;
end;

function RMechanism.Get_Logical_model(Index: Integer): RObject;
begin
  Result := FLogical_models[Index];
end;

procedure RMechanism.Add_Logical_model(Value: RObject);
begin
  if FLogical_models.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Add(Value);
  end;
end;

procedure RMechanism.Remove_Logical_model(Value: RObject);
begin
  if FLogical_models.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Remove(Value);
  end;
end;

procedure RMechanism.Insert_Logical_model(Index: Integer; Value: RObject);
begin
  if FLogical_models.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLogical_models.Insert(Index, Value);
  end;
end;

procedure RMechanism.Delete_Logical_model(Index: Integer);
begin
  Remove_Logical_model(Get_Logical_model(Index));
end;

//  RMechanism
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalView

constructor RPetalView.Create;
begin
  inherited Create;
	FFont := nil;
	FModel := nil;
	FParent_View := nil;
	FLabel_s := TList.Create;
	FStereotype := nil;
	FVertices := TList.Create;
end;

destructor RPetalView.Destroy;
var
  I: Integer;
begin
	if FFont <> nil then begin
		FFont.Free;
		FFont := nil;
	end;
	for I := FLabel_s.Count - 1 downto 0 do begin
		Get_Label_(I).Free;
		FLabel_s.Delete(I);
	end;
	FLabel_s.Free;
	FLabel_s := nil;
	if FStereotype <> nil then begin
		FStereotype.Free;
		FStereotype := nil;
	end;
	for I := FVertices.Count - 1 downto 0 do begin
		Get_Vertex(I).Free;
		FVertices.Delete(I);
	end;
	FVertices.Free;
	FVertices := nil;
	inherited;
end;

procedure RPetalView.Set_Tag(Value: Integer);
begin
  FTag := Value;
end;

procedure RPetalView.Set_Line_color(Value: Integer);
begin
  FLine_color := Value;
end;

procedure RPetalView.Set_Fill_color(Value: Integer);
begin
  FFill_color := Value;
end;

procedure RPetalView.Set_Font(Value: RFont);
begin
  if FFont <> Value then begin
    FFont := Value;
  end;
end;

procedure RPetalView.Set_Model(Value: RPetalModel);
begin
  if FModel <> Value then begin
    FModel := Value;
  end;
end;

procedure RPetalView.Set_Parent_View(Value: RPetalView);
begin
  if FParent_View <> Value then begin
    FParent_View := Value;
  end;
end;

function RPetalView.Get_Label_Count: Integer;
begin
  Result := FLabel_s.Count;
end;

function RPetalView.Get_Label_(Index: Integer): RPetalLabelView;
begin
  Result := FLabel_s[Index];
end;

procedure RPetalView.Add_Label_(Value: RPetalLabelView);
begin
  if FLabel_s.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLabel_s.Add(Value);
  end;
end;

procedure RPetalView.Remove_Label_(Value: RPetalLabelView);
begin
  if FLabel_s.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FLabel_s.Remove(Value);
  end;
end;

procedure RPetalView.Insert_Label_(Index: Integer; Value: RPetalLabelView);
begin
  if FLabel_s.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FLabel_s.Insert(Index, Value);
  end;
end;

procedure RPetalView.Delete_Label_(Index: Integer);
begin
  Remove_Label_(Get_Label_(Index));
end;

procedure RPetalView.Set_Stereotype(Value: RPetalLabelView);
begin
  if FStereotype <> Value then begin
    FStereotype := Value;
  end;
end;

function RPetalView.Get_VertexCount: Integer;
begin
  Result := FVertices.Count;
end;

function RPetalView.Get_Vertex(Index: Integer): RPoint;
begin
  Result := FVertices[Index];
end;

procedure RPetalView.Add_Vertex(Value: RPoint);
begin
  if FVertices.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVertices.Add(Value);
  end;
end;

procedure RPetalView.Remove_Vertex(Value: RPoint);
begin
  if FVertices.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FVertices.Remove(Value);
  end;
end;

procedure RPetalView.Insert_Vertex(Index: Integer; Value: RPoint);
begin
  if FVertices.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FVertices.Insert(Index, Value);
  end;
end;

procedure RPetalView.Delete_Vertex(Index: Integer);
begin
  Remove_Vertex(Get_Vertex(Index));
end;

//  RPetalView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalNodeView

procedure RPetalNodeView.Set_AutoResize(Value: Boolean);
begin
  FAutoResize := Value;
end;

procedure RPetalNodeView.Set_Icon_style(Value: RIconStyleKind);
begin
  FIcon_style := Value;
end;

procedure RPetalNodeView.Set_Location(Value: TPoint);
begin
  FLocation := Value;
end;

procedure RPetalNodeView.Set_Height(Value: Integer);
begin
  FHeight := Value;
end;

procedure RPetalNodeView.Set_Width(Value: Integer);
begin
  FWidth := Value;
end;

//  RPetalNodeView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RClassView

constructor RClassView.Create;
begin
  inherited Create;
	FCompartment := nil;
end;

destructor RClassView.Destroy;
begin
	if FCompartment <> nil then begin
		FCompartment.Free;
		FCompartment := nil;
	end;
	inherited;
end;

procedure RClassView.Set_IncludeAttribute(Value: Boolean);
begin
  FIncludeAttribute := Value;
end;

procedure RClassView.Set_IncludeOperation(Value: Boolean);
begin
  FIncludeOperation := Value;
end;

procedure RClassView.Set_ShowCompartmentStereotypes(Value: Boolean);
begin
  FShowCompartmentStereotypes := Value;
end;

procedure RClassView.Set_ShowOperationSignature(Value: Boolean);
begin
  FShowOperationSignature := Value;
end;

procedure RClassView.Set_Annotation(Value: Integer);
begin
  FAnnotation := Value;
end;

procedure RClassView.Set_Icon(Value: string);
begin
  FIcon := Value;
end;

procedure RClassView.Set_SuppressAttribute(Value: Boolean);
begin
  FSuppressAttribute := Value;
end;

procedure RClassView.Set_SuppressOperation(Value: Boolean);
begin
  FSuppressOperation := Value;
end;

procedure RClassView.Set_Compartment(Value: RCompartment);
begin
  if FCompartment <> Value then begin
    FCompartment := Value;
  end;
end;

//  RClassView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RCategoryView

procedure RCategoryView.Set_Icon(Value: string);
begin
  FIcon := Value;
end;

//  RCategoryView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RUseCaseView

procedure RUseCaseView.Set_Icon(Value: string);
begin
  FIcon := Value;
end;

//  RUseCaseView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RActivityStateView

constructor RActivityStateView.Create;
begin
  inherited Create;
	FCompartment := nil;
end;

destructor RActivityStateView.Destroy;
begin
	if FCompartment <> nil then begin
		FCompartment.Free;
		FCompartment := nil;
	end;
	inherited;
end;

procedure RActivityStateView.Set_Annotation(Value: Integer);
begin
  FAnnotation := Value;
end;

procedure RActivityStateView.Set_Compartment(Value: RCompartment);
begin
  if FCompartment <> Value then begin
    FCompartment := Value;
  end;
end;

//  RActivityStateView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RClassInstanceView

procedure RClassInstanceView.Set_Annotation(Value: Integer);
begin
  FAnnotation := Value;
end;

procedure RClassInstanceView.Set_Icon(Value: string);
begin
  FIcon := Value;
end;

//  RClassInstanceView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RCompartment

constructor RCompartment.Create;
begin
  inherited Create;
	FCompartmentItems := TList.Create;
end;

destructor RCompartment.Destroy;
var
  I: Integer;
begin
	for I := FCompartmentItems.Count - 1 downto 0 do begin
		Get_CompartmentItem(I).Free;
		FCompartmentItems.Delete(I);
	end;
	FCompartmentItems.Free;
	FCompartmentItems := nil;
	inherited;
end;

procedure RCompartment.Set_Anchor(Value: Integer);
begin
  FAnchor := Value;
end;

procedure RCompartment.Set_Justify(Value: Integer);
begin
  FJustify := Value;
end;

procedure RCompartment.Set_Max_width(Value: Integer);
begin
  FMax_width := Value;
end;

procedure RCompartment.Set_Nlines(Value: Integer);
begin
  FNlines := Value;
end;

function RCompartment.Get_CompartmentItemCount: Integer;
begin
  Result := FCompartmentItems.Count;
end;

function RCompartment.Get_CompartmentItem(Index: Integer): RCompartment;
begin
  Result := FCompartmentItems[Index];
end;

procedure RCompartment.Add_CompartmentItem(Value: RCompartment);
begin
  if FCompartmentItems.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FCompartmentItems.Add(Value);
  end;
end;

procedure RCompartment.Remove_CompartmentItem(Value: RCompartment);
begin
  if FCompartmentItems.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FCompartmentItems.Remove(Value);
  end;
end;

procedure RCompartment.Insert_CompartmentItem(Index: Integer; Value: RCompartment);
begin
  if FCompartmentItems.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FCompartmentItems.Insert(Index, Value);
  end;
end;

procedure RCompartment.Delete_CompartmentItem(Index: Integer);
begin
  Remove_CompartmentItem(Get_CompartmentItem(Index));
end;

//  RCompartment
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDecisionView

//  RDecisionView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDestruction_Marker

//  RDestruction_Marker
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDeviceView

procedure RDeviceView.Set_Annotation(Value: Integer);
begin
  FAnnotation := Value;
end;

//  RDeviceView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInterObjView

constructor RInterObjView.Create;
begin
  inherited Create;
	FFocus_Of_Controls := TList.Create;
end;

destructor RInterObjView.Destroy;
var
  I: Integer;
begin
	for I := FFocus_Of_Controls.Count - 1 downto 0 do begin
		Get_Focus_Of_Control(I).Free;
		FFocus_Of_Controls.Delete(I);
	end;
	FFocus_Of_Controls.Free;
	FFocus_Of_Controls := nil;
	inherited;
end;

procedure RInterObjView.Set_Annotation(Value: Integer);
begin
  FAnnotation := Value;
end;

procedure RInterObjView.Set_Icon(Value: string);
begin
  FIcon := Value;
end;

procedure RInterObjView.Set_Icon_height(Value: Integer);
begin
  FIcon_height := Value;
end;

procedure RInterObjView.Set_Icon_width(Value: Integer);
begin
  FIcon_width := Value;
end;

procedure RInterObjView.Set_Icon_y_offset(Value: Integer);
begin
  FIcon_y_offset := Value;
end;

function RInterObjView.Get_Focus_Of_ControlCount: Integer;
begin
  Result := FFocus_Of_Controls.Count;
end;

function RInterObjView.Get_Focus_Of_Control(Index: Integer): RFocus_Of_Control;
begin
  Result := FFocus_Of_Controls[Index];
end;

procedure RInterObjView.Add_Focus_Of_Control(Value: RFocus_Of_Control);
begin
  if FFocus_Of_Controls.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFocus_Of_Controls.Add(Value);
  end;
end;

procedure RInterObjView.Remove_Focus_Of_Control(Value: RFocus_Of_Control);
begin
  if FFocus_Of_Controls.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FFocus_Of_Controls.Remove(Value);
  end;
end;

procedure RInterObjView.Insert_Focus_Of_Control(Index: Integer; Value: RFocus_Of_Control);
begin
  if FFocus_Of_Controls.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FFocus_Of_Controls.Insert(Index, Value);
  end;
end;

procedure RInterObjView.Delete_Focus_Of_Control(Index: Integer);
begin
  Remove_Focus_Of_Control(Get_Focus_Of_Control(Index));
end;

//  RInterObjView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RModView

procedure RModView.Set_Icon(Value: string);
begin
  FIcon := Value;
end;

//  RModView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RObjectView

constructor RObjectView.Create;
begin
  inherited Create;
	FCompartment := nil;
end;

destructor RObjectView.Destroy;
begin
	if FCompartment <> nil then begin
		FCompartment.Free;
		FCompartment := nil;
	end;
	inherited;
end;

procedure RObjectView.Set_Annotation(Value: Integer);
begin
  FAnnotation := Value;
end;

procedure RObjectView.Set_Subobjects(Value: Integer);
begin
  FSubobjects := Value;
end;

procedure RObjectView.Set_X_offset(Value: Real);
begin
  FX_offset := Value;
end;

procedure RObjectView.Set_Y_offset(Value: Real);
begin
  FY_offset := Value;
end;

procedure RObjectView.Set_Icon(Value: string);
begin
  FIcon := Value;
end;

procedure RObjectView.Set_Compartment(Value: RCompartment);
begin
  if FCompartment <> Value then begin
    FCompartment := Value;
  end;
end;

//  RObjectView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RProcessorView

procedure RProcessorView.Set_Annotation(Value: Integer);
begin
  FAnnotation := Value;
end;

//  RProcessorView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RStateView

constructor RStateView.Create;
begin
  inherited Create;
	FCompartment := nil;
end;

destructor RStateView.Destroy;
begin
	if FCompartment <> nil then begin
		FCompartment.Free;
		FCompartment := nil;
	end;
	inherited;
end;

procedure RStateView.Set_Compartment(Value: RCompartment);
begin
  if FCompartment <> Value then begin
    FCompartment := Value;
  end;
end;

//  RStateView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSubSysView

//  RSubSysView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RFocus_Of_Control

procedure RFocus_Of_Control.Set_Nested(Value: Boolean);
begin
  FNested := Value;
end;

procedure RFocus_Of_Control.Set_Y_coord(Value: Integer);
begin
  FY_coord := Value;
end;

procedure RFocus_Of_Control.Set_InterObjView(Value: RInterObjView);
begin
  if FInterObjView <> Value then begin
    FInterObjView := Value;
  end;
end;

//  RFocus_Of_Control
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInterfaceView

procedure RInterfaceView.Set_Icon(Value: string);
begin
  FIcon := Value;
end;

//  RInterfaceView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RNoteView

//  RNoteView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSwimlane

//  RSwimlane
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSynchronizationView

procedure RSynchronizationView.Set_Sync_flow_direction(Value: RSynchFlowDirectionKind);
begin
  FSync_flow_direction := Value;
end;

procedure RSynchronizationView.Set_Sync_is_horizontal(Value: Boolean);
begin
  FSync_is_horizontal := Value;
end;

//  RSynchronizationView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RTierView

procedure RTierView.Set_Hidden(Value: Boolean);
begin
  FHidden := Value;
end;

//  RTierView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalLabelView

//  RPetalLabelView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RItemLabel

procedure RItemLabel.Set_Anchor(Value: Integer);
begin
  FAnchor := Value;
end;

procedure RItemLabel.Set_Anchor_loc(Value: Integer);
begin
  FAnchor_loc := Value;
end;

procedure RItemLabel.Set_Hidden(Value: Boolean);
begin
  FHidden := Value;
end;

procedure RItemLabel.Set_Justify(Value: Integer);
begin
  FJustify := Value;
end;

procedure RItemLabel.Set_Label_(Value: string);
begin
  FLabel_ := Value;
end;

procedure RItemLabel.Set_Max_width(Value: Integer);
begin
  FMax_width := Value;
end;

procedure RItemLabel.Set_Nlines(Value: Integer);
begin
  FNlines := Value;
end;

//  RItemLabel
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RLabel

procedure RLabel.Set_Max_width(Value: Integer);
begin
  FMax_width := Value;
end;

procedure RLabel.Set_Nlines(Value: Integer);
begin
  FNlines := Value;
end;

procedure RLabel.Set_Label_(Value: string);
begin
  FLabel_ := Value;
end;

//  RLabel
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSegLabel

procedure RSegLabel.Set_Anchor(Value: Integer);
begin
  FAnchor := Value;
end;

procedure RSegLabel.Set_Anchor_loc(Value: Integer);
begin
  FAnchor_loc := Value;
end;

procedure RSegLabel.Set_Hidden(Value: Boolean);
begin
  FHidden := Value;
end;

procedure RSegLabel.Set_Justify(Value: Integer);
begin
  FJustify := Value;
end;

procedure RSegLabel.Set_Label_(Value: string);
begin
  FLabel_ := Value;
end;

procedure RSegLabel.Set_Max_width(Value: Integer);
begin
  FMax_width := Value;
end;

procedure RSegLabel.Set_Nlines(Value: Integer);
begin
  FNlines := Value;
end;

procedure RSegLabel.Set_Orientation(Value: Integer);
begin
  FOrientation := Value;
end;

procedure RSegLabel.Set_PctDist(Value: Real);
begin
  FPctDist := Value;
end;

//  RSegLabel
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RMessView

constructor RMessView.Create;
begin
  inherited Create;
	FDataFlowViews := TList.Create;
	FObject_arc := nil;
end;

destructor RMessView.Destroy;
begin
	FDataFlowViews.Free;
	FDataFlowViews := nil;
	inherited;
end;

procedure RMessView.Set_Dir(Value: RMessViewDirectionKind);
begin
  FDir := Value;
end;

procedure RMessView.Set_Orientation(Value: Integer);
begin
  FOrientation := Value;
end;

procedure RMessView.Set_Origin(Value: TPoint);
begin
  FOrigin := Value;
end;

procedure RMessView.Set_PctDist(Value: Real);
begin
  FPctDist := Value;
end;

procedure RMessView.Set_Terminus(Value: TPoint);
begin
  FTerminus := Value;
end;

function RMessView.Get_DataFlowViewCount: Integer;
begin
  Result := FDataFlowViews.Count;
end;

function RMessView.Get_DataFlowView(Index: Integer): RDataFlowView;
begin
  Result := FDataFlowViews[Index];
end;

procedure RMessView.Add_DataFlowView(Value: RDataFlowView);
begin
  if FDataFlowViews.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FDataFlowViews.Add(Value);
    Value.FMessView := Self;
  end;
end;

procedure RMessView.Remove_DataFlowView(Value: RDataFlowView);
begin
  if FDataFlowViews.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FDataFlowViews.Remove(Value);
    Value.FMessView := nil;
  end;
end;

procedure RMessView.Insert_DataFlowView(Index: Integer; Value: RDataFlowView);
begin
  if FDataFlowViews.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FDataFlowViews.Insert(Index, Value);
    Value.FMessView := Self;
  end;
end;

procedure RMessView.Delete_DataFlowView(Index: Integer);
begin
  Remove_DataFlowView(Get_DataFlowView(Index));
end;

procedure RMessView.Set_Object_arc(Value: RLinkView);
begin
  if FObject_arc <> Value then begin
    FObject_arc := Value;
  end;
end;

//  RMessView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetalEdgeView

procedure RPetalEdgeView.Set_Line_style(Value: RLineStyleKind);
begin
  FLine_style := Value;
end;

procedure RPetalEdgeView.Set_Stereotype(Value: Boolean);
begin
  FStereotype := Value;
end;

procedure RPetalEdgeView.Set_Origin_attachment(Value: TPoint);
begin
  FOrigin_attachment := Value;
end;

procedure RPetalEdgeView.Set_Terminal_attachment(Value: TPoint);
begin
  FTerminal_attachment := Value;
end;

procedure RPetalEdgeView.Set_Client(Value: RPetalView);
begin
  if FClient <> Value then begin
    FClient := Value;
  end;
end;

procedure RPetalEdgeView.Set_Supplier(Value: RPetalView);
begin
  if FSupplier <> Value then begin
    FSupplier := Value;
  end;
end;

//  RPetalEdgeView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RAssocAttachView

//  RAssocAttachView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RAssociationViewNew

constructor RAssociationViewNew.Create;
begin
  inherited Create;
	FRoleview_lists := TList.Create;
end;

destructor RAssociationViewNew.Destroy;
var
  I: Integer;
begin
	for I := FRoleview_lists.Count - 1 downto 0 do begin
		Get_Roleview_list(I).Free;
		FRoleview_lists.Delete(I);
	end;
	FRoleview_lists.Free;
	FRoleview_lists := nil;
	inherited;
end;

procedure RAssociationViewNew.Set_Location(Value: TPoint);
begin
  FLocation := Value;
end;

function RAssociationViewNew.Get_Roleview_listCount: Integer;
begin
  Result := FRoleview_lists.Count;
end;

function RAssociationViewNew.Get_Roleview_list(Index: Integer): RRoleView;
begin
  Result := FRoleview_lists[Index];
end;

procedure RAssociationViewNew.Add_Roleview_list(Value: RRoleView);
begin
  if FRoleview_lists.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FRoleview_lists.Add(Value);
  end;
end;

procedure RAssociationViewNew.Remove_Roleview_list(Value: RRoleView);
begin
  if FRoleview_lists.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FRoleview_lists.Remove(Value);
  end;
end;

procedure RAssociationViewNew.Insert_Roleview_list(Index: Integer; Value: RRoleView);
begin
  if FRoleview_lists.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FRoleview_lists.Insert(Index, Value);
  end;
end;

procedure RAssociationViewNew.Delete_Roleview_list(Index: Integer);
begin
  Remove_Roleview_list(Get_Roleview_list(Index));
end;

//  RAssociationViewNew
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RAttachView

//  RAttachView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RConnectionView

//  RConnectionView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDependencyView

//  RDependencyView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RImportView

//  RImportView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInheritView

procedure RInheritView.Set_drawSupplier(Value: RInheritTreeView);
begin
  if FdrawSupplier <> Value then begin
    FdrawSupplier := Value;
  end;
end;

//  RInheritView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RLinkView

//  RLinkView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RLinkSelfView

procedure RLinkSelfView.Set_Location(Value: TPoint);
begin
  FLocation := Value;
end;

//  RLinkSelfView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RModVisView

//  RModVisView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RRealizeView

//  RRealizeView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RTransView

procedure RTransView.Set_X_offset(Value: Boolean);
begin
  FX_offset := Value;
end;

//  RTransView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RUsesView

//  RUsesView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInterMessView

procedure RInterMessView.Set_Location(Value: TPoint);
begin
  FLocation := Value;
end;

procedure RInterMessView.Set_Ordinal(Value: Integer);
begin
  FOrdinal := Value;
end;

procedure RInterMessView.Set_Origin(Value: TPoint);
begin
  FOrigin := Value;
end;

procedure RInterMessView.Set_Terminus(Value: TPoint);
begin
  FTerminus := Value;
end;

procedure RInterMessView.Set_Focus_Src(Value: RFocus_Of_Control);
begin
  if FFocus_Src <> Value then begin
    FFocus_Src := Value;
  end;
end;

procedure RInterMessView.Set_Focus_Entry(Value: RFocus_Of_Control);
begin
  if FFocus_Entry <> Value then begin
    FFocus_Entry := Value;
  end;
end;

//  RInterMessView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RRoleView

procedure RRoleView.Set_Location(Value: TPoint);
begin
  FLocation := Value;
end;

//  RRoleView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSelfTransView

procedure RSelfTransView.Set_Location(Value: TPoint);
begin
  FLocation := Value;
end;

//  RSelfTransView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSelfMessView

procedure RSelfMessView.Set_Ordinal(Value: Integer);
begin
  FOrdinal := Value;
end;

procedure RSelfMessView.Set_Origin(Value: TPoint);
begin
  FOrigin := Value;
end;

procedure RSelfMessView.Set_Terminus(Value: TPoint);
begin
  FTerminus := Value;
end;

procedure RSelfMessView.Set_Focus_Src(Value: RFocus_Of_Control);
begin
  if FFocus_Src <> Value then begin
    FFocus_Src := Value;
  end;
end;

procedure RSelfMessView.Set_Focus_Entry(Value: RFocus_Of_Control);
begin
  if FFocus_Entry <> Value then begin
    FFocus_Entry := Value;
  end;
end;

//  RSelfMessView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RInheritTreeView

//  RInheritTreeView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDataFlowView

procedure RDataFlowView.Set_Dir(Value: RDataFlowDirectionKind);
begin
  FDir := Value;
end;

procedure RDataFlowView.Set_Height(Value: Integer);
begin
  FHeight := Value;
end;

procedure RDataFlowView.Set_MessView(Value: RMessView);
begin
  if FMessView <> Value then begin
    if MessView <> nil then FMessView.FDataFlowViews.Remove(Self);
    FMessView := Value;
    if FMessView <> nil then FMessView.FDataFlowViews.Add(Self);
  end;
end;

//  RDataFlowView
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDesign

constructor RDesign.Create;
begin
  inherited Create;
	FAttributes := TList.Create;
	FDefaults := nil;
	FProperties := nil;
	FRoot_category := nil;
	FRoot_usecase_package := nil;
	FRoot_subsystem := nil;
	FProcess_structure := nil;
end;

destructor RDesign.Destroy;
var
  I: Integer;
begin
	for I := FAttributes.Count - 1 downto 0 do begin
		Get_Attribute(I).Free;
		FAttributes.Delete(I);
	end;
	FAttributes.Free;
	FAttributes := nil;
	if FDefaults <> nil then begin
		FDefaults.Free;
		FDefaults := nil;
	end;
	if FProperties <> nil then begin
		FProperties.Free;
		FProperties := nil;
	end;
	if FRoot_category <> nil then begin
		FRoot_category.Free;
		FRoot_category := nil;
	end;
	if FRoot_usecase_package <> nil then begin
		FRoot_usecase_package.Free;
		FRoot_usecase_package := nil;
	end;
	if FRoot_subsystem <> nil then begin
		FRoot_subsystem.Free;
		FRoot_subsystem := nil;
	end;
	if FProcess_structure <> nil then begin
		FProcess_structure.Free;
		FProcess_structure := nil;
	end;
	inherited;
end;

procedure RDesign.Set_Is_loaded(Value: Boolean);
begin
  FIs_loaded := Value;
end;

procedure RDesign.Set_Is_unit(Value: Boolean);
begin
  FIs_unit := Value;
end;

function RDesign.Get_AttributeCount: Integer;
begin
  Result := FAttributes.Count;
end;

function RDesign.Get_Attribute(Index: Integer): RAttribute;
begin
  Result := FAttributes[Index];
end;

procedure RDesign.Add_Attribute(Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FAttributes.Add(Value);
  end;
end;

procedure RDesign.Remove_Attribute(Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FAttributes.Remove(Value);
  end;
end;

procedure RDesign.Insert_Attribute(Index: Integer; Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FAttributes.Insert(Index, Value);
  end;
end;

procedure RDesign.Delete_Attribute(Index: Integer);
begin
  Remove_Attribute(Get_Attribute(Index));
end;

procedure RDesign.Set_Defaults(Value: RDefaults);
begin
  if FDefaults <> Value then begin
    FDefaults := Value;
  end;
end;

procedure RDesign.Set_Properties(Value: RProperties);
begin
  if FProperties <> Value then begin
    FProperties := Value;
  end;
end;

procedure RDesign.Set_Root_category(Value: RClass_Category);
begin
  if FRoot_category <> Value then begin
    FRoot_category := Value;
  end;
end;

procedure RDesign.Set_Root_usecase_package(Value: RClass_Category);
begin
  if FRoot_usecase_package <> Value then begin
    FRoot_usecase_package := Value;
  end;
end;

procedure RDesign.Set_Root_subsystem(Value: RSubSystem);
begin
  if FRoot_subsystem <> Value then begin
    FRoot_subsystem := Value;
  end;
end;

procedure RDesign.Set_Process_structure(Value: RProcesses);
begin
  if FProcess_structure <> Value then begin
    FProcess_structure := Value;
  end;
end;

//  RDesign
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RProperties

constructor RProperties.Create;
begin
  inherited Create;
	FAttributes := TList.Create;
end;

destructor RProperties.Destroy;
var
  I: Integer;
begin
	for I := FAttributes.Count - 1 downto 0 do begin
		Get_Attribute(I).Free;
		FAttributes.Delete(I);
	end;
	FAttributes.Free;
	FAttributes := nil;
	inherited;
end;

function RProperties.Get_AttributeCount: Integer;
begin
  Result := FAttributes.Count;
end;

function RProperties.Get_Attribute(Index: Integer): RAttribute;
begin
  Result := FAttributes[Index];
end;

procedure RProperties.Add_Attribute(Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FAttributes.Add(Value);
  end;
end;

procedure RProperties.Remove_Attribute(Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) = -1 then Exit;
  if Value <> nil then begin
    FAttributes.Remove(Value);
  end;
end;

procedure RProperties.Insert_Attribute(Index: Integer; Value: RAttribute);
begin
  if FAttributes.IndexOf(Value) <> -1 then Exit;
  if Value <> nil then begin
    FAttributes.Insert(Index, Value);
  end;
end;

procedure RProperties.Delete_Attribute(Index: Integer);
begin
  Remove_Attribute(Get_Attribute(Index));
end;

//  RProperties
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPetal

procedure RPetal.Set__written(Value: string);
begin
  F_written := Value;
end;

procedure RPetal.Set_CharSet(Value: Integer);
begin
  FCharSet := Value;
end;

procedure RPetal.Set_Version(Value: Integer);
begin
  FVersion := Value;
end;

//  RPetal
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RFont

procedure RFont.Set_Bold(Value: Boolean);
begin
  FBold := Value;
end;

procedure RFont.Set_Color(Value: Integer);
begin
  FColor := Value;
end;

procedure RFont.Set_Default_color(Value: Boolean);
begin
  FDefault_color := Value;
end;

procedure RFont.Set_Face(Value: string);
begin
  FFace := Value;
end;

procedure RFont.Set_Italics(Value: Boolean);
begin
  FItalics := Value;
end;

procedure RFont.Set_Size(Value: Integer);
begin
  FSize := Value;
end;

procedure RFont.Set_Strike(Value: Boolean);
begin
  FStrike := Value;
end;

procedure RFont.Set_Underline(Value: Boolean);
begin
  FUnderline := Value;
end;

procedure RFont.Set_CharSet(Value: Integer);
begin
  FCharSet := Value;
end;

//  RFont
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RAttribute

procedure RAttribute.Set_Name(Value: string);
begin
  FName := Value;
end;

procedure RAttribute.Set_Tool(Value: string);
begin
  FTool := Value;
end;

procedure RAttribute.Set_Value(Value: string);
begin
  FValue := Value;
end;

//  RAttribute
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RDefaults

constructor RDefaults.Create;
begin
  inherited Create;
	FDefaultFont := nil;
end;

destructor RDefaults.Destroy;
begin
	if FDefaultFont <> nil then begin
		FDefaultFont.Free;
		FDefaultFont := nil;
	end;
	inherited;
end;

procedure RDefaults.Set_AutoResize(Value: Boolean);
begin
  FAutoResize := Value;
end;

procedure RDefaults.Set_BottomMargin(Value: Real);
begin
  FBottomMargin := Value;
end;

procedure RDefaults.Set_ClipIconLabels(Value: Boolean);
begin
  FClipIconLabels := Value;
end;

procedure RDefaults.Set_GridX(Value: Integer);
begin
  FGridX := Value;
end;

procedure RDefaults.Set_GridY(Value: Integer);
begin
  FGridY := Value;
end;

procedure RDefaults.Set_LeftMargin(Value: Real);
begin
  FLeftMargin := Value;
end;

procedure RDefaults.Set_Notation(Value: RnotationKind);
begin
  FNotation := Value;
end;

procedure RDefaults.Set_PageOverlap(Value: Real);
begin
  FPageOverlap := Value;
end;

procedure RDefaults.Set_RightMargin(Value: Real);
begin
  FRightMargin := Value;
end;

procedure RDefaults.Set_ShowClassOfObject(Value: Boolean);
begin
  FShowClassOfObject := Value;
end;

procedure RDefaults.Set_ShowMessageNum(Value: Integer);
begin
  FShowMessageNum := Value;
end;

procedure RDefaults.Set_SnapToGrid(Value: Boolean);
begin
  FSnapToGrid := Value;
end;

procedure RDefaults.Set_TopMargin(Value: Real);
begin
  FTopMargin := Value;
end;

procedure RDefaults.Set_DefaultFont(Value: RFont);
begin
  if FDefaultFont <> Value then begin
    FDefaultFont := Value;
  end;
end;

//  RDefaults
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RSemantic_Info

procedure RSemantic_Info.Set_PDL(Value: string);
begin
  FPDL := Value;
end;

procedure RSemantic_Info.Set_Diagram_ref(Value: RPetalDiagram);
begin
  if FDiagram_ref <> Value then begin
    FDiagram_ref := Value;
  end;
end;

//  RSemantic_Info
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RExternal_doc

procedure RExternal_doc.Set_External_doc_path(Value: string);
begin
  FExternal_doc_path := Value;
end;

procedure RExternal_doc.Set_External_doc_url(Value: string);
begin
  FExternal_doc_url := Value;
end;

//  RExternal_doc
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  RPoint

procedure RPoint.Set_X(Value: Integer);
begin
  FX := Value;
end;

procedure RPoint.Set_Y(Value: Integer);
begin
  FY := Value;
end;

//  RPoint
/////////////////////////////////////////////////////////////////////////////


end.
