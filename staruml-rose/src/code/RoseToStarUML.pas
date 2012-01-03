unit RoseToStarUML;

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
  PetalDoc, PetalElements, WhiteStarUML_TLB,
  SysUtils;

type
  // Exceptions
  EElemConversion = class(Exception);
  EPropConversion = class(Exception);

  // Events
  POnLogEvent = procedure (Sender: TObject; Msg: string) of object;
  POnProgressEvent = procedure (Sender: TObject; Current, Max: Integer; Msg: string) of object;

  // Enumerations
  PStateMachineType = (smtStateMachine, smtActivityGraph, smtBoth);

  // RoseStarUMLAdapter
  RoseStarUMLAdapter = class
  private
   { Member Fields }
    FStarUMLApp: IStarUMLApplication;
    FInstanceToRoleOption: Boolean;
    FMakeDiagramViewOption: Boolean;
    FAddFilePathOption: Boolean;
    FFileName: string;
    FDesignObj: RDesign;
    FModelObjCount: Integer;
    FViewObjCount: Integer;
    FProgressIdx: Integer;
    FOnLog: POnLogEvent;
    FOnProgress: POnProgressEvent;
    procedure AddLog(Msg: string);
    procedure SetProgress(Current, Max: Integer; Msg: string);
    { Getters/Setters }
    procedure SetInstanceToRoleOption(Value: Boolean);
    procedure SetMakeDiagramViewOption(Value: Boolean);
    procedure SetAddFilePathOption(Value: Boolean);
    { Utility Methods}
    procedure EstimateProcessTime(Obj: RPetalObject);
    function GetProject: IUMLProject;
    function GetRoseApproachRootModel(ElemName: string): IUMLModel;
    function GetNamespaceElement(Elem: IUMLModelElement): IUMLNamespace;
    function GetOwnerStateMachine(Elem: IUMLStateVertex): IUMLStateMachine;
    function GetTargetNodeView(AView: RPetalEdgeView; const ClientType: TGUID; AllowNull: Boolean = False): IView;
    function GetEdgeViewClient(AView: RPetalEdgeView; const ClientType: TGUID; AllowNull: Boolean = False): IView;
    function GetEdgeViewSupplier(AView: RPetalEdgeView; const ClientType: TGUID; AllowNull: Boolean = False): IView;
    function GetModelOfView(AView: RPetalView; const MdlType: TGuid; AllowNull: Boolean = False): IModel;
    procedure RemovePredefinedDiagrams;
    procedure SetDefaultDiagramAndOpen;
    procedure SetProjectProperties(PetalDoc: RPetalDocument);
    function IsPredefinedModel(AModel: IModel): Boolean;
    function DetermineStatemachineType(RoseElem: RState_Machine): PStateMachineType;
    function CheckUMLElemNameValidation(Val: string): Boolean;
    function ConflictNameToNewName(Elem: IUMLModelElement; Val: string): string;
  private
    { Conversion Routines }
    procedure BeforeConversion(PetalDoc: RPetalDocument);
    procedure AfterConversion;
    procedure ConvertElements(PetalDoc: RPetalDocument);
    procedure ConvertProperties(Obj: RPetalObject);
    { Conversion Subroutines }
    procedure ConvertModelElements(ADesign: RDesign; IsSecondLoop: Boolean);
    procedure ConvertViewElements(Obj: RPetalObject; IsSecondLoop: Boolean);
    procedure ConvertModelElement(AOwner: IModel; RoseElem: RPetalModel; IsSecondLoop: Boolean);
    procedure ConvertViewElement(AOwner: IDiagramView; RoseElem: RPetalView; IsSecondLoop: Boolean);
    procedure ConvertModelProperties(RoseElem: RPetalModel);
    procedure ConvertViewProperties(RoseElem: RPetalView);
    { Conversion - Element Type Specific * Model Element }
    procedure ConvertGeneralDependency(AOwner: IModel; RoseElem: RPetalRelationship; IsSecondLoop: Boolean);
    procedure ConvertActivityDiagram(AOwner: IModel; RoseElem: RActivityDiagram; IsSecondLoop: Boolean);
    procedure ConvertActivityState(AOwner: IModel; RoseElem: RActivityState; IsSecondLoop: Boolean);
    procedure ConvertAssociation(AOwner: IModel; RoseElem: RAssociation; IsSecondLoop: Boolean);
    procedure ConvertClass(AOwner: IModel; RoseElem: RClass; IsSecondLoop: Boolean);
    procedure ConvertClassAttribute(AOwner: IModel; RoseElem: RClassAttribute; IsSecondLoop: Boolean);
    procedure ConvertClassDiagram(AOwner: IModel; RoseElem: RClassDiagram; IsSecondLoop: Boolean);
    procedure ConvertClassCategory(AOwner: IModel; RoseElem: RClass_Category; IsSecondLoop: Boolean);
    procedure ConvertClass_Utility(AOwner: IModel; RoseElem: RClass_Utility; IsSecondLoop: Boolean);
    procedure ConvertConnection_Relationship(AOwner: IModel; RoseElem: RConnection_Relationship; IsSecondLoop: Boolean);
    procedure ConvertDecision(AOwner: IModel; RoseElem: RDecision; IsSecondLoop: Boolean);
    procedure ConvertDependency_Relationship(AOwner: IModel; RoseElem: RDependency_Relationship; IsSecondLoop: Boolean);
    procedure ConvertDevice(AOwner: IModel; RoseElem: RDevice; IsSecondLoop: Boolean);
    procedure ConvertEvent(AOwner: IModel; RoseElem: REvent; IsSecondLoop: Boolean);
    procedure ConvertInheritance_Relationship(AOwner: IModel; RoseElem: RInheritance_Relationship; IsSecondLoop: Boolean);
    procedure ConvertInstantiated_Class(AOwner: IModel; RoseElem: RInstantiated_Class; IsSecondLoop: Boolean);
    procedure ConvertInstantiated_Class_Utility(AOwner: IModel; RoseElem: RInstantiated_Class_Utility; IsSecondLoop: Boolean);
    procedure ConvertInteractionDiagram(AOwner: IModel; RoseElem: RInteractionDiagram; IsSecondLoop: Boolean);
    procedure ConvertLink(AOwner: IModel; RoseElem: RLink; IsSecondLoop: Boolean);
    procedure ConvertMechanism(AOwner: IModel; RoseElem: RMechanism; IsSecondLoop: Boolean);
    procedure ConvertMessage(AOwner: IModel; RoseElem: RMessage; IsSecondLoop: Boolean);
    procedure ConvertMetaclass(AOwner: IModel; RoseElem: RMetaclass; IsSecondLoop: Boolean);
    procedure ConvertModule_Diagram(AOwner: IModel; RoseElem: RModule_Diagram; IsSecondLoop: Boolean);
    procedure ConvertModule_Visibility_Relationship(AOwner: IModel; RoseElem: RModule_Visibility_Relationship; IsSecondLoop: Boolean);
    procedure ConvertObject(AOwner: IModel; RoseElem: RObject; IsSecondLoop: Boolean);
    procedure ConvertObjectDiagram(AOwner: IModel; RoseElem: RObjectDiagram; IsSecondLoop: Boolean);
    procedure ConvertOperation(AOwner: IModel; RoseElem: ROperation; IsSecondLoop: Boolean);
    procedure ConvertParameter(AOwner: IModel; RoseElem: RParameter; IsSecondLoop: Boolean);
    procedure ConvertParameterized_Class(AOwner: IModel; RoseElem: RParameterized_Class; IsSecondLoop: Boolean);
    procedure ConvertParameterized_Class_Utility(AOwner: IModel; RoseElem: RParameterized_Class_Utility; IsSecondLoop: Boolean);
    procedure ConvertPartition(AOwner: IModel; RoseElem: RPartition; IsSecondLoop: Boolean);
    procedure ConvertProcess_Diagram(AOwner: IModel; RoseElem: RProcess_Diagram; IsSecondLoop: Boolean);
    procedure ConvertProcessor(AOwner: IModel; RoseElem: RProcessor; IsSecondLoop: Boolean);
    procedure ConvertRealize_Relationship(AOwner: IModel; RoseElem: RRealize_Relationship; IsSecondLoop: Boolean);
    procedure ConvertRole(AOwner: IModel; RoseElem: RRole; IsSecondLoop: Boolean);
    procedure ConvertState(AOwner: IModel; RoseElem: RState; IsSecondLoop: Boolean);
    procedure ConvertState_Diagram(AOwner: IModel; RoseElem: RState_Diagram; IsSecondLoop: Boolean);
    procedure ConvertState_Machine(AOwner: IModel; RoseElem: RState_Machine; IsSecondLoop: Boolean);
    procedure ConvertState_Transition(AOwner: IModel; RoseElem: RState_Transition; IsSecondLoop: Boolean);
    procedure ConvertSubSystem(AOwner: IModel; RoseElem: RSubSystem; IsSecondLoop: Boolean);
    procedure ConvertSynchronizationState(AOwner: IModel; RoseElem: RSynchronizationState; IsSecondLoop: Boolean);
    procedure ConvertTierDiagram(AOwner: IModel; RoseElem: RTier_Diagram; IsSecondLoop: Boolean);
    procedure ConvertUseCase(AOwner: IModel; RoseElem: RUseCase; IsSecondLoop: Boolean);
    procedure ConvertUseCaseDiagram(AOwner: IModel; RoseElem: RUseCaseDiagram; IsSecondLoop: Boolean);
    procedure ConvertUses_Relationship(AOwner: IModel; RoseElem: RUses_Relationship; IsSecondLoop: Boolean);
    procedure ConvertVisibility_Relationship(AOwner: IModel; RoseElem: RVisibility_Relationship; IsSecondLoop: Boolean);
    procedure ConvertAction(AOwner: IModel; RoseElem: RAction; IsSecondLoop: Boolean);
    procedure ConvertModule(AOwner: IModel; RoseElem: RModule; IsSecondLoop: Boolean);
    procedure ConvertSendEvent(AOwner: IModel; RoseElem: RSendEvent; IsSecondLoop: Boolean);
    { Conversion - Element Type Specific * View Element }
    procedure ConvertGeneralDependencyView(AOwner: IView; RoseElem: RPetalEdgeView; IsSecondLoop: Boolean);
    procedure ConvertGeneralLinkView(AOwner: IView; RoseElem: RPetalEdgeView; IsSecondLoop: Boolean);
    procedure ConvertGeneralInterMessView(AOwner: IView; RoseElem: RPetalEdgeView; IsSecondLoop: Boolean);
    procedure ConvertGeneralNodeView(AOwner: IView; RoseElem: RPetalNodeView; IsSecondLoop: Boolean);
    procedure ConvertGeneralTransitionView(AOwner: IView; RoseElem: RPetalEdgeView; IsSecondLoop: Boolean);
    procedure ConvertActivityStateView(AOwner: IView; RoseElem: RActivityStateView; IsSecondLoop: Boolean);
    procedure ConvertAssocAttachView(AOwner: IView; RoseElem: RAssocAttachView; IsSecondLoop: Boolean);
    procedure ConvertAssociationViewNew(AOwner: IView; RoseElem: RAssociationViewNew; IsSecondLoop: Boolean);
    procedure ConvertAttachView(AOwner: IView; RoseElem: RAttachView; IsSecondLoop: Boolean);
    procedure ConvertCategoryView(AOwner: IView; RoseElem: RCategoryView; IsSecondLoop: Boolean);
    procedure ConvertClassInstanceView(AOwner: IView; RoseElem: RClassInstanceView; IsSecondLoop: Boolean);
    procedure ConvertClassView(AOwner: IView; RoseElem: RClassView; IsSecondLoop: Boolean);
    procedure ConvertConnectionView(AOwner: IView; RoseElem: RConnectionView; IsSecondLoop: Boolean);
    procedure ConvertDataFlowView(AOwner: IView; RoseElem: RDataFlowView; IsSecondLoop: Boolean);
    procedure ConvertDecisionView(AOwner: IView; RoseElem: RDecisionView; IsSecondLoop: Boolean);
    procedure ConvertDependencyView(AOwner: IView; RoseElem: RDependencyView; IsSecondLoop: Boolean);
    procedure ConvertDestruction_Marker(AOwner: IView; RoseElem: RDestruction_Marker; IsSecondLoop: Boolean);
    procedure ConvertDeviceView(AOwner: IView; RoseElem: RDeviceView; IsSecondLoop: Boolean);
    procedure ConvertFocus_Of_Control(AOwner: IView; RoseElem: RFocus_Of_Control; IsSecondLoop: Boolean);
    procedure ConvertImportView(AOwner: IView; RoseElem: RImportView; IsSecondLoop: Boolean);
    procedure ConvertInheritView(AOwner: IView; RoseElem: RInheritView; IsSecondLoop: Boolean);
    procedure ConvertInterfaceView(AOwner: IView; RoseElem: RInterfaceView; IsSecondLoop: Boolean);
    procedure ConvertInterMessView(AOwner: IView; RoseElem: RInterMessView; IsSecondLoop: Boolean);
    procedure ConvertInterObjView(AOwner: IView; RoseElem: RInterObjView; IsSecondLoop: Boolean);
    procedure ConvertLabelView(AOwner: IView; RoseElem: RLabel; IsSecondLoop: Boolean);
    procedure ConvertLinkSelfView(AOwner: IView; RoseElem: RLinkSelfView; IsSecondLoop: Boolean);
    procedure ConvertLinkView(AOwner: IView; RoseElem: RLinkView; IsSecondLoop: Boolean);
    procedure ConvertMessView(AOwner: IView; RoseElem: RMessView; IsSecondLoop: Boolean);
    procedure ConvertModView(AOwner: IView; RoseElem: RModView; IsSecondLoop: Boolean);
    procedure ConvertModVisView(AOwner: IView; RoseElem: RModVisView; IsSecondLoop: Boolean);
    procedure ConvertNoteView(AOwner: IView; RoseElem: RNoteView; IsSecondLoop: Boolean);
    procedure ConvertObjectView(AOwner: IView; RoseElem: RObjectView; IsSecondLoop: Boolean);
    procedure ConvertProcessorView(AOwner: IView; RoseElem: RProcessorView; IsSecondLoop: Boolean);
    procedure ConvertRealizeView(AOwner: IView; RoseElem: RRealizeView; IsSecondLoop: Boolean);
    procedure ConvertSelfMessView(AOwner: IView; RoseElem: RSelfMessView; IsSecondLoop: Boolean);
    procedure ConvertSelfTransView(AOwner: IView; RoseElem: RSelfTransView; IsSecondLoop: Boolean);
    procedure ConvertStateView(AOwner: IView; RoseElem: RStateView; IsSecondLoop: Boolean);
    procedure ConvertSubSysView(AOwner: IView; RoseElem: RSubSysView; IsSecondLoop: Boolean);
    procedure ConvertSwimlane(AOwner: IView; RoseElem: RSwimlane; IsSecondLoop: Boolean);
    procedure ConvertSynchronizationView(AOwner: IView; RoseElem: RSynchronizationView; IsSecondLoop: Boolean);
    procedure ConvertTierView(AOwner: IView; RoseElem: RTierView; IsSecondLoop: Boolean);
    procedure ConvertTransView(AOwner: IView; RoseElem: RTransView; IsSecondLoop: Boolean);
    procedure ConvertUseCaseView(AOwner: IView; RoseElem: RUseCaseView; IsSecondLoop: Boolean);
    procedure ConvertUsesView(AOwner: IView; RoseElem: RUsesView; IsSecondLoop: Boolean);
    { Conversion - Properties * Model elements }
    procedure ConvertModelCommonProperties(StarUMLElem: IModel; RoseElem: RPetalModel);
    procedure ConvertDiagramCommonProperties(StarUMLElem: IModel; RoseElem: RPetalDiagram);
    procedure ConvertRelationshipCommonProperties(StarUMLElem: IModel; RoseElem: RPetalRelationship);
    procedure ConvertActivityStateProperties(StarUMLElem: IModel; RoseElem: RActivityState);
    procedure ConvertAssociationProperties(StarUMLElem: IModel; RoseElem: RAssociation);
    procedure ConvertClassProperties(StarUMLElem: IModel; RoseElem: RClass);
    procedure ConvertClassAttributeProperties(StarUMLElem: IModel; RoseElem: RClassAttribute);
    procedure ConvertClassCategoryProperties(StarUMLElem: IModel; RoseElem: RClass_Category);
    procedure ConvertConnectionRelationshipProperties(StarUMLElem: IModel; RoseElem: RConnection_Relationship);
    procedure ConvertDecisionProperties(StarUMLElem: IModel; RoseElem: RDecision);
    procedure ConvertDeviceProperties(StarUMLElem: IModel; RoseElem: RDevice);
    procedure ConvertEventProperties(StarUMLElem: IModel; RoseElem: REvent);
    procedure ConvertInheritanceRelationshipProperties(StarUMLElem: IModel; RoseElem: RInheritance_Relationship);
    procedure ConvertLinkProperties(StarUMLElem: IModel; RoseElem: RLink);
    procedure ConvertMessageProperties(StarUMLElem: IModel; RoseElem: RMessage);
    procedure ConvertModuleVisibilityRelationshipProperties(StarUMLElem: IModel; RoseElem: RModule_Visibility_Relationship);
    procedure ConvertObjectProperties(StarUMLElem: IModel; RoseElem: RObject);
    procedure ConvertOperationProperties(StarUMLElem: IModel; RoseElem: ROperation);
    procedure ConvertParameterProperties(StarUMLElem: IModel; RoseElem: RParameter);
    procedure ConvertPartitionProperties(StarUMLElem: IModel; RoseElem: RPartition);
    procedure ConvertProcessProperties(StarUMLElem: IModel; RoseElem: RProcess);
    procedure ConvertProcessorProperties(StarUMLElem: IModel; RoseElem: RProcessor);
    procedure ConvertRoleProperties(StarUMLElem: IModel; RoseElem: RRole);
    procedure ConvertStateProperties(StarUMLElem: IModel; RoseElem: RState);
    procedure ConvertStateTransitionProperties(StarUMLElem: IModel; RoseElem: RState_Transition);
    procedure ConvertSynchronizationProperties(StarUMLElem: IModel; RoseElem: RSynchronizationState);
    procedure ConvertUseCaseProperties(StarUMLElem: IModel; RoseElem: RUseCase);
    procedure ConvertUsesRelationshipProperties(StarUMLElem: IModel; RoseElem: RUses_Relationship);
    procedure ConvertModuleProperties(StarUMLElem: IModel; RoseElem: RModule);
    procedure ConvertSendEventProperties(StarUMLElem: IModel; RoseElem: RSendEvent);
    procedure ConvertInteractionDiagramProperties(StarUMLElem: IModel; RoseElem: RInteractionDiagram);
    procedure ConvertObjectDiagramProperties(StarUMLElem: IModel; RoseElem: RObjectDiagram);
    { Conversion - Properties * View elements }
    function ConvertColorValue(Value: Integer): string;
    function ConvertFontStyleValue(B, I, U, S: Boolean): Integer;
    procedure ConvertViewCommonProperties(StarUMLElem: IView; RoseElem: RPetalView);
    procedure ConvertNodeViewCommonProperties(StarUMLElem: IView; RoseElem: RPetalNodeView);
    procedure ConvertEdgeViewCommonProperties(StarUMLElem: IView; RoseElem: RPetalEdgeView);
    procedure ConvertEdgeLabelViewProperties(StarUMLElem: IEdgeLabelView; RoseElem: RPetalView);
    procedure ConvertActivityStateViewProperties(StarUMLElem: IView; RoseElem: RActivityStateView);
    procedure ConvertCategoryViewProperties(StarUMLElem: IView; RoseElem: RCategoryView);
    procedure ConvertClassInstanceViewProperties(StarUMLElem: IView; RoseElem: RClassInstanceView);
    procedure ConvertClassViewProperties(StarUMLElem: IView; RoseElem: RClassView);
    procedure ConvertInterfaceViewProperties(StarUMLElem: IView; RoseElem: RInterfaceView);
    procedure ConvertInterMessViewProperties(StarUMLElem: IView; RoseElem: RInterMessView);
    procedure ConvertInterObjViewProperties(StarUMLElem: IView; RoseElem: RInterObjView);
    procedure ConvertLabelProperties(StarUMLElem: IView; RoseElem: RLabel);
    procedure ConvertMessViewProperties(StarUMLElem: IView; RoseElem: RMessView);
    procedure ConvertModViewProperties(StarUMLElem: IView; RoseElem: RModView);
    procedure ConvertNoteViewProperties(StarUMLElem: IView; RoseElem: RNoteView);
    procedure ConvertObjectViewProperties(StarUMLElem: IView; RoseElem: RObjectView);
    procedure ConvertProcessorViewProperties(StarUMLElem: IView; RoseElem: RProcessorView);
    procedure ConvertSelfMessViewProperties(StarUMLElem: IView; RoseElem: RSelfMessView);
    procedure ConvertSynchronizationViewProperties(StarUMLElem: IView; RoseElem: RSynchronizationView);
    procedure ConvertTransViewProperties(StarUMLElem: IView; RoseElem: RTransView);
    procedure ConvertUsesViewProperties(StarUMLElem: IView; RoseElem: RUsesView);
    procedure ConvertStateViewProperties(StarUMLElem: IView; RoseElem: RStateView);
  public
    { Public Interfaces}
    constructor Create(App: IStarUMLApplication);
    destructor Destroy; override;
    procedure Convert(FN: string; PetalDoc: RPetalDocument);
    { Properties }
    property StarUMLApp: IStarUMLApplication read FStarUMLApp;
    property InstanceToRoleOption: Boolean read FInstanceToRoleOption write SetInstanceToRoleOption;
    property MakeDiagramViewOption: Boolean read FMakeDiagramViewOption write SetMakeDiagramViewOption;
    property AddFilePathOption: Boolean read FAddFilePathOption write SetAddFilePathOption;
    property FileName: string read FFileName;
    property OnLog: POnLogEvent read FOnLog write FOnLog;
    property OnProgress: POnProgressEvent read FOnProgress write FOnProgress;
  end;

implementation

uses
  Symbols, NLS_RoseAddIn, 
  Types, ComObj;

////////////////////////////////////////////////////////////////////////////////
// RoseStarUMLAdapter

constructor RoseStarUMLAdapter.Create(App: IStarUMLApplication);
begin
  inherited Create;
  if App = nil then
    raise Exception.Create(Format(ERR_NULL_OBJECT, [OBJ_STARUML_APP]));
  FStarUMLApp := App;
end;

destructor RoseStarUMLAdapter.Destroy;
begin
  FStarUMLApp := nil;
  inherited;
end;

procedure RoseStarUMLAdapter.AddLog(Msg: string);
begin
  if Assigned(FOnLog) then FOnLog(nil, Msg);
end;

procedure RoseStarUMLAdapter.SetProgress(Current, Max: Integer; Msg: string);
begin
  if Assigned(FOnProgress) then FOnProgress(nil, Current, Max, Msg);
end;

procedure RoseStarUMLAdapter.SetInstanceToRoleOption(Value: Boolean);
begin
  if FInstanceToRoleOption <> Value then FInstanceToRoleOption := Value;
end;

procedure RoseStarUMLAdapter.SetMakeDiagramViewOption(Value: Boolean);
begin
  if FMakeDiagramViewOption <> Value then FMakeDiagramViewOption := Value;
end;

procedure RoseStarUMLAdapter.SetAddFilePathOption(Value: Boolean);
begin
  if FAddFilePathOption <> Value then FAddFilePathOption := Value;
end;

procedure RoseStarUMLAdapter.EstimateProcessTime(Obj: RPetalObject);
var
  I: Integer;
  Child: RPetalObject;
begin
  if Obj = nil then Exit;

  for I := 0 to Obj.ChildCount - 1 do begin
    Child := Obj.Children[I];
    if Child is RPetalModel then Inc(FModelObjCount)
    else if Child is RPetalView then Inc(FViewObjCount);

    if Child.ChildCount > 0 then EstimateProcessTime(Child);
  end;
end;

function RoseStarUMLAdapter.GetProject: IUMLProject;
begin
  Result := nil;
  if StarUMLApp <> nil then Result := StarUMLApp.GetProject;
end;

function RoseStarUMLAdapter.GetRoseApproachRootModel(ElemName: string): IUMLModel;
var
  Pjt: IUMLProject;
  TempMdl: IModel;
begin
  Result := nil;
  Pjt := GetProject;
  if (Pjt <> nil) and (ElemName <> '') then begin
    TempMdl := Pjt.FindByName(ElemName);
    if (TempMdl <> nil) and (TempMdl.IsKindOf(UML_ELEM_MODEL)) then
      Result := TempMdl as IUMLModel;
  end;
end;

function RoseStarUMLAdapter.GetNamespaceElement(Elem: IUMLModelElement): IUMLNamespace;
var
  Ret: IUMLNamespace;
begin
  Result := nil;
  if Elem = nil then Exit;
  Ret := Elem.Namespace;
  if (Ret = nil) or (Ret.IsKindOf(UML_ELEM_PROJECT)) then begin
    if Elem.IsKindOf(UML_ELEM_NAMESPACE) then Result := Elem as IUMLNamespace;
    Exit;
  end;
  Result := Ret;
end;

function RoseStarUMLAdapter.GetOwnerStateMachine(Elem: IUMLStateVertex): IUMLStateMachine;
var
  AContainer: IUMLCompositeState;
begin
  Result := nil;
  AContainer := Elem.ContainerState;
  if AContainer <> nil then Result := AContainer.StateMachine;
end;

function RoseStarUMLAdapter.GetTargetNodeView(AView: RPetalEdgeView; const ClientType: TGUID; AllowNull: Boolean = False): IView;
var
  TempView: RPetalView;
  TempObj: IUnknown;
  Ret: IView;
begin
  Result := nil;

  TempView := AView.Client;
  if TempView <> nil then begin
    TempObj := TempView.InterfaceObj;
    if TempObj <> nil then begin
      if TempObj.QueryInterface(ClientType, Ret) = S_OK then begin
        Result := Ret;
        Exit;
      end;
    end;
  end;
  TempView := AView.Supplier;
  if TempView <> nil then begin
    TempObj := TempView.InterfaceObj;
    if TempObj <> nil then begin
      if TempObj.QueryInterface(ClientType, Ret) = S_OK then begin
        Result := Ret;
        Exit;
      end;
    end;
  end;
  if not AllowNull then raise EElemConversion.Create(ERR_INVALID_PARAM);
end;

function RoseStarUMLAdapter.GetEdgeViewClient(AView: RPetalEdgeView; const ClientType: TGUID; AllowNull: Boolean = False): IView;
var
  TempView: RPetalView;
  TempObj: IUnknown;
  Ret: IView;
begin
  Result := nil;

  TempView := AView.Client;
  if TempView <> nil then begin
    TempObj := TempView.InterfaceObj;
    if TempObj <> nil then begin
      if TempObj.QueryInterface(ClientType, Ret) = S_OK then begin
        Result := Ret;
        Exit;
      end;
    end;
  end;
  if not AllowNull then raise EElemConversion.Create(ERR_INVALID_PARAM);
end;

function RoseStarUMLAdapter.GetEdgeViewSupplier(AView: RPetalEdgeView; const ClientType: TGUID; AllowNull: Boolean = False): IView;
var
  TempView: RPetalView;
  TempObj: IUnknown;
  Ret: IView;
begin
  Result := nil;

  TempView := AView.Supplier;
  if TempView <> nil then begin
    TempObj := TempView.InterfaceObj;
    if TempObj <> nil then begin
      if TempObj.QueryInterface(ClientType, Ret) = S_OK then begin
        Result := Ret;
        Exit;
      end;
    end;
  end;
  if not AllowNull then raise EElemConversion.Create(ERR_INVALID_PARAM);
end;

function RoseStarUMLAdapter.GetModelOfView(AView: RPetalView; const MdlType: TGuid; AllowNull: Boolean = False): IModel;
var
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  Ret: IModel;
begin
  Result := nil;
  TempMdl := AView.Model;
  if TempMdl <> nil then begin
    TempObj := TempMdl.InterfaceObj;
    if TempObj <> nil then begin
      if TempObj.QueryInterface(MdlType, Ret) = S_OK then begin
        Result := Ret;
        Exit;
      end;
    end;
  end;
  if not AllowNull then raise EElemConversion.Create(ERR_MODEL_NOT_FOUND);
end;

procedure RoseStarUMLAdapter.RemovePredefinedDiagrams;
  procedure RemoveDiagram(Mdl: IUMLModel);
  var ADiagram: IDiagram;
  begin
    if (Mdl <> nil) and (Mdl.GetOwnedDiagramCount = 1) then begin
      ADiagram := Mdl.GetOwnedDiagramAt(0);
      StarUMLApp.DeleteModel(ADiagram);
    end;
  end;
var
  AModel: IUMLModel;
begin
  AModel := GetRoseApproachRootModel(USE_CASE_VIEW_STR);
  RemoveDiagram(AModel);
  AModel := GetRoseApproachRootModel(LOGICAL_VIEW_STR);
  RemoveDiagram(AModel);
  AModel := GetRoseApproachRootModel(COMPONENT_VIEW_STR);
  RemoveDiagram(AModel);
  AModel := GetRoseApproachRootModel(DEPLOYMENT_VIEW_STR);
  RemoveDiagram(AModel);
end;

procedure RoseStarUMLAdapter.SetDefaultDiagramAndOpen;
var
  AModel: IUMLModel;
  ADiagram: IDiagram;
begin
  AModel := GetRoseApproachRootModel(LOGICAL_VIEW_STR);
  if (AModel <> nil) and (AModel.GetOwnedDiagramCount > 0) then begin
    ADiagram := AModel.GetOwnedDiagramAt(0);
    if ADiagram.IsKindOf(UML_ELEM_CLASS_DIAGRAM) then begin
      (ADiagram as IUMLClassDiagram).DefaultDiagram := True;
      StarUMLApp.OpenDiagram(ADiagram);
    end;
  end;
end;

procedure RoseStarUMLAdapter.SetProjectProperties(PetalDoc: RPetalDocument);
var
  Pjt: IUMLProject;
  PetalObj: RPetal;
  Str: string;
begin
  try
    Pjt := StarUMLApp.GetProject;
    // Name, Attachment
    if FileName <> '' then begin
      Str := ExtractFileName(FileName);
      Pjt.Title := ChangeFileExt(Str, '');
      if AddFilePathOption then Pjt.AddAttachment(FileName);
    end;
    // Documentation
    PetalObj := PetalDoc.Petal;
    if PetalObj <> nil then begin
      Str := '';
      if PetalObj._written <> '' then
        Str := Format(TXT_ORIGINAL_WRITTEN, [PetalObj._written]) + #13#10;
      if PetalObj.Version > 0 then
        Str := Str + Format(TXT_PETAL_VERSION, [IntToStr(PetalObj.Version)]) + #13#10;
      if Str <> '' then Pjt.Documentation := Str;
    end;
  except
  end;
end;

function RoseStarUMLAdapter.IsPredefinedModel(AModel: IModel): Boolean;
begin
  Result := False;
  if AModel = nil then Exit;
  if AModel.IsKindOf(UML_ELEM_MODEL) then begin
    if (AModel as IUMLModel).Namespace.IsKindOf(UML_ELEM_PROJECT) then
      Result := True;
  end;
end;

function RoseStarUMLAdapter.DetermineStatemachineType(RoseElem: RState_Machine): PStateMachineType;
  function HasChildObject(Obj: RPetalObject; ChildType: string): Boolean;
  var
    I: Integer;
    Child: RPetalObject;
  begin
    Result := False;
    for I := 0 to Obj.ChildCount - 1 do begin
      Child := Obj.Children[I];
      if LowerCase(Child.ObjectName) = LowerCase(ChildType) then begin
        Result := True;
        Exit;
      end else begin
        if Child.ChildCount > 0 then Result := HasChildObject(Child, ChildType);
      end;
    end;
  end;
var
  S, A: Boolean;
begin
  S := HasChildObject(RoseElem, PETAL_ELEM_STATE_DIAGRAM);
  A := HasChildObject(RoseElem, PETAL_ELEM_ACTIVITY_DIAGRAM);
  if S and A then Result := smtBoth
  else if S then Result := smtStateMachine
  else if A then Result := smtActivityGraph
  else Result := smtStateMachine;
end;

function RoseStarUMLAdapter.CheckUMLElemNameValidation(Val: string): Boolean;
const
  NotAllowedChars: array[0..0] of string = ('::');
var
  I: Integer;
begin
  Result := True;
  for I := 0 to High(NotAllowedChars) do
  begin
    if Pos(NotAllowedChars[I], Val) > 0 then begin
      Result := False;
      Break;
    end;
  end;
end;

function RoseStarUMLAdapter.ConflictNameToNewName(Elem: IUMLModelElement; Val: string): string;
var
  Ret: string;
begin
  Result := Val;
  if Val <> '' then begin
    Ret := Val;
    try
      while Elem.Namespace.ContainsName(Ret) do
        Ret := Ret + TXT_NAME_DISTINGUISHER;
      Result := Ret;
    except on Exception do
    end;
  end;
end;

procedure RoseStarUMLAdapter.BeforeConversion(PetalDoc: RPetalDocument);
begin
  SetProgress(0, 0, MSG_PREPARE_PROCESS);
  if not Assigned(PetalDoc) then
    raise Exception.Create(ERR_EMPTY_DOC);
  SetProjectProperties(PetalDoc);
  //* Check Rose Model Validity (Use Case View, Logical View, ...)
  //* Check StarUML Project Validity
  if MakeDiagramViewOption then RemovePredefinedDiagrams;
  EstimateProcessTime(PetalDoc.Design);
end;

procedure RoseStarUMLAdapter.AfterConversion;
begin
  try
    SetDefaultDiagramAndOpen;
  except
  end;
end;

procedure RoseStarUMLAdapter.ConvertElements(PetalDoc: RPetalDocument);
var
  ADesign: RDesign;
begin
  ADesign := PetalDoc.Design;
  if not assigned(ADesign) then raise Exception.Create(ERR_EMPTY_DOC);

  // Node type model elements conversion
  FProgressIdx := 0;
  SetProgress(FProgressIdx, FModelObjCount * 2, MSG_CONVERT_MODEL);
  ConvertModelElements(ADesign, FIRST_LOOP);
  // Edge type model elements conversion
  ConvertModelElements(ADesign, SECOND_LOOP);
  SetProgress(100, 100, MSG_CONVERT_MODEL);
  if MakeDiagramViewOption then begin
    // Node type view elements conversion
    FProgressIdx := 0;
    SetProgress(FProgressIdx, FViewObjCount * 2, MSG_CONVERT_VIEW);
    ConvertViewElements(ADesign, FIRST_LOOP);
    // Edge type view elements conversion
    ConvertViewElements(ADesign, SECOND_LOOP);
    SetProgress(100, 100, MSG_CONVERT_VIEW);
  end;
  FProgressIdx := 0;
end;

procedure RoseStarUMLAdapter.ConvertProperties(Obj: RPetalObject);
var
  I: Integer;
  Child: RPetalObject;
begin
  if Obj = nil then Exit;

  SetProgress(FProgressIdx, FModelObjCount + FViewObjCount, MSG_CONVERT_PROP);

  for I := 0 to Obj.ChildCount - 1 do begin
    Child := Obj.Children[I];
    if Child is RPetalModel then
      ConvertModelProperties(Child as RPetalModel)
    else if (Child is RPetalView) and MakeDiagramViewOption then
      ConvertViewProperties(Child as RPetalView);

    if Child.ChildCount > 0 then ConvertProperties(Child);
  end;
end;

procedure RoseStarUMLAdapter.ConvertModelElements(ADesign: RDesign; IsSecondLoop: Boolean);
var
  ACategory: RClass_Category;
  ASubsystem: RSubSystem;
  AProcesses: RProcesses;
  AModel: RPetalModel;
  AOwner: IUMLModel;
  I: Integer;
begin
  // Use Case View
  AOwner := GetRoseApproachRootModel(USE_CASE_VIEW_STR);
  ACategory := ADesign.Root_usecase_package;
  if ACategory <> nil then begin
    if not IsSecondLoop then ACategory.InterfaceObj := AOwner;
    Inc(FProgressIdx);
    SetProgress(FProgressIdx, FModelObjCount * 2, MSG_CONVERT_MODEL);
    // Use Case View::Logical_models
    for I := 0 to ACategory.Logical_modelCount - 1 do begin
      AModel := ACategory.Logical_models[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
    // Use Case View::Logical_presentations (Diagrams)
    for I := 0 to ACategory.Logical_presentationCount - 1 do begin
      AModel := ACategory.Logical_presentations[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
    // Use Case View::Statemachine
    ConvertModelElement(AOwner, ACategory.Statemachine, IsSecondLoop);
    // Use Case View::Visible_categories
    for I := 0 to ACategory.Visible_categoryCount - 1 do begin
      AModel := ACategory.Visible_categories[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
    // Use Case View::Visible_modules
    for I := 0 to ACategory.Visible_moduleCount - 1 do begin
      AModel := ACategory.Visible_modules[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
  end;

  // Logical View
  AOwner := GetRoseApproachRootModel(LOGICAL_VIEW_STR);
  ACategory := ADesign.Root_category;
  if ACategory <> nil then begin
    if not IsSecondLoop then ACategory.InterfaceObj := AOwner;
    Inc(FProgressIdx);
    SetProgress(FProgressIdx, FModelObjCount * 2, MSG_CONVERT_MODEL);
    // Logical View::Logical_models
    for I := 0 to ACategory.Logical_modelCount - 1 do begin
      AModel := ACategory.Logical_models[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
    // Logical View::Logical_presentations (Diagrams)
    for I := 0 to ACategory.Logical_presentationCount - 1 do begin
      AModel := ACategory.Logical_presentations[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
    // Logical View::Statemachine
    ConvertModelElement(AOwner, ACategory.Statemachine, IsSecondLoop);
    // Logical View::Visible_categories
    for I := 0 to ACategory.Visible_categoryCount - 1 do begin
      AModel := ACategory.Visible_categories[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
    // Logical View::Visible_modules
    for I := 0 to ACategory.Visible_moduleCount - 1 do begin
      AModel := ACategory.Visible_modules[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
  end;

  // Component View
  AOwner := GetRoseApproachRootModel(COMPONENT_VIEW_STR);
  ASubsystem := ADesign.Root_subsystem;
  if ASubsystem <> nil then begin
    Inc(FProgressIdx);
    SetProgress(FProgressIdx, FModelObjCount * 2, MSG_CONVERT_MODEL);
    if not IsSecondLoop then ASubsystem.InterfaceObj := AOwner;
    // Component View::Physical_models
    for I := 0 to ASubsystem.Physical_modelCount - 1 do begin
      AModel := ASubsystem.Physical_models[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
    // Component View::Physical_presentations
    for I := 0 to ASubsystem.Physical_presentationCount - 1 do begin
      AModel := ASubsystem.Physical_presentations[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
  end;

  // Deployment View
  AOwner := GetRoseApproachRootModel(DEPLOYMENT_VIEW_STR);
  AProcesses := ADesign.Process_structure;
  if AProcesses <> nil then begin
    Inc(FProgressIdx);
    SetProgress(FProgressIdx, FModelObjCount * 2, MSG_CONVERT_MODEL);
    if not IsSecondLoop then AProcesses.InterfaceObj := AOwner;
    // Deployment View::ProcsNDevs
    for I := 0 to AProcesses.ProcsNDevCount - 1 do begin
      AModel := AProcesses.ProcsNDevs[I];
      ConvertModelElement(AOwner, AModel, IsSecondLoop);
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertViewElements(Obj: RPetalObject; IsSecondLoop: Boolean);
var
  I, J: Integer;
  Child: RPetalObject;
  AView: RPetalView;
  TempObj: IUnknown;
  AOwnerMdl: IUMLDiagram;
  AOwner: IDiagramView;
begin
  if Obj = nil then Exit;

  for I := 0 to Obj.ChildCount - 1 do begin
    Child := Obj.Children[I];
    if Child is RPetalDiagram then begin
      TempObj := Child.InterfaceObj;
      if TempObj = nil then Continue;
      if TempObj.QueryInterface(IUMLDiagram, AOwnerMdl) = S_OK then begin
        AOwner := AOwnerMdl.DiagramView;
        for J := 0 to (Child as RPetalDiagram).ItemCount - 1 do begin
          AView := (Child as RPetalDiagram).Items[J];
          ConvertViewElement(AOwner, AView, IsSecondLoop);
        end;
      end;
    end else begin
      if Child.ChildCount > 0 then ConvertViewElements(Child, IsSecondLoop);
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertModelElement(AOwner: IModel; RoseElem: RPetalModel; IsSecondLoop: Boolean);
begin
  if RoseElem = nil then Exit;
  Inc(FProgressIdx);
  SetProgress(FProgressIdx, FModelObjCount * 2, MSG_CONVERT_MODEL);

  try
         if RoseElem is RActivityDiagram then ConvertActivityDiagram(AOwner, RoseElem as RActivityDiagram, IsSecondLoop)
    else if RoseElem is RActivityState then ConvertActivityState(AOwner, RoseElem as RActivityState, IsSecondLoop)
    else if RoseElem is RAssociation then ConvertAssociation(AOwner, RoseElem as RAssociation, IsSecondLoop)
    else if RoseElem is RClass_Utility then ConvertClass_Utility(AOwner, RoseElem as RClass_Utility, IsSecondLoop)
    else if RoseElem is RParameterized_Class_Utility then ConvertParameterized_Class_Utility(AOwner, RoseElem as RParameterized_Class_Utility, IsSecondLoop)
    else if RoseElem is RParameterized_Class then ConvertParameterized_Class(AOwner, RoseElem as RParameterized_Class, IsSecondLoop)
    else if RoseElem is RInstantiated_Class then ConvertInstantiated_Class(AOwner, RoseElem as RInstantiated_Class, IsSecondLoop)
    else if RoseElem is RInstantiated_Class_Utility then ConvertInstantiated_Class_Utility(AOwner, RoseElem as RInstantiated_Class_Utility, IsSecondLoop)
    else if RoseElem is RMetaclass then ConvertMetaclass(AOwner, RoseElem as RMetaclass, IsSecondLoop)
    else if RoseElem is RClass then ConvertClass(AOwner, RoseElem as RClass, IsSecondLoop)
    else if RoseElem is RClassAttribute then ConvertClassAttribute(AOwner, RoseElem as RClassAttribute, IsSecondLoop)
    else if RoseElem is RClassDiagram then ConvertClassDiagram(AOwner, RoseElem as RClassDiagram, IsSecondLoop)
    else if RoseElem is RClass_Category then ConvertClassCategory(AOwner, RoseElem as RClass_Category, IsSecondLoop)
    else if RoseElem is RConnection_Relationship then ConvertConnection_Relationship(AOwner, RoseElem as RConnection_Relationship, IsSecondLoop)
    else if RoseElem is RDecision then ConvertDecision(AOwner, RoseElem as RDecision, IsSecondLoop)
    else if RoseElem is RDependency_Relationship then ConvertDependency_Relationship(AOwner, RoseElem as RDependency_Relationship, IsSecondLoop)
    else if RoseElem is RDevice then ConvertDevice(AOwner, RoseElem as RDevice, IsSecondLoop)
    else if RoseElem is REvent then ConvertEvent(AOwner, RoseElem as REvent, IsSecondLoop)
    else if RoseElem is RInheritance_Relationship then ConvertInheritance_Relationship(AOwner, RoseElem as RInheritance_Relationship, IsSecondLoop)
    else if RoseElem is RInteractionDiagram then ConvertInteractionDiagram(AOwner, RoseElem as RInteractionDiagram, IsSecondLoop)
    else if RoseElem is RLink then ConvertLink(AOwner, RoseElem as RLink, IsSecondLoop)
    else if RoseElem is RMechanism then ConvertMechanism(AOwner, RoseElem as RMechanism, IsSecondLoop)
    else if RoseElem is RMessage then ConvertMessage(AOwner, RoseElem as RMessage, IsSecondLoop)
    else if RoseElem is RModule_Diagram then ConvertModule_Diagram(AOwner, RoseElem as RModule_Diagram, IsSecondLoop)
    else if RoseElem is RModule_Visibility_Relationship then ConvertModule_Visibility_Relationship(AOwner, RoseElem as RModule_Visibility_Relationship, IsSecondLoop)
    else if RoseElem is RObject then ConvertObject(AOwner, RoseElem as RObject, IsSecondLoop)
    else if RoseElem is RObjectDiagram then ConvertObjectDiagram(AOwner, RoseElem as RObjectDiagram, IsSecondLoop)
    else if RoseElem is ROperation then ConvertOperation(AOwner, RoseElem as ROperation, IsSecondLoop)
    else if RoseElem is RParameter then ConvertParameter(AOwner, RoseElem as RParameter, IsSecondLoop)
    else if RoseElem is RPartition then ConvertPartition(AOwner, RoseElem as RPartition, IsSecondLoop)
    else if RoseElem is RProcess_Diagram then ConvertProcess_Diagram(AOwner, RoseElem as RProcess_Diagram, IsSecondLoop)
    else if RoseElem is RProcessor then ConvertProcessor(AOwner, RoseElem as RProcessor, IsSecondLoop)
    else if RoseElem is RRealize_Relationship then ConvertRealize_Relationship(AOwner, RoseElem as RRealize_Relationship, IsSecondLoop)
    else if RoseElem is RRole then ConvertRole(AOwner, RoseElem as RRole, IsSecondLoop)
    else if RoseElem is RState then ConvertState(AOwner, RoseElem as RState, IsSecondLoop)
    else if RoseElem is RState_Diagram then ConvertState_Diagram(AOwner, RoseElem as RState_Diagram, IsSecondLoop)
    else if RoseElem is RState_Machine then ConvertState_Machine(AOwner, RoseElem as RState_Machine, IsSecondLoop)
    else if RoseElem is RState_Transition then ConvertState_Transition(AOwner, RoseElem as RState_Transition, IsSecondLoop)
    else if RoseElem is RSubSystem then ConvertSubSystem(AOwner, RoseElem as RSubSystem, IsSecondLoop)
    else if RoseElem is RSynchronizationState then ConvertSynchronizationState(AOwner, RoseElem as RSynchronizationState, IsSecondLoop)
    else if RoseElem is RTier_Diagram then ConvertTierDiagram(AOwner, RoseElem as RTier_Diagram, IsSecondLoop)
    else if RoseElem is RUseCase then ConvertUseCase(AOwner, RoseElem as RUseCase, IsSecondLoop)
    else if RoseElem is RUseCaseDiagram then ConvertUseCaseDiagram(AOwner, RoseElem as RUseCaseDiagram, IsSecondLoop)
    else if RoseElem is RUses_Relationship then ConvertUses_Relationship(AOwner, RoseElem as RUses_Relationship, IsSecondLoop)
    else if RoseElem is RVisibility_Relationship then ConvertVisibility_Relationship(AOwner, RoseElem as RVisibility_Relationship, IsSecondLoop)
    else if RoseElem is RAction then ConvertAction(AOwner, RoseElem as RAction, IsSecondLoop)
    else if RoseElem is RModule then ConvertModule(AOwner, RoseElem as RModule, IsSecondLoop)
    else if RoseElem is RSendEvent then ConvertSendEvent(AOwner, RoseElem as RSendEvent, IsSecondLoop);
  except on E: Exception do
    AddLog(Format(ERR_ELEM_CONVERSION, [RoseElem.ObjectName, RoseElem.Name, E.Message]));
  end;
end;

procedure RoseStarUMLAdapter.ConvertViewElement(AOwner: IDiagramView; RoseElem: RPetalView; IsSecondLoop: Boolean);
begin
  if (AOwner = nil) or (RoseElem = nil) then Exit;
  Inc(FProgressIdx);
  SetProgress(FProgressIdx, FViewObjCount * 2, MSG_CONVERT_VIEW);

  try
         if RoseElem is RActivityStateView then ConvertActivityStateView(AOwner, RoseElem as RActivityStateView, IsSecondLoop)
    else if RoseElem is RAssocAttachView then ConvertAssocAttachView(AOwner, RoseElem as RAssocAttachView, IsSecondLoop)
    else if RoseElem is RAssociationViewNew then ConvertAssociationViewNew(AOwner, RoseElem as RAssociationViewNew, IsSecondLoop)
    else if RoseElem is RAttachView then ConvertAttachView(AOwner, RoseElem as RAttachView, IsSecondLoop)
    else if RoseElem is RCategoryView then ConvertCategoryView(AOwner, RoseElem as RCategoryView, IsSecondLoop)
    else if RoseElem is RClassInstanceView then ConvertClassInstanceView(AOwner, RoseElem as RClassInstanceView, IsSecondLoop)
    else if RoseElem is RClassView then ConvertClassView(AOwner, RoseElem as RClassView, IsSecondLoop)
    else if RoseElem is RConnectionView then ConvertConnectionView(AOwner, RoseElem as RConnectionView, IsSecondLoop)
    else if RoseElem is RDataFlowView then ConvertDataFlowView(AOwner, RoseElem as RDataFlowView, IsSecondLoop)
    else if RoseElem is RDecisionView then ConvertDecisionView(AOwner, RoseElem as RDecisionView, IsSecondLoop)
    else if RoseElem is RDependencyView then ConvertDependencyView(AOwner, RoseElem as RDependencyView, IsSecondLoop)
    else if RoseElem is RDestruction_Marker then ConvertDestruction_Marker(AOwner, RoseElem as RDestruction_Marker, IsSecondLoop)
    else if RoseElem is RDeviceView then ConvertDeviceView(AOwner, RoseElem as RDeviceView, IsSecondLoop)
    else if RoseElem is RFocus_Of_Control then ConvertFocus_Of_Control(AOwner, RoseElem as RFocus_Of_Control, IsSecondLoop)
    else if RoseElem is RImportView then ConvertImportView(AOwner, RoseElem as RImportView, IsSecondLoop)
    else if RoseElem is RInheritView then ConvertInheritView(AOwner, RoseElem as RInheritView, IsSecondLoop)
    else if RoseElem is RInterfaceView then ConvertInterfaceView(AOwner, RoseElem as RInterfaceView, IsSecondLoop)
    else if RoseElem is RInterMessView then ConvertInterMessView(AOwner, RoseElem as RInterMessView, IsSecondLoop)
    else if RoseElem is RInterObjView then ConvertInterObjView(AOwner, RoseElem as RInterObjView, IsSecondLoop)
    else if RoseElem is RLabel then ConvertLabelView(AOwner, RoseElem as RLabel, IsSecondLoop)
    else if RoseElem is RLinkSelfView then ConvertLinkSelfView(AOwner, RoseElem as RLinkSelfView, IsSecondLoop)
    else if RoseElem is RLinkView then ConvertLinkView(AOwner, RoseElem as RLinkView, IsSecondLoop)
    else if RoseElem is RMessView then ConvertMessView(AOwner, RoseElem as RMessView, IsSecondLoop)
    else if RoseElem is RModView then ConvertModView(AOwner, RoseElem as RModView, IsSecondLoop)
    else if RoseElem is RModVisView then ConvertModVisView(AOwner, RoseElem as RModVisView, IsSecondLoop)
    else if RoseElem is RNoteView then ConvertNoteView(AOwner, RoseElem as RNoteView, IsSecondLoop)
    else if RoseElem is RObjectView then ConvertObjectView(AOwner, RoseElem as RObjectView, IsSecondLoop)
    else if RoseElem is RProcessorView then ConvertProcessorView(AOwner, RoseElem as RProcessorView, IsSecondLoop)
    else if RoseElem is RRealizeView then ConvertRealizeView(AOwner, RoseElem as RRealizeView, IsSecondLoop)
    else if RoseElem is RSelfMessView then ConvertSelfMessView(AOwner, RoseElem as RSelfMessView, IsSecondLoop)
    else if RoseElem is RSelfTransView then ConvertSelfTransView(AOwner, RoseElem as RSelfTransView, IsSecondLoop)
    else if RoseElem is RStateView then ConvertStateView(AOwner, RoseElem as RStateView, IsSecondLoop)
    else if RoseElem is RSubSysView then ConvertSubSysView(AOwner, RoseElem as RSubSysView, IsSecondLoop)
    else if RoseElem is RSwimlane then ConvertSwimlane(AOwner, RoseElem as RSwimlane, IsSecondLoop)
    else if RoseElem is RSynchronizationView then ConvertSynchronizationView(AOwner, RoseElem as RSynchronizationView, IsSecondLoop)
    else if RoseElem is RTierView then ConvertTierView(AOwner, RoseElem as RTierView, IsSecondLoop)
    else if RoseElem is RTransView then ConvertTransView(AOwner, RoseElem as RTransView, IsSecondLoop)
    else if RoseElem is RUseCaseView then ConvertUseCaseView(AOwner, RoseElem as RUseCaseView, IsSecondLoop)
    else if RoseElem is RUsesView then ConvertUsesView(AOwner, RoseElem as RUsesView, IsSecondLoop);
  except on E: Exception do
    AddLog(Format(ERR_VIEW_CONVERSION, [AOwner.Diagram.GetClassName, AOwner.Diagram.Name, RoseElem.ObjectName, E.Message]));
  end;
end;

procedure RoseStarUMLAdapter.ConvertModelProperties(RoseElem: RPetalModel);
var
  TempObj: IUnknown;
  StarUMLElem: IModel;
begin
  if RoseElem = nil then Exit;
  TempObj := RoseElem.InterfaceObj;
  if TempObj = nil then Exit;
  if TempObj.QueryInterface(IModel, StarUMLElem) <> S_OK then Exit;

  Inc(FProgressIdx);
  SetProgress(FProgressIdx, FModelObjCount + FViewObjCount, MSG_CONVERT_PROP);

  try
    ConvertModelCommonProperties(StarUMLElem, RoseElem);
    if RoseElem is RPetalDiagram then ConvertDiagramCommonProperties(StarUMLElem, RoseElem as RPetalDiagram);
    if RoseElem is RPetalRelationship then ConvertRelationshipCommonProperties(StarUMLElem, RoseElem as RPetalRelationship);
    if RoseElem is RActivityState then ConvertActivityStateProperties(StarUMLElem, RoseElem as RActivityState);
    if RoseElem is RAssociation then ConvertAssociationProperties(StarUMLElem, RoseElem as RAssociation);
    if RoseElem is RClass then ConvertClassProperties(StarUMLElem, RoseElem as RClass);
    if RoseElem is RClassAttribute then ConvertClassAttributeProperties(StarUMLElem, RoseElem as RClassAttribute);
    if RoseElem is RClass_Category then ConvertClassCategoryProperties(StarUMLElem, RoseElem as RClass_Category);
    if RoseElem is RConnection_Relationship then ConvertConnectionRelationshipProperties(StarUMLElem, RoseElem as RConnection_Relationship);
    if RoseElem is RDecision then ConvertDecisionProperties(StarUMLElem, RoseElem as RDecision);
    if RoseElem is RDevice then ConvertDeviceProperties(StarUMLElem, RoseElem as RDevice);
    if RoseElem is REvent then ConvertEventProperties(StarUMLElem, RoseElem as REvent);
    if RoseElem is RInheritance_Relationship then ConvertInheritanceRelationshipProperties(StarUMLElem, RoseElem as RInheritance_Relationship);
    if RoseElem is RLink then ConvertLinkProperties(StarUMLElem, RoseElem as RLink);
    if RoseElem is RMessage then ConvertMessageProperties(StarUMLElem, RoseElem as RMessage);
    if RoseElem is RModule_Visibility_Relationship then ConvertModuleVisibilityRelationshipProperties(StarUMLElem, RoseElem as RModule_Visibility_Relationship);
    if RoseElem is RObject then ConvertObjectProperties(StarUMLElem, RoseElem as RObject);
    if RoseElem is ROperation then ConvertOperationProperties(StarUMLElem, RoseElem as ROperation);
    if RoseElem is RParameter then ConvertParameterProperties(StarUMLElem, RoseElem as RParameter);
    if RoseElem is RPartition then ConvertPartitionProperties(StarUMLElem, RoseElem as RPartition);
    if RoseElem is RProcess then ConvertProcessProperties(StarUMLElem, RoseElem as RProcess);
    if RoseElem is RProcessor then ConvertProcessorProperties(StarUMLElem, RoseElem as RProcessor);
    if RoseElem is RRole then ConvertRoleProperties(StarUMLElem, RoseElem as RRole);
    if RoseElem is RState then ConvertStateProperties(StarUMLElem, RoseElem as RState);
    if RoseElem is RState_Transition then ConvertStateTransitionProperties(StarUMLElem, RoseElem as RState_Transition);
    if RoseElem is RSynchronizationState then ConvertSynchronizationProperties(StarUMLElem, RoseElem as RSynchronizationState);
    if RoseElem is RUseCase then ConvertUseCaseProperties(StarUMLElem, RoseElem as RUseCase);
    if RoseElem is RUses_Relationship then ConvertUsesRelationshipProperties(StarUMLElem, RoseElem as RUses_Relationship);
    if RoseElem is RModule then ConvertModuleProperties(StarUMLElem, RoseElem as RModule);
    if RoseElem is RSendEvent then ConvertSendEventProperties(StarUMLElem, RoseElem as RSendEvent);
    if RoseElem is RInteractionDiagram then ConvertInteractionDiagramProperties(StarUMLElem, RoseElem as RInteractionDiagram);
    if RoseElem is RObjectDiagram then ConvertObjectDiagramProperties(StarUMLElem, RoseElem as RObjectDiagram);
  except on E: Exception do
    AddLog(Format(ERR_PROP_CONVERSION, [StarUMLElem.Pathname, E.Message]));
  end;
end;

procedure RoseStarUMLAdapter.ConvertViewProperties(RoseElem: RPetalView);
var
  TempObj: IUnknown;
  StarUMLElem: IView;
begin
  if RoseElem = nil then Exit;
  TempObj := RoseElem.InterfaceObj;
  if TempObj = nil then Exit;
  if TempObj.QueryInterface(IView, StarUMLElem) <> S_OK then Exit;

  Inc(FProgressIdx);
  SetProgress(FProgressIdx, FModelObjCount + FViewObjCount, MSG_CONVERT_PROP);

  try
    ConvertViewCommonProperties(StarUMLElem, RoseElem);
    if RoseElem is RPetalNodeView then ConvertNodeViewCommonProperties(StarUMLElem, RoseElem as RPetalNodeView);
    if RoseElem is RPetalEdgeView then ConvertEdgeViewCommonProperties(StarUMLElem, RoseELem as RPetalEdgeView);
    if RoseElem is RActivityStateView then ConvertActivityStateViewProperties(StarUMLElem, RoseElem as RActivityStateView);
    if RoseElem is RCategoryView then ConvertCategoryViewProperties(StarUMLElem, RoseElem as RCategoryView);
    if RoseElem is RClassInstanceView then ConvertClassInstanceViewProperties(StarUMLElem, RoseElem as RClassInstanceView);
    if RoseElem is RClassView then ConvertClassViewProperties(StarUMLElem, RoseElem as RClassView);
    if RoseElem is RInterfaceView then ConvertInterfaceViewProperties(StarUMLElem, RoseElem as RInterfaceView);
    if RoseElem is RInterMessView then ConvertInterMessViewProperties(StarUMLElem, RoseElem as RInterMessView);
    if RoseElem is RInterObjView then ConvertInterObjViewProperties(StarUMLElem, RoseElem as RInterObjView);
    if RoseElem is RLabel then ConvertLabelProperties(StarUMLElem, RoseElem as RLabel);
    if RoseElem is RMessView then ConvertMessViewProperties(StarUMLElem, RoseElem as RMessView);
    if RoseElem is RModView then ConvertModViewProperties(StarUMLElem, RoseElem as RModView);
    if RoseElem is RNoteView then ConvertNoteViewProperties(StarUMLElem, RoseElem as RNoteView);
    if RoseElem is RObjectView then ConvertObjectViewProperties(StarUMLElem, RoseElem as RObjectView);
    if RoseElem is RProcessorView then ConvertProcessorViewProperties(StarUMLElem, RoseElem as RProcessorView);
    if RoseElem is RSelfMessView then ConvertSelfMessViewProperties(StarUMLElem, RoseElem as RSelfMessView);
    if RoseElem is RSynchronizationView then ConvertSynchronizationViewProperties(StarUMLElem, RoseElem as RSynchronizationView);
    if RoseElem is RTransView then ConvertTransViewProperties(StarUMLElem, RoseElem as RTransView);
    if RoseElem is RUsesView then ConvertUsesViewProperties(StarUMLElem, RoseElem as RUsesView);
    if RoseElem is RStateView then ConvertStateViewProperties(StarUMLElem, RoseElem as RStateView);
  except on E: Exception do
    //AddLog(Format(ERR_PROP_CONVERSION, [StarUMLElem.Pathname, E.Message]));
  end;
end;

procedure RoseStarUMLAdapter.ConvertGeneralDependency(AOwner: IModel; RoseElem: RPetalRelationship; IsSecondLoop: Boolean);
var
  NewOwner: IUMLNamespace;
  NewElem: IUMLDependency;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  End2: IUMLModelElement;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_MODEL_ELEM)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  NewOwner := GetNamespaceElement(AOwner as IUMLModelElement);
  if NewOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempMdl := RoseElem.Supplier;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if TempObj.QueryInterface(IUMLModelElement, End2) <> S_OK then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateDependency(NewOwner, AOwner as IUMLModelElement, End2);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertActivityDiagram(AOwner: IModel; RoseElem: RActivityDiagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLActivityDiagram;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if AOwner.IsKindOf(UML_ELEM_STA_VERTEX) then
    AOwner := GetOwnerStateMachine(AOwner as IUMLStateVertex) as IUMLStateMachine;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_ACTIVITY_GRAPH)) then begin
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  end;

  NewElem := StarUMLApp.UMLFactory.CreateActivityDiagram(AOwner as IUMLActivityGraph);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertActivityState(AOwner: IModel; RoseElem: RActivityState; IsSecondLoop: Boolean);
var
  I: Integer;
  NewElem: IUMLState;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if AOwner.IsKindOf(UML_ELEM_STATE_MACHINE) then begin
      if not AOwner.IsKindOf(UML_ELEM_ACTIVITY_GRAPH) then
        raise EElemConversion.Create(ERR_INVALID_PARAM);
      AOwner := (AOwner as IUMLStateMachine).Top as IUMLCompositeState;
    end;
    if not AOwner.IsKindOf(UML_ELEM_COMPOSITE_STATE) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    // if RoseElem.Statemachine <> nil then
    //   NewElem := StarUMLApp.UMLFactory.CreateSubactivityState(AOwner as IUMLCompositeState)
    // else
    NewElem := StarUMLApp.UMLFactory.CreateActionState(AOwner as IUMLCompositeState);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLActionState;
  end;

  // statemachine
  ConvertModelElement(NewElem, RoseElem.Statemachine, IsSecondLoop);
  // actions
  for I := 0 to RoseElem.ActionCount - 1 do begin
    AModel := RoseElem.Actions[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // transitions
  for I := 0 to RoseElem.TransitionCount - 1 do begin
    AModel := RoseElem.Transitions[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertAssociation(AOwner: IModel; RoseElem: RAssociation; IsSecondLoop: Boolean);
var
  Role1, Role2: RRole;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  End1, End2: IUMLClassifier;
  AClass: IUMLClass;
  NewElem: IUMLAssociation;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not AOwner.IsKindOf(UML_ELEM_NAMESPACE) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not RoseElem.RoleCount = 2 then
    raise EElemConversion.Create(ERR_INVALID_ASSOC_ROLE);
  
  Role1 := RoseElem.Roles[1];
  TempMdl := Role1.Supplier;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_ASSOC_ROLE);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_ASSOC_ROLE);
  if TempObj.QueryInterface(IUMLClassifier, End1) <> S_OK then
    raise EElemConversion.Create(ERR_INVALID_ASSOC_ROLE);
  Role2 := RoseElem.Roles[0];
  TempMdl := Role2.Supplier;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_ASSOC_ROLE);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_ASSOC_ROLE);
  if TempObj.QueryInterface(IUMLClassifier, End2) <> S_OK then
     raise EElemConversion.Create(ERR_INVALID_ASSOC_ROLE);

  NewElem := StarUMLApp.UMLFactory.CreateAssociation(AOwner as IUMLNamespace, End1, End2);
  RoseElem.InterfaceObj := NewElem;
  Role1.InterfaceObj := NewElem.GetConnectionAt(0);
  Role2.InterfaceObj := NewElem.GetConnectionAt(1);

  // associationClass
  if RoseElem.AssociationClass <> nil then begin
    TempObj := RoseElem.AssociationClass.InterfaceObj;
    if (TempObj <> nil) and (TempObj.QueryInterface(IUMLClass, AClass) = S_OK) then
      StarUMLApp.UMLFactory.CreateAssociationClass(AOwner as IUMLNamespace, NewElem, AClass)
    else ;//* AddLog
  end;

  // roles
  for I := 0 to RoseElem.RoleCount - 1 do begin
    AModel := RoseElem.Roles[I];
    ConvertModelElement(RoseElem.Roles[I].InterfaceObj as IModel, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertClass(AOwner: IModel; RoseElem: RClass; IsSecondLoop: Boolean);
var
  StreotypeStr: string;
  I: Integer;
  NewElem: IUMLClassifier;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_NAMESPACE)) then raise
      EElemConversion.Create(ERR_INVALID_PARAM);

    StreotypeStr := LowerCase(RoseElem.Stereotype);
    if StreotypeStr = LowerCase(STEREOTYPE_ACTOR) then
      NewElem := StarUMLApp.UMLFactory.CreateActor(AOwner as IUMLNamespace)
    else if StreotypeStr = LowerCase(STEREOTYPE_INTERFACE) then
      NewElem := StarUMLApp.UMLFactory.CreateInterface(AOwner as IUMLNamespace)
    else NewElem := StarUMLApp.UMLFactory.CreateClass(AOwner as IUMLNamespace);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLClassifier;
  end;

  // class_attributes
  for I := 0 to RoseElem.Class_attributeCount - 1 do begin
    AModel := RoseElem.Class_attributes[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // nestedClasses
  for I := 0 to RoseElem.NestedClassCount - 1 do begin
    AModel := RoseElem.NestedClasses[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // operations
  for I := 0 to RoseElem.OperationCount - 1 do begin
    AModel := RoseElem.Operations[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // statemachine
  ConvertModelElement(NewElem, RoseElem.Statemachine, IsSecondLoop);
  // realized_interface
  for I := 0 to RoseElem.Realized_interfaceCount - 1 do begin
    AModel := RoseElem.Realized_interfaces[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // superclasses
  for I := 0 to RoseElem.SuperclassCount - 1 do begin
    AModel := RoseElem.Superclasses[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // used_nodes
  for I := 0 to RoseElem.Used_nodeCount - 1 do begin
    AModel := RoseElem.Used_nodes[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertClassAttribute(AOwner: IModel; RoseElem: RClassAttribute; IsSecondLoop: Boolean);
var
  NewElem: IUMLAttribute;
begin
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not(AOwner.IsKindOf(UML_ELEM_CLASSIFIER) or AOwner.IsKindOf(UML_ELEM_ASSOC_END)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  if AOwner.IsKindOf(UML_ELEM_CLASSIFIER) then begin
    if IsSecondLoop then Exit;
    NewElem := StarUMLApp.UMLFactory.CreateAttribute(AOwner as IUMLClassifier);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if not IsSecondLoop then Exit;
    NewElem := StarUMLApp.UMLFactory.CreateQualifier(AOwner as IUMLAssociationEnd);
    RoseElem.InterfaceObj := NewElem;
  end;
end;

procedure RoseStarUMLAdapter.ConvertClassDiagram(AOwner: IModel; RoseElem: RClassDiagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLClassDiagram;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateClassDiagram(AOwner);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertClassCategory(AOwner: IModel; RoseElem: RClass_Category; IsSecondLoop: Boolean);
var
  NewElem: IUMLPackage;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_NAMESPACE)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewElem := StarUMLApp.UMLFactory.CreatePackage(AOwner as IUMLNamespace);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLPackage;
  end;

  // logical_models
  for I := 0 to RoseElem.Logical_modelCount - 1 do begin
    AModel := RoseElem.Logical_models[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // logical_presentations
  for I := 0 to RoseElem.Logical_presentationCount - 1 do begin
    AModel := RoseElem.Logical_presentations[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // statemachine
  ConvertModelElement(NewElem, RoseElem.Statemachine, IsSecondLoop);
  // visible_categories
  for I := 0 to RoseElem.Visible_categoryCount - 1 do begin
    AModel := RoseElem.Visible_categories[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // visible_modules
  for I := 0 to RoseElem.Visible_moduleCount - 1 do begin
    AModel := RoseElem.Visible_modules[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertClass_Utility(AOwner: IModel; RoseElem: RClass_Utility; IsSecondLoop: Boolean);
begin
  ConvertClass(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertConnection_Relationship(AOwner: IModel; RoseElem: RConnection_Relationship; IsSecondLoop: Boolean);
var
  NewOwner: IUMLNamespace;
  NewElem: IUMLAssociation;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  End2: IUMLClassifier;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_CLASSIFIER)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);
    
  NewOwner := GetNamespaceElement(AOwner as IUMLClassifier);
  if NewOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempMdl := RoseElem.Supplier;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if TempObj.QueryInterface(IUMLClassifier, End2) <> S_OK then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateAssociation(NewOwner, AOwner as IUMLClassifier, End2);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertDecision(AOwner: IModel; RoseElem: RDecision; IsSecondLoop: Boolean);
var
  NewElem: IUMLPseudoState;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if AOwner.IsKindOf(UML_ELEM_STATE_MACHINE) then
      AOwner := (AOwner as IUMLStateMachine).Top;
    if not(AOwner.IsKindOf(UML_ELEM_COMPOSITE_STATE)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
      
    NewElem := StarUMLApp.UMLFactory.CreatePseudostate(AOwner as IUMLCompositeState);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLPseudostate;
  end;

  // transitions
  for I := 0 to RoseElem.TransitionCount - 1 do begin
    AModel := RoseElem.Transitions[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertDependency_Relationship(AOwner: IModel; RoseElem: RDependency_Relationship; IsSecondLoop: Boolean);
begin
  ConvertGeneralDependency(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertDevice(AOwner: IModel; RoseElem: RDevice; IsSecondLoop: Boolean);
var
  NewElem: IUMLNode;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_NAMESPACE)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
      
    NewElem := StarUMLApp.UMLFactory.CreateNode(AOwner as IUMLNamespace);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLNode;
  end;

  // connections
  for I := 0 to RoseElem.ConnectionCount - 1 do begin
    AModel := RoseElem.Connections[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertEvent(AOwner: IModel; RoseElem: REvent; IsSecondLoop: Boolean);
var
  NewElem: IUMLCallEvent;
begin
  If not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_TRANSITION)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateCallEvent(AOwner as IUMLTransition);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertInheritance_Relationship(AOwner: IModel; RoseElem: RInheritance_Relationship; IsSecondLoop: Boolean);
var
  NewOwner: IUMLNamespace;
  NewElem: IUMLGeneralization;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  End2: IUMLGeneralizableElement;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_GENERALIABLE)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  NewOwner := GetNamespaceElement(AOwner as IUMLGeneralizableElement);
  if NewOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempMdl := RoseElem.Supplier;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if TempObj.QueryInterface(IUMLGeneralizableElement, End2) <> S_OK then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateGeneralization(NewOwner, End2, AOwner as IUMLGeneralizableElement);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertInstantiated_Class(AOwner: IModel; RoseElem: RInstantiated_Class; IsSecondLoop: Boolean);
begin
  ConvertClass(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertInstantiated_Class_Utility(AOwner: IModel; RoseElem: RInstantiated_Class_Utility; IsSecondLoop: Boolean);
begin
  ConvertClass(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertInteractionDiagram(AOwner: IModel; RoseElem: RInteractionDiagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLDiagram;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  ACol: IUMLCollaboration;
  AColSet: IUMLCollaborationInstanceSet;
  AInter: IUMLInteraction;
  AInterSet: IUMLInteractionInstanceSet;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  TempMdl := RoseElem.Mechanism_ref;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);

  if TempObj.QueryInterface(IUMLCollaboration, ACol) = S_OK then begin
    if ACol.GetInteractionCount <= 0 then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    AInter := ACol.GetInteractionAt(0);
    NewElem := StarUMLApp.UMLFactory.CreateSequenceRoleDiagram(AInter);
  end else if TempObj.QueryInterface(IUMLCollaborationInstanceSet, AColSet) = S_OK then begin
    if AColSet.GetInteractionInstanceSetCount <= 0 then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    AInterSet := AColSet.GetInteractionInstanceSetAt(0);
    NewElem := StarUMLApp.UMLFactory.CreateSequenceDiagram(AInterSet);
  end else begin
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  end;
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertLink(AOwner: IModel; RoseElem: RLink; IsSecondLoop: Boolean);
var
  NewElem: IUMLModelElement;
  ANamespace: IUMLNamespace;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  ACol: IUMLCollaboration;
  AColSet: IUMLCollaborationInstanceSet;
  End2_1: IUMLClassifierRole;
  End2_2: IUMLObject;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not(AOwner.IsKindOf(UML_ELEM_OBJECT) or AOwner.IsKindOf(UML_ELEM_CLASSIFIER_ROLE)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempMdl := RoseElem.Supplier;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);

  if AOwner.IsKindOf(UML_ELEM_CLASSIFIER_ROLE) then begin
    ANamespace := (AOwner as IUMLClassifierRole).Namespace;
    if not(ANamespace.IsKindOf(UML_ELEM_COLLABORATION)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    ACol := ANamespace as IUMLCollaboration;
    if TempObj.QueryInterface(IUMLClassifierRole, End2_1) <> S_OK then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    NewElem := StarUMLApp.UMLFactory.CreateAssociationRole(ACol, AOwner as IUMLClassifierRole, End2_1);
  end else begin
    AColSet := (AOwner as IUMLObject).CollaborationInstanceSet;
    if AColSet = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if TempObj.QueryInterface(IUMLObject, End2_2) <> S_OK then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    NewElem := StarUMLApp.UMLFactory.CreateLink(AColSet, AOwner as IUMLObject, End2_2);
  end;
  RoseElem.InterfaceObj := NewElem;

  // messages
  for I := 0 to RoseElem.MessageCount - 1 do begin
    AModel := RoseElem.Messages[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertMechanism(AOwner: IModel; RoseElem: RMechanism; IsSecondLoop: Boolean);
var
  NewElem: IUMLModelElement;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_CLASSIFIER)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    if InstanceToRoleOption then begin
      NewElem := StarUMLApp.UMLFactory.CreateCollaboration(AOwner as IUMLClassifier);
      StarUMLApp.UMLFactory.CreateInteraction(NewElem as IUMLCollaboration);
    end else begin
      NewElem := StarUMLApp.UMLFactory.CreateCollaborationInstanceSet(AOwner as IUMLClassifier);
      StarUMLApp.UMLFactory.CreateInteractionInstanceSet(NewElem as IUMLCollaborationInstanceSet);
    end;
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLModelElement;
  end;

  // logical_models
  for I := 0 to RoseElem.Logical_modelCount - 1 do begin
    AModel := RoseElem.Logical_models[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertMessage(AOwner: IModel; RoseElem: RMessage; IsSecondLoop: Boolean);
var
  NewElem: IUMLModelElement;
  ALink: RLink;
  AObject: RObject;
  AMechanism: RMechanism;
  ACol, AInter: IUMLModelElement;
  CommLink, End1, End2: IUMLModelElement;
  MsgKind: UMLFactoryMessageKind;
begin
  if not IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not(AOwner.IsKindOf(UML_ELEM_LINK) or AOwner.IsKindOf(UML_ELEM_ASSOC_ROLE)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  MsgKind := mkSendAction;  
  try
    ALink := RoseElem.Parent as RLink;
    AObject := ALink.Parent as RObject;
    AMechanism := AObject.Parent as RMechanism;
    ACol := AMechanism.InterfaceObj as IUMLModelElement;
    if ACol.IsKindOf(UML_ELEM_COLLABORATION) then
      AInter := (ACol as IUMLCollaboration).GetInteractionAt(0)
    else AInter := (ACol as IUMLCollaborationInstanceSet).GetInteractionInstanceSetAt(0);
    CommLink := ALink.InterfaceObj as IUMLModelElement;
    End1 := AObject.InterfaceObj as IUMLModelElement;
    End2 := ALink.Supplier.InterfaceObj as IUMLModelElement;
    if RoseElem.Creation then MsgKind := mkCreateAction
    else begin
      case RoseElem.Synchronization of
        skReturn: MsgKind := mkReturnAction;
        skAsynchronous: MsgKind := mkSendAction;
        else MsgKind := mkSendAction;
      end;
    end;
  except
  end;

  if (AInter = nil) or (CommLink = nil) or (End1 = nil) or (End2 = nil) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  if AOwner.IsKindOf(UML_ELEM_LINK) then begin
    // Stimulus
    if not AInter.IsKindOf(UML_ELEM_INTERACTION_SET) then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not End1.IsKindOf(UML_ELEM_INSTANCE) then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not End2.IsKindOf(UML_ELEM_INSTANCE) then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not CommLink.IsKindOf(UML_ELEM_LINK) then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if RoseElem.Dir = dkClientToSupplier then
      NewElem := StarUMLApp.UMLFactory.CreateStimulus2(AInter as IUMLInteractionInstanceSet,
                 End1 as IUMLInstance, End2 as IUMLInstance, CommLink as IUMLLink, MsgKind)
    else
      NewElem := StarUMLApp.UMLFactory.CreateStimulus2(AInter as IUMLInteractionInstanceSet,
                 End2 as IUMLInstance, End1 as IUMLInstance, CommLink as IUMLLink, MsgKind);
  end else begin
    // Message
    if not AInter.IsKindOf(UML_ELEM_INTERACTION) then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not End1.IsKindOf(UML_ELEM_CLASSIFIER_ROLE) then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not End2.IsKindOf(UML_ELEM_CLASSIFIER_ROLE) then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not CommLink.IsKindOf(UML_ELEM_ASSOC_ROLE) then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if RoseElem.Dir = dkClientToSupplier then
      NewElem := StarUMLApp.UMLFactory.CreateMessage2(AInter as IUMLInteraction,
                 End1 as IUMLClassifierRole, End2 as IUMLClassifierRole, CommLink as IUMLAssociationRole, MsgKind)
    else
      NewElem := StarUMLApp.UMLFactory.CreateMessage2(AInter as IUMLInteraction,
                 End2 as IUMLClassifierRole, End1 as IUMLClassifierRole, CommLink as IUMLAssociationRole, MsgKind)
  end;
  RoseElem.InterfaceObj := NewElem; 
end;

procedure RoseStarUMLAdapter.ConvertMetaclass(AOwner: IModel; RoseElem: RMetaclass; IsSecondLoop: Boolean);
begin
  ConvertClass(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertModule_Diagram(AOwner: IModel; RoseElem: RModule_Diagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLComponentDiagram;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  
  NewElem := StarUMLApp.UMLFactory.CreateComponentDiagram(AOwner);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertModule_Visibility_Relationship(AOwner: IModel; RoseElem: RModule_Visibility_Relationship; IsSecondLoop: Boolean);
begin
  ConvertGeneralDependency(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertObject(AOwner: IModel; RoseElem: RObject; IsSecondLoop: Boolean);
var
  NewElem: IUMLModelElement;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM); 
    if (AOwner.IsKindOf(UML_ELEM_STATE_MACHINE) or AOwner.IsKindOf(UML_ELEM_STATE)) then
      raise EElemConversion.Create(ERR_OBJECT_NOT_SUPPORT);
    if not ((AOwner.IsKindOf(UML_ELEM_COLLABORATION)) or (AOwner.IsKindOf(UML_ELEM_COLLABORATION_SET))) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    if AOwner.IsKindOf(UML_ELEM_COLLABORATION) then
      NewElem := StarUMLApp.UMLFactory.CreateClassifierRole(AOwner as IUMLCollaboration)
    else NewElem := StarUMLApp.UMLFactory.CreateObject(AOwner as IUMLCollaborationInstanceSet);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLModelElement;
  end;

  // collaborators
  for I := 0 to RoseElem.CollaboratorCount - 1 do begin
    AModel := RoseElem.Collaborators[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertObjectDiagram(AOwner: IModel; RoseElem: RObjectDiagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLDiagram;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  ACol: IUMLCollaboration;
  AColSet: IUMLCollaborationInstanceSet;
  AInter: IUMLInteraction;
  AInterSet: IUMLInteractionInstanceSet;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  TempMdl := RoseElem.Mechanism_ref;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);

  if TempObj.QueryInterface(IUMLCollaboration, ACol) = S_OK then begin
    if ACol.GetInteractionCount <= 0 then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    AInter := ACol.GetInteractionAt(0);
    NewElem := StarUMLApp.UMLFactory.CreateCollaborationRoleDiagram(AInter);
  end else if TempObj.QueryInterface(IUMLCollaborationInstanceSet, AColSet) = S_OK then begin
    if AColSet.GetInteractionInstanceSetCount <= 0 then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    AInterSet := AColSet.GetInteractionInstanceSetAt(0);
    NewElem := StarUMLApp.UMLFactory.CreateCollaborationDiagram(AInterSet);
  end else begin
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  end;
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertOperation(AOwner: IModel; RoseElem: ROperation; IsSecondLoop: Boolean);
var
  NewElem: IUMLOperation;
  I: Integer;
  AModel: RPetalModel;
  ARet: IUMLParameter;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_CLASSIFIER)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewElem := StarUMLApp.UMLFactory.CreateOperation(AOwner as IUMLClassifier);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLOperation;
  end;

  // result
  if (RoseElem.Result <> nil) or (RoseElem.ResultExpression <> '') then begin
    ARet := StarUMLApp.UMLFactory.CreateParameter(NewElem);
    ARet.DirectionKind := pdkReturn;
  end;
  
  // parameters
  for I := 0 to RoseElem.ParameterCount - 1 do begin
    AModel := RoseElem.Parameters[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertParameter(AOwner: IModel; RoseElem: RParameter; IsSecondLoop: Boolean);
var
  NewElem: IUMLElement;
begin
  if IsSecondLoop then Exit;
  if (AOwner = nil) then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not(AOwner.IsKindOf(UML_ELEM_BEHAVIORAL) or AOwner.IsKindOf(UML_ELEM_CLASS)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  if AOwner.IsKindOf(UML_ELEM_CLASS) then
    NewElem := StarUMLApp.UMLFactory.CreateTemplateParameter(AOwner as IUMLClass)
  else NewElem := StarUMLApp.UMLFactory.CreateParameter(AOwner as IUMLBehavioralFeature);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertParameterized_Class(AOwner: IModel; RoseElem: RParameterized_Class; IsSecondLoop: Boolean);
var
  I: Integer;
  NewElem: IUMLClass;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_NAMESPACE)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewElem := StarUMLApp.UMLFactory.CreateClass(AOwner as IUMLNamespace);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLClass;
  end;

  // class_attributes
  for I := 0 to RoseElem.Class_attributeCount - 1 do begin
    AModel := RoseElem.Class_attributes[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // nestedClasses
  for I := 0 to RoseElem.NestedClassCount - 1 do begin
    AModel := RoseElem.NestedClasses[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // operations
  for I := 0 to RoseElem.OperationCount - 1 do begin
    AModel := RoseElem.Operations[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // statemachine
  ConvertModelElement(NewElem, RoseElem.Statemachine, IsSecondLoop);
  // realized_interface
  for I := 0 to RoseElem.Realized_interfaceCount - 1 do begin
    AModel := RoseElem.Realized_interfaces[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // superclasses
  for I := 0 to RoseElem.SuperclassCount - 1 do begin
    AModel := RoseElem.Superclasses[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // used_nodes
  for I := 0 to RoseElem.Used_nodeCount - 1 do begin
    AModel := RoseElem.Used_nodes[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // parameters
  for I := 0 to RoseElem.ParameterCount - 1 do begin
    AModel := RoseElem.Parameters[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertParameterized_Class_Utility(AOwner: IModel; RoseElem: RParameterized_Class_Utility; IsSecondLoop: Boolean);
begin
  ConvertParameterized_Class(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertPartition(AOwner: IModel; RoseElem: RPartition; IsSecondLoop: Boolean);
var
  NewElem: IUMLPartition;
begin
  if IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if AOwner.IsKindOf(UML_ELEM_STA_VERTEX) then
    AOwner := GetOwnerStateMachine(AOwner as IUMLStateVertex) as IUMLStateMachine;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_ACTIVITY_GRAPH)) then begin
    raise EElemConversion.Create(ERR_SWIMLANE_NOT_SUPPORT);
  end;

  NewElem := StarUMLApp.UMLFactory.CreatePartition(AOwner as IUMLActivityGraph);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertProcess_Diagram(AOwner: IModel; RoseElem: RProcess_Diagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLDeploymentDiagram;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateDeploymentDiagram(AOwner);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertProcessor(AOwner: IModel; RoseElem: RProcessor; IsSecondLoop: Boolean);
var
  NewElem: IUMLNode;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_CLASSIFIER)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
      
    NewElem := StarUMLApp.UMLFactory.CreateNode(AOwner as IUMLNamespace);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLNode;
  end;

  // connections
  for I := 0 to RoseElem.ConnectionCount - 1 do begin
    AModel := RoseElem.Connections[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // processes
  //* AddLog
end;

procedure RoseStarUMLAdapter.ConvertRealize_Relationship(AOwner: IModel; RoseElem: RRealize_Relationship; IsSecondLoop: Boolean);
var
  NewOwner: IUMLNamespace;
  NewElem: IUMLRealization;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  End2: IUMLModelElement;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_MODEL_ELEM)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  NewOwner := GetNamespaceElement(AOwner as IUMLModelElement);
  if NewOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempMdl := RoseElem.Supplier;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if TempObj.QueryInterface(IUMLModelElement, End2) <> S_OK then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateRealization(NewOwner, AOwner as IUMLModelElement, End2);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertRole(AOwner: IModel; RoseElem: RRole; IsSecondLoop: Boolean);
var
  I: Integer;
  AModel: RPetalModel;
  TempObj: IUnknown;
  AssocEnd: IUMLAssociationEnd;
begin
  if not IsSecondLoop then Exit;
  TempObj := RoseElem.InterfaceObj;
  if (TempObj = nil) or (TempObj.QueryInterface(IUMLAssociationEnd, AssocEnd) <> S_OK) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  for I := 0 to RoseElem.KeyCount - 1 do begin
    AModel := RoseElem.Keies[I];
    ConvertModelElement(AssocEnd, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertState(AOwner: IModel; RoseElem: RState; IsSecondLoop: Boolean);
var
  ElemKind: RStateKind;
  I: Integer;
  NewElem: IUMLStateVertex;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
     if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if AOwner.IsKindOf(UML_ELEM_STATE_MACHINE) then
      AOwner := (AOwner as IUMLStateMachine).Top as IUMLCompositeState;
    if not AOwner.IsKindOf(UML_ELEM_COMPOSITE_STATE) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    ElemKind := RoseElem.Type_;
    case ElemKind of
      skNormal:
        // if RoseElem.Statemachine <> nil then
        //   NewElem := StarUMLApp.UMLFactory.CreateSubmachineState(AOwner as IUMLCompositeState)
        // else
        NewElem := StarUMLApp.UMLFactory.CreateCompositeState(AOwner as IUMLCompositeState);
      skStartState:
        NewElem := StarUMLApp.UMLFactory.CreatePseudostate(AOwner as IUMLCompositeState);
      skEndState:
        NewElem := StarUMLApp.UMLFactory.CreateFinalState(AOwner as IUMLCompositeState);
      skHistory:
        NewElem := StarUMLApp.UMLFactory.CreatePseudostate(AOwner as IUMLCompositeState);
      skHistoryAll:
        NewElem := StarUMLApp.UMLFactory.CreatePseudostate(AOwner as IUMLCompositeState);
    end;
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLStateVertex;
  end;

  // statemachine
  ConvertModelElement(NewElem, RoseElem.Statemachine, IsSecondLoop);
  // actions
  for I := 0 to RoseElem.ActionCount - 1 do begin
    AModel := RoseElem.Actions[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // transitions
  for I := 0 to RoseElem.TransitionCount - 1 do begin
    AModel := RoseElem.Transitions[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertState_Diagram(AOwner: IModel; RoseElem: RState_Diagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLStatechartDiagram;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if AOwner.IsKindOf(UML_ELEM_STA_VERTEX) then
    AOwner := GetOwnerStateMachine(AOwner as IUMLStateVertex) as IUMLStateMachine;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_STATE_MACHINE)) then begin
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  end;
    
  NewElem := StarUMLApp.UMLFactory.CreateStatechartDiagram(AOwner as IUMLStateMachine);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertState_Machine(AOwner: IModel; RoseElem: RState_Machine; IsSecondLoop: Boolean);
var
  NewElem: IUMLModelElement;
  Kind: PStateMachineType;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_MODEL_ELEM)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    if AOwner.IsKindOf(UML_ELEM_STATE) then begin
      AddLog(Format(ERR_ELEM_CONVERSION, [RoseElem.ObjectName, RoseElem.Name, ERR_STATE_MACHINE_NOT_SUPPORT]));
      NewElem := AOwner as IUMLModelElement;
    end else begin
      Kind := DetermineStatemachineType(RoseElem);
      if Kind <> smtActivityGraph then begin
        NewElem := StarUMLApp.UMLFactory.CreateStateMachine(AOwner as IUMLModelElement);
        AddLog(Format(ERR_STATE_ACTIVITY_NOT_SUPPORT, [RoseElem.Name, UML_ELEM_STATE_MACHINE]));
      end else begin
        NewElem := StarUMLApp.UMLFactory.CreateActivityGraph(AOwner as IUMLModelElement);
        AddLog(Format(ERR_STATE_ACTIVITY_NOT_SUPPORT, [RoseElem.Name, UML_ELEM_ACTIVITY_GRAPH]));
      end;
      RoseElem.InterfaceObj := NewElem;
    end;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLModelElement
  end;

  // objects
  for I := 0 to RoseElem.ObjectCount - 1 do begin
    AModel := RoseElem.Objects[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // partitions
  for I := 0 to RoseElem.PartitionCount - 1 do begin
    AModel := RoseElem.Partitions[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // statediagrams
  for I := 0 to RoseElem.StatediagramCount - 1 do begin
    AModel := RoseElem.Statediagrams[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // states
  for I := 0 to RoseElem.StateCount - 1 do begin
    AModel := RoseElem.States[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertState_Transition(AOwner: IModel; RoseElem: RState_Transition; IsSecondLoop: Boolean);
var
  NewElem: IUMLTransition;
  NewOwner: IUMLStateMachine;
  TempMdl: RPetalModel;
  TempObj: IUnknown;
  End2: IUMLStateVertex;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_STA_VERTEX)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  NewOwner := GetOwnerStateMachine(AOwner as IUMLStateVertex);
  if NewOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempMdl := RoseElem.Supplier;
  if TempMdl = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := TempMdl.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if TempObj.QueryInterface(IUMLStateVertex, End2) <> S_OK then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateTransition(NewOwner, AOwner as IUMLStateVertex, End2);
  RoseElem.InterfaceObj := NewElem;

  // event
  ConvertModelElement(NewElem, RoseElem.Event, IsSecondLoop);
  // action
  ConvertModelElement(NewElem, RoseElem.Action, IsSecondLoop);
  // sendEvent
  ConvertModelElement(NewElem, RoseElem.SendEvent, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertSubSystem(AOwner: IModel; RoseElem: RSubSystem; IsSecondLoop: Boolean);
var
  NewElem: IUMLSubsystem;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_NAMESPACE)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewElem := StarUMLApp.UMLFactory.CreateSubsystem(AOwner as IUMLNamespace);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLSubsystem;
  end;

  // physical_models
  for I := 0 to RoseElem.Physical_modelCount - 1 do begin
    AModel := RoseElem.Physical_models[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // visible_modules
  for I := 0 to RoseElem.Visible_moduleCount - 1 do begin
    AModel := RoseElem.Visible_modules[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // physical_presentations
  for I := 0 to RoseElem.Physical_presentationCount - 1 do begin
    AModel := RoseElem.Physical_presentations[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertSynchronizationState(AOwner: IModel; RoseElem: RSynchronizationState; IsSecondLoop: Boolean);
var
  NewElem: IUMLPseudoState;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
     if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if AOwner.IsKindOf(UML_ELEM_STATE_MACHINE) then
      AOwner := (AOwner as IUMLStateMachine).Top as IUMLCompositeState;
    if not AOwner.IsKindOf(UML_ELEM_COMPOSITE_STATE) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewElem := StarUMLApp.UMLFactory.CreatePseudostate(AOwner as IUMLCompositeState);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLPseudoState;
  end;

  // transitions
  for I := 0 to RoseElem.TransitionCount - 1 do begin
    AModel := RoseElem.Transitions[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertTierDiagram(AOwner: IModel; RoseElem: RTier_Diagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLClassDiagram;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  
  NewElem := StarUMLApp.UMLFactory.CreateClassDiagram(AOwner);
  RoseElem.InterfaceObj := NewElem;
  //* AddLog (Tier dgm. -> Class dgm.)
end;

procedure RoseStarUMLAdapter.ConvertUseCase(AOwner: IModel; RoseElem: RUseCase; IsSecondLoop: Boolean);
var
  NewElem: IUMLUseCase;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_NAMESPACE)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
      
    NewElem := StarUMLApp.UMLFactory.CreateUseCase(AOwner as IUMLNamespace);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLUseCase;
  end;

  // logical_models
  for I := 0 to RoseElem.Logical_modelCount - 1 do begin
    AModel := RoseElem.Logical_models[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // logical_presentation
  for I := 0 to RoseElem.Logical_presentationCount - 1 do begin
    AModel := RoseElem.Logical_presentations[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // statemachine
  ConvertModelElement(NewElem, RoseElem.Statemachine, IsSecondLoop);
  // superclasses
  for I := 0 to RoseElem.SuperclassCount - 1 do begin
    AModel := RoseElem.Superclasses[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // visible_modules
  for I := 0 to RoseElem.Visible_moduleCount - 1 do begin
    AModel := RoseElem.Visible_modules[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertUseCaseDiagram(AOwner: IModel; RoseElem: RUseCaseDiagram; IsSecondLoop: Boolean);
var
  NewElem: IUMLUseCaseDiagram;
begin
  if not MakeDiagramViewOption then Exit;
  if IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateUseCaseDiagram(AOwner);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertUses_Relationship(AOwner: IModel; RoseElem: RUses_Relationship; IsSecondLoop: Boolean);
begin
  ConvertGeneralDependency(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertVisibility_Relationship(AOwner: IModel; RoseElem: RVisibility_Relationship; IsSecondLoop: Boolean);
begin
  ConvertGeneralDependency(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertAction(AOwner: IModel; RoseElem: RAction; IsSecondLoop: Boolean);
var
  NewElem: IUMLUninterpretedAction;
  ElemKind: RActionTime;
begin
  if not IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not(AOwner.IsKindOf(UML_ELEM_STATE) or AOwner.IsKindOf(UML_ELEM_TRANSITION)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  if AOwner.IsKindOf(UML_ELEM_STATE) then begin
    ElemKind := RoseElem.ActionTime;
    if ElemKind = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    case ElemKind.When of
      tkEntry: NewElem := StarUMLApp.UMLFactory.CreateEntryAction(AOwner as IUMLState);
      tkExit: NewElem := StarUMLApp.UMLFactory.CreateExitAction(AOwner as IUMLState);
      tkActivity: NewElem := StarUMLApp.UMLFactory.CreateDoAction(AOwner as IUMLState);
      else
        raise EElemConversion.Create(ERR_EVENT_NOT_SUPPORT);
    end;
  end else begin
    NewElem := StarUMLApp.UMLFactory.CreateEffect(AOwner as IUMLTransition);
  end;
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertModule(AOwner: IModel; RoseElem: RModule; IsSecondLoop: Boolean);
var
  NewElem: IUMLComponent;
  I: Integer;
  AModel: RPetalModel;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_NAMESPACE)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewElem := StarUMLApp.UMLFactory.CreateComponent(AOwner as IUMLNamespace);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLComponent;
  end;

  // visible_modules
  for I := 0 to RoseElem.Visible_moduleCount - 1 do begin
    AModel := RoseElem.Visible_modules[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
  // realized_interfaces
  for I := 0 to RoseElem.Realized_interfaceCount - 1 do begin
    AModel := RoseElem.Realized_interfaces[I];
    ConvertModelElement(NewElem, AModel, IsSecondLoop);
  end;
end;

procedure RoseStarUMLAdapter.ConvertSendEvent(AOwner: IModel; RoseElem: RSendEvent; IsSecondLoop: Boolean);
begin
  if IsSecondLoop then Exit;
  raise EElemConversion.Create(ERR_SEND_EVENT_NOT_SUPPORT);
end;

procedure RoseStarUMLAdapter.ConvertGeneralDependencyView(AOwner: IView; RoseElem: RPetalEdgeView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLDependency;
  NewElem: IUMLDependencyView;
  End1, End2: IView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewMdl := GetModelOfView(RoseElem, IUMLDependency) as IUMLDependency;
  End1 := GetEdgeViewClient(RoseElem, IView);
  End2 := GetEdgeViewSupplier(RoseElem, IView);
  NewElem := StarUMLApp.UMLFactory.CreateDependencyView(AOwner as IDiagramView, NewMdl, End1, End2);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertGeneralLinkView(AOwner: IView; RoseElem: RPetalEdgeView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLModelElement;
  NewElem: IUMLGeneralEdgeView;
  End1, End2: IView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  End1 := GetEdgeViewClient(RoseElem, IView);
  End2 := GetEdgeViewSupplier(RoseElem, IView);
  NewMdl := GetModelOfView(RoseElem, IUMLLink, True) as IUMLLink;
  if NewMdl <> nil then
    NewElem := StarUMLApp.UMLFactory.CreateLinkView(AOwner as IDiagramView, NewMdl as IUMLLink, End1, End2)
  else begin
    NewMdl := GetModelOfView(RoseElem, IUMLAssociationRole, True) as IUMLAssociationRole;
    if NewMdl = nil then raise EElemConversion.Create(ERR_MODEL_NOT_FOUND);
    NewElem := StarUMLApp.UMLFactory.CreateAssociationRoleView(AOwner as IDiagramView, NewMdl as IUMLAssociationRole, End1, End2)
  end;
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertGeneralInterMessView(AOwner: IView; RoseElem: RPetalEdgeView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLModelElement;
  NewElem: IUMLCustomSeqMessageView;
  End1, End2: IView;
begin
  if not IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not(AOwner.IsKindOf(UML_ELEM_SEQ_DIAGRAM_VIEW) or AOwner.IsKindOf(UML_ELEM_SEQ_ROLE_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  End1 := GetEdgeViewClient(RoseElem, IView);
  End2 := GetEdgeViewSupplier(RoseElem, IView);
  if RoseElem.Model = nil then begin
    if RoseElem.Label_Count = 1 then begin
      RoseElem.Model := RoseElem.Label_s[0].Model;
    end;
  end;

  if AOwner.IsKindOf(UML_ELEM_SEQ_DIAGRAM_VIEW) then begin
    NewMdl := GetModelOfView(RoseElem, IUMLStimulus) as IUMLModelElement;
    NewElem := StarUMLApp.UMLFactory.CreateSeqStimulusView(AOwner as IUMLSequenceDiagramView,
               NewMdl as IUMLStimulus, End1, End2);
  end else begin
    NewMdl := GetModelOfView(RoseElem, IUMLMessage) as IUMLModelElement;
    NewElem := StarUMLApp.UMLFactory.CreateSeqMessageView(AOwner as IUMLSequenceRoleDiagramView,
               NewMdl as IUMLMessage, End1, End2);
  end;
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertGeneralNodeView(AOwner: IView; RoseElem: RPetalNodeView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLNode;
  NewElem: IUMLNodeView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLNode) as IUMLNode;
    NewElem := StarUMLApp.UMLFactory.CreateNodeView(AOwner as IDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLNodeView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertGeneralTransitionView(AOwner: IView; RoseElem: RPetalEdgeView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLTransition;
  NewElem: IUMLTransitionView;
  End1, End2: IView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewMdl := GetModelOfView(RoseElem, IUMLTransition) as IUMLTransition;
  End1 := GetEdgeViewClient(RoseElem, IView);
  End2 := GetEdgeViewSupplier(RoseElem, IView);
  NewElem := StarUMLApp.UMLFactory.CreateTransitionView(AOwner as IDiagramView, NewMdl, End1, End2);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertActivityStateView(AOwner: IView; RoseElem: RActivityStateView; IsSecondLoop: Boolean);
var
  ModelElem: IUMLModelElement;
  NewElem: IUMLGeneralNodeView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_ACTIVITY_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    ModelElem := GetModelOfView(RoseElem, IUMLActionState, True) as IUMLModelElement;
    if ModelElem <> nil then
      NewElem := StarUMLApp.UMLFactory.CreateActionStateView(AOwner as IUMLActivityDiagramView, ModelElem as IUMLActionState)
    else begin
      // ModelElem := GetModelOfView(RoseElem, IUMLSubactivityState, True) as IUMLModelElement;
      // if ModelElem <> nil then
      //   NewElem := StarUMLApp.UMLFactory.CreateSubactivityStateView(AOwner as IUMLActivityDiagramView, ModelElem as IUMLSubactivityState)
      // else
      raise EElemConversion.Create(ERR_MODEL_NOT_FOUND);
    end;
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLActionStateView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertAssocAttachView(AOwner: IView; RoseElem: RAssocAttachView; IsSecondLoop: Boolean);
var
  AssocView: IUMLAssociationView;
  ClsView: IUMLClassifierView;
  NewMdl: IUMLAssociationClass;
  NewElem: IUMLAssociationClassView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);             

  AssocView := GetTargetNodeView(RoseElem, IUMLAssociationView) as IUMLAssociationView;
  ClsView := GetTargetNodeView(RoseElem, IUMLClassifierView) as IUMLClassifierView;
  NewMdl := (AssocView.Model as IUMLAssociation).AssociationClass;
  if NewMdl = nil then raise EElemConversion.Create(ERR_MODEL_NOT_FOUND);

  NewElem := StarUMLApp.UMLFactory.CreateAssociationClassView(AOwner as IDiagramView, NewMdl, AssocView, ClsView);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertAssociationViewNew(AOwner: IView; RoseElem: RAssociationViewNew; IsSecondLoop: Boolean);
var
  Role1, Role2: RRoleView;
  End1Mdl, End2Mdl: IUMLClassifier;
  End1, End2, TempEnd: IView;
  NewMdl: IUMLAssociation;
  NewElem: IUMLAssociationView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewMdl := GetModelOfView(RoseElem, IUMLAssociation) as IUMLAssociation;
  End1Mdl := NewMdl.GetConnectionAt(0).Participant;
  End2Mdl := NewMdl.GetConnectionAt(1).Participant;

  if RoseElem.Roleview_listCount <> 2 then
    raise EElemConversion.Create(ERR_INVALID_PARAM);
  Role1 := RoseElem.Roleview_lists[1];
  Role2 := RoseElem.Roleview_lists[0];
  End1 := GetEdgeViewSupplier(Role1, IView);
  End2 := GetEdgeViewSupplier(Role2, IView);
  if Role1.Supplier <> Role2.Supplier then begin
    if End1.Model.Pathname <> End1Mdl.Pathname then begin
      TempEnd := End1;
      End1 := End2;
      End2 := TempEnd;
    end;
  end;

  NewElem := StarUMLApp.UMLFactory.CreateAssociationView(AOwner as IDiagramView, NewMdl, End1, End2);
  RoseElem.InterfaceObj := NewElem;
  Role1.InterfaceObj := NewElem.HeadRoleNameLabel;
  Role2.InterfaceObj := NewElem.TailRoleNameLabel;
end;

procedure RoseStarUMLAdapter.ConvertAttachView(AOwner: IView; RoseElem: RAttachView; IsSecondLoop: Boolean);
var
  ANoteView: IUMLNoteView;
  AView: IView;
  NewElem: IUMLNoteLinkView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);             

  ANoteView := GetEdgeViewClient(RoseElem, IUMLNoteView, True) as IUMLNoteView;
  if ANoteView <> nil then
    AView := GetEdgeViewSupplier(RoseElem, IView, True)
  else begin
    ANoteView := GetEdgeViewSupplier(RoseElem, IUMLNoteView, True) as IUMLNoteView;
    AView := GetEdgeViewClient(RoseElem, IView, True);
  end;
  if (ANoteView = nil) or (AView = nil) then raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewElem := StarUMLApp.UMLFactory.CreateNoteLinkView(AOwner as IDiagramView, ANoteView, AView);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertCategoryView(AOwner: IView; RoseElem: RCategoryView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLPackage;
  NewElem: IUMLPackageView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLPackage) as IUMLPackage;
    NewElem := StarUMLApp.UMLFactory.CreatePackageView(AOwner as IDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLPackageView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertClassInstanceView(AOwner: IView; RoseElem: RClassInstanceView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLModelElement;
  NewElem: IUMLCustomColObjectView;
begin
  if not IsSecondLoop then begin
    if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not (AOwner.IsKindOf(UML_ELEM_COL_DIAGRAM_VIEW) or AOwner.IsKindOf(UML_ELEM_COL_ROLE_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    if AOwner.IsKindOf(UML_ELEM_COL_DIAGRAM_VIEW) then begin
      NewMdl := GetModelOfView(RoseElem, IUMLObject) as IUMLObject;
      NewElem := StarUMLApp.UMLFactory.CreateObjectView(AOwner as IDiagramView, NewMdl as IUMLObject);
    end else begin
      NewMdl := GetModelOfView(RoseElem, IUMLClassifierRole) as IUMLClassifierRole;
      NewElem := StarUMLApp.UMLFactory.CreateClassifierRoleView(AOwner as IDiagramView, NewMdl as IUMLClassifierRole);
    end;
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLCustomColObjectView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertClassView(AOwner: IView; RoseElem: RClassView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLClassifier;
  NewElem: IUMLClassifierView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLClassifier) as IUMLClassifier;
    if NewMdl.IsKindOf(UML_ELEM_CLASS) then
      NewElem := StarUMLApp.UMLFactory.CreateClassView(AOwner as IDiagramView, NewMdl as IUMLClass)
    else if NewMdl.IsKindOf(UML_ELEM_INTERFACE) then
      NewElem := StarUMLApp.UMLFactory.CreateInterfaceView(AOwner as IDiagramView, NewMdl as IUMLInterface)
    else if NewMdl.IsKindOf(UML_ELEM_ACTOR) then
      NewElem := StarUMLApp.UMLFactory.CreateActorView(AOwner as IDiagramView, NewMdl as IUMLActor)
    else raise EElemConversion.Create(ERR_MODEL_NOT_FOUND);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLClassifierView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertConnectionView(AOwner: IView; RoseElem: RConnectionView; IsSecondLoop: Boolean);
var
  End1, End2: IView;
  NewMdl: IUMLAssociation;
  NewElem: IUMLAssociationView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewMdl := GetModelOfView(RoseElem, IUMLAssociation) as IUMLAssociation;
  End1 := GetEdgeViewClient(RoseElem, IView);
  End2 := GetEdgeViewSupplier(RoseElem, IView);
  NewElem := StarUMLApp.UMLFactory.CreateAssociationView(AOwner as IDiagramView, NewMdl, End1, End2);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertDataFlowView(AOwner: IView; RoseElem: RDataFlowView; IsSecondLoop: Boolean);
begin
  if not IsSecondLoop then Exit;
  raise EElemConversion.Create(ERR_DATA_TOKEN_VIEW_NOT_SUPPORT);
end;

procedure RoseStarUMLAdapter.ConvertDecisionView(AOwner: IView; RoseElem: RDecisionView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLPseudoState;
  NewElem: IUMLPseudostateView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLPseudoState) as IUMLPseudoState;
    NewElem := StarUMLApp.UMLFactory.CreatePseudostateView(AOwner as IDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLPseudostateView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertDependencyView(AOwner: IView; RoseElem: RDependencyView; IsSecondLoop: Boolean);
begin
  ConvertGeneralDependencyView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertDestruction_Marker(AOwner: IView; RoseElem: RDestruction_Marker; IsSecondLoop: Boolean);
begin
  if not IsSecondLoop then Exit;
  //* AddLog
end;

procedure RoseStarUMLAdapter.ConvertDeviceView(AOwner: IView; RoseElem: RDeviceView; IsSecondLoop: Boolean);
begin
  ConvertGeneralNodeView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertFocus_Of_Control(AOwner: IView; RoseElem: RFocus_Of_Control; IsSecondLoop: Boolean);
begin
  if not IsSecondLoop then Exit;
  //* AddLog
end;

procedure RoseStarUMLAdapter.ConvertImportView(AOwner: IView; RoseElem: RImportView; IsSecondLoop: Boolean);
begin
  ConvertGeneralDependencyView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertInheritView(AOwner: IView; RoseElem: RInheritView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLGeneralization;
  NewElem: IUMLGeneralizationView;
  End1, End2: IView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewMdl := GetModelOfView(RoseElem, IUMLGeneralization) as IUMLGeneralization;
  End1 := GetEdgeViewClient(RoseElem, IView);
  End2 := GetEdgeViewSupplier(RoseElem, IView);
  NewElem := StarUMLApp.UMLFactory.CreateGeneralizationView(AOwner as IDiagramView, NewMdl, End2, End1);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertInterfaceView(AOwner: IView; RoseElem: RInterfaceView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLInterface;
  NewElem: IUMLInterfaceView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLNode) as IUMLInterface;
    NewElem := StarUMLApp.UMLFactory.CreateInterfaceView(AOwner as IDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLInterfaceView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertInterMessView(AOwner: IView; RoseElem: RInterMessView; IsSecondLoop: Boolean);
begin
  ConvertGeneralInterMessView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertInterObjView(AOwner: IView; RoseElem: RInterObjView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLModelElement;
  NewElem: IUMLCustomSeqObjectView;
begin
  if not IsSecondLoop then begin
    if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not (AOwner.IsKindOf(UML_ELEM_SEQ_DIAGRAM_VIEW) or AOwner.IsKindOf(UML_ELEM_SEQ_ROLE_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLObject, True) as IUMLObject;
    if NewMdl <> nil then
      NewElem := StarUMLApp.UMLFactory.CreateSeqObjectView(AOwner as IUMLSequenceDiagramView, NewMdl as IUMLObject)
    else begin
      NewMdl := GetModelOfView(RoseElem, IUMLClassifierRole, True) as IUMLClassifierRole;
      if NewMdl = nil then raise EElemConversion.Create(ERR_MODEL_NOT_FOUND);
      NewElem := StarUMLApp.UMLFactory.CreateSeqClassifierRoleView(AOwner as IUMLSequenceRoleDiagramView, NewMdl as IUMLClassifierRole);
    end;
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLCustomSeqObjectView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertLabelView(AOwner: IView; RoseElem: RLabel; IsSecondLoop: Boolean);
var
  NewElem: IUMLTextView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewElem := StarUMLApp.UMLFactory.CreateTextView(AOwner as IDiagramView);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLTextView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertLinkSelfView(AOwner: IView; RoseElem: RLinkSelfView; IsSecondLoop: Boolean);
begin
  ConvertGeneralLinkView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertLinkView(AOwner: IView; RoseElem: RLinkView; IsSecondLoop: Boolean);
begin
  ConvertGeneralLinkView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertMessView(AOwner: IView; RoseElem: RMessView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLModelElement;
  NewElem: IUMLCustomColMessageView;
  TempObj: IUnknown;
  ALinkView: IView;
begin
  if not IsSecondLoop then Exit;
  if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if not (AOwner.IsKindOf(UML_ELEM_COL_DIAGRAM_VIEW) or AOwner.IsKindOf(UML_ELEM_COL_ROLE_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  if RoseElem.Object_arc = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  TempObj := RoseElem.Object_arc.InterfaceObj;
  if TempObj = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
  if RoseElem.Model = nil then begin
    if RoseElem.Label_Count = 1 then begin
      RoseElem.Model := RoseElem.Label_s[0].Model;
    end;
  end;

  if AOwner.IsKindOf(UML_ELEM_COL_DIAGRAM_VIEW) then begin
    NewMdl := GetModelOfView(RoseElem, IUMLStimulus) as IUMLModelElement;
    if TempObj.QueryInterface(IUMLLinkView, ALinkView) <> S_OK then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    NewElem := StarUMLApp.UMLFactory.CreateStimulusView(AOwner as IUMLCollaborationDiagramView,
               NewMdl as IUMLStimulus, ALinkView);
  end else begin
    NewMdl := GetModelOfView(RoseElem, IUMLMessage) as IUMLModelElement;
    if TempObj.QueryInterface(IUMLAssociationRoleView, ALinkView) <> S_OK then
      raise EElemConversion.Create(ERR_INVALID_PARAM);
    NewElem := StarUMLApp.UMLFactory.CreateMessageView(AOwner as IUMLCollaborationRoleDiagramView,
               NewMdl as IUMLMessage, ALinkView);
  end;
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertModView(AOwner: IView; RoseElem: RModView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLComponent;
  NewElem: IUMLComponentView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLComponent) as IUMLComponent;
    NewElem := StarUMLApp.UMLFactory.CreateComponentView(AOwner as IDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLComponentView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertModVisView(AOwner: IView; RoseElem: RModVisView; IsSecondLoop: Boolean);
begin
  ConvertGeneralDependencyView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertNoteView(AOwner: IView; RoseElem: RNoteView; IsSecondLoop: Boolean);
var
  NewElem: IUMLNoteView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewElem := StarUMLApp.UMLFactory.CreateNoteView(AOwner as IDiagramView);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLNoteView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertObjectView(AOwner: IView; RoseElem: RObjectView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLModelElement;
  NewElem: IUMLCustomColObjectView;
begin
  if not IsSecondLoop then begin
    if AOwner = nil then raise EElemConversion.Create(ERR_INVALID_PARAM);
    if not (AOwner.IsKindOf(UML_ELEM_COL_DIAGRAM_VIEW) or AOwner.IsKindOf(UML_ELEM_COL_ROLE_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLObject, True) as IUMLObject;
    if NewMdl <> nil then
      NewElem := StarUMLApp.UMLFactory.CreateObjectView(AOwner as IDiagramView, NewMdl as IUMLObject)
    else begin
      NewMdl := GetModelOfView(RoseElem, IUMLClassifierRole, True) as IUMLClassifierRole;
      if NewMdl = nil then raise EElemConversion.Create(ERR_MODEL_NOT_FOUND);
      NewElem := StarUMLApp.UMLFactory.CreateClassifierRoleView(AOwner as IDiagramView, NewMdl as IUMLClassifierRole);
    end;
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLCustomColObjectView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertProcessorView(AOwner: IView; RoseElem: RProcessorView; IsSecondLoop: Boolean);
begin
  ConvertGeneralNodeView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertRealizeView(AOwner: IView; RoseElem: RRealizeView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLRealization;
  NewElem: IUMLRealizationView;
  End1, End2: IView;
begin
  if not IsSecondLoop then Exit;
  if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
    raise EElemConversion.Create(ERR_INVALID_PARAM);

  NewMdl := GetModelOfView(RoseElem, IUMLRealization) as IUMLRealization;
  End1 := GetEdgeViewClient(RoseElem, IView);
  End2 := GetEdgeViewSupplier(RoseElem, IView);
  NewElem := StarUMLApp.UMLFactory.CreateRealizationView(AOwner as IDiagramView, NewMdl, End1, End2);
  RoseElem.InterfaceObj := NewElem;
end;

procedure RoseStarUMLAdapter.ConvertSelfMessView(AOwner: IView; RoseElem: RSelfMessView; IsSecondLoop: Boolean);
begin
  ConvertGeneralInterMessView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertSelfTransView(AOwner: IView; RoseElem: RSelfTransView; IsSecondLoop: Boolean);
begin
  ConvertGeneralTransitionView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertStateView(AOwner: IView; RoseElem: RStateView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLStateVertex;
  NewElem: INodeView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLStateVertex) as IUMLStateVertex;
    if NewMdl.IsKindOf(UML_ELEM_PSEUDO_STATE) then
      NewElem := StarUMLApp.UMLFactory.CreatePseudostateView(AOwner as IDiagramView, NewMdl as IUMLPseudostate)
    else if NewMdl.IsKindOf(UML_ELEM_FINAL_STATE) then
      NewElem := StarUMLApp.UMLFactory.CreateFinalStateView(AOwner as IDiagramView, NewMdl as IUMLFinalState)
    else begin
      if not(AOwner.IsKindOf(UML_ELEM_STATE_DIAGRAM_VIEW)) then
        raise EElemConversion.Create(ERR_INVALID_PARAM);
      // if NewMdl.IsKindOf(UML_ELEM_SUBMACHINE_STATE) then
      //   NewElem := StarUMLApp.UMLFactory.CreateSubmachineStateView(AOwner as IUMLStatechartDiagramView,
      //              NewMdl as IUMLSubmachineState)
      // else
      NewElem := StarUMLApp.UMLFactory.CreateStateView(AOwner as IUMLStatechartDiagramView,
                 NewMdl as IUMLCompositeState);
    end;
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as INodeView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertSubSysView(AOwner: IView; RoseElem: RSubSysView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLSubsystem;
  NewElem: IUMLSubsystemView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLSubsystem) as IUMLSubsystem;
    NewElem := StarUMLApp.UMLFactory.CreateSubsystemView(AOwner as IDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLSubsystemView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertSwimlane(AOwner: IView; RoseElem: RSwimlane; IsSecondLoop: Boolean);
var
  NewMdl: IUMLPartition;
  NewElem: IUMLSwimlaneView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_ACTIVITY_DIAGRAM_VIEW)) then
      Exit;

    NewMdl := GetModelOfView(RoseElem, IUMLPartition, True) as IUMLPartition;
    if NewMdl = nil then Exit;
    NewElem := StarUMLApp.UMLFactory.CreateSwimlaneView(AOwner as IUMLActivityDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLSwimlaneView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertSynchronizationView(AOwner: IView; RoseElem: RSynchronizationView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLPseudostate;
  NewElem: IUMLPseudostateView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLPseudostate) as IUMLPseudostate;
    NewElem := StarUMLApp.UMLFactory.CreatePseudostateView(AOwner as IDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLPseudostateView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertTierView(AOwner: IView; RoseElem: RTierView; IsSecondLoop: Boolean);
begin
  if IsSecondLoop then Exit;
  //* AddLog
end;

procedure RoseStarUMLAdapter.ConvertTransView(AOwner: IView; RoseElem: RTransView; IsSecondLoop: Boolean);
begin
  ConvertGeneralTransitionView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertUseCaseView(AOwner: IView; RoseElem: RUseCaseView; IsSecondLoop: Boolean);
var
  NewMdl: IUMLUseCase;
  NewElem: IUMLUseCaseView;
begin
  if not IsSecondLoop then begin
    if (AOwner = nil) or not(AOwner.IsKindOf(UML_ELEM_DIAGRAM_VIEW)) then
      raise EElemConversion.Create(ERR_INVALID_PARAM);

    NewMdl := GetModelOfView(RoseElem, IUMLUseCase) as IUMLUseCase;
    NewElem := StarUMLApp.UMLFactory.CreateUseCaseView(AOwner as IDiagramView, NewMdl);
    RoseElem.InterfaceObj := NewElem;
  end else begin
    if RoseElem.InterfaceObj = nil then Exit;
    NewElem := RoseElem.InterfaceObj as IUMLUseCaseView;
  end;
end;

procedure RoseStarUMLAdapter.ConvertUsesView(AOwner: IView; RoseElem: RUsesView; IsSecondLoop: Boolean);
begin
  ConvertGeneralDependencyView(AOwner, RoseElem, IsSecondLoop);
end;

procedure RoseStarUMLAdapter.ConvertModelCommonProperties(StarUMLElem: IModel; RoseElem: RPetalModel);
var
  I: Integer;
  ADoc: RExternal_doc;
  NewName: string;
begin
  // (name)
  if not IsPredefinedModel(StarUMLElem) then begin
    if RoseElem.Name <> '' then begin
      NewName := RoseElem.Name;
      if Pos(UNNAMED, NewName) > 0 then NewName := ''
      else begin
        if not CheckUMLElemNameValidation(NewName) then
          NewName := TXT_INVALID_NAME_CHANGE_TO;
        if StarUMLElem.IsKindOf(UML_ELEM_CLASSIFIER) then
          NewName := ConflictNameToNewName(StarUMLElem as IUMLModelElement, NewName);
      end;
      StarUMLElem.Name := NewName;
    end else StarUMLElem.Name := '';
    // exportControl
    if StarUMLElem.IsKindOf(UML_ELEM_MODEL_ELEM) then begin
      case RoseElem.ExportControl of
        ekPublic: (StarUMLElem as IUMLModelElement).Visibility := vkPublic;
        ekProtected: (StarUMLElem as IUMLModelElement).Visibility := vkProtected;
        ekPrivate: (StarUMLElem as IUMLModelElement).Visibility := vkPrivate;
        ekImplementation: (StarUMLElem as IUMLModelElement).Visibility := vkPackage;
      end;
    end;
  end;
  // documentation
  if RoseElem.Documentation <> '' then StarUMLElem.Documentation := RoseElem.Documentation;
  // stereotype
  if RoseElem.Stereotype <> '' then begin
    if StarUMLElem.IsKindOf(ELEM_EXTENSIBLE_MODEL) then
      (StarUMLElem as IExtensibleModel).SetStereotype(RoseElem.Stereotype);
  end;
  // external_docs
  for I := 0 to RoseElem.External_docCount - 1  do begin
    ADoc := RoseElem.External_docs[I];
    if ADoc.External_doc_path <> '' then
      StarUMLElem.AddAttachment(ADoc.External_doc_path);
    if ADoc.External_doc_url <> '' then
      StarUMLElem.AddAttachment(ADoc.External_doc_url);
  end;
end;

procedure RoseStarUMLAdapter.ConvertDiagramCommonProperties(StarUMLElem: IModel; RoseElem: RPetalDiagram);
begin
  if not MakeDiagramViewOption then Exit;
  if not StarUMLElem.IsKindOf(UML_ELEM_DIAGRAM) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);
  // title
  if RoseElem.Title <> '' then StarUMLElem.Name := RoseElem.Title;
end;

procedure RoseStarUMLAdapter.ConvertRelationshipCommonProperties(StarUMLElem: IModel; RoseElem: RPetalRelationship);
var
  NewName: string;
begin
  // label
  if RoseElem.Label_ <> '' then begin
    NewName := RoseElem.Label_;
    if Pos(UNNAMED, NewName) > 0 then NewName := ''
    else begin
      if not CheckUMLElemNameValidation(NewName) then
        NewName := TXT_INVALID_NAME_CHANGE_TO;
    end;
    StarUMLElem.Name := NewName;
  end;
end;

procedure RoseStarUMLAdapter.ConvertActivityStateProperties(StarUMLElem: IModel; RoseElem: RActivityState);
begin
  //* not yet...
  // UMLSubmachineState이면 StateMachine 속성을 설정...
end;

procedure RoseStarUMLAdapter.ConvertAssociationProperties(StarUMLElem: IModel; RoseElem: RAssociation);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_ASSOC) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);
  // constraints
  if RoseElem.Constraints <> '' then
    (StarUMLElem as IUMLAssociation).AddConstraint('', RoseElem.Constraints);
  // derived: not support
end;

procedure RoseStarUMLAdapter.ConvertClassProperties(StarUMLElem: IModel; RoseElem: RClass);
var
  I: Integer;
  TempMdl: RModule;
  TempObj: IUnknown;
  AComponent: IUMLComponent;
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_CLASSIFIER) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // stereotype
  if (LowerCase((StarUMLElem as IExtensibleModel).StereotypeName) = LowerCase(STEREOTYPE_ACTOR)) or
     (LowerCase((StarUMLElem as IExtensibleModel).StereotypeName) = LowerCase(STEREOTYPE_INTERFACE))
  then (StarUMLElem as IExtensibleModel).SetStereotype('');
  if (StarUMLElem as IExtensibleModel).StereotypeName = '' then begin
    if RoseElem is RClass_Utility then
      (StarUMLElem as IExtensibleModel).SetStereotype('utility')
    else if RoseElem is RInstantiated_Class then
      (StarUMLElem as IExtensibleModel).SetStereotype('instantiatedClass')
    else if RoseElem is RInstantiated_Class_Utility then
      (StarUMLElem as IExtensibleModel).SetStereotype('instantiatedClassUtility')
    else if RoseElem is RMetaclass then
      (StarUMLElem as IExtensibleModel).SetStereotype('metaclass')
    else if RoseElem is RParameterized_Class_Utility then
      (StarUMLElem as IExtensibleModel).SetStereotype('utility');
  end;
  // abstract
  if RoseElem.Abstract then
    (StarUMLElem as IUMLClassifier).IsAbstract := True;
  // cardinality: not support
  // concurrency: not support
  // language: not support
  // persistence: not support
  // space: not support
  // module
  for I := 0 to RoseElem.ModuleCount - 1 do begin
    TempMdl := RoseElem.Modules[I];
    TempObj := TempMdl.InterfaceObj;
    if (TempObj <> nil) and (TempObj.QueryInterface(IUMLComponent, AComponent) = S_OK) then
      AComponent.AddResident(StarUMLElem as IUMLModelElement);
  end;
end;

procedure RoseStarUMLAdapter.ConvertClassAttributeProperties(StarUMLElem: IModel; RoseElem: RClassAttribute);
var
  TempObj: IUnknown;
  AClassifier: IUMLClassifier;
  Str: string;
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_ATTRIBUTE) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // containment: not support
  // derived: not support
  // initv
  if RoseElem.Initv <> '' then begin
    Str := RoseElem.Initv;
    Str := StringReplace(Str, #13, '', [rfReplaceAll, rfIgnoreCase]);
    Str := StringReplace(Str, #10, ' ', [rfReplaceAll, rfIgnoreCase]);
    (StarUMLElem as IUMLAttribute).InitialValue := Str;
  end;
  // static
  if RoseElem.Static then
    (StarUMLElem as IUMLAttribute).OwnerScope := skClassifier; 
  // type
  if RoseElem.Type_ <> nil then begin
    TempObj := RoseElem.Type_.InterfaceObj;
    if (TempObj <> nil) and (TempObj.QueryInterface(IUMLClassifier, AClassifier) = S_OK) then
      (StarUMLElem as IUMLAttribute).Type_ := AClassifier
    else ;//* AddLog
  end else begin
    if RoseElem.TypeExpression <> '' then
      (StarUMLElem as IUMLAttribute).TypeExpression := RoseElem.TypeExpression;
  end;
end;

procedure RoseStarUMLAdapter.ConvertClassCategoryProperties(StarUMLElem: IModel; RoseElem: RClass_Category);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_PACKAGE) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // global: not support
  // subsystem: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertConnectionRelationshipProperties(StarUMLElem: IModel; RoseElem: RConnection_Relationship);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_ASSOC) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // supplier_is_device: nothing to do
  // characteristics
  if RoseElem.Characteristics <> '' then
    (StarUMLElem as IUMLAssociation).AddConstraint(CONSTR_CHARACTERISTICS, RoseElem.Characteristics);
end;

procedure RoseStarUMLAdapter.ConvertDecisionProperties(StarUMLElem: IModel; RoseElem: RDecision);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_PSEUDO_STATE) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  (StarUMLElem as IUMLPseudostate).PseudostateKind := pkDecision;
end;

procedure RoseStarUMLAdapter.ConvertDeviceProperties(StarUMLElem: IModel; RoseElem: RDevice);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_NODE) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // stereotype
  if (StarUMLElem as IExtensibleModel).StereotypeName = '' then
    (StarUMLElem as IExtensibleModel).SetStereotype('device');
  // characteristics
  if RoseElem.Characteristics <> '' then
    (StarUMLElem as IExtensibleModel).AddConstraint(CONSTR_CHARACTERISTICS, RoseElem.Characteristics);
end;

procedure RoseStarUMLAdapter.ConvertEventProperties(StarUMLElem: IModel; RoseElem: REvent);
begin
  // parameters: not support
end;

procedure RoseStarUMLAdapter.ConvertInheritanceRelationshipProperties(StarUMLElem: IModel; RoseElem: RInheritance_Relationship);
begin
  // friend: not support
  // virtual: not support
end;

procedure RoseStarUMLAdapter.ConvertLinkProperties(StarUMLElem: IModel; RoseElem: RLink);
var
  TempObj: IUnknown;
  AAssoc: IUMLAssociation;
begin
  if not(StarUMLElem.IsKindOf(UML_ELEM_LINK) or StarUMLElem.IsKindOf(UML_ELEM_ASSOC_ROLE))then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // client_containment: not support
  // client_visibility: not support
  // supplier_containment: not support
  // supplier_visibility: not support
  // association
  if StarUMLElem.IsKindOf(UML_ELEM_LINK) and (RoseElem.Association <> nil) then begin
    TempObj := RoseElem.Association.InterfaceObj;
    if (TempObj <> nil) and (TempObj.QueryInterface(IUMLAssociation, AAssoc) = S_OK) then
      (StarUMLElem as IUMLLink).Association := AAssoc;
  end;
end;

procedure RoseStarUMLAdapter.ConvertMessageProperties(StarUMLElem: IModel; RoseElem: RMessage);
var
  TempObj: IUnknown;
  AAction: IUMLAction;
  AOp: IUMLOperation;
begin
  if not(StarUMLElem.IsKindOf(UML_ELEM_MESSAGE) or StarUMLElem.IsKindOf(UML_ELEM_STIMULUS))then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // creation: nothing to do
  // dir: nothing to do
  // frequency: not support
  // ordinal: nothing to do
  // sequence: nothing to do
  // synchronization: nothing to do
  // operation
  if RoseElem.Operation <> nil then begin
    if StarUMLElem.IsKindOf(UML_ELEM_MESSAGE) then
      AAction := (StarUMLElem as IUMLMessage).Action
    else AAction := (StarUMLElem as IUMLStimulus).Action;
    if AAction.IsKindOf(UML_ELEM_CALL_ACTION) then begin
      TempObj := RoseElem.Operation.InterfaceObj;
      if (TempObj <> nil) and (TempObj.QueryInterface(IUMLOperation, AOp) = S_OK) then
        (AAction as IUMLCallAction).Operation := AOp;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertModuleVisibilityRelationshipProperties(StarUMLElem: IModel; RoseElem: RModule_Visibility_Relationship);
begin
  // supplier_is_spec: nothing to do
  // supplier_is_subsystem: nothing do to
end;

procedure RoseStarUMLAdapter.ConvertObjectProperties(StarUMLElem: IModel; RoseElem: RObject);
var
  TempObj: IUnknown;
  AClass: IUMLClassifier;
begin
  if not(StarUMLElem.IsKindOf(UML_ELEM_OBJECT) or StarUMLElem.IsKindOf(UML_ELEM_CLASSIFIER_ROLE))then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // creationObj: not support
  // multi
  if RoseElem.Multi then begin
    if StarUMLElem.IsKindOf(UML_ELEM_OBJECT) then
      (StarUMLElem as IUMLObject).IsMultiInstance := True;
  end;
  // persistence: not support
  // class
  if RoseElem.Class_ <> nil then begin
    TempObj := RoseElem.Class_.InterfaceObj;
    if (TempObj <> nil) and (TempObj.QueryInterface(IUMLClassifier, AClass) = S_OK) then begin
      if StarUMLElem.IsKindOf(UML_ELEM_OBJECT) then
        (StarUMLElem as IUMLObject).Classifier := AClass
      else (StarUMLElem as IUMLClassifierRole).Base := AClass;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertOperationProperties(StarUMLElem: IModel; RoseElem: ROperation);
var
  I: Integer;
  AParam: IUMLParameter;
  TempObj: IUnknown;
  ATypeElem: IUMLClassifier;
begin
  if not(StarUMLElem.IsKindOf(UML_ELEM_OPERATION)) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // abstract
  if RoseElem.Abstract then (StarUMLElem as IUMLOperation).IsAbstract := True;
  // concurrency
  case RoseElem.Concurrency of
    ckSequential: (StarUMLElem as IUMLOperation).Concurrency := cckSequential;
    ckGuarded: (StarUMLElem as IUMLOperation).Concurrency := cckGuarded;
    ckSynchronous: (StarUMLElem as IUMLOperation).Concurrency := cckConcurrent;
  end;
  // exceptions: not support
  // qualification: not support
  // protocol: not support
  // space: not support
  // time_complexity: not support
  // uid: not support
  // result
  for I := 0 to (StarUMLElem as IUMLOperation).GetParameterCount - 1 do begin
    AParam := (StarUMLElem as IUMLOperation).GetParameterAt(I);
    if AParam.DirectionKind = pdkReturn then begin
      AParam.Name := 'Result';
      if RoseElem.Result <> nil then begin
        TempObj := RoseElem.Result.InterfaceObj;
        if (TempObj <> nil) and ((TempObj.QueryInterface(IUMLClassifier, ATypeElem) = S_OK)) then
          AParam.Type_ := ATypeElem
        else ;//* AddLog
      end else begin
        if RoseElem.ResultExpression <> '' then
          AParam.TypeExpression := RoseElem.ResultExpression;
      end;
      Break;
    end;
  end;
  // pre_condition: not support
  // post_condition: not support
  // semantics: not support
end;

procedure RoseStarUMLAdapter.ConvertParameterProperties(StarUMLElem: IModel; RoseElem: RParameter);
var
  TempObj: IUnknown;
  AClassifier: IUMLClassifier;
begin
  if not (StarUMLElem.IsKindOf(UML_ELEM_PARAMETER) or (StarUMLElem.IsKindOf(UML_ELEM_TEMPLATE)))then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // initv
  if RoseElem.Initv <> '' then begin
    if StarUMLElem.IsKindOf(UML_ELEM_PARAMETER) then
      (StarUMLElem as IUMLParameter).DefaultValue := RoseElem.Initv
    else
      (StarUMLElem as IUMLTemplateParameter).DefaultValue := RoseElem.Initv;
  end;
  // type
  if RoseElem.Type_ <> nil then begin
    TempObj := RoseElem.Type_.InterfaceObj;
    if (TempObj <> nil) and (TempObj.QueryInterface(IUMLClassifier, AClassifier) = S_OK) then begin
      if StarUMLElem.IsKindOf(UML_ELEM_PARAMETER) then
        (StarUMLElem as IUMLParameter).Type_ := AClassifier
      else
        (StarUMLElem as IUMLTemplateParameter).ParameterType := AClassifier.Name;
    end else ;//* AddLog
  end else begin
    if RoseElem.TypeExpression <> '' then begin
      if StarUMLElem.IsKindOf(UML_ELEM_PARAMETER) then
        (StarUMLElem as IUMLParameter).TypeExpression := RoseElem.TypeExpression
      else
        (StarUMLElem as IUMLTemplateParameter).ParameterType := RoseElem.TypeExpression;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertPartitionProperties(StarUMLElem: IModel; RoseElem: RPartition);
begin
  // creationObj: not support
  // multi: not support
  // persistence: not support
  // class: not support
end;

procedure RoseStarUMLAdapter.ConvertProcessProperties(StarUMLElem: IModel; RoseElem: RProcess);
begin
  // priority: not support
end;

procedure RoseStarUMLAdapter.ConvertProcessorProperties(StarUMLElem: IModel; RoseElem: RProcessor);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_NODE) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // stereotype  
  if (StarUMLElem as IExtensibleModel).StereotypeName = '' then
    (StarUMLElem as IExtensibleModel).SetStereotype('Processor');
  // characteristics
  if RoseElem.Characteristics <> '' then
    (StarUMLElem as IExtensibleModel).AddConstraint(CONSTR_CHARACTERISTICS, RoseElem.Characteristics);
  // scheduling: not support
end;

procedure RoseStarUMLAdapter.ConvertRoleProperties(StarUMLElem: IModel; RoseElem: RRole);
var
  PetalObj: RPetalObject;
  OtherEnd: RRole;
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_ASSOC_END) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // constraints
  if RoseElem.Constraints <> '' then
    (StarUMLElem as IExtensibleModel).AddConstraint('', RoseElem.Constraints);
  // client_cardinality
  if RoseElem.client_cardinality <> '' then
    (StarUMLElem as IUMLAssociationEnd).Multiplicity := RoseElem.client_cardinality;
  // friend: not support
  // is_aggregate, containment
  if RoseElem.Is_aggregate then begin
    PetalObj := RoseElem.Parent;
    if (PetalObj <> nil) and (PetalObj is RAssociation) then begin
      if (PetalObj as RAssociation).Roles[0] = RoseElem then
        OtherEnd := (PetalObj as RAssociation).Roles[1]
      else OtherEnd := (PetalObj as RAssociation).Roles[0];
      if OtherEnd.Containment = ckByValue then
        (StarUMLElem as IUMLAssociationEnd).Aggregation := akComposite
      else (StarUMLElem as IUMLAssociationEnd).Aggregation := akAggregate;
    end;
  end;
  // is_navigable
  if not RoseElem.Is_navigable then
    (StarUMLElem as IUMLAssociationEnd).IsNavigable := False;
  // is_principal: not support
  // static
  if RoseElem.Static then
    (StarUMLElem as IUMLAssociationEnd).TargetScope := skClassifier; 
end;

procedure RoseStarUMLAdapter.ConvertStateProperties(StarUMLElem: IModel; RoseElem: RState);
var
  ElemKind: RStateKind;
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_STA_VERTEX) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // pseudostate kind
  if StarUMLElem.IsKindOf(UML_ELEM_PSEUDO_STATE) then begin
    ElemKind := RoseElem.Type_;
    case ElemKind of
      skStartState: (StarUMLElem as IUMLPseudostate).PseudostateKind := pkInitial;
      skHistory: (StarUMLElem as IUMLPseudostate).PseudostateKind := pkShallowHistory;
      skHistoryAll: (StarUMLElem as IUMLPseudostate).PseudostateKind := pkDeepHistory;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertStateTransitionProperties(StarUMLElem: IModel; RoseElem: RState_Transition);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_TRANSITION) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // condition
  if RoseElem.Condition <> '' then
    (StarUMLElem as IUMLTransition).GuardCondition := RoseElem.Condition;
end;

procedure RoseStarUMLAdapter.ConvertSynchronizationProperties(StarUMLElem: IModel; RoseElem: RSynchronizationState);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_PSEUDO_STATE) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // pseudostate kind
  (StarUMLElem as IUMLPseudostate).PseudostateKind := pkSynchronization;
end;

procedure RoseStarUMLAdapter.ConvertUseCaseProperties(StarUMLElem: IModel; RoseElem: RUseCase);
begin
  if not StarUMLElem.IsKindOf(UML_ELEM_USE_CASE) then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  // abstract
  if RoseElem.Abstract then (StarUMLElem as IUMLUseCase).IsAbstract := True;
  // rank: not support
end;

procedure RoseStarUMLAdapter.ConvertUsesRelationshipProperties(StarUMLElem: IModel; RoseElem: RUses_Relationship);
begin
  // client_cardinality: not support
  // friend: not support
  // supplier_cardinality: not support
end;

procedure RoseStarUMLAdapter.ConvertModuleProperties(StarUMLElem: IModel; RoseElem: RModule);
begin
  // declarations: not support
  // language: not support
end;

procedure RoseStarUMLAdapter.ConvertSendEventProperties(StarUMLElem: IModel; RoseElem: RSendEvent);
begin
  // parameters: nothing to do
  // target: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertInteractionDiagramProperties(StarUMLElem: IModel; RoseElem: RInteractionDiagram);
var
  ADefaults: RDefaults;
  TempVal: Integer;
  ShowSeq: Boolean;
begin
  if not(StarUMLElem.IsKindOf(UML_ELEM_SEQ_DIAGRAM) or StarUMLElem.IsKindOf(UML_ELEM_SEQ_ROLE_DIAGRAM))then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  ADefaults := FDesignObj.Defaults;
  if ADefaults <> nil then begin
    TempVal := ADefaults.ShowMessageNum;
    if TempVal = 1 then ShowSeq := False
    else ShowSeq := True;
    if StarUMLElem.IsKindOf(UML_ELEM_SEQ_DIAGRAM) then
      (StarUMLElem as IUMLSequenceDiagram).ShowSequenceNumber := ShowSeq
    else
      (StarUMLElem as IUMLSequenceRoleDiagram).ShowSequenceNumber := ShowSeq;
  end;
end;

procedure RoseStarUMLAdapter.ConvertObjectDiagramProperties(StarUMLElem: IModel; RoseElem: RObjectDiagram);
var
  ADefaults: RDefaults;
  TempVal: Integer;
  ShowSeq: Boolean;
begin
  if not(StarUMLElem.IsKindOf(UML_ELEM_COL_DIAGRAM) or StarUMLElem.IsKindOf(UML_ELEM_COL_ROLE_DIAGRAM))then
    raise EPropConversion.Create(ERR_UNKNOWN_ELEM);

  ADefaults := FDesignObj.Defaults;
  if ADefaults <> nil then begin
    TempVal := ADefaults.ShowMessageNum;
    if TempVal = 1 then ShowSeq := False
    else ShowSeq := True;
    if StarUMLElem.IsKindOf(UML_ELEM_SEQ_DIAGRAM) then
      (StarUMLElem as IUMLCollaborationDiagram).ShowSequenceNumber := ShowSeq
    else
      (StarUMLElem as IUMLCollaborationRoleDiagram).ShowSequenceNumber := ShowSeq;
  end;
end;

function RoseStarUMLAdapter.ConvertColorValue(Value: Integer): string;
begin
  Result := IntToStr(Value);
end;

function RoseStarUMLAdapter.ConvertFontStyleValue(B, I, U, S: Boolean): Integer;
begin
  Result := 0;
  if B then Result := 1;
  if I then Result := Result + 2;
  if U then Result := Result + 4;
  if S then Result := Result + 8;
end;

procedure RoseStarUMLAdapter.ConvertViewCommonProperties(StarUMLElem: IView; RoseElem: RPetalView);
var
  AFont: RFont;
  NL, SL: IEdgeLabelView;
begin
  // font
  AFont := RoseElem.Font;
  if (AFont = nil) and (FDesignObj.Defaults <> nil) then
    AFont := FDesignObj.Defaults.DefaultFont;
  if AFont <> nil then begin
    with AFont do begin
      StarUMLElem.FontFace := Face;
      StarUMLElem.FontColor := ConvertColorValue(Color);
      StarUMLElem.FontSize := Size;
      StarUMLElem.FontStyle := ConvertFontStyleValue(Bold, Italics, Underline, Strike);
    end;
  end;
  // Parent_View: nothing to do
  // line_color
  if RoseElem.Line_color >= 0 then
    StarUMLElem.LineColor := ConvertColorValue(RoseElem.Line_color);
  // fill_color
  if RoseElem.Fill_color >= 0 then
    StarUMLElem.FillColor := ConvertColorValue(RoseElem.Fill_color);
  // Label_, Streotype (Label)
  if (RoseElem is RPetalEdgeView) and (StarUMLElem.IsKindOf(ELEM_UML_GENERAL_EDGE_VIEW)) then begin
    NL := (StarUMLElem as IUMLGeneralEdgeView).NameLabel;
    if NL <> nil then
      ConvertEdgeLabelViewProperties(NL, RoseElem);
    SL := (StarUMLElem as IUMLGeneralEdgeView).StereotypeLabel;
    if SL <> nil then
      ConvertEdgeLabelViewProperties(SL, RoseElem);
  end;
end;

procedure RoseStarUMLAdapter.ConvertNodeViewCommonProperties(StarUMLElem: IView; RoseElem: RPetalNodeView);
begin
  if StarUMLElem.IsKindOf(ELEM_NODE_VIEW) then begin
    // autoResize
    // (StarUMLElem as INodeView).AutoResize := RoseElem.AutoResize;
    // location
    (StarUMLElem as INodeView).Left := RoseElem.Location.X div 3;
    (StarUMLElem as INodeView).Top := RoseElem.Location.Y div 3;
    // height
    (StarUMLElem as INodeView).Height := RoseElem.Height div 3;
    // width
    (StarUMLElem as INodeView).Width := RoseElem.Width div 3;
  end;
  if StarUMLElem.IsKindOf(UML_ELEM_GEN_NODE_VIEW) then begin
    // icon_style
    case RoseElem.Icon_style of
      ikNone: (StarUMLElem as IUMLGeneralNodeView).StereotypeDisplay := sdkNone;
      ikLabel: (StarUMLElem as IUMLGeneralNodeView).StereotypeDisplay := sdkLabel;
      ikIcon: (StarUMLElem as IUMLGeneralNodeView).StereotypeDisplay := sdkIcon;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertEdgeViewCommonProperties(StarUMLElem: IView; RoseElem: RPetalEdgeView);
var
  I: Integer;
  Pt: RPoint;
begin
  if StarUMLElem.IsKindOf(ELEM_EDGE_VIEW) then begin
    // line_style
    case RoseElem.Line_style of
      lkOblique: (StarUMLElem as IEdgeView).LineStyle := lsOblique;
      lkRectlinear: (StarUMLElem as IEdgeView).LineStyle := lsRectilinear;
    end;
    if RoseElem.VertexCount > 0 then
      (StarUMLElem as IEdgeView).Points.ClearPoints;
    // vertices
    for I := 0 to RoseElem.VertexCount - 1 do begin
      Pt := RoseElem.Vertices[I];
      (StarUMLElem as IEdgeView).Points.AddPoint(Pt.X div 3, Pt.Y div 3);
    end;
    // origin_attachment: nothing to do
    // terminal_attachment: nothing to do
    // stereotype: nothing to do
  end;
end;

procedure RoseStarUMLAdapter.ConvertEdgeLabelViewProperties(StarUMLElem: IEdgeLabelView; RoseElem: RPetalView);
var
  AFont: RFont;
begin
  // font
  AFont := RoseElem.Font;
  if (AFont = nil) and (FDesignObj.Defaults <> nil) then
    AFont := FDesignObj.Defaults.DefaultFont;
  if AFont <> nil then begin
    with AFont do begin
      StarUMLElem.FontFace := Face;
      StarUMLElem.FontColor := ConvertColorValue(Color);
      StarUMLElem.FontSize := Size;
      StarUMLElem.FontStyle := ConvertFontStyleValue(Bold, Italics, Underline, Strike);
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertActivityStateViewProperties(StarUMLElem: IView; RoseElem: RActivityStateView);
begin
  // annotation: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertCategoryViewProperties(StarUMLElem: IView; RoseElem: RCategoryView);
begin
  // icon: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertClassInstanceViewProperties(StarUMLElem: IView; RoseElem: RClassInstanceView);
begin
  // annotation: nothing to do
  // icon: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertClassViewProperties(StarUMLElem: IView; RoseElem: RClassView);
var
  AClsView: IUMLClassifierView;
begin
  if StarUMLElem.IsKindOf(UML_ELEM_CLASSIFIER_VIEW) then begin
    AClsView := StarUMLElem as IUMLClassifierView;
    // showCompartmentStereotypes
    if RoseElem.ShowCompartmentStereotypes then
      AClsView.ShowCompartmentStereotype := True
    else AClsView.ShowCompartmentStereotype := False;
    // includeAttribute, suppressAttribute
    if RoseElem.IncludeAttribute and (not RoseElem.SuppressAttribute) then
      AClsView.SuppressAttributes := False
    else AClsView.SuppressAttributes := True;
    // includeOperation, suppressOperation
    if RoseElem.IncludeOperation and (not RoseElem.SuppressOperation) then
      AClsView.SuppressOperations := False
    else AClsView.SuppressOperations := True;
    // showOperationSignature
    if RoseElem.ShowOperationSignature then
      AClsView.ShowOperationSignature := True
    else AClsView.ShowOperationSignature := False;
    // annotation: nothing to do
  end;
end;

procedure RoseStarUMLAdapter.ConvertInterfaceViewProperties(StarUMLElem: IView; RoseElem: RInterfaceView);
begin
  // icon: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertInterMessViewProperties(StarUMLElem: IView; RoseElem: RInterMessView);
var
  X, Y: Integer;
begin
  if StarUMLElem.IsKindOf(UML_ELEM_SEQ_MESS_VIEW) then begin
    (StarUMLElem as IUMLCustomSeqMessageView).Points.BeginUpdate;
    try
      (StarUMLElem as IUMLCustomSeqMessageView).Points.ClearPoints;
      // origin
      X := RoseElem.Origin.X div 3;
      Y := RoseElem.Origin.Y div 3;
      (StarUMLElem as IUMLCustomSeqMessageView).Points.AddPoint(X, Y);
      // terminus
      X := RoseElem.Terminus.X div 3;
      Y := RoseElem.Terminus.Y div 3;
      (StarUMLElem as IUMLCustomSeqMessageView).Points.AddPoint(X, Y);
      // ordinal: nothing to do
      // focus_Src: nothing to do
      // focus_Entry: nothing to do
    finally
      (StarUMLElem as IUMLCustomSeqMessageView).Points.EndUpdate;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertInterObjViewProperties(StarUMLElem: IView; RoseElem: RInterObjView);
begin
  // icon_height: nothing to do
  // icon_width: nothing to do
  // icon_y_offset: nothing to do
  // annotation: nothing to do
  // icon: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertLabelProperties(StarUMLElem: IView; RoseElem: RLabel);
begin
  if StarUMLElem.IsKindOf(UML_ELEM_TEXT_VIEW) then begin
    (StarUMLElem as IUMLTextView).Text := RoseElem.Label_;
  end;
end;

procedure RoseStarUMLAdapter.ConvertMessViewProperties(StarUMLElem: IView; RoseElem: RMessView);
var
  X, Y: Integer;
begin
  if StarUMLElem.IsKindOf(UML_ELEM_COL_MESS_VIEW) then begin
    // pctDist
    //(StarUMLElem as IUMLCustomColMessageView).Distance := RoseElem.PctDist;
    // orientation: nothing to do
    // dir: nothing to do
    // origin: nothing to do
    // terminus: nothing to do
    // object_arc: nothing to do
    // dataFlowView: nothing to do
  end;
end;

procedure RoseStarUMLAdapter.ConvertModViewProperties(StarUMLElem: IView; RoseElem: RModView);
begin
  // icon: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertNoteViewProperties(StarUMLElem: IView; RoseElem: RNoteView);
var
  ALabel: RPetalLabelView;
  Str: string;
begin
  if StarUMLElem.IsKindOf(UML_ELEM_NOTE_VIEW) then begin
    if RoseElem.Label_Count > 0 then begin
      ALabel := RoseElem.Label_s[0];
      if (ALabel <> nil) and (ALabel is RItemLabel) then begin
        Str := (ALabel as RItemLabel).Label_;
        if Str <> '' then (StarUMLElem as IUMLNoteView).Text := Str;
      end;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertObjectViewProperties(StarUMLElem: IView; RoseElem: RObjectView);
begin
  // annotation: nothing to do
  // subobjects: nothing to do
  // x_offset: nothing to do
  // y_offset: nothing to do
  // icon: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertProcessorViewProperties(StarUMLElem: IView; RoseElem: RProcessorView);
begin
  // annotation: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertSelfMessViewProperties(StarUMLElem: IView; RoseElem: RSelfMessView);
var
  X, Y: Integer;
begin
  if StarUMLElem.IsKindOf(UML_ELEM_SEQ_MESS_VIEW) then begin
    (StarUMLElem as IUMLCustomSeqMessageView).Points.BeginUpdate;
    try
      (StarUMLElem as IUMLCustomSeqMessageView).Points.ClearPoints;
      // origin
      X := RoseElem.Origin.X div 3;
      Y := RoseElem.Origin.Y div 3;
      (StarUMLElem as IUMLCustomSeqMessageView).Points.AddPoint(X, Y);
      // terminus
      X := RoseElem.Terminus.X div 3;
      Y := RoseElem.Terminus.Y div 3;
      (StarUMLElem as IUMLCustomSeqMessageView).Points.AddPoint(X, Y);
      // ordinal: nothing to do
      // focus_Src: nothing to do
      // focus_Entry: nothing to do
    finally
      (StarUMLElem as IUMLCustomSeqMessageView).Points.EndUpdate;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertSynchronizationViewProperties(StarUMLElem: IView; RoseElem: RSynchronizationView);
begin
  if StarUMLElem.IsKindOf(UML_ELEM_PSEUDO_STATE_VIEW) then begin
    if RoseElem.Sync_is_horizontal then begin
      if (StarUMLElem as IUMLPseudostateView).Width <= (StarUMLElem as IUMLPseudostateView).Height then
        (StarUMLElem as IUMLPseudostateView).Width := (StarUMLElem as IUMLPseudostateView).Height + 1;
    end else begin
      if (StarUMLElem as IUMLPseudostateView).Height <= (StarUMLElem as IUMLPseudostateView).Width then
        (StarUMLElem as IUMLPseudostateView).Height := (StarUMLElem as IUMLPseudostateView).Width + 1;
    end;
  end;
end;

procedure RoseStarUMLAdapter.ConvertTransViewProperties(StarUMLElem: IView; RoseElem: RTransView);
begin
  // x_offset: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertUsesViewProperties(StarUMLElem: IView; RoseElem: RUsesView);
begin
  // icon: nothing to do
end;

procedure RoseStarUMLAdapter.ConvertStateViewProperties(StarUMLElem: IView; RoseElem: RStateView);
//var
//  TempObj: IUnknown;
//  PrtView: IUMLStateView;
begin
  // Parent_View
  {
  if RoseElem.Parent_View <> nil then begin
    TempObj := RoseElem.Parent_View.InterfaceObj;
    if (TempObj <> nil) and (TempObj.QueryInterface(IUMLStateView, PrtView) = S_OK) then begin
      StarUMLElem
      .ContainerView := PrtView;
    end;
  end;
  }
end;

procedure RoseStarUMLAdapter.Convert(FN: string; PetalDoc: RPetalDocument);
begin
  FFileName := FN;
  
  BeforeConversion(PetalDoc);
  try
    FDesignObj := PetalDoc.Design;
    ConvertElements(PetalDoc);
    ConvertProperties(FDesignObj);
  finally
    AfterConversion;
  end;
end;

// RoseStarUMLAdapter
////////////////////////////////////////////////////////////////////////////////

end.
