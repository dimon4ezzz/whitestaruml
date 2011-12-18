unit PetalObjFacto;

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
  PetalElements, GmrNodes;

type
  RPetalObjectClass = class of RPetalObject;

  RPetalObjectFactory = class
  public
    function Create_PetalModel(PetalObjClass: RPetalObjectClass; AClass_Category: RClass_Category; ASTObj: NObject): RPetalModel; overload;
    function Create_PetalModel(PetalObjClass: RPetalObjectClass; ASubSystem: RSubSystem; ASTObj: NObject): RPetalModel; overload;
    function Create_PetalModel(PetalObjClass: RPetalObjectClass; AUseCase: RUseCase; ASTObj: NObject): RPetalModel; overload;
    function Create_PetalModel(PetalObjClass: RPetalObjectClass; AProcesses: RProcesses; ASTObj: NObject): RPetalModel; overload;
    function Create_PetalDiagram(PetalObjClass: RPetalObjectClass; AClass_Category: RClass_Category; ASTObj: NObject): RPetalDiagram; overload;
    function Create_PetalDiagram(PetalObjClass: RPetalObjectClass; AUseCase: RUseCase; ASTObj: NObject): RPetalDiagram; overload;

    function Create_PetalView(PetalObjClass: RPetalObjectClass; ADiagram: RPetalDiagram; ASTObj: NObject): RPetalView; overload;
    function Create_PetalLabelViewAsLabel(PetalObjClass: RPetalObjectClass; APetalView: RPetalView; ASTObj: NObject): RPetalLabelView;
    function Create_PetalLabelViewAsStereotype(PetalObjClass: RPetalObjectClass; APetalView: RPetalView; ASTObj: NObject): RPetalLabelView;
    function Create_Class(PetalObjClass: RPetalObjectClass; AClass: RClass; ASTObj: NObject): RClass;
    function Create_PetalStateVertex(APetalObjClass: RPetalObjectClass; AState_Machine: RState_Machine; ASTObj: NObject): RPetalStateVertex;

    function Create_Action(AActivityState: RActivityState; ASTObj: NObject): RAction; overload;
    function Create_Action(AState: RState; ASTObj: NObject): RAction; overload;
    function Create_Action(AState_Transition: RState_Transition; ASTObj: NObject): RAction; overload;
    function Create_ActionTime(AAction: RAction; ASTObj: NObject): RActionTime; overload;
    function Create_ActionTime(ASendEvent: RSendEvent; ASTObj: NObject): RActionTime; overload;
    function Create_ActivityDiagram(AState_Machine: RState_Machine; ASTObj: NObject): RActivityDiagram;
    function Create_Attribute(AModel: RPetalModel; ASTObj: NObject): RAttribute; overload;
    function Create_Attribute(ADesign: RDesign; ASTObj: NObject): RAttribute; overload;
    function Create_Attribute(AProperties: RProperties; ASTObj: NObject): RAttribute; overload;
    function Create_ClassAttribute(AClass: RClass; ASTObj: NObject): RClassAttribute; overload;
    function Create_ClassAttribute(ARole: RRole; ASTObj: NObject): RClassAttribute; overload;
    function Create_Class_Category_As_Root_category(ADesign: RDesign; ASTObj: NObject): RClass_Category;
    function Create_Class_Category_As_Root_usecase_package(ADesign: RDesign; ASTObj: NObject): RClass_Category;
    function Create_Compartment(AActivityStateView: RActivityStateView; ASTObj: NObject): RCompartment; overload;
    function Create_Compartment(AClassView: RClassView; ASTObj: NObject): RCompartment; overload;
    function Create_Compartment(ACompartment: RCompartment; ASTObj: NObject): RCompartment; overload;
    function Create_Compartment(AObjectView: RObjectView; ASTObj: NObject): RCompartment; overload;
    function Create_Compartment(AStateView: RStateView; ASTObj: NObject): RCompartment; overload;
    function Create_Connection_Relationship(ADepoloymentNode: RPetalDeploymentNode; ASTObj: NObject): RConnection_Relationship;
    function Create_Defaults(ADesign: RDesign; ASTObj: NObject): RDefaults;
    function Create_Dependency_Relationship(AClass_Category: RClass_Category; ASTObj: NObject): RDependency_Relationship; overload;
    function Create_Dependency_Relationship(AUseCase: RUseCase; ASTObj: NObject): RDependency_Relationship; overload;
    function Create_External_doc(AModel: RPetalModel; ASTObj: NObject): RExternal_doc;
    function Create_Event(AState_Transition: RState_Transition; ASTObj: NObject): REvent; overload;
    function Create_Event(AActionTime: RActionTime; ASTObj: NObject): REvent; overload;
    function Create_Event(ASendEvent: RSendEvent; ASTObj: NObject): REvent; overload;
    function Create_Focus_Of_Control(AInterObjView: RInterObjView; ASTObj: NObject): RFocus_Of_Control;
    function Create_Font(AView: RPetalView; ASTObj: NObject): RFont; overload;
    function Create_Font(ADefaults: RDefaults; ASTObj: NObject): RFont; overload;
    function Create_Inheritance_Relationship(AClass: RClass; ASTObj: NObject): RInheritance_Relationship; overload;
    function Create_Inheritance_Relationship(AUseCase: RUseCase; ASTObj: NObject): RInheritance_Relationship; overload;
    function Create_Link(AObject: RObject; ASTObj: NObject): RLink;
    function Create_Message(ALink: RLink; ASTObj: NObject): RMessage;
    function Create_Module_Diagram(ASubSystem: RSubSystem; ASTObj: NObject): RModule_Diagram;
    function Create_Module_Visibility_Relationship(AModule: RModule; ASTObj: NObject): RModule_Visibility_Relationship; overload;
    function Create_Module_Visibility_Relationship(ASubSystem: RSubSystem; ASTObj: NObject): RModule_Visibility_Relationship; overload;
    function Create_Object(AMechanism: RMechanism; ASTObj: NObject): RObject; overload;
    function Create_Object(AState_Machine: RState_Machine; ASTObj: NObject): RObject; overload;
    function Create_Operation(AClass: RClass; ASTObj: NObject): ROperation;
    function Create_Parameter(AOperation: ROperation; ASTObj: NObject): RParameter; overload;
    function Create_Parameter(AParameterized_Class: RParameterized_Class; ASTObj: NObject): RParameter; overload;
    function Create_Partition(AState_Machine: RState_Machine; ASTObj: NObject): RPartition;
    function Create_Process(AProcessor: RProcessor; ASTObj: NObject): RProcess;
    function Create_Processes(ADesign: RDesign; ASTObj: NObject): RProcesses;
    function Create_Properties(ADesign: RDesign; ASTObj: NObject): RProperties;
    function Create_Realize_Relationship(AClass: RClass; ASTObj: NObject): RRealize_Relationship; overload;
    function Create_Realize_Relationship(AModule: RModule; ASTObj: NObject): RRealize_Relationship; overload;
    function Create_Role(AAssociation: RAssociation; ASTObj: NObject): RRole;
    function Create_RoleView(AAssociationViewNew: RAssociationViewNew; ASTObj: NObject): RRoleView;
    function Create_Semantic_Info_As_PostCondition(AOperation: ROperation; ASTObj: NObject): RSemantic_Info;
    function Create_Semantic_Info_As_PreCondition(AOperation: ROperation; ASTObj: NObject): RSemantic_Info;
    function Create_Semantic_Info_As_Semantics(AOperation: ROperation; ASTObj: NObject): RSemantic_Info;
    function Create_SendEvent(AState_Transition: RState_Transition; ASTObj: NObject): RSendEvent;
    function Create_State_Diagram(AState_Machine: RState_Machine; ASTObj: NObject): RState_Diagram;
    function Create_State_Machine(AActivityState: RActivityState; ASTObj: NObject): RState_Machine; overload;
    function Create_State_Machine(AClass: RClass; ASTObj: NObject): RState_Machine; overload;
    function Create_State_Machine(AClass_Category: RClass_Category; ASTObj: NObject): RState_Machine; overload;
    function Create_State_Machine(AUseCase: RUseCase; ASTObj: NObject): RState_Machine; overload;
    function Create_State_Machine(AState: RState; ASTObj: NObject): RState_Machine; overload;
    function Create_SubSystem(ADesign: RDesign; ASTObj: NObject): RSubSystem;
    function Create_Transition(AStateVertex: RPetalStateVertex; ASTObj: NObject): RState_Transition;
    function Create_Uses_Relationship(AClass: RClass; ASTObj: NObject): RUses_Relationship;
    function Create_Visibility_Relationship(AClass_Category: RClass_Category; ASTObj: NObject): RVisibility_Relationship;
  end;

implementation

/////////////////////////////////////////////////////////////////////////////
//  RPetalObjectFactory

function RPetalObjectFactory.Create_PetalModel(PetalObjClass: RPetalObjectClass; AClass_Category: RClass_Category; ASTObj: NObject): RPetalModel;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalModel);
  AClass_Category.Add_Logical_model(Obj as RPetalModel);
  AClass_Category.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalModel;
end;

function RPetalObjectFactory.Create_PetalModel(PetalObjClass: RPetalObjectClass; ASubSystem: RSubSystem; ASTObj: NObject): RPetalModel;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalModel);
  ASubSystem.Add_Physical_model(Obj as RPetalModel);
  ASubSystem.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalModel;
end;

function RPetalObjectFactory.Create_PetalModel(PetalObjClass: RPetalObjectClass; AUseCase: RUseCase; ASTObj: NObject): RPetalModel;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalModel);
  AUseCase.Add_Logical_model(Obj as RPetalModel);
  AUseCase.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalModel;
end;

function RPetalObjectFactory.Create_PetalModel(PetalObjClass: RPetalObjectClass; AProcesses: RProcesses; ASTObj: NObject): RPetalModel;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalModel);
  AProcesses.Add_ProcsNDev(Obj as RPetalModel);
  AProcesses.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalModel;
end;

function RPetalObjectFactory.Create_PetalDiagram(PetalObjClass: RPetalObjectClass; AClass_Category: RClass_Category; ASTObj: NObject): RPetalDiagram;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalDiagram);
  AClass_Category.Add_Logical_presentation(Obj as RPetalDiagram);
  AClass_Category.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalDiagram;
end;

function RPetalObjectFactory.Create_PetalDiagram(PetalObjClass: RPetalObjectClass; AUseCase: RUseCase; ASTObj: NObject): RPetalDiagram;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalDiagram);
  AUseCase.Add_Logical_presentation(Obj as RPetalDiagram);
  AUseCase.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalDiagram;
end;

function RPetalObjectFactory.Create_PetalView(PetalObjClass: RPetalObjectClass; ADiagram: RPetalDiagram; ASTObj: NObject): RPetalView;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalView);
  ADiagram.Add_Item(Obj as RPetalView);
  ADiagram.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalView;
end;

function RPetalObjectFactory.Create_PetalLabelViewAsLabel(PetalObjClass: RPetalObjectClass; APetalView: RPetalView; ASTObj: NObject): RPetalLabelView;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalLabelView);
  APetalView.Add_Label_(Obj as RPetalLabelView);
  APetalView.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalLabelView;
end;

function RPetalObjectFactory.Create_PetalLabelViewAsStereotype(PetalObjClass: RPetalObjectClass; APetalView: RPetalView; ASTObj: NObject): RPetalLabelView;
var
  Obj: RPetalObject;
begin
  Assert(APetalView.Stereotype = nil);
  Obj := PetalObjClass.Create;
  Assert(Obj is RPetalLabelView);
  APetalView.Stereotype := Obj as RPetalLabelView;
  APetalView.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalLabelView;
end;

function RPetalObjectFactory.Create_Class(PetalObjClass: RPetalObjectClass; AClass: RClass; ASTObj: NObject): RClass;
var
  Obj: RPetalObject;
begin
  Obj := PetalObjClass.Create;
  Assert(Obj is RClass);
  AClass.Add_NestedClass(Obj as RClass);
  AClass.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RClass;
end;

function RPetalObjectFactory.Create_PetalStateVertex(APetalObjClass: RPetalObjectClass; AState_Machine: RState_Machine; ASTObj: NObject): RPetalStateVertex;
var
  Obj: RPetalObject;
begin
  Obj := APetalObjClass.Create;
  Assert(Obj is RPetalStateVertex);
  AState_Machine.Add_State(Obj as RPetalStateVertex);
  AState_Machine.Add_Child(Obj);
  Obj.ASTObject := ASTObj;
  Result := Obj as RPetalStateVertex;
end;

function RPetalObjectFactory.Create_Action(AActivityState: RActivityState; ASTObj: NObject): RAction;
var
  UA: RAction;
begin
  UA := RAction.Create;
  AActivityState.Add_Action(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_Action(AState: RState; ASTObj: NObject): RAction;
var
  UA: RAction;
begin
  UA := RAction.Create;
  AState.Add_Action(UA);
  AState.Add_Child(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_Action(AState_Transition: RState_Transition; ASTObj: NObject): RAction;
var
  UA: RAction;
begin
  Assert(AState_Transition.Action = nil);
  UA := RAction.Create;
  AState_Transition.Action := UA;
  AState_Transition.Add_Child(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_ActionTime(AAction: RAction; ASTObj: NObject): RActionTime;
var
  UA: RActionTime;
begin
  Assert(AAction.ActionTime = nil);
  UA := RActionTime.Create;
  AAction.ActionTime := UA;
  AAction.Add_Child(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_ActionTime(ASendEvent: RSendEvent; ASTObj: NObject): RActionTime;
var
  UA: RActionTime;
begin
  Assert(ASendEvent.ActionTime = nil);
  UA := RActionTime.Create;
  ASendEvent.ActionTime := UA;
  ASendEvent.Add_Child(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_ActivityDiagram(AState_Machine: RState_Machine; ASTObj: NObject): RActivityDiagram;
var
  UA: RActivityDiagram;
begin
  UA := RActivityDiagram.Create;
  AState_Machine.Add_Statediagram(UA);
  AState_Machine.Add_Child(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_Attribute(AModel: RPetalModel; ASTObj: NObject): RAttribute;
var
  UA: RAttribute;
begin
  UA := RAttribute.Create;
  AModel.Add_Attribute(UA);
  AModel.Add_Child(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_Attribute(ADesign: RDesign; ASTObj: NObject): RAttribute;
var
  UA: RAttribute;
begin
  UA := RAttribute.Create;
  ADesign.Add_Attribute(UA);
  ADesign.Add_Child(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_Attribute(AProperties: RProperties; ASTObj: NObject): RAttribute;
var
  UA: RAttribute;
begin
  UA := RAttribute.Create;
  AProperties.Add_Attribute(UA);
  AProperties.Add_Child(UA);
  UA.ASTObject := ASTObj;
  Result := UA;
end;

function RPetalObjectFactory.Create_ClassAttribute(AClass: RClass; ASTObj: NObject): RClassAttribute;
var
  UC: RClassAttribute;
begin
  UC := RClassAttribute.Create;
  AClass.Add_Class_attribute(UC);
  AClass.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_ClassAttribute(ARole: RRole; ASTObj: NObject): RClassAttribute;
var
  UC: RClassAttribute;
begin
  UC := RClassAttribute.Create;
  ARole.Add_Key(UC);
  ARole.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Class_Category_As_Root_category(ADesign: RDesign; ASTObj: NObject): RClass_Category;
var
  UC: RClass_Category;
begin
  Assert(ADesign.Root_category = nil);
  UC := RClass_Category.Create;
  ADesign.Root_category := UC;
  ADesign.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Class_Category_As_Root_usecase_package(ADesign: RDesign; ASTObj: NObject): RClass_Category;
var
  UC: RClass_Category;
begin
  Assert(ADesign.Root_usecase_package = nil);
  UC := RClass_Category.Create;
  ADesign.Root_usecase_package := UC;
  ADesign.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Compartment(AActivityStateView: RActivityStateView; ASTObj: NObject): RCompartment;
var
  UC: RCompartment;
begin
  Assert(AActivityStateView.Compartment = nil);
  UC := RCompartment.Create;
  AActivityStateView.Compartment := UC;
  AActivityStateView.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Compartment(AClassView: RClassView; ASTObj: NObject): RCompartment;
var
  UC: RCompartment;
begin
  Assert(AClassView.Compartment = nil);
  UC := RCompartment.Create;
  AClassView.Compartment := UC;
  AClassView.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Compartment(ACompartment: RCompartment; ASTObj: NObject): RCompartment;
var
  UC: RCompartment;
begin
  UC := RCompartment.Create;
  ACompartment.Add_CompartmentItem(UC);
  ACompartment.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Compartment(AObjectView: RObjectView; ASTObj: NObject): RCompartment;
var
  UC: RCompartment;
begin
  Assert(AObjectView.Compartment = nil);
  UC := RCompartment.Create;
  AObjectView.Compartment := UC;
  AObjectView.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Compartment(AStateView: RStateView; ASTObj: NObject): RCompartment;
var
  UC: RCompartment;
begin
  Assert(AStateView.Compartment = nil);
  UC := RCompartment.Create;
  AStateView.Compartment := UC;
  AStateView.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Connection_Relationship(ADepoloymentNode: RPetalDeploymentNode; ASTObj: NObject): RConnection_Relationship;
var
  UC: RConnection_Relationship;
begin
  UC := RConnection_Relationship.Create;
  ADepoloymentNode.Add_Connection(UC);
  ADepoloymentNode.Add_Child(UC);
  UC.ASTObject := ASTObj;
  Result := UC;
end;

function RPetalObjectFactory.Create_Defaults(ADesign: RDesign; ASTObj: NObject): RDefaults;
var
  UD: RDefaults;
begin
  Assert(ADesign.Defaults = nil);
  UD := RDefaults.Create;
  ADesign.Defaults := UD;
  ADesign.Add_Child(UD);
  UD.ASTObject := ASTObj;
  Result := UD;
end;

function RPetalObjectFactory.Create_Dependency_Relationship(AClass_Category: RClass_Category; ASTObj: NObject): RDependency_Relationship;
var
  UD: RDependency_Relationship;
begin
  UD := RDependency_Relationship.Create;
  AClass_Category.Add_Visible_module(UD);
  AClass_Category.Add_Child(UD);
  UD.ASTObject := ASTObj;
  Result := UD;
end;

function RPetalObjectFactory.Create_Dependency_Relationship(AUseCase: RUseCase; ASTObj: NObject): RDependency_Relationship;
var
  UD: RDependency_Relationship;
begin
  UD := RDependency_Relationship.Create;
  AUseCase.Add_Visible_module(UD);
  AUseCase.Add_Child(UD);
  UD.ASTObject := ASTObj;
  Result := UD;
end;

function RPetalObjectFactory.Create_External_doc(AModel: RPetalModel; ASTObj: NObject): RExternal_doc;
var
  UE: RExternal_doc;
begin
  UE := RExternal_doc.Create;
  AModel.Add_External_doc(UE);
  AModel.Add_Child(UE);
  UE.ASTObject := ASTObj;
  Result := UE;
end;

function RPetalObjectFactory.Create_Event(AState_Transition: RState_Transition; ASTObj: NObject): REvent;
var
  UE: REvent;
begin
  Assert(AState_Transition.Event = nil);
  UE := REvent.Create;
  AState_Transition.Event := UE;
  AState_Transition.Add_Child(UE);
  UE.ASTObject := ASTObj;
  Result := UE;
end;

function RPetalObjectFactory.Create_Event(AActionTime: RActionTime; ASTObj: NObject): REvent;
var
  UE: REvent;
begin
  Assert(AActionTime.Event = nil);
  UE := REvent.Create;
  AActionTime.Event := UE;
  AActionTime.Add_Child(UE);
  UE.ASTObject := ASTObj;
  Result := UE;
end;

function RPetalObjectFactory.Create_Event(ASendEvent: RSendEvent; ASTObj: NObject): REvent;
var
  UE: REvent;
begin
  Assert(ASendEvent.Event = nil);
  UE := REvent.Create;
  ASendEvent.Event := UE;
  ASendEvent.Add_Child(UE);
  UE.ASTObject := ASTObj;
  Result := UE;
end;

function RPetalObjectFactory.Create_Focus_Of_Control(AInterObjView: RInterObjView; ASTObj: NObject): RFocus_Of_Control;
var
  UF: RFocus_Of_Control;
begin
  UF := RFocus_Of_Control.Create;
  AInterObjView.Add_Focus_Of_Control(UF);
  AInterObjView.Add_Child(UF);
  UF.ASTObject := ASTObj;
  Result := UF;
end;

function RPetalObjectFactory.Create_Font(AView: RPetalView; ASTObj: NObject): RFont;
var
  UF: RFont;
begin
  Assert(AView.Font = nil);
  UF := RFont.Create;
  AView.Font := UF;
  AView.Add_Child(UF);
  UF.ASTObject := ASTObj;
  Result := UF;
end;

function RPetalObjectFactory.Create_Font(ADefaults: RDefaults; ASTObj: NObject): RFont;
var
  UF: RFont;
begin
  Assert(ADefaults.DefaultFont = nil);
  UF := RFont.Create;
  ADefaults.DefaultFont := UF;
  ADefaults.Add_Child(UF);
  UF.ASTObject := ASTObj;
  Result := UF;
end;

function RPetalObjectFactory.Create_Inheritance_Relationship(AClass: RClass; ASTObj: NObject): RInheritance_Relationship;
var
  UI: RInheritance_Relationship;
begin
  UI := RInheritance_Relationship.Create;
  AClass.Add_Superclass(UI);
  AClass.Add_Child(UI);
  UI.ASTObject := ASTObj;
  Result := UI;
end;

function RPetalObjectFactory.Create_Inheritance_Relationship(AUseCase: RUseCase; ASTObj: NObject): RInheritance_Relationship;
var
  UI: RInheritance_Relationship;
begin
  UI := RInheritance_Relationship.Create;
  AUseCase.Add_Superclass(UI);
  AUseCase.Add_Child(UI);
  UI.ASTObject := ASTObj;
  Result := UI;
end;

function RPetalObjectFactory.Create_Link(AObject: RObject; ASTObj: NObject): RLink;
var
  UL: RLink;
begin
  UL := RLink.Create;
  AObject.Add_Collaborator(UL);
  AObject.Add_Child(UL);
  UL.ASTObject := ASTObj;
  Result := UL;
end;

function RPetalObjectFactory.Create_Message(ALink: RLink; ASTObj: NObject): RMessage;
var
  UM: RMessage;
begin
  UM := RMessage.Create;
  ALink.Add_Message(UM);
  ALink.Add_Child(UM);
  UM.ASTObject := ASTObj;
  Result := UM;
end;

function RPetalObjectFactory.Create_Module_Diagram(ASubSystem: RSubSystem; ASTObj: NObject): RModule_Diagram;
var
  UM: RModule_Diagram;
begin
  UM := RModule_Diagram.Create;
  ASubSystem.Add_Physical_presentation(UM);
  ASubSystem.Add_Child(UM);
  UM.ASTObject := ASTObj;
  Result := UM;
end;

function RPetalObjectFactory.Create_Module_Visibility_Relationship(AModule: RModule; ASTObj: NObject): RModule_Visibility_Relationship;
var
  UM: RModule_Visibility_Relationship;
begin
  UM := RModule_Visibility_Relationship.Create;
  AModule.Add_Visible_module(UM);
  AModule.Add_Child(UM);
  UM.ASTObject := ASTObj;
  Result := UM;
end;

function RPetalObjectFactory.Create_Module_Visibility_Relationship(ASubSystem: RSubSystem; ASTObj: NObject): RModule_Visibility_Relationship;
var
  UM: RModule_Visibility_Relationship;
begin
  UM := RModule_Visibility_Relationship.Create;
  ASubSystem.Add_Visible_module(UM);
  ASubSystem.Add_Child(UM);
  UM.ASTObject := ASTObj;
  Result := UM;
end;

function RPetalObjectFactory.Create_Object(AMechanism: RMechanism; ASTObj: NObject): RObject;
var
  UO: RObject;
begin
  UO := RObject.Create;
  AMechanism.Add_Logical_model(UO);
  AMechanism.Add_Child(UO);
  UO.ASTObject := ASTObj;
  Result := UO;
end;

function RPetalObjectFactory.Create_Object(AState_Machine: RState_Machine; ASTObj: NObject): RObject;
var
  UO: RObject;
begin
  UO := RObject.Create;
  AState_Machine.Add_Object(UO);
  AState_Machine.Add_Child(UO);
  UO.ASTObject := ASTObj;
  Result := UO;
end;

function RPetalObjectFactory.Create_Operation(AClass: RClass; ASTObj: NObject): ROperation;
var
  UO: ROperation;
begin
  UO := ROperation.Create;
  AClass.Add_Operation(UO);
  AClass.Add_Child(UO);
  UO.ASTObject := ASTObj;
  Result := UO;
end;

function RPetalObjectFactory.Create_Parameter(AOperation: ROperation; ASTObj: NObject): RParameter;
var
  UP: RParameter;
begin
  UP := RParameter.Create;
  AOperation.Add_Parameter(UP);
  AOperation.Add_Child(UP);
  UP.ASTObject := ASTObj;
  Result := UP;
end;

function RPetalObjectFactory.Create_Parameter(AParameterized_Class: RParameterized_Class; ASTObj: NObject): RParameter;
var
  UP: RParameter;
begin
  UP := RParameter.Create;
  AParameterized_Class.Add_Parameter(UP);
  AParameterized_Class.Add_Child(UP);
  UP.ASTObject := ASTObj;
  Result := UP;
end;

function RPetalObjectFactory.Create_Partition(AState_Machine: RState_Machine; ASTObj: NObject): RPartition;
var
  UP: RPartition;
begin
  UP := RPartition.Create;
  AState_Machine.Add_Partition(UP);
  AState_Machine.Add_Child(UP);
  UP.ASTObject := ASTObj;
  Result := UP;
end;

function RPetalObjectFactory.Create_Process(AProcessor: RProcessor; ASTObj: NObject): RProcess;
var
  UP: RProcess;
begin
  UP := RProcess.Create;
  AProcessor.Add_Process(UP);
  AProcessor.Add_Child(UP);
  UP.ASTObject := ASTObj;
  Result := UP;
end;

function RPetalObjectFactory.Create_Processes(ADesign: RDesign; ASTObj: NObject): RProcesses;
var
  UP: RProcesses;
begin
  Assert(ADesign.Process_structure = nil);
  UP := RProcesses.Create;
  ADesign.Process_structure := UP;
  ADesign.Add_Child(UP);
  UP.ASTObject := ASTObj;
  Result := UP;
end;

function RPetalObjectFactory.Create_Properties(ADesign: RDesign; ASTObj: NObject): RProperties;
var
  UP: RProperties;
begin
  Assert(ADesign.Properties = nil);
  UP := RProperties.Create;
  ADesign.Properties := UP;
  ADesign.Add_Child(UP);
  UP.ASTObject := ASTObj;
  Result := UP;
end;

function RPetalObjectFactory.Create_Realize_Relationship(AClass: RClass; ASTObj: NObject): RRealize_Relationship;
var
  UR: RRealize_Relationship;
begin
  UR := RRealize_Relationship.Create;
  AClass.Add_Realized_interface(UR);
  AClass.Add_Child(UR);
  UR.ASTObject := ASTObj;
  Result := UR;
end;

function RPetalObjectFactory.Create_Realize_Relationship(AModule: RModule; ASTObj: NObject): RRealize_Relationship;
var
  UR: RRealize_Relationship;
begin
  UR := RRealize_Relationship.Create;
  AModule.Add_Realized_interface(UR);
  AModule.Add_Child(UR);
  UR.ASTObject := ASTObj;
  Result := UR;
end;

function RPetalObjectFactory.Create_Role(AAssociation: RAssociation; ASTObj: NObject): RRole;
var
  UR: RRole;
begin
  UR := RRole.Create;
  AAssociation.Add_Role(UR);
  AAssociation.Add_Child(UR);
  UR.ASTObject := ASTObj;
  Result := UR;
end;

function RPetalObjectFactory.Create_RoleView(AAssociationViewNew: RAssociationViewNew; ASTObj: NObject): RRoleView;
var
  UR: RRoleView;
begin
  UR := RRoleView.Create;
  AAssociationViewNew.Add_Roleview_list(UR);
  AAssociationViewNew.Add_Child(UR);
  UR.ASTObject := ASTObj;
  Result := UR;
end;

function RPetalObjectFactory.Create_Semantic_Info_As_PostCondition(AOperation: ROperation; ASTObj: NObject): RSemantic_Info;
var
  US: RSemantic_Info;
begin
  Assert(AOperation.Post_condition = nil);
  US := RSemantic_Info.Create;
  AOperation.Post_condition := US;
  AOperation.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_Semantic_Info_As_PreCondition(AOperation: ROperation; ASTObj: NObject): RSemantic_Info;
var
  US: RSemantic_Info;
begin
  Assert(AOperation.Pre_condition = nil);
  US := RSemantic_Info.Create;
  AOperation.Pre_condition := US;
  AOperation.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_Semantic_Info_As_Semantics(AOperation: ROperation; ASTObj: NObject): RSemantic_Info;
var
  US: RSemantic_Info;
begin
  Assert(AOperation.Semantics = nil);
  US := RSemantic_Info.Create;
  AOperation.Semantics := US;
  AOperation.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_SendEvent(AState_Transition: RState_Transition; ASTObj: NObject): RSendEvent;
var
  US: RSendEvent;
begin
  Assert(AState_Transition.SendEvent = nil);
  US := RSendEvent.Create;
  AState_Transition.SendEvent := US;
  AState_Transition.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_State_Diagram(AState_Machine: RState_Machine; ASTObj: NObject): RState_Diagram;
var
  US: RState_Diagram;
begin
  US := RState_Diagram.Create;
  AState_Machine.Add_Statediagram(US);
  AState_Machine.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_State_Machine(AActivityState: RActivityState; ASTObj: NObject): RState_Machine;
var
  US: RState_Machine;
begin
  Assert(AActivityState.Statemachine = nil);
  US := RState_Machine.Create;
  AActivityState.Statemachine := US;
  AActivityState.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_State_Machine(AClass: RClass; ASTObj: NObject): RState_Machine;
var
  US: RState_Machine;
begin
  Assert(AClass.Statemachine = nil);
  US := RState_Machine.Create;
  AClass.Statemachine := US;
  AClass.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_State_Machine(AClass_Category: RClass_Category; ASTObj: NObject): RState_Machine;
var
  US: RState_Machine;
begin
  Assert(AClass_Category.Statemachine = nil);
  US := RState_Machine.Create;
  AClass_Category.Statemachine := US;
  AClass_Category.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_State_Machine(AUseCase: RUseCase; ASTObj: NObject): RState_Machine;
var
  US: RState_Machine;
begin
  Assert(AUseCase.Statemachine = nil);
  US := RState_Machine.Create;
  AUseCase.Statemachine := US;
  AUseCase.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_State_Machine(AState: RState; ASTObj: NObject): RState_Machine;
var
  US: RState_Machine;
begin
  Assert(AState.Statemachine = nil);
  US := RState_Machine.Create;
  AState.Statemachine := US;
  AState.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_SubSystem(ADesign: RDesign; ASTObj: NObject): RSubSystem;
var
  US: RSubSystem;
begin
  Assert(ADesign.Root_subsystem = nil);
  US := RSubSystem.Create;
  ADesign.Root_subsystem := US;
  ADesign.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_Transition(AStateVertex: RPetalStateVertex; ASTObj: NObject): RState_Transition;
var
  US: RState_Transition;
begin
  US := RState_Transition.Create;
  AStateVertex.Add_Transition(US);
  AStateVertex.Add_Child(US);
  US.ASTObject := ASTObj;
  Result := US;
end;

function RPetalObjectFactory.Create_Uses_Relationship(AClass: RClass; ASTObj: NObject): RUses_Relationship;
var
  UU: RUses_Relationship;
begin
  UU := RUses_Relationship.Create;
  AClass.Add_Used_node(UU);
  AClass.Add_Child(UU);
  UU.ASTObject := ASTObj;
  Result := UU;
end;

function RPetalObjectFactory.Create_Visibility_Relationship(AClass_Category: RClass_Category; ASTObj: NObject): RVisibility_Relationship;
var
  UV: RVisibility_Relationship;
begin
  UV := RVisibility_Relationship.Create;
  AClass_Category.Add_Visible_category(UV);
  AClass_Category.Add_Child(UV);
  UV.ASTObject := ASTObj;
  Result := UV;
end;

//  RPetalObjectFactory
/////////////////////////////////////////////////////////////////////////////

end.
