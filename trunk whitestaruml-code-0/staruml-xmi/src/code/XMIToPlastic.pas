{******************************************************************************}
{                                                                              }
{                        PLASTIC 2003 XMIAddIn                                 }
{                                                                              }
{               Copyright(c) 1998-2003 Plastic Software, Inc.                  }
{                                                                              }
{******************************************************************************}

// @FILE:
//   XMIToPlastic.pas
//
// @AUTHORS:
//   Hyesoo Kim, Heeseok Ahn
//
// @DESCRIPTION:
//   XMI to Plastic Adapter Class  
//
// @REVISION HISTORY:
//   Ver  Author        Date        Summary
//   ---  ------------  ----------  --------------------------------------------
//   1.0  All           2003-09-01  First, written
//
//  No part of this work covered by the copyright hereon may be reproduced,   //
//  stored in retrieval systems, in any form or by any means, electronic,     //
//  mechanical, photocopying, recording or otherwise, without the prior       //
//  permission of Plastic Software, Inc.                                      //

unit XMIToPlastic;

interface

uses
  PLASTIC_TLB, Classes, XMLDoc, XMLIntf, SysUtils,
  Utilities;

type
  // Exception
  EElementCreationFailed = class(Exception);

  // PProgressEvent
  PProgressEvent = procedure (Pos: Integer; Max: Integer; Msg: string) of object;

  // PXMIElementWrapper
  PXMIElementWrapper = class
  private
    FXMLNode: IXMLNode;
    FPlasticElement: IElement;
    FXmiId: string;
    FPredefined: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property XMLNode: IXMLNode read FXMLNode write FXMLNode;
    property PlasticElement: IElement read FPlasticElement write FPlasticElement;
    property XmiId: string read FXmiId write FXmiId;
    property Predefined: Boolean read FPredefined write FPredefined;
  end;

  // PXMIStereotypeWrapper
  PXMIStereotypeWrapper = class
  private
    FXMLNode: IXMLNode;
    FXmiId: string;
    FXmiName: string;
    FAppliedElements: TStringList;
    procedure SetStereotypeInfo;
  public
    constructor Create(Node: IXMLNode);
    destructor Destroy; override;
    function IsAppliedXMIElement(Node: IXMLNode): Boolean;
    property XMLNode: IXMLNode read FXMLNode;
    property XmiId: string read FXmiId write FXmiId;
    property XmiName: string read FXmiName write FXmiName;
  end;

  // PXMIToPlasticAdapter
  PXMIToPlasticAdapter = class
  private
    FOnProgress: PProgressEvent;
    FPlasticApp: IPlasticApplication;
    FProject: IUMLProject;
    FXMLDocument: TXMLDocument;
    FElementWrapperList: TList;
    FStereotypeWrapperList: TList;
    FCommentWrapperList: TList;
    FDiagramWrapperList: TList;
    FViewWrapperList: TList;
    FDataTypeWrapperList: TList;
    FConstraintWrapperList: TList;
    FParameterWrapperList: TList;
    FActionWrapperList: TList;
    FTaggedValueWrapperList: TList;
    FCreateDiagramMode: Boolean;
    FNewProjectMode: Boolean;
    FRationalApproachMode: Boolean;
    FRootElement: IUMLPackage;
    FFactory: IUMLFactory;
    FTotalXMINodeCount: Integer;
    FCurrentXMINodeIndex: Integer;

    { utility methods - list related }
    procedure AddElementToList(AWrapper: PXMIElementWrapper); overload;
    procedure AddElementToList(Elem: IElement; Node: IXMLNode; Predefined: Boolean = False); overload;
    procedure AddDiagramToList(Elem: IUMLDiagram; Node: IXMLNode);
    procedure AddViewToList(Elem: IView; Node: IXMLNode);
    procedure AddStreotypeToList(AWrapper: PXMIStereotypeWrapper); overload;
    procedure AddStreotypeToList(Node: IXMLNode); overload;
    procedure AddCommentToList(AWrapper: PXMIElementWrapper); overload;
    procedure AddCommentToList(Node: IXMLNode); overload;
    procedure AddConstraintToList(Node: IXMLNode);
    procedure AddDataTypeToList(Node: IXMLNode);
    procedure AddParameterToList(Node: IXMLNode);
    procedure AddActionToList(Node: IXMLNode);
    procedure AddTaggedValueToList(Node: IXMLNode);
    function GetElementFromList(XmiId: string): IElement; overload;
    function GetElementFromList(XmiId: string; ElemKind: string): IElement; overload;
    function GetParentElement(Node: IXMLNode): IElement; overload;
    function GetParentElement(Node: IXMLNode; ElemKind: string): IElement; overload;
    function GetDiagramFromList(XmiId: string): IUMLDiagram;
    function GetConstraintFromList(XmiId: string): IXMLnode;
    function GetDataTypeFromList(XmiId: string): string;
    function GetParameterFromList(XmiId: string): IXMLNode;
    function GetActionFromList(XmiId: string): IXMLNode;
    function IsStereotypeApplied(Node: IXMLNode; StereotypeName: string): Boolean;
    function GetAppliedStereotype(Node: IXMLnode): string;
    function IndexOfCommentList(Node: IXMLNode): Integer;
    { utility methods - getting construction parameters }
    function GetConstructParamNamespace(Node: IXMLNode): IUMLNamespace;
    function GetConstructParamModelElement(Node: IXMLNode): IUMLModelElement;
    function GetConstructParamCollaborationClassifier(Node: IXMLNode): IUMLClassifier;
    function GetConstructParamCollaborationOperation(Node: IXMLNode): IUMLOperation;
    function GetConstructParamCollaboration(Node: IXMLNode): IUMLCollaboration;
    function GetConstructParamInteraction(Node: IXMLNode): IUMLInteraction;
    function GetConstructParamCompositeState(Node: IXMLNode): IUMLCompositeState;
    function GetConstructParamActivityGraph(Node: IXMLNode): IUMLActivityGraph;
    function GetConstructParamClassifier(Node: IXMLNode): IUMLClassifier;
    function GetConstructParamBehavioralFeature(Node: IXMLNode): IUMLBehavioralFeature;
    function GetConstructParamOfTemplateParameter(Node: IXMLNode): IUMLModelElement;
    function GetConstructParamStateMachine(Node: IXMLNode): IUMLStateMachine;
    function GetConstructParamStateVertexSource(Node: IXMLNode): IUMLStateVertex;
    function GetConstructParamStateVertexTarget(Node: IXMLNode): IUMLStateVertex;
    function GetConstructParamTransition(Node: IXMLNode): IUMLTransition;
    function GetConstructParamClassifierRoleCollaboration(Node: IXMLNode): IUMLCollaboration;
    function GetConstructParamOfQualifier(Node: IXMLNode): IUMLAssociationEnd;
    function GetConstructParamAssociationEnd(Node: IXMLNode; IsEnd2: Boolean): IUMLClassifier;
    function GetConstructParamAssociationEndRole(Node: IXMLNode; IsEnd2: Boolean): IUMLClassifier;
    function GetConstructParamClient(Node: IXMLNode): IUMLModelElement;
    function GetConstructParamSupplier(Node: IXMLNode): IUMLModelElement;
    function GetConstructParamParent(Node: IXMLNode): IUMLGeneralizableElement;
    function GetConstructParamChild(Node: IXMLNode): IUMLGeneralizableElement;
    function GetConstructParamUseCase(Node: IXMLNode; AttrName, NodeName: string): IUMLUseCase;
    function GetConstructParamClassifierRole(Node: IXMLNode; AttrName, NodeName: string): IUMLClassifierRole;
    function GetConstructParamCommConnection(Node: IXMLNode): IUMLAssociationRole;
    function GetConstructParamEffectTransition(Node: IXMLNode): IUMLTransition;
    function GetConstructParamState(Node: IXMLNode): IUMLState;
    function GetConstructParamDiagramType(Node: IXMLNode): string;
    function GetConstructParamDiagramOwner(Node: IXMLNode): IUMLModelElement;
    function GetConstructParamViewModel(Node: IXMLNode): IModel;
    function GetConstructParamGeometry(Node: IXMLNode): PStrArray;
    function GetConstructParamAnnotatedElems(Node: IXMLNode): PStrArray;
    function GetConstructParamAnnotatedElemView(DiagramView: IDiagramView; XmiId: string): IView;
    function GetOwnedViewCount(DiagramView: IDiagramView; Elem: IModel): Integer;
    function GetOwnedViewOfModel(DiagramView: IDiagramView; Elem: IModel): IView;
    function GetOwnedViewByCoordinate(DiagramView: IDiagramView; Node: IXMLNode; Elem: IModel): IView;
    function IsNodeTypeView(Elem: IModel): Boolean;
    function IsEdgeTypeView(Elem: IModel): Boolean;
    { utility methods - getting property values }
    function GetPropValue(Node: IXMLNode; Attr, NodeName: string): string;
    function GetPropValue2(Node: IXMLNode; Attr, NodeName: string): string;
    function GetPropName(Node: IXMLNode): string;
    function GetPropExpressionValue(Node: IXMLNode): string;
    function GetPropMultiplicity(Node: IXMLNode): string;
    function GetPropDiagramStyle(Node: IXMLNode): string;
    function GetPropDiagramElemStyle(Node: IXMLNode): string;
    function GetPropDiagramElemStyleValue(Node: IXMLNode; StyleName: string): string;
    { convert element xmi to plastic subroutines }
    function ConvertElemToRoseView(XMLNode: IXMLNode): Boolean;
    procedure ConvertElemModel(XMLNode: IXMLNode);
    procedure ConvertElemSubsystem(XMLNode: IXMLNode);
    procedure ConvertElemPackage(XMLNode: IXMLNode);
    procedure ConvertElemClass(XMLNode: IXMLNode);
    procedure ConvertElemInterface(XMLNode: IXMLNode);
    procedure ConvertElemSignal(XMLNode: IXMLNode);
    procedure ConvertElemException(XMLNode: IXMLNode);
    procedure ConvertElemComponent(XMLNode: IXMLNode);
    procedure ConvertElemComponentInstance(XMLNode: IXMLNode);
    procedure ConvertElemNode(XMLNode: IXMLNode);
    procedure ConvertElemNodeInstance(XMLNode: IXMLNode);
    procedure ConvertElemUseCase(XMLNode: IXMLNode);
    procedure ConvertElemActor(XMLNode: IXMLNode);
    procedure ConvertElemActivityGraph(XMLNode: IXMLNode);
    procedure ConvertElemStateMachine(XMLNode: IXMLNode);
    procedure ConvertElemCollaboration(XMLNode: IXMLNode);
    procedure ConvertElemInteraction(XMLNode: IXMLNode);
    procedure ConvertElemTopState(XMLNode: IXMLNode);
    procedure ConvertElemActionState(XMLNode: IXMLNode);
    procedure ConvertElemSubactivityState(XMLNode: IXMLNode);
    procedure ConvertElemPseudostate(XMLNode: IXMLNode);
    procedure ConvertElemFinalState(XMLNode: IXMLNode);
    procedure ConvertElemSubmachineState(XMLNode: IXMLNode);
    procedure ConvertElemPartition(XMLNode: IXMLNode);
    procedure ConvertElemAttribute(XMLNode: IXMLNode);
    procedure ConvertElemQualifier(XMLNode: IXMLNode);
    procedure ConvertElemOperation(XMLNode: IXMLNode);
    procedure ConvertElemParameter(XMLNode: IXMLNode);
    procedure ConvertElemTemplateParameter(XMLNode: IXMLNode);
    procedure ConvertElemTransition(XMLNode: IXMLNode);
    procedure ConvertElemSignalEvent(XMLNode: IXMLNode);
    procedure ConvertElemCallEvent(XMLNode: IXMLNode);
    procedure ConvertElemTimeEvent(XMLNode: IXMLNode);
    procedure ConvertElemChangeEvent(XMLNode: IXMLNode);
    procedure ConvertElemClassifierRole(XMLNode: IXMLNode);
    procedure ConvertElemObject(XMLNode: IXMLNode);
    procedure ConvertElemDependency(XMLNode: IXMLNode);
    procedure ConvertElemDependencyWithStereotype(XMLNode: IXMLNode; StreotypeName: string);
    procedure ConvertElemAssociation(XMLNode: IXMLNode);
    procedure ConvertElemGeneralization(XMLNode: IXMLNode);
    procedure ConvertElemAssociationRole(XMLNode: IXMLNode);
    procedure ConvertElemMessage(XMLNode: IXMLNode);
    procedure ConvertElemInclude(XMLNode: IXMLNode);
    procedure ConvertElemExtend(XMLNode: IXMLNode);
    procedure ConvertElemAssociationClass(XMLNode: IXMLNode);
    procedure ConvertElemAbstraction(XMLNode: IXMLNode);
    procedure ConvertElemCompositeState(XMLNode: IXMLNode);
    procedure ConvertElemObjectFlowState(XMLNode: IXMLNode);
    procedure ConvertElemUninterpretedAction(XMLNode: IXMLNode);
    procedure ConvertElemNotSupport1(XMLNode: IXMLNode);
    procedure ConvertElemNotSupport2(XMLNode: IXMLNode);
    function CheckNotSupportEmbedding(PN, N: IXMLNode; NodeName: string): Boolean;
    function ConvertGeneralizationView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertAssociationView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertAssociationClassView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertDependencyView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertRealizationView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertIncludeView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertExtendView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertLinkView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertAssociationRoleView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertAssociationRoleView2(DiagramView: IDiagramView; Elem: IModel): IView;
    function ConvertColMessageView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertSeqMessageView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertTransitionView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertElemNodeTypeView(DiagramView: IDiagramView; Elem: IModel): IView;
    function ConvertElemEdgeTypeView(DiagramView: IDiagramView; Elem: IModel; Node: IXMLNode): IView;
    function ConvertElemNoteView(DiagramView: IDiagramView): IView;
    function ConvertElemNoteLinkView(DiagramView: IDiagramView; Elem: IUMLNoteView; AWrapper: PXMIElementWrapper): IView;
    function ConvertElemDiagram(XMLNode: IXMLNode): IUMLDiagram;
    procedure ConvertElemNodeTypeDiagramElement(XMLNode: IXMLNode; Diagram: IUMLDiagram);
    procedure ConvertElemEdgeTypeDiagramElement(XMLNode: IXMLNode; Diagram: IUMLDiagram);
    procedure ConvertElemNoteDiagramElement(XMLNode: IXMLNode; Diagram: IUMLDiagram);
    { convert property xmi to plastic subroutines }
    procedure ConvertPropModel(AWrapper: PXMIElementWrapper);
    procedure ConvertPropModelElement(AWrapper: PXMIElementWrapper);
    procedure ConvertPropGeneralizableElement(AWrapper: PXMIElementWrapper);
    procedure ConvertPropClassifier(AWrapper: PXMIElementWrapper);
    procedure ConvertPropClass(AWrapper: PXMIElementWrapper);
    procedure ConvertPropFeature(AWrapper: PXMIElementWrapper);
    procedure ConvertPropStructuralFeature(AWrapper: PXMIElementWrapper);
    procedure ConvertPropAssociationEnd(AWrapper: PXMIElementWrapper);
    procedure ConvertPropAttribute(AWrapper: PXMIElementWrapper);
    procedure ConvertPropBehavioralFeature(AWrapper: PXMIElementWrapper);
    procedure ConvertPropOperation(AWrapper: PXMIElementWrapper);
    procedure ConvertPropParameter(AWrapper: PXMIElementWrapper);
    procedure ConvertPropGeneralization(AWrapper: PXMIElementWrapper);
    procedure ConvertPropRealization(AWrapper: PXMIElementWrapper);
    procedure ConvertPropAssociationClass(AWrapper: PXMIElementWrapper);
    procedure ConvertPropComponent(AWrapper: PXMIElementWrapper);
    procedure ConvertPropNode(AWrapper: PXMIElementWrapper);
    procedure ConvertPropTemplateParameter(AWrapper: PXMIElementWrapper);
    procedure ConvertPropSignal(AWrapper: PXMIElementWrapper);
    procedure ConvertPropAction(AWrapper: PXMIElementWrapper);
    procedure ConvertPropCreateAction(AWrapper: PXMIElementWrapper);
    procedure ConvertPropLink(AWrapper: PXMIElementWrapper);
    procedure ConvertPropCallAction(AWrapper: PXMIElementWrapper);
    procedure ConvertPropSendAction(AWrapper: PXMIElementWrapper);
    procedure ConvertPropInstance(AWrapper: PXMIElementWrapper);
    procedure ConvertPropComponentInstance(AWrapper: PXMIElementWrapper);
    procedure ConvertPropNodeInstance(AWrapper: PXMIElementWrapper);
    procedure ConvertPropExtend(AWrapper: PXMIElementWrapper);
    procedure ConvertPropEvent(AWrapper: PXMIElementWrapper);
    procedure ConvertPropState(AWrapper: PXMIElementWrapper);
    procedure ConvertPropCompositeState(AWrapper: PXMIElementWrapper);
    procedure ConvertPropTimeEvent(AWrapper: PXMIElementWrapper);
    procedure ConvertPropCallEvent(AWrapper: PXMIElementWrapper);
    procedure ConvertPropSignalEvent(AWrapper: PXMIElementWrapper);
    procedure ConvertPropTransition(AWrapper: PXMIElementWrapper);
    procedure ConvertPropChangeEvent(AWrapper: PXMIElementWrapper);
    procedure ConvertPropPseudoState(AWrapper: PXMIElementWrapper);
    procedure ConvertPropCollaboration(AWrapper: PXMIElementWrapper);
    procedure ConvertPropSubmachineSate(AWrapper: PXMIElementWrapper);
    procedure ConvertPropPartition(AWrapper: PXMIElementWrapper);
    procedure ConvertPropClassifierRole(AWrapper: PXMIElementWrapper);
    procedure ConvertPropAssociationRole(AWrapper: PXMIElementWrapper);
    procedure ConvertPropAssociationEndRole(AWrapper: PXMIElementWrapper);
    procedure ConvertPropMessage(AWrapper: PXMIElementWrapper);
    procedure ConvertPropSubactivityState(AWrapper: PXMIElementWrapper);
    procedure ConvertPropActionState(AWrapper: PXMIElementWrapper);
    procedure ConvertPropSubsystem(AWrapper: PXMIElementWrapper);
    procedure ConvertPropDiagram(AWrapper: PXMIElementWrapper);
    procedure ConvertPropViewFontSize(Elem: IView; Node: IXMLNode);
    procedure ConvertPropViewFontFace(Elem: IView; Node: IXMLNode);
    procedure ConvertPropViewFontColor(Elem: IView; Node: IXMLNode);
    procedure ConvertPropViewFontStyle(Elem: IView; Node: IXMLNode);
    procedure ConvertPropViewLineColor(Elem: IView; Node: IXMLNode);
    procedure ConvertPropNodeViewFillColor(Elem: INodeView; Node: IXMLNode);
    procedure ConvertPropNodeViewAutoResize(Elem: INodeView; Node: IXMLNode);
    procedure ConvertPropViewOpSignature(Elem: INodeView; Node: IXMLNode);
    procedure ConvertPropSuppressAttributes(Elem: INodeView; Node: IXMLNode);
    procedure ConvertPropSuppressOperations(Elem: INodeView; Node: IXMLNode);
    procedure ConvertPropNodeViewRect(Elem: INodeView; Node: IXMLNode);
    procedure ConvertPropSwimlaneViewRect(Elem: IUMLSwimlaneView; Node: IXMLNode);
    procedure ConvertPropSeqMessageViewRect(DiagramView: IDiagramView;
      ElemView: IUMLCustomSeqMessageView; Node: IXMLNode);
    { convert xmi to plastic subroutines }
    procedure SetProjectProperties(N: IXMLNode);
    procedure GatherPreparatoryInfo(N: IXMLNode);
    procedure GatherTaggedValues(N: IXMLNode);
    procedure PrepareDiagramConversion(Node: IXMLNode);
    procedure ConvertElementAtFirstLoop(Node: IXMLNode);
    procedure ConvertElementAtSecondLoop(Node: IXMLNode);
    procedure ConvertProperties(AWrapper: PXMIElementWrapper);
    procedure ConvertViewsProperties(AWrapper: PXMIElementWrapper);
    procedure ConvertStreotypes(AWrapper: PXMIStereotypeWrapper);
    procedure ConvertTaggedValues(AWrapper: PXMIElementWrapper);
    procedure ConvertDiagram(Node: IXMLNode);
    procedure ConvertViews(Node: IXMLNode);
    { convert xmi to plastic }
    procedure StimulateProgressEvent(Pos: Integer; Max: Integer; Msg: string);
    procedure PrepareConversion(Content: IXMLNode);
    procedure DoFirstLoopConversion(Content: IXMLNode);
    procedure DoSecondLoopConversion(Content: IXMLNode);
    procedure FinalizeConversion;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ConvertXMIToPlastic(RootElem: IUMLPackage);
    { Properties }
    property OnProgress: PProgressEvent read FOnProgress write FOnProgress;
    property PlasticApp: IPlasticApplication read FPlasticApp write FPlasticApp;
    property XMLDocument: TXMLDocument read FXMLDocument write FXMLDocument;
    property Project: IUMLProject read FProject;
    property RootElement: IUMLPackage read FRootElement;
    property CreateDiagramMode: Boolean read FCreateDiagramMode write FCreateDiagramMode;
    property NewProjectMode: Boolean read FNewProjectMode write FNewProjectMode;
    property RationalApproachMode: Boolean read FRationalApproachMode write FRationalApproachMode;
    property Factory: IUMLFactory read FFactory;
    property TotalXMINodeCount: Integer read FTotalXMINodeCount;
    property CurrentXMINodeIndex: Integer read FCurrentXMINodeIndex;
  end;

var
  XMIToPlasticAdapter: PXMIToPlasticAdapter;

implementation

uses
  Symbols, NLS_XMIAddIn,
  Dialogs, Types;

////////////////////////////////////////////////////////////////////////////////
// PXMIElementWrapper

constructor PXMIElementWrapper.Create;
begin
  inherited;
  FXMLNode := nil;
  FPlasticElement := nil;
  FPredefined := False;
end;

destructor PXMIElementWrapper.Destroy;
begin
  FXMLNode := nil;
  FPlasticElement := nil;
  inherited;
end;

// PXMIElementWrapper
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PXMIStereotypeWrapper

constructor PXMIStereotypeWrapper.Create(Node: IXMLNode);
begin
  inherited Create;
  FAppliedElements := TStringList.Create;
  FXMLNode := Node;
  SetStereotypeInfo;
end;

destructor PXMIStereotypeWrapper.Destroy;
begin
  FXMLNode := nil;
  FAppliedElements.Free;
  inherited;
end;

function PXMIStereotypeWrapper.IsAppliedXMIElement(Node: IXMLNode): Boolean;
var
  I: Integer;
  NodeId: string;
begin
  Result := False;
  NodeId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
  for I := 0 to FAppliedElements.Count - 1 do begin
    if NodeId = FAppliedElements.Strings[I] then begin
      Result := True;
      Break;
    end;
  end;
end;

procedure PXMIStereotypeWrapper.SetStereotypeInfo;
var
  Strs: string;
  I: Integer;
  Arr: PStrArray;
  SubNode: IXMLNode;
begin
  if FXMLNode <> nil then begin
    Strs := XMLUtil.GetAttributeValue(FXMLNode, ATTR_UML_EXTENDED_ELEMENT);
    if Strs = '' then begin
      SubNode := XMLUtil.FindFirstNode(FXMLNode, NODE_UML_STEREOTYPE_EXTENDED_ELEM);
      if SubNode <> nil then begin
        Strs := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
      end;
    end;
    Arr := SplitStringWithMatch(Strs, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      FAppliedElements.Add(Arr[I]);
    end;
  end;
end;

// PXMIStereotypeWrapper
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PXMIToPlasticAdapter

constructor PXMIToPlasticAdapter.Create;
begin
  inherited;
  FTotalXMINodeCount := 0;
  FElementWrapperList := TList.Create;
  FStereotypeWrapperList := TList.Create;
  FCommentWrapperList := TList.Create;
  FDiagramWrapperList := TList.Create;
  FViewWrapperList := TList.Create;
  FConstraintWrapperList := TList.Create;
  FDataTypeWrapperList := TList.Create;
  FParameterWrapperList := TList.Create;
  FActionWrapperList := TList.Create;
  FTaggedValueWrapperList := TList.Create;
end;

destructor PXMIToPlasticAdapter.Destroy;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
  AWrapper2: PXMIStereotypeWrapper;
begin
  FRootElement := nil;
  FProject := nil;
  FPlasticApp := nil;
  for I := FElementWrapperList.Count - 1 downto 0 do begin
    AWrapper := FElementWrapperList.Items[I];
    AWrapper.Free;
  end;
  FElementWrapperList.Free;
  for I := FStereotypeWrapperList.Count - 1 downto 0 do begin
    AWrapper2 := FStereotypeWrapperList.Items[I];
    AWrapper2.Free;
  end;
  FStereotypeWrapperList.Free;
  for I := FCommentWrapperList.Count - 1 downto 0 do begin
    AWrapper := FCommentWrapperList.Items[I];
    AWrapper.Free;
  end;
  FCommentWrapperList.Free;
  for I := FDiagramWrapperList.Count - 1 downto 0 do begin
    AWrapper := FDiagramWrapperList.Items[I];
    AWrapper.Free;
  end;
  FDiagramWrapperList.Free;
  for I := FViewWrapperList.Count - 1 downto 0 do begin
    AWrapper := FViewWrapperList.Items[I];
    AWrapper.Free;
  end;
  FViewWrapperList.Free;
  for I := FConstraintWrapperList.Count - 1 downto 0 do begin
    AWrapper := FConstraintWrapperList.Items[I];
    AWrapper.Free;
  end;
  FConstraintWrapperList.Free;
  for I := FDataTypeWrapperList.Count - 1 downto 0 do begin
    AWrapper := FDataTypeWrapperList.Items[I];
    AWrapper.Free;
  end;
  FDataTypeWrapperList.Free;
  for I := FParameterWrapperList.Count - 1 downto 0 do begin
    AWrapper := FParameterWrapperList.Items[I];
    AWrapper.Free;
  end;
  FParameterWrapperList.Free;
  for I := FActionWrapperList.Count - 1 downto 0 do begin
    AWrapper := FActionWrapperList.Items[I];
    AWrapper.Free;
  end;
  FActionWrapperList.Free;
  for I := FTaggedValueWrapperList.Count - 1 downto 0 do begin
    AWrapper := FTaggedValueWrapperList.Items[I];
    AWrapper.Free;
  end;
  FTaggedValueWrapperList.Free;
  inherited;
end;

procedure PXMIToPlasticAdapter.AddElementToList(AWrapper: PXMIElementWrapper);
begin
  if AWrapper <> nil then FElementWrapperList.Add(AWrapper);
end;

procedure PXMIToPlasticAdapter.AddElementToList(Elem: IElement; Node: IXMLNode;
  Predefined: Boolean = False);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if (Elem <> nil) and (Node <> nil) then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := Elem;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    if Predefined then AWrapper.Predefined := True;
    AddElementToList(AWrapper);
  end;
end;

procedure PXMIToPlasticAdapter.AddDiagramToList(Elem: IUMLDiagram; Node: IXMLNode);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if (Elem <> nil) and (Node <> nil) then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := Elem;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    FDiagramWrapperList.Add(AWrapper);
  end;
end;

procedure PXMIToPlasticAdapter.AddViewToList(Elem: IView; Node: IXMLNode);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if (Elem <> nil) and (Node <> nil) then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := Elem;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    FViewWrapperList.Add(AWrapper);
  end;
end;

procedure PXMIToPlasticAdapter.AddStreotypeToList(AWrapper: PXMIStereotypeWrapper);
begin
  if AWrapper <> nil then FStereotypeWrapperList.Add(AWrapper);
end;

procedure PXMIToPlasticAdapter.AddStreotypeToList(Node: IXMLNode);
var
  AWrapper: PXMIStereotypeWrapper;
  XmiId: string;
begin
  if Node <> nil then begin
    if Node.NodeName = NODE_UML_STEREOTYPE then begin
      XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
      if XmiId = '' then Exit;
      AWrapper := PXMIStereotypeWrapper.Create(Node);
      AWrapper.XmiId := XmiId;
      AWrapper.XmiName := Trim(GetPropName(Node));
      AddStreotypeToList(AWrapper);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.AddCommentToList(AWrapper: PXMIElementWrapper);
begin
  if AWrapper <> nil then FCommentWrapperList.Add(AWrapper);
end;

procedure PXMIToPlasticAdapter.AddCommentToList(Node: IXMLNode);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if Node <> nil then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := nil;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    AddCommentToList(AWrapper);
  end;
end;

procedure PXMIToPlasticAdapter.AddConstraintToList(Node: IXMLNode);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if Node <> nil then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := nil;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    FConstraintWrapperList.Add(AWrapper);
  end;
end;

procedure PXMIToPlasticAdapter.AddDataTypeToList(Node: IXMLNode);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if Node <> nil then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := nil;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    FDataTypeWrapperList.Add(AWrapper);
  end;
end;

procedure PXMIToPlasticAdapter.AddParameterToList(Node: IXMLNode);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if Node <> nil then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := nil;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    FParameterWrapperList.Add(AWrapper);
  end;
end;

procedure PXMIToPlasticAdapter.AddActionToList(Node: IXMLNode);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if Node <> nil then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := nil;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    FActionWrapperList.Add(AWrapper);
  end;
end;

procedure PXMIToPlasticAdapter.AddTaggedValueToList(Node: IXMLNode);
var
  AWrapper: PXMIElementWrapper;
  XmiId: string;
begin
  if Node <> nil then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
    if XmiId = '' then Exit;
    AWrapper := PXMIElementWrapper.Create;
    AWrapper.PlasticElement := nil;
    AWrapper.XMLNode := Node;
    AWrapper.XmiId := XmiId;
    FTaggedValueWrapperList.Add(AWrapper);
  end;
end;

function PXMIToPlasticAdapter.GetElementFromList(XmiId: string): IElement;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
begin
  Result := nil;
  if XmiId = '' then Exit;
  for I := FElementWrapperList.Count - 1 downto 0 do begin
    AWrapper := FElementWrapperList.Items[I];
    if AWrapper.XmiId = XmiId then begin
      Result := AWrapper.PlasticElement;
      Break;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetElementFromList(XmiId: string; ElemKind: string): IElement;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
  Elem: IElement;
begin
  Result := nil;
  if ElemKind = '' then GetElementFromList(XmiId);
  if XmiId = '' then Exit;
  for I := FElementWrapperList.Count - 1 downto 0 do begin
    AWrapper := FElementWrapperList.Items[I];
    if AWrapper.XmiId = XmiId then begin
      Elem := AWrapper.PlasticElement;
      if (Elem <> nil) and (Elem.IsKindOf(ElemKind)) then begin
        Result := AWrapper.PlasticElement;
        Exit;
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetParentElement(Node: IXMLNode): IElement;
var
  PN: IXMLNode;
  XmiId: string;
  Elem: IElement;
begin
  Result := nil;
  if Node <> nil then begin
    PN := XMLUtil.GetParentNode(Node);
    if PN <> nil then begin
      XmiId := XMLUtil.GetAttributeValue(PN, ATTR_XMI_ID);
      Elem := GetElementFromList(XmiId);
      if Elem <> nil then begin
        Result := Elem;
        Exit;
      end else begin
        Result := GetParentElement(PN);
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetParentElement(Node: IXMLNode; ElemKind: string): IElement;
var
  PN: IXMLNode;
  XmiId: string;
  Elem: IElement;
begin
  Result := nil;
  if ElemKind = '' then GetParentElement(Node);
  if Node <> nil then begin
    PN := XMLUtil.GetParentNode(Node);
    if PN <> nil then begin
      XmiId := XMLUtil.GetAttributeValue(PN, ATTR_XMI_ID);
      Elem := GetElementFromList(XmiId);
      if Elem <> nil then begin
        Result := GetElementFromList(XmiId, ElemKind);
        Exit;
      end else begin
        Result := GetParentElement(PN, ElemKind);
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetDiagramFromList(XmiId: string): IUMLDiagram;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
begin
  Result := nil;
  if XmiId = '' then Exit;
  for I := 0 to FDiagramWrapperList.Count - 1 do begin
    AWrapper := FDiagramWrapperList.Items[I];
    if AWrapper.XmiId = XmiId then begin
      Result := AWrapper.PlasticElement as IUMLDiagram;
      Break;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstraintFromList(XmiId: string): IXMLnode;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
begin
  Result := nil;
  if XmiId = '' then Exit;
  for I := 0 to FConstraintWrapperList.Count - 1 do begin
    AWrapper := FConstraintWrapperList.Items[I];
    if AWrapper.XmiId = XmiId then begin
      Result := AWrapper.XMLNode;
      Break;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetDataTypeFromList(XmiId: string): string;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
begin
  Result := '';
  if XmiId = '' then Exit;
  for I := 0 to FDataTypeWrapperList.Count - 1 do begin
    AWrapper := FDataTypeWrapperList.Items[I];
    if AWrapper.XmiId = XmiId then begin
      Result := XMLUtil.GetAttributeValue(AWrapper.XMLNode, ATTR_UML_NAME);
      Break;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetParameterFromList(XmiId: string): IXMLNode;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
begin
  Result := nil;
  if XmiId = '' then Exit;
  for I := 0 to FParameterWrapperList.Count - 1 do begin
    AWrapper := FParameterWrapperList.Items[I];
    if AWrapper.XmiId = XmiId then begin
      Result := AWrapper.XMLNode;
      Break;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetActionFromList(XmiId: string): IXMLNode;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
begin
  Result := nil;
  if XmiId = '' then Exit;
  for I := 0 to FActionWrapperList.Count - 1 do begin
    AWrapper := FActionWrapperList.Items[I];
    if AWrapper.XmiId = XmiId then begin
      Result := AWrapper.XMLNode;
      Break;
    end;
  end;
end;

function PXMIToPlasticAdapter.IsStereotypeApplied(Node: IXMLNode; StereotypeName: string): Boolean;
var
  I: Integer;
  AWrapper: PXMIStereotypeWrapper;
begin
  Result := False;
  StereotypeName := LowerCase(Trim(StereotypeName));
  for I := 0 to FStereotypeWrapperList.Count - 1 do begin
    AWrapper := FStereotypeWrapperList.Items[I];
    if LowerCase(AWrapper.XmiName) = StereotypeName then begin
      if AWrapper.IsAppliedXMIElement(Node) then begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetAppliedStereotype(Node: IXMLnode): string;
var
  I: Integer;
  AWrapper: PXMIStereotypeWrapper;
begin
  Result := '';
  for I := 0 to FStereotypeWrapperList.Count - 1 do begin
    AWrapper := FStereotypeWrapperList.Items[I];
    if AWrapper.IsAppliedXMIElement(Node) then begin
      Result := AWrapper.XmiName;
      Break;
    end;
  end;
end;

function PXMIToPlasticAdapter.IndexOfCommentList(Node: IXMLNode): Integer;
var
  XmiId: string;
  SubNode: IXMLNode;
  I: Integer;
  AWrapper: PXMIElementWrapper;
begin
  Result := -1;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_SUBJECT);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_VIEW_SUBJECT);
    if SubNode <> nil then begin
      XmiId := XMLUtil.GetNodeValue(SubNode);
    end;
  end;
  if XmiId <> '' then begin
    for I := 0 to FCommentWrapperList.Count - 1 do begin
      AWrapper := FCommentWrapperList.Items[I];
      if AWrapper.XmiId = XmiId then begin
        Result := I;
        Break;
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamNamespace(Node: IXMLNode): IUMLNamespace;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_NAMESPACE);
  Elem := GetElementFromList(XmiId, UML_NAMESPACE);
  if Elem <> nil then begin
    Result := Elem as IUMLNamespace;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_MODEL_ELEMENT_NAMESPACE);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_NAMESPACE);
    if Elem <> nil then begin
      Result := Elem as IUMLNamespace;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_NAMESPACE);
  if Elem <> nil then begin
    Result := Elem as IUMLNamespace;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamModelElement(Node: IXMLNode): IUMLModelElement;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_CONTEXT);
  Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
  if Elem <> nil then begin
    Result := Elem as IUMLModelElement;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_STATE_MACHINE_CONTEXT);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
    if Elem <> nil then begin
      Result := Elem as IUMLModelElement;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_MODEL_ELEMENT);
  if Elem <> nil then begin
    Result := Elem as IUMLModelElement;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamCollaborationClassifier(Node: IXMLNode): IUMLClassifier;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_REPRESENTED_CLASSIFIER);
  Elem := GetElementFromList(XmiId, UML_CLASSIFIER);
  if Elem <> nil then begin
    Result := Elem as IUMLClassifier;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_COLLABORATION_REPRESENTED_CLASSIFIER);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if Elem <> nil then begin
      Result := Elem as IUMLClassifier;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_CLASSIFIER);
  if Elem <> nil then begin
    Result := Elem as IUMLClassifier;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamCollaborationOperation(Node: IXMLNode): IUMLOperation;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_REPRESENTED_OPERATION);
  Elem := GetElementFromList(XmiId, UML_OPERATION);
  if Elem <> nil then begin
    Result := Elem as IUMLOperation;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_COLLABORATION_REPRESENTED_OPERATION);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_OPERATION);
    if Elem <> nil then begin
      Result := Elem as IUMLOperation;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_OPERATION);
  if Elem <> nil then begin
    Result := Elem as IUMLOperation;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamCollaboration(Node: IXMLNode): IUMLCollaboration;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_CONTEXT);
  Elem := GetElementFromList(XmiId, UML_COLLABORATION);
  if Elem <> nil then begin
    Result := Elem as IUMLCollaboration;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_INTERACTION_CONTEXT);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_COLLABORATION);
    if Elem <> nil then begin
      Result := Elem as IUMLCollaboration;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_COLLABORATION);
  if Elem <> nil then begin
    Result := Elem as IUMLCollaboration;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamInteraction(Node: IXMLNode): IUMLInteraction;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_INTERACTION);
  Elem := GetElementFromList(XmiId, UML_INTERACTION);
  if Elem <> nil then begin
    Result := Elem as IUMLInteraction;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_MESSAGE_INTERACTION);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_INTERACTION);
    if Elem <> nil then begin
      Result := Elem as IUMLInteraction;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_INTERACTION);
  if Elem <> nil then begin
    Result := Elem as IUMLInteraction;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamCompositeState(Node: IXMLNode): IUMLCompositeState;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_CONTAINER);
  Elem := GetElementFromList(XmiId, UML_COMPOSITE_STATE);
  if Elem <> nil then begin
    Result := Elem as IUMLCompositeState;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_STATE_VERTEX_CONTAINER);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_COMPOSITE_STATE);
    if Elem <> nil then begin
      Result := Elem as IUMLCompositeState;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_COMPOSITE_STATE);
  if Elem <> nil then begin
    Result := Elem as IUMLCompositeState;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamActivityGraph(Node: IXMLNode): IUMLActivityGraph;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_ACTIVITYGRAPH);
  Elem := GetElementFromList(XmiId, UML_ACTIVITYGRAPH);
  if Elem <> nil then begin
    Result := Elem as IUMLActivityGraph;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_PARTITION_ACTIVITY_GRAPH);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_ACTIVITYGRAPH);
    if Elem <> nil then begin
      Result := Elem as IUMLActivityGraph;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_ACTIVITYGRAPH);
  if Elem <> nil then begin
    Result := Elem as IUMLActivityGraph;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamClassifier(Node: IXMLNode): IUMLClassifier;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_OWNER);
  Elem := GetElementFromList(XmiId, UML_CLASSIFIER);
  if Elem <> nil then begin
    Result := Elem as IUMLClassifier;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_FEATURE_OWNER);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if Elem <> nil then begin
      Result := Elem as IUMLClassifier;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_CLASSIFIER);
  if Elem <> nil then begin
    Result := Elem as IUMLClassifier;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamBehavioralFeature(Node: IXMLNode): IUMLBehavioralFeature;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_BEHAVIORAL_FEATURE);
  Elem := GetElementFromList(XmiId, UML_BEHAVIORAL_FEATURE);
  if Elem <> nil then begin
    Result := Elem as IUMLBehavioralFeature;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_PARAMETER_BEHAVIORAL_FEATURE);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_BEHAVIORAL_FEATURE);
    if Elem <> nil then begin
      Result := Elem as IUMLBehavioralFeature;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_BEHAVIORAL_FEATURE);
  if Elem <> nil then begin
    Result := Elem as IUMLBehavioralFeature;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamOfTemplateParameter(Node: IXMLNode): IUMLModelElement;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_MODEL_ELEMENT);
  Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
  if Elem <> nil then begin
    Result := Elem as IUMLModelElement;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TEMPLATE_PARAMETER_MODEL_ELEMENT);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
    if Elem <> nil then begin
      Result := Elem as IUMLModelElement;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_MODEL_ELEMENT);
  if Elem <> nil then begin
    Result := Elem as IUMLModelElement;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamStateMachine(Node: IXMLNode): IUMLStateMachine;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_STATE_MACHINE);
  Elem := GetElementFromList(XmiId, UML_STATE_MACHINE);
  if Elem <> nil then begin
    Result := Elem as IUMLStateMachine;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TRANSITION_STATEMACHINE);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_STATE_MACHINE);
    if Elem <> nil then begin
      Result := Elem as IUMLStateMachine;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_STATE_MACHINE);
  if Elem <> nil then begin
    Result := Elem as IUMLStateMachine;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamStateVertexSource(Node: IXMLNode): IUMLStateVertex;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_SOURCE);
  Elem := GetElementFromList(XmiId, UML_STATE_VERTEX);
  if Elem <> nil then begin
    Result := Elem as IUMLStateVertex;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TRANSITION_SOURCE);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_STATE_VERTEX);
    if Elem <> nil then begin
      Result := Elem as IUMLStateVertex;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamStateVertexTarget(Node: IXMLNode): IUMLStateVertex;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_TARGET);
  Elem := GetElementFromList(XmiId, UML_STATE_VERTEX);
  if Elem <> nil then begin
    Result := Elem as IUMLStateVertex;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TRANSITION_TARGET);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_STATE_VERTEX);
    if Elem <> nil then begin
      Result := Elem as IUMLStateVertex;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamTransition(Node: IXMLNode): IUMLTransition;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
  I, J: Integer;
  AWrapper: PXMIElementWrapper;
  RefId: string;
  Arr: PStrArray;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_TRANSITION);
  Elem := GetElementFromList(XmiId, UML_TRANSITION);
  if Elem <> nil then begin
    Result := Elem as IUMLTransition;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_EVENT_TRANSITION);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_TRANSITION);
    if Elem <> nil then begin
      Result := Elem as IUMLTransition;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_TRANSITION);
  if Elem <> nil then begin
    Result := Elem as IUMLTransition;
    Exit;
  end;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_XMI_ID);
  for I := FElementWrapperList.Count - 1 downto 0 do begin
    AWrapper := FElementWrapperList.Items[I];
    Elem := AWrapper.PlasticElement;
    if (Elem <> nil) and (Elem.IsKindOf(UML_TRANSITION)) then begin
      SubNode := AWrapper.XMLNode;
      if SubNode = nil then Continue;
      RefId := XMLUtil.GetAttributeValue(SubNode, ATTR_UML_TRIGGER);
      if RefId = '' then RefId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
      if RefId = '' then Continue;
      Arr := SplitStringWithMatch(RefId, ' ');
      for J := 0 to Length(Arr) - 1 do begin
        if Arr[J] = XmiId then begin
          Result := Elem as IUMLTransition;
          Exit;
        end;
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamClassifierRoleCollaboration(Node: IXMLNode): IUMLCollaboration;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_NAMESPACE);
  Elem := GetElementFromList(XmiId, UML_COLLABORATION);
  if Elem <> nil then begin
    Result := Elem as IUMLCollaboration;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_MODEL_ELEMENT_NAMESPACE);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_COLLABORATION);
    if Elem <> nil then begin
      Result := Elem as IUMLCollaboration;
      Exit;
    end;
  end;
  Elem := GetParentElement(Node, UML_COLLABORATION);
  if Elem <> nil then begin
    Result := Elem as IUMLCollaboration;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamOfQualifier(Node: IXMLNode): IUMLAssociationEnd;
var
  XmiId: string;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_ASSOCIATION_END);
  Elem := GetElementFromList(XmiId, UML_ASSOCIATION_END);
  if Elem <> nil then begin
    Result := Elem as IUMLAssociationEnd;
    Exit;
  end;
  Elem := GetParentElement(Node, UML_ASSOCIATION_END);
  if Elem <> nil then begin
    Result := Elem as IUMLAssociationEnd;
    Exit;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamAssociationEnd(Node: IXMLNode; IsEnd2: Boolean): IUMLClassifier;
var
  XN, SN: IXMLNode;
  XmiId: string;
  Elem: IElement;
begin
  Result := nil;
  XN := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOCIATION_CONNECTION);
  if XN = nil then Exit;
  SN := XMLUtil.FindFirstNode(XN, NODE_UML_ASSOCIATION_END);
  if SN = nil then Exit;
  if IsEnd2 then begin
    SN := XMLUtil.FindSecondNode(XN, NODE_UML_ASSOCIATION_END);
    if SN = nil then Exit;
  end;
  XmiId := XMLUtil.GetAttributeValue(SN, ATTR_UML_TYPE);
  Elem := GetElementFromList(XmiId, UML_CLASSIFIER);
  if Elem <> nil then begin
    Result := Elem as IUMLClassifier;
    Exit;
  end;
  SN := XMLUtil.FindFirstNode(SN, NODE_UML_ASSOCIATION_END_TYPE);
  if SN <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SN);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SN, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if Elem <> nil then begin
      Result := Elem as IUMLClassifier;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamAssociationEndRole(Node: IXMLNode;
  IsEnd2: Boolean): IUMLClassifier;
var
  XN, SN: IXMLNode;
  XmiId: string;
  Elem: IElement;
begin
  Result := nil;
  XN := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOCIATION_CONNECTION);
  if XN = nil then Exit;
  SN := XMLUtil.FindFirstNode(XN, NODE_UML_ASSOCIATION_END_ROLE);
  if SN = nil then Exit;
  if IsEnd2 then begin
    SN := XMLUtil.FindSecondNode(XN, NODE_UML_ASSOCIATION_END_ROLE);
    if SN = nil then Exit;
  end;
  XmiId := XMLUtil.GetAttributeValue(SN, ATTR_UML_TYPE);
  Elem := GetElementFromList(XmiId, UML_CLASSIFIER);
  if Elem <> nil then begin
    Result := Elem as IUMLClassifier;
    Exit;
  end;
  SN := XMLUtil.FindFirstNode(SN, NODE_UML_ASSOCIATION_END_TYPE);
  if SN <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SN);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SN, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if Elem <> nil then begin
      Result := Elem as IUMLClassifier;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamClient(Node: IXMLNode): IUMLModelElement;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_CLIENT);
  Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
  if Elem <> nil then begin
    Result := Elem as IUMLModelElement;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_DEPENDENCY_CLIENT);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
    if Elem <> nil then begin
      Result := Elem as IUMLModelElement;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamSupplier(Node: IXMLNode): IUMLModelElement;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_SUPPLIER);
  Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
  if Elem <> nil then begin
    Result := Elem as IUMLModelElement;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_DEPENDENCY_SUPPLIER);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
    if Elem <> nil then begin
      Result := Elem as IUMLModelElement;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamParent(Node: IXMLNode): IUMLGeneralizableElement;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_PARENT);
  Elem := GetElementFromList(XmiId, UML_GENERALIZABLE);
  if Elem <> nil then begin
    Result := Elem as IUMLGeneralizableElement;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_GENERALIZATION_PARENT);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_GENERALIZABLE);
    if Elem <> nil then begin
      Result := Elem as IUMLGeneralizableElement;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamChild(Node: IXMLNode): IUMLGeneralizableElement;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_CHILD);
  Elem := GetElementFromList(XmiId, UML_GENERALIZABLE);
  if Elem <> nil then begin
    Result := Elem as IUMLGeneralizableElement;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_GENERALIZATION_CHILD);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_GENERALIZABLE);
    if Elem <> nil then begin
      Result := Elem as IUMLGeneralizableElement;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamUseCase(Node: IXMLNode; AttrName,
  NodeName: string): IUMLUseCase;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, AttrName);
  Elem := GetElementFromList(XmiId, UML_USECASE);
  if Elem <> nil then begin
    Result := Elem as IUMLUseCase;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NodeName);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_USECASE);
    if Elem <> nil then begin
      Result := Elem as IUMLUseCase;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamClassifierRole(Node: IXMLNode;
  AttrName, NodeName: string): IUMLClassifierRole;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, AttrName);
  Elem := GetElementFromList(XmiId, UML_CLASSIFIER_ROLE);
  if Elem <> nil then begin
    Result := Elem as IUMLClassifierRole;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NodeName);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_CLASSIFIER_ROLE);
    if Elem <> nil then begin
      Result := Elem as IUMLClassifierRole;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamCommConnection(Node: IXMLNode): IUMLAssociationRole;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_COMM_CONN);
  Elem := GetElementFromList(XmiId, UML_ASSOCIATION_ROLE);
  if Elem <> nil then begin
    Result := Elem as IUMLAssociationRole;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_MESSAGE_CONNECTION);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_ASSOCIATION_ROLE);
    if Elem <> nil then begin
      Result := Elem as IUMLAssociationRole;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamEffectTransition(Node: IXMLNode): IUMLTransition;
var
  PN: IXMLNode;
  XmiId: string;
  Elem: IElement;
begin
  Result := nil;
  PN := XMLUtil.FindFirstParentNode(Node, NODE_UML_TRANSITION);
  if PN <> nil then begin
    XmiId := XMLUtil.GetAttributeValue(PN, ATTR_XMI_ID);
    Elem := GetElementFromList(XmiId, UML_TRANSITION);
    if Elem <> nil then begin
      Result := Elem as IUMLTransition;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamState(Node: IXMLNode): IUMLState;
var
  PN: IXMLNode;
  XmiId: string;
  Elem: IElement;
begin
  Result := nil;
  PN := XMLUtil.FindFirstParentNode(Node, NODE_UML_STATE_ENTRY);
  if PN = nil then PN := XMLUtil.FindFirstParentNode(Node, NODE_UML_STATE_DO_ACTIVITY);
  if PN = nil then PN := XMLUtil.FindFirstParentNode(Node, NODE_UML_STATE_EXIT);
  if PN <> nil then begin
    PN := XMLUtil.GetParentNode(PN);
    if PN = nil then Exit;
    XmiId := XMLUtil.GetAttributeValue(PN, ATTR_XMI_ID);
    Elem := GetElementFromList(XmiId, UML_STATE);
    if Elem <> nil then begin
      Result := Elem as IUMLState;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamDiagramType(Node: IXMLNode): string;
var
  Str: string;
  SubNode: IXMLNode;
begin
  Result := '';
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_DIAGRAM_TYPE);
  if Str <> '' then begin
    Result := Str;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_DIAGRAM_TYPE);
  if SubNode <> nil then
    Result := XMLUtil.GetNodeValue(SubNode);
end;

function PXMIToPlasticAdapter.GetConstructParamDiagramOwner(Node: IXMLNode): IUMLModelElement;
var
  XmiId: string;
  SubNode: IXMLNode;
  Elem: IElement;
begin
  Result := nil;
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_OWNER);
  Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
  if Elem <> nil then begin
    Result := Elem as IUMLModelElement;
    Exit;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_DIAGRAM_OWNER);
  if SubNode <> nil then begin
    XmiId := XMLUtil.GetNodeValue(SubNode);
    if XmiId = '' then XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    Elem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
    if Elem <> nil then begin
      Result := Elem as IUMLModelElement;
      Exit;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamViewModel(Node: IXMLNode): IModel;
var
  I: Integer;
  XmiId, Str: string;
  ElemNode, SubNode: IXMLNode;
  AWrapper: PXMIElementWrapper;
  Elem: IElement;
begin
  Result := nil;
  XmiId := GetPropValue2(Node, ATTR_UML_SUBJECT, NODE_UML_VIEW_SUBJECT);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_VIEW_SUBJECT);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId = '' then Exit;

  for I := 0 to FElementWrapperList.Count - 1 do begin
    AWrapper := FElementWrapperList.Items[I];
    if AWrapper.XmiId = XmiId then begin

      ElemNode := AWrapper.XMLNode;
      if ElemNode <> nil then begin
        if ElemNode.NodeName = NODE_UML_ASSOCIATION_CLASS then begin
          Str := GetPropDiagramElemStyle(Node);
          if Pos(ATTR_UML_ASSOCIATION2, Str) > 0 then begin
            Elem := AWrapper.PlasticElement;
            if (Elem <> nil) and (Elem.IsKindOf(UML_ASSOCIATION_CLASS)) then begin
              Result := Elem as IModel;
              Exit;
            end;
          end else begin
            Elem := AWrapper.PlasticElement;
            if (Elem <> nil) and (Elem.IsKindOf(UML_CLASS)) then begin
              Result := Elem as IModel;
              Exit;
            end;
          end;
        end else begin
          Elem := AWrapper.PlasticElement;
          if (Elem <> nil) and (Elem.IsKindOf(ELEM_MODEL)) then begin
            Result := Elem as IModel;
            Exit;
          end;
        end;
      end;

    end;
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamGeometry(Node: IXMLNode): PStrArray;
var
  Ret: PStrArray;
  Strs: string;
  SubNode: IXMLNode;
begin
  SetLength(Ret, 0);
  Result := Ret;
  if Node <> nil then begin
    Strs := XMLUtil.GetAttributeValue(Node, ATTR_UML_GEOMETRY);
    if Strs = '' then begin
      SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_VIEW_GEOMETRY);
      if SubNode <> nil then Strs := XMLUtil.GetNodeValue(SubNode);
    end;
    if Strs <> '' then Result := SplitStringWithMatch(Strs, ',');
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamAnnotatedElems(Node: IXMLNode): PStrArray;
var
  Ret: PStrArray;
  Strs: string;
begin
  SetLength(Ret, 0);
  Result := Ret;
  if Node <> nil then begin
    Strs := GetPropValue2(Node, ATTE_UML_ANNOTATED_ELEM, NODE_UML_ANNOTATED_ELEM);
    if Strs <> '' then Result := SplitStringWithMatch(Strs, ' ');
  end;
end;

function PXMIToPlasticAdapter.GetConstructParamAnnotatedElemView(DiagramView: IDiagramView;
  XmiId: string): IView;
var
  Elem: IElement;
  I: Integer;
  AModel: IModel;
  AView: IView;
begin
  Result := nil;
  Elem := GetElementFromList(XmiId, ELEM_MODEL);
  if Elem <> nil then begin
    AModel := Elem as IModel;
    for I := 0 to AModel.GetViewCount - 1 do begin
      AView := AModel.GetViewAt(I);
      if AView.OwnerDiagramView = DiagramView then begin
        Result := AView;
        Break;
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetOwnedViewCount(DiagramView: IDiagramView; Elem: IModel): Integer;
var
  AView: IView;
  I, J, C: Integer;
begin
  C := 0;
  for I := 0 to Elem.GetViewCount - 1 do begin
    AView := Elem.GetViewAt(I);
    for J := 0 to DiagramView.GetOwnedViewCount - 1 do begin
      if DiagramView.GetOwnedViewAt(J) = AView then begin
        Inc(C);
        Break;
      end;
    end;
    if C >= 2 then Break;
  end;
  Result := C;
end;

function PXMIToPlasticAdapter.GetOwnedViewOfModel(DiagramView: IDiagramView; Elem: IModel): IView;
var
  AView: IView;
  I, J: Integer;
begin
  Result := nil;
  for I := 0 to DiagramView.GetOwnedViewCount - 1 do begin
    AView := DiagramView.GetOwnedViewAt(I);
    if AView.Model = nil then Continue; 
    if AView.Model.Pathname = Elem.Pathname then begin
      for J := 0 to Elem.GetViewCount - 1 do begin
        if Elem.GetViewAt(J) = AView then begin
          Result := AView;
          Exit;
        end;
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.GetOwnedViewByCoordinate(DiagramView: IDiagramView;
  Node: IXMLNode; Elem: IModel): IView;
var
  I: Integer;
  AWrapper: PXMIElementWrapper;
  AView: IView;
  AModel: IModel;
  N: IXMLNode;
  OwnerArr, OwnedArr: PStrArray;
begin
  Result := nil;
  for I := 0 to FViewWrapperList.Count - 1 do begin
    AWrapper := FViewWrapperList.Items[I];
    AView := AWrapper.PlasticElement as IView;
    if AView.OwnerDiagramView = DiagramView then begin
      AModel := AView.Model;
      if AModel = nil then Continue;
      if (AModel.Pathname = Elem.Pathname) and
         (AModel.GetClassName = Elem.GetClassName) then
      begin
        N := AWrapper.XMLNode;
        if N <> nil then begin
          OwnerArr := GetConstructParamGeometry(N);
          OwnedArr := GetConstructParamGeometry(Node);
          if IsContainedCoordinate(OwnerArr, OwnedArr) then begin
            Result := AView;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.IsNodeTypeView(Elem: IModel): Boolean;
var
  ElemType: string;
begin
  Result := False;
  ElemType := Elem.GetClassName;
  if (ElemType = UML_MODEL) or (ElemType = UML_SUBSYSTEM) or
     (ElemType = UML_PACKAGE) or (ElemType = UML_CLASS) or
     (ElemType = UML_INTERFACE) or (ElemType = UML_ENUMERATION) or
     (ElemType = UML_SIGNAL) or (ElemType = UML_EXCEPTION) or
     (ElemType = UML_COMPONENT) or (ElemType = UML_COMPONENT_INSTANCE) or
     (ElemType = UML_NODE) or (ElemType = UML_NODE_INSTANCE) or
     (ElemType = UML_ACTOR) or (ElemType = UML_USECASE) or
     (ElemType = UML_COLLABORATION) or (ElemType = UML_OBJECT) or
     (ElemType = UML_CLASSIFIER_ROLE) or (ElemType = UML_COMPOSITE_STATE) or
     (ElemType = UML_SUBMACHINE_STATE) or (ElemType = UML_PSEUDO_STATE) or
     (ElemType = UML_FINAL_STATE) or (ElemType = UML_ACTION_STATE) or
     (ElemType = UML_SUBACTIVITY_STATE) or (ElemType = UML_PARTITION)
  then Result := True;
end;

function PXMIToPlasticAdapter.IsEdgeTypeView(Elem: IModel): Boolean;
var
  ElemType: string;
begin
  Result := False;
  ElemType := Elem.GetClassName;
  if (ElemType = UML_GENERALIZATION) or (ElemType = UML_ASSOCIATION) or
     (ElemType = UML_ASSOCIATION_CLASS) or (ElemType = UML_DEPENDENCY) or
     (ElemType = UML_REALIZATION) or (ElemType = UML_INCLUDE) or
     (ElemType = UML_EXTEND) or (ElemType = UML_LINK) or
     (ElemType = UML_ASSOCIATION_ROLE) or (ElemType = UML_MESSAGE) or
     (ElemType = UML_TRANSITION)
  then Result := True;
end;

function PXMIToPlasticAdapter.GetPropValue(Node: IXMLNode; Attr, NodeName: string): string;
var
  Str: string;
  SubNode: IXMLNode;
begin
  Str := '';
  if NodeName <> '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NodeName);
    if SubNode <> nil then Str := XMLUtil.GetAttributeValue(SubNode, ATTR_XMI_VALUE);
  end;
  if (Str = '') and (Attr <> '') then Str := XMLUtil.GetAttributeValue(Node, Attr);
  Result := Str;
end;

function PXMIToPlasticAdapter.GetPropValue2(Node: IXMLNode; Attr, NodeName: string): string;
var
  Str: string;
  SubNode: IXMLNode;
begin
  Str := '';
  if NodeName <> '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NodeName);
    if SubNode <> nil then Str := XMLUtil.GetNodeValue(SubNode);
  end;
  if (Str = '') and (Attr <> '') then Str := XMLUtil.GetAttributeValue(Node, Attr);
  Result := Str;
end;

function PXMIToPlasticAdapter.GetPropName(Node: IXMLNode): string;
begin
  Result := GetPropValue2(Node, ATTR_UML_NAME, NODE_UML_MODEL_ELEMENT_NAME);
end;

function PXMIToPlasticAdapter.GetPropExpressionValue(Node: IXMLNode): string;
var
  SN: IXMLNode;
begin
  Result := '';
  SN := XMLUtil.FindFirstNode(Node, NODE_UML_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_OBJECT_SET_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_TIME_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_BOOLEAN_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_ACTION_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_ITERATION_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_TYPE_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_ARG_LIST_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_MAPPING_EXPR);
  if SN = nil then SN := XMLUtil.FindFirstNode(Node, NODE_UML_PROCEDURE_EXPR);
  if SN <> nil then begin
    Result := XMLUtil.GetAttributeValue(SN, ATTR_UML_BODY);
    if Result = '' then begin
      SN := XMLUtil.FindFirstNode(SN, NODE_UML_EXPRESSION_BODY);
      if SN <> nil then Result := XMLUtil.GetNodeValue(SN);
    end;
  end;
end;

function PXMIToPlasticAdapter.GetPropMultiplicity(Node: IXMLNode): string;
var
  SN: IXMLNode;
  LowerStr, UpperStr: string;
begin
  Result := '';
  SN := XMLUtil.FindFirstNode(Node, NODE_UML_MULTIPLICITY, True);
  if SN = nil then Exit;
  SN := XMLUtil.FindFirstNode(SN, NODE_UML_MULTIPLICITY_RANGE, True);
  if SN <> nil then begin
    LowerStr := GetPropValue(SN, ATTR_UML_LOWER, NODE_UML_MULTI_RANGE_LOWER);
    UpperStr := GetPropValue(SN, ATTR_UML_UPPER, NODE_UML_MULTI_RANGE_UPPER);
    if LowerStr = '-1' then LowerStr := '*';
    if UpperStr = '-1' then UpperStr := '*';
    if LowerStr = UpperStr then Result := LowerStr
    else Result := LowerStr + '..' + UpperStr;
  end;
end;

function PXMIToPlasticAdapter.GetPropDiagramStyle(Node: IXMLNode): string;
begin
  Result := GetPropValue2(Node, ATTR_UML_STYLE, NODE_UML_DIAGRAM_STYLE);
end;

function PXMIToPlasticAdapter.GetPropDiagramElemStyle(Node: IXMLNode): string;
begin
  Result := GetPropValue2(Node, ATTR_UML_STYLE, NODE_UML_DIAGRAM_ELEM_STYLE);
end;

function PXMIToPlasticAdapter.GetPropDiagramElemStyleValue(Node: IXMLNode; StyleName: string): string;
var
  Str: string;
  Idx: Integer;
begin
  Result := '';
  Str := GetPropDiagramElemStyle(Node);
  if (Str <> '') and (StyleName <> '') then begin
    Idx := Pos(StyleName, Str);
    if Idx > 0 then begin
      Str := Copy(Str, Idx, Length(Str) - Idx + 1);
      Idx := Pos('=', Str);
      Str := Copy(Str, Idx + 1, Length(Str) - Idx - 1);
      Idx := Pos(',', Str);
      if Idx > 0 then begin
        Str := Copy(Str, 1, Idx - 1);
        Result := Trim(Str);
      end;
    end;
  end;
end;

function PXMIToPlasticAdapter.ConvertElemToRoseView(XMLNode: IXMLNode): Boolean;
var
  Str: string;
  Elem: IModel;
begin
  Result := False;
  Str := GetPropName(XMLNode);
  if Str = ROSE_USECASE_VIEW then begin
    Elem := Project.FindByName(ROSE_USECASE_VIEW);
    if Elem <> nil then begin
      AddElementToList(Elem, XMLNode, True);
      Result := True;
    end;
  end else if Str = ROSE_COMPONENT_VIEW then begin
    Elem := Project.FindByName(ROSE_COMPONENT_VIEW);
    if Elem <> nil then begin
      AddElementToList(Elem, XMLNode, True);
      Result := True;
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemModel(XMLNode: IXMLNode);
var
  NS: IUMLNamespace;
  Elem: IUMLModel;
begin
  if RationalApproachMode then
    if ConvertElemToRoseView(XMLNode) then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateModel(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemSubsystem(XMLNode: IXMLNode);
var
  NS: IUMLNamespace;
  Elem: IUMLSubsystem;
begin
  if RationalApproachMode then
    if ConvertElemToRoseView(XMLNode) then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateSubsystem(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemPackage(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLPackage;
begin
  if RationalApproachMode then
    if ConvertElemToRoseView(XMLNode) then Exit;

  PN := XMLUtil.GetParentNode(XMLNode);
  if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ELEM_IMPORT_PACKAGE) then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreatePackage(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemClass(XMLNode: IXMLNode);
var
  NS: IUMLNamespace;
  Elem: IUMLClassifier;
begin
  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    if not IsStereotypeApplied(XMLNode, TYPE_ENUMERATION) then
      Elem := Factory.CreateClass(NS)
    else
      Elem := Factory.CreateEnumeration(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemInterface(XMLNode: IXMLNode);
var
  NS: IUMLNamespace;
  Elem: IUMLInterface;
begin
  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateInterface(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemSignal(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLSignal;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_SEND_ACTION_SIGNAL);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_RECEPTION_SIGNAL);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_SIGNAL_EVENT_SIGNAL);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateSignal(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemException(XMLNode: IXMLNode);
var
  NS: IUMLNamespace;
  Elem: IUMLException;
begin
  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateException(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemComponent(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLComponent;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_NODE_RESIDENT);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ELEMENT_RESIDENCE_IMPLEMENTATION_LOCATION);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateComponent(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemComponentInstance(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLComponentInstance;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_NODE_INSTANCE_RESIDENT);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_INSTANCE_COMPONENT_INSTANCE);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateComponentInstance(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemNode(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLNode;
begin
  if RationalApproachMode then begin
    NS := Project.FindByName(ROSE_DEPLOYMENT_VIEW) as IUMLNamespace;
    if NS <> nil then begin
      Elem := Factory.CreateNode(NS);
      AddElementToList(Elem, XMLNode);
      Exit;
    end;
  end;

  PN := XMLUtil.GetParentNode(XMLNode);
  if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_COMPONENT_DEPLOYMENT_LOCATION) then
    Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateNode(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemNodeInstance(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLNodeInstance;
begin
  if RationalApproachMode then begin
    NS := Project.FindByName(ROSE_DEPLOYMENT_VIEW) as IUMLNamespace;
    if NS <> nil then begin
      Elem := Factory.CreateNodeInstance(NS);
      AddElementToList(Elem, XMLNode);
      Exit;
    end;
  end;

  PN := XMLUtil.GetParentNode(XMLNode);
  if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_COMPONENT_INSTANCE_NODE_INSTANCE) then
    Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateNodeInstance(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemUseCase(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLUseCase;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_EXTEND_BASE);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_EXTEND_EXTENSION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_INCLUDE_ADDITION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_INCLUDE_BASE);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_EXTENSION_POINT_USECASE);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateUseCase(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemActor(XMLNode: IXMLNode);
var
  NS: IUMLNamespace;
  Elem: IUMLActor;
begin
  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateActor(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_NAMESPACE);
end;

procedure PXMIToPlasticAdapter.ConvertElemActivityGraph(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLModelElement;
  Elem: IUMLActivityGraph;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_PARTITION_ACTIVITY_GRAPH) then Exit;

  NS := GetConstructParamModelElement(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateActivityGraph(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONTEXT);
end;

procedure PXMIToPlasticAdapter.ConvertElemStateMachine(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLModelElement;
  Elem: IUMLStateMachine;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_STATE_STATEMACHINE);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_TRANSITION_STATEMACHINE);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_SUBMACHINESTATE_SUBMACHINE);
  if B then Exit;

  NS := GetConstructParamModelElement(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateStateMachine(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONTEXT);
end;

procedure PXMIToPlasticAdapter.ConvertElemCollaboration(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLClassifier;
  NS2: IUMLOperation;
  Elem: IUMLCollaboration;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_INTERACTION_CONTEXT) then Exit;

  NS := GetConstructParamCollaborationClassifier(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateCollaboration(NS);
    AddElementToList(Elem, XMLNode);
  end else begin
    NS2 := GetConstructParamCollaborationOperation(XMLNode);
    if NS2 <> nil then begin
      Elem := Factory.CreateCollaboration2(NS2);
      AddElementToList(Elem, XMLNode);
    end;
  end;
  if Elem = nil then 
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER);
end;

procedure PXMIToPlasticAdapter.ConvertElemInteraction(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLCollaboration;
  Elem: IUMLInteraction;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_MESSAGE_INTERACTION) then Exit;

  NS := GetConstructParamCollaboration(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateInteraction(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_COLLABORATION);
end;

procedure PXMIToPlasticAdapter.ConvertElemTopState(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  XmiId: string;
  Elem: IElement;
  Top: IUMLState;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if PN <> nil then begin
    PN := XMLUtil.GetParentNode(PN);
    if PN <> nil then begin
      XmiId := XMLUtil.GetAttributeValue(PN, ATTR_XMI_ID);
      Elem := GetElementFromList(XmiId, UML_STATE_MACHINE);
      if Elem <> nil then begin
        Top := (Elem as IUMLStatemachine).Top;
        if Top <> nil then AddElementToList(Top, XMLNode);
      end;
    end;
  end;
  if Top = nil then
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_TOP_STATE);
end;

procedure PXMIToPlasticAdapter.ConvertElemActionState(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLCompositeState;
  Elem: IUMLActionState;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if PN <> nil then begin
    if (PN.NodeName = NODE_UML_STATE_MACHINE_TOP) then begin
      ConvertElemTopState(XMLNode);
      Exit;
    end;
  end;

  NS := GetConstructParamCompositeState(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateActionState(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER_STATE);
end;

procedure PXMIToPlasticAdapter.ConvertElemSubactivityState(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLCompositeState;
  Elem: IUMLSubactivityState;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if PN <> nil then begin
    if (PN.NodeName = NODE_UML_STATE_MACHINE_TOP) then begin
      ConvertElemTopState(XMLNode);
      Exit;
    end;
  end;

  NS := GetConstructParamCompositeState(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateSubactivityState(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER_STATE);
end;

procedure PXMIToPlasticAdapter.ConvertElemPseudostate(XMLNode: IXMLNode);
var
  Str: string;
  NS: IUMLCompositeState;
  Elem: IUMLPseudostate;
begin
  Str := GetPropValue(XMLNode, ATTR_UML_KIND, NODE_UML_PSEUDO_KIND);
  if (Str <> '') and (Str = ATTR_UML_FINAL) then begin
    ConvertElemFinalState(XMLNode);
    Exit;
  end;

  NS := GetConstructParamCompositeState(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreatePseudostate(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER_STATE);
end;

procedure PXMIToPlasticAdapter.ConvertElemFinalState(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLCompositeState;
  Elem: IUMLFinalState;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if PN <> nil then begin
    if (PN.NodeName = NODE_UML_STATE_MACHINE_TOP) then begin
      ConvertElemTopState(XMLNode);
      Exit;
    end;
  end;

  NS := GetConstructParamCompositeState(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateFinalState(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER_STATE);
end;

procedure PXMIToPlasticAdapter.ConvertElemSubmachineState(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLCompositeState;
  Elem: IUMLSubmachineState;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if PN <> nil then begin
    if (PN.NodeName = NODE_UML_STATE_MACHINE_TOP) then begin
      ConvertElemTopState(XMLNode);
      Exit;
    end;
  end;

  NS := GetConstructParamCompositeState(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateSubmachineState(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER_STATE);
end;

procedure PXMIToPlasticAdapter.ConvertElemPartition(XMLNode: IXMLNode);
var
  NS: IUMLActivityGraph;
  Elem: IUMLPartition;
begin
  NS := GetConstructParamActivityGraph(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreatePartition(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_ACTIVITY_GRAPH);
end;

procedure PXMIToPlasticAdapter.ConvertElemAttribute(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLClassifier;
  Elem: IUMLModelElement;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ATTRIBUTE_LINK_ATTRIBUTE);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ASSOCIATION_END_ROLE_AVAILABLE_QUALIFIER);
  if B then Exit;
  if (PN <> nil) and (PN.NodeName = NODE_UML_ASSOCIATION_END_QUALIFIER) then
    Exit;
  
  NS := GetConstructParamClassifier(XMLNode);
  if NS <> nil then begin
    if NS.IsKindOf(UML_ENUMERATION) then
      Elem := Factory.CreateEnumerationLiteral(NS as IUMLEnumeration)
    else
      Elem := Factory.CreateAttribute(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CLASSIFIER);
end;

procedure PXMIToPlasticAdapter.ConvertElemQualifier(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLAssociationEnd;
  Elem: IUMLAttribute;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if (PN <> nil) and (PN.NodeName = NODE_UML_ASSOCIATION_END_QUALIFIER) then begin
    NS := GetConstructParamOfQualifier(XMLNode);
    if NS <> nil then begin
      Elem := Factory.CreateQualifier(NS);
      AddElementToList(Elem, XMLNode);
    end
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_ASSOC_END);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemOperation(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLClassifier;
  Elem: IUMLOperation;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_METHOD_SPECIFICATION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_CALL_ACTION_OPERATION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_CALL_EVENT_OPERATION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_COLLABORATION_REPRESENTED_OPERATION);
  if B then Exit;

  NS := GetConstructParamClassifier(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateOperation(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CLASSIFIER);
end;

procedure PXMIToPlasticAdapter.ConvertElemParameter(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLBehavioralFeature;
  Elem: IUMLParameter;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_EVENT_PARAMETER);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_OBJECT_FLOW_STATE_PARAMETER);
  if B then Exit;

  NS := GetConstructParamBehavioralFeature(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateParameter(NS);
    AddElementToList(Elem, XMLNode);
  end else begin
    // Parameter는 실패 시 로그를 남기지 않는다 (TemplateParameter에서 쓰이는 경우가 있음)
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemTemplateParameter(XMLNode: IXMLNode);
var
  NS: IUMLModelElement;
  Elem: IUMLTemplateParameter;
begin
  NS := GetConstructParamOfTemplateParameter(XMLNode);
  if NS <> nil then begin
    if NS.IsKindOf(UML_CLASS) then begin
      Elem := Factory.CreateTemplateParameter(NS as IUMLClass);
      AddElementToList(Elem, XMLNode);
    end else if NS.IsKindOf(UML_COLLABORATION) then begin
      Elem := Factory.CreateTemplateParameter2(NS as IUMLCollaboration);
      AddElementToList(Elem, XMLNode);
    end else 
      raise EElementCreationFailed.Create(ERR_CREATE_TEMPLATE_PARAM);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_PARAM);
end;

procedure PXMIToPlasticAdapter.ConvertElemTransition(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLStateMachine;
  Elem: IUMLTransition;
  ElemSource: IUMLStateVertex;
  ElemTarget: IUMLStateVertex;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_EVENT_TRANSITION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_STATE_VERTEX_OUTGOING);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_STATE_VERTEX_INCOMING);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_STATE_INTERNAL_TRANSITION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_GUARD_TRANSITION);
  if B then Exit;

  NS := GetConstructParamStateMachine(XMLNode);
  ElemSource := GetConstructParamStateVertexSource(XMLNode);
  ElemTarget := GetConstructParamStateVertexTarget(XMLNode);
  if (NS <> nil) and
     (ElemSource <> nil) and
     (ElemTarget <> nil)
  then begin
    Elem := Factory.CreateTransition(NS, ElemSource, ElemTarget);
    AddElementToList(Elem, XMLNode);
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_STATE_MACHINE)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemSignalEvent(XMLNode: IXMLNode);
var
  NS: IUMLTransition;
  Elem: IUMLSignalEvent;
begin
  NS := GetConstructParamTransition(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateSignalEvent(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_TRANSITION);
end;

procedure PXMIToPlasticAdapter.ConvertElemCallEvent(XMLNode: IXMLNode);
var
  NS: IUMLTransition;
  Elem: IUMLCallEvent;
begin
  NS := GetConstructParamTransition(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateCallEvent(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_TRANSITION);
end;

procedure PXMIToPlasticAdapter.ConvertElemTimeEvent(XMLNode: IXMLNode);
var
  NS: IUMLTransition;
  Elem: IUMLTimeEvent;
begin
  NS := GetConstructParamTransition(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateTimeEvent(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_TRANSITION);
end;

procedure PXMIToPlasticAdapter.ConvertElemChangeEvent(XMLNode: IXMLNode);
var
  NS: IUMLTransition;
  Elem: IUMLChangeEvent;
begin
  NS := GetConstructParamTransition(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateChangeEvent(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_TRANSITION);
end;

procedure PXMIToPlasticAdapter.ConvertElemClassifierRole(XMLNode: IXMLNode);
var
  NS: IUMLCollaboration;
  Elem: IUMLClassifierRole;
begin
  NS := GetConstructParamClassifierRoleCollaboration(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateClassifierRole(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_COLLABORATION);
end;

procedure PXMIToPlasticAdapter.ConvertElemObject(XMLNode: IXMLNode);
var
  NS: IUMLNamespace;
  Elem: IUMLObject;
begin
  NS := GetConstructParamNamespace(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateObject2(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER);
end;

procedure PXMIToPlasticAdapter.ConvertElemDependency(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLDependency;
  Client, Supplier: IUMLModelElement;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_CLIENT_DEPENDENCY);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_SUPPLIER_DEPENDENCY);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  Client := GetConstructParamClient(XMLNode);
  Supplier := GetConstructParamSupplier(XMLNode);
  if (NS <> nil) and
     (Client <> nil) and
     (Supplier <> nil)
  then begin
    Elem := Factory.CreateDependency(NS, Client, Supplier);
    AddElementToList(Elem, XMLNode);
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemDependencyWithStereotype(XMLNode: IXMLNode;
  StreotypeName: string);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLDependency;
  Client, Supplier: IUMLModelElement;
begin
  if StreotypeName = TYPE_BINDING then begin
    PN := XMLUtil.GetParentNode(XMLNode);
    if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ELEM_BINDING) then Exit;
  end;
  NS := GetConstructParamNamespace(XMLNode);
  Client := GetConstructParamClient(XMLNode);
  Supplier := GetConstructParamSupplier(XMLNode);
  if (NS <> nil) and
     (Client <> nil) and
     (Supplier <> nil)
  then begin
    Elem := Factory.CreateDependency(NS, Client, Supplier);
    Elem.SetStereotype(StreotypeName);
    AddElementToList(Elem, XMLNode);
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemAssociation(XMLNode: IXMLNode);
var
  PN, SN: IXMLNode;
  NS: IUMLNamespace;
  End1, End2: IUMLClassifier;
  Elem: IUMLAssociation;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ASSOCIATION_END_ASSOCIATION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_LINK_ASSOCIATION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ASSOCIATION_ROLE_BASE);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  End1 := GetConstructParamAssociationEnd(XMLNode, False);
  End2 := GetConstructParamAssociationEnd(XMLNode, True);
  if (NS <> nil) and
     (End1 <> nil) and
     (End2 <> nil)
  then begin
    Elem := Factory.CreateAssociation(NS, End1, End2);
    AddElementToList(Elem, XMLNode);
    PN := XMLUtil.FindFirstNode(XMLNode, NODE_UML_ASSOCIATION_CONNECTION);
    SN := XMLUtil.FindFirstNode(PN, NODE_UML_ASSOCIATION_END);
    AddElementToList(Elem.GetConnectionAt(0), SN);
    SN := XMLUtil.FindSecondNode(PN, NODE_UML_ASSOCIATION_END);
    AddElementToList(Elem.GetConnectionAt(1), SN);
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemGeneralization(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLGeneralization;
  Parent, Child: IUMLGeneralizableElement;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ELEM_GENERALIZATION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ELEM_SPECIALIZATION);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_POWERTYPE_RANGE);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  Parent := GetConstructParamParent(XMLNode);
  Child := GetConstructParamChild(XMLNode);
  if (NS <> nil) and
     (Parent <> nil) and
     (Child <> nil)
  then begin
    Elem := Factory.CreateGeneralization(NS, Parent, Child);
    AddElementToList(Elem, XMLNode);
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemAssociationRole(XMLNode: IXMLNode);
var
  PN, SN: IXMLNode;
  NS: IUMLNamespace;
  End1, End2: IUMLClassifier;
  Elem: IUMLAssociationRole;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_MESSAGE_CONNECTION) then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  End1 := GetConstructParamAssociationEndRole(XMLNode, False);
  End2 := GetConstructParamAssociationEndRole(XMLNode, True);

  if (NS <> nil) and
     (End1 <> nil) and
     (End2 <> nil)
  then begin
    if not (NS.IsKindOf(UML_COLLABORATION) and
            End1.IsKindOf(UML_CLASSIFIER_ROLE) and
            End2.IsKindOf(UML_CLASSIFIER_ROLE))
    then begin
      raise EElementCreationFailed.Create(ERR_CREATE_ASSOCIATION_ROLE);
    end;
    Elem := Factory.CreateAssociationRole(NS as IUMLCollaboration,
                                          End1 as IUMLClassifierRole,
                                          End2 as IUMLClassifierRole);
    AddElementToList(Elem, XMLNode);
    PN := XMLUtil.FindFirstNode(XMLNode, NODE_UML_ASSOCIATION_CONNECTION);
    SN := XMLUtil.FindFirstNode(PN, NODE_UML_ASSOCIATION_END_ROLE);
    AddElementToList(Elem.GetConnectionAt(0), XMLNode);
    SN := XMLUtil.FindSecondNode(PN, NODE_UML_ASSOCIATION_END_ROLE);
    AddElementToList(Elem.GetConnectionAt(1), XMLNode);
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemMessage(XMLNode: IXMLNode);
var
  PN, N: IXMLNode;
  NS: IUMLInteraction;
  Sender, Receiver: IUMLClassifierRole;
  Conn: IUMLAssociationRole;
  Kind: UMLFactoryMessageKind;
  Elem: IUMLMessage;
  ElemAction: IUMLAction;
  B: Boolean;
  XmiId, NodeName, Str: string;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_CLASSIFIER_ROLE_MESSAGE1);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_CLASSIFIER_ROLE_MESSAGE2);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_ASSOC_ROLE_MESSAGE);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_MESSAGE_ACTIVATOR);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_MESSAGE_PREDECESSOR);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_MESSAGE_MESSAGE3);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_MESSAGE_MESSAGE4);
  if B then Exit;

  XmiId := XMLUtil.GetAttributeValue(XMLNode, ATTR_UML_ACTION);
  if XmiId = '' then begin
    N := XMLUtil.FindFirstNode(XMLNode, NODE_UML_MESSAGE_ACTION);
    if N <> nil then N := XMLUtil.FindFirstNode(N, UML_ACTION);
    if N <> nil then XmiId := XMLUtil.GetAttributeValue(N, ATTR_XMI_ID);
  end;
  if XmiId <> '' then begin
    N := GetActionFromList(XmiId);
  end;
  Kind := mkCallAction;
  if N <> nil then begin
    NodeName := N.NodeName;
    if NodeName = NODE_UML_CALL_ACTION then Kind := mkCallAction
    else if NodeName = NODE_UML_SEND_ACTION then Kind := mkSendAction
    else if NodeName = NODE_UML_RETURN_ACTION then Kind := mkReturnAction
    else if NodeName = NODE_UML_CREATE_ACTION then Kind := mkCreateAction
    else if NodeName = NODE_UML_DESTROY_ACTION then Kind := mkDestroyAction;
  end;
  Str := GetAppliedStereotype(XMLNode);
  Str := LowerCase(Str);
  if (Str = TYPE_SIMPLE) or (Str = TYPE_SYNCHRONOUS) or
     (Str = TYPE_PROCEDURAL) or (Str = TYPE_ASYNCHRONOUS) or
     (Str = TYPE_RETURN)
  then Kind := StringToMessageKind(Str);

  NS := GetConstructParamInteraction(XMLNode);
  Sender := GetConstructParamClassifierRole(XMLNode, ATTR_UML_SENDER, NODE_UML_MESSAGE_SENDER);
  Receiver := GetConstructParamClassifierRole(XMLNode, ATTR_UML_RECEIVER, NODE_UML_MESSAGE_RECEIVER);
  Conn := GetConstructParamCommConnection(XMLNode);

  if (NS <> nil) and
     (Sender <> nil) and
     (Receiver <> nil)
  then begin
    if Conn <> nil then Elem := Factory.CreateMessage2(NS, Sender, Receiver, Conn, Kind)
    else Elem := Factory.CreateMessage(NS, Sender, Receiver, Kind);
    AddElementToList(Elem, XMLNode);

    if N <> nil then begin
      ElemAction := Elem.Action;
      AddElementToList(ElemAction, N);
    end;
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_INTERACTION)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemInclude(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLInclude;
  Includer, Includee: IUMLUseCase;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_USECASE_INCLUDE);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_USECASE_INCLUDE2);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  Includer := GetConstructParamUseCase(XMLNode, ATTR_UML_BASE, NODE_UML_INCLUDE_BASE);
  Includee := GetConstructParamUseCase(XMLNode, ATTR_UML_ADDITION, NODE_UML_INCLUDE_ADDITION);
  if (NS <> nil) and
     (Includer <> nil) and
     (Includee <> nil)
  then begin
    Elem := Factory.CreateInclude(NS, Includer, Includee);
    AddElementToList(Elem, XMLNode);
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemExtend(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLNamespace;
  Elem: IUMLExtend;
  Extender, Extendee: IUMLUseCase;
  B: Boolean;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_USECASE_EXTEND);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_USECASE_EXTEND2);
  if not B then B := CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_EXTENSION_POINT_EXTEND);
  if B then Exit;

  NS := GetConstructParamNamespace(XMLNode);
  Extender := GetConstructParamUseCase(XMLNode, ATTR_UML_EXTENSION, NODE_UML_EXTEND_EXTENSION);
  Extendee := GetConstructParamUseCase(XMLNode, ATTR_UML_BASE, NODE_UML_EXTEND_BASE);
  if (NS <> nil) and
     (Extender <> nil) and
     (Extendee <> nil)
  then begin
    Elem := Factory.CreateExtend(NS, Extender, Extendee);
    AddElementToList(Elem, XMLNode);
  end
  else begin
    if NS = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER)
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemAssociationClass(XMLNode: IXMLNode);
var
  XmiId: string;
  AClass: IUMLClass;
  AAssoc: IUMLAssociation;
  NS: IUMLNamespace;
  Elem: IUMLAssociationClass;
begin
  ConvertElemClass(XMLNode);
  XmiId := XMLUtil.GetAttributeValue(XMLNode, ATTR_XMI_ID);
  AClass := GetElementFromList(XmiId, UML_CLASS) as IUMLClass;
  ConvertElemAssociation(XMLNode);
  AAssoc := GetElementFromList(XmiId, UML_ASSOCIATION) as IUMLAssociation;
  NS := GetConstructParamNamespace(XMLNode);
  if (AClass <> nil) and (AAssoc <> nil) and (NS <> nil) then begin
    Elem := Factory.CreateAssociationClass(NS, AAssoc, AClass);
    AddElementToList(Elem, XMLNode);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemAbstraction(XMLNode: IXMLNode);
var
  NS: IUMLNamespace;
  Elem: IUMLRealization;
  Client, Supplier: IUMLModelElement;
begin
  if not IsStereotypeApplied(XMLNode, TYPE_REALIZE) then
    ConvertElemDependency(XMLNode)
  else begin
    NS := GetConstructParamNamespace(XMLNode);
    Client := GetConstructParamClient(XMLNode);
    Supplier := GetConstructParamSupplier(XMLNode);
    if (NS <> nil) and
       (Client <> nil) and
       (Supplier <> nil)
    then begin
      Elem := Factory.CreateRealization(NS, Client, Supplier);
      AddElementToList(Elem, XMLNode);
    end
    else begin
      if NS = nil then
        raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER)
      else
        raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemCompositeState(XMLNode: IXMLNode);
var
  PN: IXMLNode;
  NS: IUMLCompositeState;
  Elem: IUMLCompositeState;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if PN <> nil then begin
    if (PN.NodeName = NODE_UML_STATE_MACHINE_TOP) then begin
      ConvertElemTopState(XMLNode);
      Exit;
    end;
  end;
  if CheckNotSupportEmbedding(PN, XMLNode, NODE_UML_STATE_VERTEX_CONTAINER) then Exit;

  NS := GetConstructParamCompositeState(XMLNode);
  if NS <> nil then begin
    Elem := Factory.CreateCompositeState(NS);
    AddElementToList(Elem, XMLNode);
  end
  else
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER_STATE);
end;

procedure PXMIToPlasticAdapter.ConvertElemObjectFlowState(XMLNode: IXMLNode);
var
  PN: IXMLNode;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if PN <> nil then begin
    if (PN.NodeName = NODE_UML_STATE_MACHINE_TOP) then begin
      ConvertElemTopState(XMLNode);
      Exit;
    end;
  end;
  ConvertElemNotSupport2(XMLNode);
end;

procedure PXMIToPlasticAdapter.ConvertElemUninterpretedAction(XMLNode: IXMLNode);
type
  CreationType = (ctEntry, ctDo, ctExit, ctEffect, ctNone);

  function DetermineCreationType(ParentNode: IXMLNode): CreationType;
  var NodeName: string;
  begin
    Result := ctNone;
    if ParentNode = nil then Exit;
    NodeName := ParentNode.NodeName;
    if NodeName = NODE_UML_STATE_ENTRY then Result := ctEntry
    else if NodeName = NODE_UML_STATE_DO_ACTIVITY then Result := ctDo
    else if NodeName = NODE_UML_STATE_EXIT then Result := ctExit
    else if NodeName = NODE_UML_TRANSITION_EFFECT then Result := ctEffect
    else Result := DetermineCreationType(XMLUtil.GetParentNode(ParentNode));
  end;
var
  PN: IXMLNode;
  CT: CreationType;
  NS: IUMLModelElement;
  Elem: IUMLUninterpretedAction;
begin
  PN := XMLUtil.GetParentNode(XMLNode);
  if PN = nil then Exit;
  if (XMLNode.NodeName = NODE_UML_SEND_ACTION) and
     (PN.NodeName = NODE_UML_SIGNAL_SEND_ACTION)
  then Exit;

  CT := DetermineCreationType(PN);
  if CT = ctNone then Exit;
  if CT = ctEffect then begin
    NS := GetConstructParamEffectTransition(PN);
    if NS <> nil then begin
      Elem := Factory.CreateEffect(NS as IUMLTransition);
      AddElementToList(Elem, XMLNode);
    end
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_TRANSITION);
  end else begin
    NS := GetConstructParamState(XMLNode);
    if NS <> nil then begin
      case CT of
        ctEntry: Elem := Factory.CreateEntryAction(NS as IUMLState);
        ctDo: Elem := Factory.CreateDoAction(NS as IUMLState);
        ctExit: Elem := Factory.CreateExitAction(NS as IUMLState);
      end;
      AddElementToList(Elem, XMLNode);
    end
    else
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_OWNER_STATE);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemNotSupport1(XMLNode: IXMLNode);
var
  NodeName: string;
begin
  // 직접 생성은 되지 않는 요소들의 경우
  if XMLNode <> nil then begin
    NodeName := XMLNode.NodeName;
    // NODE_UML_COMMENT
    if XMLNode.NodeName = NODE_UML_COMMENT then AddCommentToList(XMLNode);
    // NODE_UML_STEREOTYPE
    // NODE_UML_TAGGED_VALUE
    // NODE_UML_DATA_TYPE
    // NODE_UML_ACTION_SEQUENCE
    // NODE_UML_GUARD
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemNotSupport2(XMLNode: IXMLNode);
var
  NodeName: string;
begin
  // 생성이 고려되지 않는 요소들의 경우
  if XMLNode <> nil then begin
    NodeName := XMLNode.NodeName;
    AppUtil.AddLog(Format(MSG_ELEM_NOT_SUPPORT, [NodeName]));
  end;
end;

function PXMIToPlasticAdapter.CheckNotSupportEmbedding(PN, N: IXMLNode; NodeName: string): Boolean;
begin
  // 포함관계에 따라 생성이 지원되지 않는 경우
  Result := False;
  if (PN <> nil) and (PN.NodeName = NodeName) then begin
    AppUtil.AddLog(Format(MSG_ELEM_NOT_SUPPORT_EMBEDDING, [PN.NodeName, N.NodeName]));
    Result := True;
  end;
end;

function PXMIToPlasticAdapter.ConvertGeneralizationView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLGeneralization;
  ParentElem, ChildElem: IUMLGeneralizableElement;
  ParentView, ChildView: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLGeneralization;
  ParentElem := ModelElem.Parent;
  ChildElem := Modelelem.Child;
  if (ParentElem = nil) or (ChildElem = nil) then
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, ParentElem);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then ParentView := GetOwnedViewOfModel(DiagramView, ParentElem)
  else ParentView := GetOwnedViewByCoordinate(DiagramView, Node, ParentElem);
  if ParentView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, ChildElem);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then ChildView := GetOwnedViewOfModel(DiagramView, ChildElem)
  else ChildView := GetOwnedViewByCoordinate(DiagramView, Node, ChildElem);
  if ChildView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateGeneralizationView(DiagramView, ModelElem, ParentView, ChildView);
end;

function PXMIToPlasticAdapter.ConvertAssociationView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLAssociation;
  AssocEnd: IUMLAssociationEnd;
  End1, End2: IUMLClassifier;
  End1View, End2View: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLAssociation;
  AssocEnd := ModelElem.GetConnectionAt(0);
  if AssocEnd = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  End1 := AssocEnd.Participant;
  AssocEnd := ModelElem.GetConnectionAt(1);
  if AssocEnd = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  End2 := AssocEnd.Participant;
  if (End1 = nil) or (End2 = nil) then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, End1);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then End1View := GetOwnedViewOfModel(DiagramView, End1)
  else End1View := GetOwnedViewByCoordinate(DiagramView, Node, End1);
  if End1View = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, End2);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then End2View := GetOwnedViewOfModel(DiagramView, End2)
  else End2View := GetOwnedViewByCoordinate(DiagramView, Node, End2);
  if End2View = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateAssociationView(DiagramView, ModelElem, End1View, End2View);
end;

function PXMIToPlasticAdapter.ConvertAssociationClassView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLAssociationClass;
  ModelElemAssoc: IUMLAssociation;
  ModelElemClass: IUMLClass;
  TempElem: IElement;
  XmiId: string;
  AssocEnd: IUMLAssociationEnd;
  End1, End2: IUMLClassifier;
  End1View, End2View: IView;
  AssocView: IView;
  ClassView: IView;
  C: Integer;
begin
  Result := nil;
  ModelElem := Elem as IUMLAssociationClass;
  XmiId := GetPropValue2(Node, ATTR_UML_SUBJECT, NODE_UML_VIEW_SUBJECT);
  TempElem := GetElementFromList(XmiId, UML_ASSOCIATION);
  if TempElem = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  ModelElemAssoc := TempElem as IUMLAssociation;

  AssocEnd := ModelElemAssoc.GetConnectionAt(0);
  if AssocEnd = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  End1 := AssocEnd.Participant;
  AssocEnd := ModelElemAssoc.GetConnectionAt(1);
  if AssocEnd = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  End2 := AssocEnd.Participant;
  if (End1 = nil) or (End2 = nil) then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  C := GetOwnedViewCount(DiagramView, End1);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then End1View := GetOwnedViewOfModel(DiagramView, End1)
  else End1View := GetOwnedViewByCoordinate(DiagramView, Node, End1);
  if End1View = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, End2);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then End2View := GetOwnedViewOfModel(DiagramView, End2)
  else End2View := GetOwnedViewByCoordinate(DiagramView, Node, End2);
  if End2View = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  AssocView := Factory.CreateAssociationView(DiagramView, ModelElemAssoc, End1View, End2View);
  if AssocView <> nil then begin
    AddViewToList(AssocView, Node);

    ModelElemClass := ModelElem.ClassSide;

    C := GetOwnedViewCount(DiagramView, ModelElemClass);
    if C = 1 then ClassView := GetOwnedViewOfModel(DiagramView, ModelElemClass);
    if ClassView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

    Result := Factory.CreateAssociationClassView(DiagramView, ModelElem, AssocView, ClassView);
  end;
end;

function PXMIToPlasticAdapter.ConvertDependencyView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLDependency;
  Client, Supplier: IUMLModelElement;
  ClientView, SupplierView: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLDependency;
  Client := ModelElem.Client;
  Supplier := ModelElem.Supplier;
  if (Client = nil) or (Supplier = nil) then
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Client);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then ClientView := GetOwnedViewOfModel(DiagramView, Client)
  else ClientView := GetOwnedViewByCoordinate(DiagramView, Node, Client);
  if ClientView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Supplier);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then SupplierView := GetOwnedViewOfModel(DiagramView, Supplier)
  else SupplierView := GetOwnedViewByCoordinate(DiagramView, Node, Supplier);
  if SupplierView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateDependencyView(DiagramView, ModelElem, ClientView, SupplierView);
end;

function PXMIToPlasticAdapter.ConvertRealizationView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLRealization;
  Client, Supplier: IUMLModelElement;
  ClientView, SupplierView: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLRealization;
  Client := ModelElem.Client;
  Supplier := ModelElem.Supplier;
  if (Client = nil) or (Supplier = nil) then
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Client);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then ClientView := GetOwnedViewOfModel(DiagramView, Client)
  else ClientView := GetOwnedViewByCoordinate(DiagramView, Node, Client);
  if ClientView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Supplier);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then SupplierView := GetOwnedViewOfModel(DiagramView, Supplier)
  else SupplierView := GetOwnedViewByCoordinate(DiagramView, Node, Supplier);
  if SupplierView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateRealizationView(DiagramView, ModelElem, ClientView, SupplierView);
end;

function PXMIToPlasticAdapter.ConvertIncludeView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLInclude;
  Base, Addition: IUMLUseCase;
  BaseView, AdditionView: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLInclude;
  Base := ModelElem.Base;
  Addition := ModelElem.Addition;
  if (Base = nil) or (Addition = nil) then
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Base);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then BaseView := GetOwnedViewOfModel(DiagramView, Base)
  else BaseView := GetOwnedViewByCoordinate(DiagramView, Node, Base);
  if BaseView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Addition);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then AdditionView := GetOwnedViewOfModel(DiagramView, Addition)
  else AdditionView := GetOwnedViewByCoordinate(DiagramView, Node, Addition);
  if AdditionView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateIncludeView(DiagramView, ModelElem, BaseView, AdditionView);
end;

function PXMIToPlasticAdapter.ConvertExtendView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLExtend;
  Base, Extension: IUMLUseCase;
  BaseView, ExtensionView: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLExtend;
  Base := ModelElem.Base;
  Extension := ModelElem.Extension;
  if (Base = nil) or (Extension = nil) then
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Base);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then BaseView := GetOwnedViewOfModel(DiagramView, Base)
  else BaseView := GetOwnedViewByCoordinate(DiagramView, Node, Base);
  if BaseView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Extension);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then ExtensionView := GetOwnedViewOfModel(DiagramView, Extension)
  else ExtensionView := GetOwnedViewByCoordinate(DiagramView, Node, Extension);
  if ExtensionView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateExtendView(DiagramView, ModelElem, BaseView, ExtensionView);
end;

function PXMIToPlasticAdapter.ConvertLinkView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
begin
  Result := nil;
end;

function PXMIToPlasticAdapter.ConvertAssociationRoleView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLAssociationRole;
  AssocEnd: IUMLAssociationEndRole;
  End1, End2: IUMLClassifierRole;
  End1View, End2View: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLAssociationRole;
  AssocEnd := ModelElem.GetConnectionAt(0) as IUMLAssociationEndRole;
  if AssocEnd = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  End1 := AssocEnd.Participant as IUMLClassifierRole;
  AssocEnd := ModelElem.GetConnectionAt(1) as IUMLAssociationEndRole;
  if AssocEnd = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  End2 := AssocEnd.Participant as IUMLClassifierRole;
  if (End1 = nil) or (End2 = nil) then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, End1);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then End1View := GetOwnedViewOfModel(DiagramView, End1)
  else End1View := GetOwnedViewByCoordinate(DiagramView, Node, End1);
  if End1View = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, End2);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then End2View := GetOwnedViewOfModel(DiagramView, End2)
  else End2View := GetOwnedViewByCoordinate(DiagramView, Node, End2);
  if End2View = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateAssociationRoleView(DiagramView, ModelElem, End1View, End2View);
end;

function PXMIToPlasticAdapter.ConvertAssociationRoleView2(DiagramView: IDiagramView; Elem: IModel): IView;
var
  ModelElem: IUMLAssociationRole;
  AssocEnd: IUMLAssociationEndRole;
  End1, End2: IUMLClassifierRole;
  End1View, End2View: IView;
  C: Integer;
begin
  Result := nil;
  try
    ModelElem := Elem as IUMLAssociationRole;
    AssocEnd := ModelElem.GetConnectionAt(0) as IUMLAssociationEndRole;
    if AssocEnd = nil then Exit;
    End1 := AssocEnd.Participant as IUMLClassifierRole;
    AssocEnd := ModelElem.GetConnectionAt(1) as IUMLAssociationEndRole;
    if AssocEnd = nil then Exit;
    End2 := AssocEnd.Participant as IUMLClassifierRole;
    if (End1 = nil) or (End2 = nil) then Exit;
    C := GetOwnedViewCount(DiagramView, End1);
    if C = 1 then End1View := GetOwnedViewOfModel(DiagramView, End1)
    else Exit;
    if End1View = nil then Exit;
    C := GetOwnedViewCount(DiagramView, End2);
    if C = 1 then End2View := GetOwnedViewOfModel(DiagramView, End2)
    else Exit;
    if End2View = nil then Exit;

    Result := Factory.CreateAssociationRoleView(DiagramView, ModelElem, End1View, End2View);
  except
  end;
end;

function PXMIToPlasticAdapter.ConvertColMessageView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLMessage;
  AssocRole: IUMLAssociationRole;
  AssocRoleView: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLMessage;
  AssocRole := ModelElem.CommunicationConnection;
  if AssocRole = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  
  C := GetOwnedViewCount(DiagramView, AssocRole);
  if C = 1 then AssocRoleView := GetOwnedViewOfModel(DiagramView, AssocRole)
  else if C = 0 then begin
    AssocRoleView := ConvertAssociationRoleView2(DiagramView, AssocRole);
    if AssocRoleView = nil then
      raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  end else raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateMessageView(DiagramView as IUMLCollaborationRoleDiagramView,
                                      ModelElem, AssocRoleView);
end;

function PXMIToPlasticAdapter.ConvertSeqMessageView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLMessage;
  Sender, Receiver: IUMLClassifierRole;
  SenderView, ReceiverView: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLMessage;
  Sender := ModelElem.Sender;
  Receiver := ModelElem.Receiver;
  if (Sender = nil) or (Receiver = nil) then
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Sender);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then SenderView := GetOwnedViewOfModel(DiagramView, Sender)
  else SenderView := GetOwnedViewByCoordinate(DiagramView, Node, Sender);
  if SenderView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Receiver);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then ReceiverView := GetOwnedViewOfModel(DiagramView, Receiver)
  else ReceiverView := GetOwnedViewByCoordinate(DiagramView, Node, Receiver);
  if ReceiverView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateSeqMessageView(DiagramView as IUMLSequenceRoleDiagramView,
                                        ModelElem, SenderView, ReceiverView);
end;

function PXMIToPlasticAdapter.ConvertTransitionView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ModelElem: IUMLTransition;
  Source, Target: IUMLStateVertex;
  SourceView, TargetView: IView;
  C: Integer;
begin
  Result := nil;

  ModelElem := Elem as IUMLTransition;
  Source := ModelElem.Source;
  Target := ModelElem.Target;
  if (Source = nil) or (Target = nil) then
    raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Source);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then SourceView := GetOwnedViewOfModel(DiagramView, Source)
  else SourceView := GetOwnedViewByCoordinate(DiagramView, Node, Source);
  if SourceView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  C := GetOwnedViewCount(DiagramView, Target);
  if C = 0 then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);
  if C = 1 then TargetView := GetOwnedViewOfModel(DiagramView, Target)
  else TargetView := GetOwnedViewByCoordinate(DiagramView, Node, Target);
  if TargetView = nil then raise EElementCreationFailed.Create(ERR_CREATE_ELEM_NO_CONN);

  Result := Factory.CreateTransitionView(DiagramView, ModelElem, SourceView, TargetView);
end;

function PXMIToPlasticAdapter.ConvertElemNodeTypeView(DiagramView: IDiagramView; Elem: IModel): IView;
var
  ElemType: string;
  NewView: IView;
begin
  Result := nil;
  ElemType := Elem.GetClassName;
  NewView := nil;

  if ElemType = UML_MODEL then
     NewView := Factory.CreateModelView(DiagramView, Elem as IUMLModel)
  else if ElemType = UML_SUBSYSTEM then
    NewView := Factory.CreateSubsystemView(DiagramView, Elem as IUMLSubsystem)
  else if ElemType = UML_PACKAGE then
    NewView := Factory.CreatePackageView(DiagramView, Elem as IUMLPackage)
  else if ElemType = UML_CLASS then
    NewView := Factory.CreateClassView(DiagramView, Elem as IUMLClass)
  else if ElemType = UML_INTERFACE then
    NewView := Factory.CreateInterfaceView(DiagramView, Elem as IUMLInterface)
  else if ElemType = UML_ENUMERATION then
    NewView := Factory.CreateEnumerationView(DiagramView, Elem as IUMLEnumeration)
  else if ElemType = UML_SIGNAL then
    NewView := Factory.CreateSignalView(DiagramView, Elem as IUMLSignal)
  else if ElemType = UML_EXCEPTION then
    NewView := Factory.CreateExceptionView(DiagramView, Elem as IUMLException)
  else if ElemType = UML_COMPONENT then
    NewView := Factory.CreateComponentView(DiagramView, Elem as IUMLComponent)
  else if ElemType = UML_COMPONENT_INSTANCE then
    NewView := Factory.CreateComponentInstanceView(DiagramView, Elem as IUMLComponentInstance)
  else if ElemType = UML_NODE then
    NewView := Factory.CreateNodeView(DiagramView, Elem as IUMLNode)
  else if ElemType = UML_NODE_INSTANCE then
    NewView := Factory.CreateNodeInstanceView(DiagramView, Elem as IUMLNodeInstance)
  else if ElemType = UML_ACTOR then
    NewView := Factory.CreateActorView(DiagramView, Elem as IUMLActor)
  else if ElemType = UML_USECASE then
    NewView := Factory.CreateUseCaseView(DiagramView, Elem as IUMLUseCase)
  else if ElemType = UML_COLLABORATION then
    NewView := Factory.CreateCollaborationView(DiagramView, Elem as IUMLCollaboration)
  else if ElemType = UML_OBJECT then
    NewView := Factory.CreateObjectView(DiagramView, Elem as IUMLObject)
  else if ElemType = UML_CLASSIFIER_ROLE then begin
    if DiagramView.IsKindOf(UML_SEQ_ROLE_DIAGRAM_VIEW) then
      NewView := Factory.CreateSeqClassifierRoleView(DiagramView as IUMLSequenceRoleDiagramView,
                                                     Elem as IUMLClassifierRole)
    else
      NewView := Factory.CreateClassifierRoleView(DiagramView, Elem as IUMLClassifierRole);
  end else if ElemType = UML_COMPOSITE_STATE then begin
    if DiagramView.IsKindOf(UML_STATECHART_DIAGRAM_VIEW) then
      NewView := Factory.CreateStateView(DiagramView as IUMLStatechartDiagramView,
                                         Elem as IUMLCompositeState);
  end else if ElemType = UML_SUBMACHINE_STATE then begin
    if DiagramView.IsKindOf(UML_STATECHART_DIAGRAM_VIEW) then
      NewView := Factory.CreateSubmachineStateView(DiagramView as IUMLStatechartDiagramView,
                                                   Elem as IUMLSubmachineState);
  end else if ElemType = UML_PSEUDO_STATE then
    NewView := Factory.CreatePseudostateView(DiagramView, Elem as IUMLPseudostate)
  else if ElemType = UML_FINAL_STATE then
    NewView := Factory.CreateFinalStateView(DiagramView, Elem as IUMLFinalState)
  else if ElemType = UML_ACTION_STATE then begin
    if DiagramView.IsKindOf(UML_ACTIVITY_DIAGRAM_VIEW) then
      NewView := Factory.CreateActionStateView(DiagramView as IUMLActivityDiagramView,
                                               Elem as IUMLActionState);
  end else if ElemType = UML_SUBACTIVITY_STATE then begin
    if DiagramView.IsKindOf(UML_ACTIVITY_DIAGRAM_VIEW) then
      NewView := Factory.CreateSubactivityStateView(DiagramView as IUMLActivityDiagramView,
                                                    Elem as IUMLSubactivityState);
  end else if ElemType = UML_PARTITION then begin
    if DiagramView.IsKindOf(UML_ACTIVITY_DIAGRAM_VIEW) then
      NewView := Factory.CreateSwimlaneView(DiagramView as IUMLActivityDiagramView,
                                            Elem as IUMLPartition);
  end;

  Result := NewView;
end;

function PXMIToPlasticAdapter.ConvertElemEdgeTypeView(DiagramView: IDiagramView; Elem: IModel;
  Node: IXMLNode): IView;
var
  ElemType: string;
  NewView: IView;
begin
  Result := nil;
  ElemType := Elem.GetClassName;
  NewView := nil;

  if ElemType = UML_GENERALIZATION then
    NewView := ConvertGeneralizationView(DiagramView, Elem, Node)
  else if ElemType = UML_ASSOCIATION then
    NewView := ConvertAssociationView(DiagramView, Elem, Node)
  else if ElemType = UML_ASSOCIATION_CLASS then
    NewView := ConvertAssociationClassView(DiagramView, Elem, Node)
  else if ElemType = UML_DEPENDENCY then
    NewView := ConvertDependencyView(DiagramView, Elem, Node)
  else if ElemType = UML_REALIZATION then
    NewView := ConvertRealizationView(DiagramView, Elem, Node)
  else if ElemType = UML_INCLUDE then
    NewView := ConvertIncludeView(DiagramView, Elem, Node)
  else if ElemType = UML_EXTEND then
    NewView := ConvertExtendView(DiagramView, Elem, Node)
  else if ElemType = UML_LINK then
    NewView := ConvertLinkView(DiagramView, Elem, Node)
  else if ElemType = UML_ASSOCIATION_ROLE then
    NewView := ConvertAssociationRoleView(DiagramView, Elem, Node)
  else if ElemType = UML_MESSAGE then begin
    if DiagramView.IsKindOf(UML_COL_ROLE_DIAGRAM_VIEW) then
      NewView := ConvertColMessageView(DiagramView, Elem, Node)
    else if DiagramView.IsKindOf(UML_SEQ_ROLE_DIAGRAM_VIEW) then
      NewView := ConvertSeqMessageView(DiagramView, Elem, Node);
  end
  else if ElemType = UML_TRANSITION then
    NewView := ConvertTransitionView(DiagramView, Elem, Node);

  Result := NewView;
end;

function PXMIToPlasticAdapter.ConvertElemNoteView(DiagramView: IDiagramView): IView;
begin
  Result := nil;
  Result := Factory.CreateNoteView(DiagramView);
end;

function PXMIToPlasticAdapter.ConvertElemNoteLinkView(DiagramView: IDiagramView;
  Elem: IUMLNoteView; AWrapper: PXMIElementWrapper): IView;
var
  Arr: PStrArray;
  I: Integer;
  AView: IView;
begin
  Result := nil;
  Arr := GetConstructParamAnnotatedElems(AWrapper.XMLNode);
  for I := 0 to Length(Arr) - 1 do begin
    AView := GetConstructParamAnnotatedElemView(DiagramView, Arr[I]);
    if AView <> nil then
      Result := Factory.CreateNoteLinkView(DiagramView, Elem, AView);
  end;
end;

function PXMIToPlasticAdapter.ConvertElemDiagram(XMLNode: IXMLNode): IUMLDiagram;
var
  NS: IUMLModelElement;
  DiagramType, DiagramType2, XmiId: string;
  Elem: IUMLDiagram;
begin
  Result := nil;
  DiagramType2 := GetConstructParamDiagramType(XMLNode);
  XmiId := XMLUtil.GetAttributeValue(XMLNode, ATTR_XMI_ID);
  if DiagramType2 = '' then begin
    AppUtil.AddLog(Format(MSG_DIAGRAM_CONVERSION_FAILED2, [XMLNode.NodeName, XmiId, MSG_DIAGRAM_NO_TYPE]));
    Exit;
  end;
  DiagramType := LowerCase(DiagramType2);
  NS := GetConstructParamDiagramOwner(XMLNode);
  if NS <> nil then begin
    if (DiagramType = TYPE_DIAGRAM_CLASS) and NS.IsKindOf(ELEM_MODEL) then
      Elem := Factory.CreateClassDiagram(NS)
    else if (DiagramType = TYPE_DIAGRAM_USECASE) and NS.IsKindOf(ELEM_MODEL) then
      Elem := Factory.CreateUseCaseDiagram(NS)
    else if (DiagramType = TYPE_DIAGRAM_COMPONENT) and NS.IsKindOf(ELEM_MODEL) then
      Elem := Factory.CreateComponentDiagram(NS)
    else if (DiagramType = TYPE_DIAGRAM_MODULE) and NS.IsKindOf(ELEM_MODEL) then
      Elem := Factory.CreateComponentDiagram(NS)
    else if (DiagramType = TYPE_DIAGRAM_DEPLOYMENT) and NS.IsKindOf(ELEM_MODEL) then begin
      if RationalApproachMode then begin
        NS := Project.FindByName(ROSE_DEPLOYMENT_VIEW) as IUMLNamespace;
        if NS = nil then NS := GetConstructParamDiagramOwner(XMLNode); 
      end;
      Elem := Factory.CreateDeploymentDiagram(NS);
    end else if (DiagramType = TYPE_DIAGRAM_SEQUENCE) and NS.IsKindOf(UML_INTERACTION) then
      Elem := Factory.CreateSequenceRoleDiagram(NS as IUMLInteraction)
    else if (DiagramType = TYPE_DIAGRAM_COLLABORATION) and NS.IsKindOf(UML_INTERACTION) then
      Elem := Factory.CreateCollaborationRoleDiagram(NS as IUMLInteraction)
    else if (DiagramType = TYPE_DIAGRAM_STATECHART) and NS.IsKindOf(UML_STATE_MACHINE) then
      Elem := Factory.CreateStatechartDiagram(NS as IUMLStatemachine)
    else if (DiagramType = TYPE_DIAGRAM_ACTIVITY) and NS.IsKindOf(UML_ACTIVITYGRAPH) then
      Elem := Factory.CreateActivityDiagram(NS as IUMLActivityGraph)
    else begin
      AppUtil.AddLog(Format(MSG_DIAGRAM_NOT_SUPPORT, [DiagramType2]));
      Exit;
    end;
    Result := Elem;
  end else begin
    AppUtil.AddLog(Format(MSG_DIAGRAM_CONVERSION_FAILED, [DiagramType2, XmiId, ERR_CREATE_ELEM_NO_OWNER]));
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemNodeTypeDiagramElement(XMLNode: IXMLNode;
  Diagram: IUMLDiagram);
var
  I: Integer;
  ViewNode: IXMLNode;
  ModelElem: IModel;
  DiagramView: IDiagramView;
  ElemType, XmiId: string;
  ViewElem: IView;
begin
  DiagramView := Diagram.DiagramView;
  for I := 0 to XMLNode.ChildNodes.Count - 1 do begin
    ViewNode := XMLNode.ChildNodes.Nodes[I];
    if ViewNode.NodeName = NODE_UML_DIAGRAM_ELEMENT then begin
      ModelElem := GetConstructParamViewModel(ViewNode);
      XmiId := XMLUtil.GetAttributeValue(ViewNode, ATTR_XMI_ID);
      try
        if ModelElem <> nil then begin
          ElemType := ModelElem.GetClassName;
          if IsNodeTypeView(ModelElem) then begin
            ViewElem := nil;
            ViewElem := ConvertElemNodeTypeView(DiagramView, ModelElem);
            if ViewElem <> nil then AddViewToList(ViewElem, ViewNode);
          end;
        end;
      except on E: Exception do
        AppUtil.AddLog(Format(MSG_VIEW_CONVERSION_FAILED, [ElemType, XmiId, E.Message]));
      end;
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemEdgeTypeDiagramElement(XMLNode: IXMLNode;
  Diagram: IUMLDiagram);
var
  I: Integer;
  ViewNode: IXMLNode;
  ModelElem: IModel;
  DiagramView: IDiagramView;
  ElemType, XmiId: string;
  ViewElem: IView;
begin
  DiagramView := Diagram.DiagramView;
  for I := 0 to XMLNode.ChildNodes.Count - 1 do begin
    ViewNode := XMLNode.ChildNodes.Nodes[I];
    if ViewNode.NodeName = NODE_UML_DIAGRAM_ELEMENT then begin
      ModelElem := GetConstructParamViewModel(ViewNode);
      XmiId := XMLUtil.GetAttributeValue(ViewNode, ATTR_XMI_ID);
      try
        if ModelElem <> nil then begin
          ElemType := ModelElem.GetClassName;
          if IsEdgeTypeView(ModelElem) then begin
            ViewElem := nil;
            ViewElem := ConvertElemEdgeTypeView(DiagramView, ModelElem, ViewNode);
            if ViewElem <> nil then AddViewToList(ViewElem, ViewNode);
          end;
        end;
      except on E: Exception do
        AppUtil.AddLog(Format(MSG_VIEW_CONVERSION_FAILED, [ElemType, XmiId, E.Message]));
      end;
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElemNoteDiagramElement(XMLNode: IXMLNode;
  Diagram: IUMLDiagram);
var
  I, Idx: Integer;
  ViewNode: IXMLNode;
  ModelElem: IModel;
  DiagramView: IDiagramView;
  ElemType, NoteText, XmiId: string;
  ViewElem: IView;
  NoteWrapper: PXMIElementWrapper;
begin
  DiagramView := Diagram.DiagramView;
  for I := 0 to XMLNode.ChildNodes.Count - 1 do begin
    ViewNode := XMLNode.ChildNodes.Nodes[I];
    if ViewNode.NodeName = NODE_UML_DIAGRAM_ELEMENT then begin
      ModelElem := GetConstructParamViewModel(ViewNode);
      XmiId := XMLUtil.GetAttributeValue(ViewNode, ATTR_XMI_ID);
      try
        if ModelElem = nil then begin
          Idx := IndexOfCommentList(ViewNode);
          if Idx >= 0 then begin
            ElemType := ELEM_NOTE;
            NoteWrapper := FCommentWrapperList.Items[Idx];
            if NoteWrapper <> nil then begin
              NoteText := GetPropName(NoteWrapper.XMLNode);
              if NoteText = ATTR_NOTE_TEXT_IGNORED then Continue;

              ViewElem := nil;
              ViewElem := ConvertElemNoteView(DiagramView);
              if ViewElem <> nil then begin
                AddViewToList(ViewElem, ViewNode);
                (ViewElem as IUMLNoteView).Text := NoteText;
                ConvertElemNoteLinkView(DiagramView, ViewElem as IUMLNoteView, NoteWrapper);
              end;
            end;
          end;
        end;
      except on E: Exception do
        AppUtil.AddLog(Format(MSG_VIEW_CONVERSION_FAILED, [ElemType, XmiId, E.Message]));
      end;
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropModel(AWrapper: PXMIElementWrapper);
var
  Elem: IModel;
  Node: IXMLNode;
  OriginName, NewName: string;
begin
  Elem := AWrapper.PlasticElement as IModel;
  Node := AWrapper.XMLNode;
  // Name
  OriginName := GetPropName(Node);
  NewName := RemoveBraceFromName(OriginName);
  if Elem.IsKindOf(UML_ATTRIBUTE) then
    NewName := RemoveSlashFromName(NewName);
  if not CheckUMLElemNameValidation(NewName) then NewName := TXT_INVALID_NAME_CHANGE_TO;
  if Elem.IsKindOf(UML_CLASSIFIER) then begin
    Elem.Name := '';
    NewName := ConflictNameToNewName(Elem as IUMLModelElement, NewName);
  end;
  Elem.Name := NewName;
  if OriginName <> NewName then begin
    AppUtil.AddLog(Format(MSG_ELEM_NAME_CHANGED, [OriginName, NewName]));
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropModelElement(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  ConstrName, ConstrBody: string;
  Elem: IUMLModelElement;
  Node, SubNode, RefNode: IXMLNode;
  I: Integer;
  Arr: PStrArray;
begin
  Elem := AWrapper.PlasticElement as IUMLModelElement;
  Node := AWrapper.XMLNode;
  // Visibility
  Str := GetPropValue(Node, ATTR_UML_VISIBILITY, NODE_UML_MODEL_ELEMENT_VISIBILITY);
  if Str <> '' then Elem.Visibility := StringToVisibility(Str);
  // IsSpecification
  Str := GetPropValue(Node, ATTR_UML_SPECIFICATION, NODE_UML_MODEL_ELEMENT_IS_SPEC);
  if Str <> '' then Elem.IsSpecification := StringToBoolean(Str);
  // Constraint
  Str := '';
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_CONSTRINT);
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      RefNode := GetConstraintFromList(XmiId);
      if RefNode <> nil then begin
        ConstrName := GetPropName(RefNode);
        RefNode := XMLUtil.FindFirstNode(RefNode, NODE_UML_CONSTRAINT_BODY);
        ConstrBody := GetPropExpressionValue(RefNode);
        if ConstrBody <> '' then Elem.AddConstraint(ConstrName, ConstrBody);
      end;
    end;
  end;
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ELEM_CONSTRAINT);
  if SubNode <> nil then begin
    for I := 0 to SubNode.ChildNodes.Count - 1 do begin
      RefNode := SubNode.ChildNodes.Nodes[I];
      if RefNode.NodeName = NODE_UML_CONSTRAINT then begin
        ConstrName := GetPropName(RefNode);
        RefNode := XMLUtil.FindFirstNode(RefNode, NODE_UML_CONSTRAINT_BODY);
        ConstrBody := GetPropExpressionValue(RefNode);
        if ConstrBody <> '' then Elem.AddConstraint(ConstrName, ConstrBody);
      end;
    end;
  end;
  // Not support
  if (XMLUtil.GetAttributeValue(Node, ATTR_UML_TEMPLATE_PARAM2) <> '') or
     (XMLUtil.FindFirstNode(Node, NODE_UML_ELEM_TEMPLATE_PARAM2) <> nil)
  then AppUtil.AddLog(Format(MSG_MODEL_ELEM_PROP_NOT_SUPPORT, [UML_MODEL_ELEMENT, ATTR_UML_TEMPLATE_PARAM2]));
  if (XMLUtil.GetAttributeValue(Node, ATTR_UML_TEMPLATE_PARAM3) <> '') or
     (XMLUtil.FindFirstNode(Node, NODE_UML_ELEM_TEMPLATE_PARAM3) <> nil)
  then AppUtil.AddLog(Format(MSG_MODEL_ELEM_PROP_NOT_SUPPORT, [UML_MODEL_ELEMENT, ATTR_UML_TEMPLATE_PARAM3]));
end;

procedure PXMIToPlasticAdapter.ConvertPropGeneralizableElement(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLGeneralizableElement;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLGeneralizableElement;
  Node := AWrapper.XMLNode;
  // IsRoot
  Str := GetPropValue(Node, ATTR_UML_ROOT, NODE_UML_GENERALIZABLE_IS_ROOT);
  if Str <> '' then Elem.IsRoot := StringToBoolean(Str);
  // IsLeaf
  Str := GetPropValue(Node, ATTR_UML_LEAF, NODE_UML_GENERALIZABLE_IS_LEAF);
  if Str <> '' then Elem.IsLeaf := StringToBoolean(Str);
  // IsAbstract
  Str := GetPropValue(Node, ATTR_UML_ABSTRACT, NODE_UML_GENERALIZABLE_IS_ABSTRACT);
  if Str <> '' then Elem.IsAbstract := StringToBoolean(Str);
end;

procedure PXMIToPlasticAdapter.ConvertPropClassifier(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLClassifier;
  Node, SubNode: IXMLNode;
  Arr: PStrArray;
  I, J: Integer;
  ElemWrapper: PXMIElementWrapper;
  WrapperElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLClassifier;
  Node := AWrapper.XMLNode;
  // PowerTypeGeneralization
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_POWERTYPE_RANGE);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_POWERTYPE_RANGE);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      for J := 0 to FElementWrapperList.Count - 1 do begin
        ElemWrapper := FElementWrapperList.Items[J];
        if ElemWrapper.XmiId = XmiId then begin
          WrapperElem := ElemWrapper.PlasticElement;
          if (WrapperElem <> nil) and (WrapperElem.IsKindOf(UML_GENERALIZATION)) then
            Elem.AddPowertypeGeneralization(WrapperElem as IUMLGeneralization);
        end;
      end;
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropClass(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLClass;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLClass;
  Node := AWrapper.XMLNode;
  // IsActive
  Str := GetPropValue(Node, ATTR_UML_IS_ACTIVE, NODE_UML_CLASS_IS_ACTIVE);
  if Str <> '' then Elem.IsActive := StringToBoolean(Str);
end;

procedure PXMIToPlasticAdapter.ConvertPropFeature(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLFeature;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLFeature;
  Node := AWrapper.XMLNode;
  // OwnerScope
  Str := GetPropValue(Node, ATTR_UML_OWNER_SCOPE, NODE_UML_FEATURE_SCOPE);
  if Str <> '' then Elem.OwnerScope := StringToScope(Str);
end;

procedure PXMIToPlasticAdapter.ConvertPropStructuralFeature(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLStructuralFeature;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLStructuralFeature;
  Node := AWrapper.XMLNode;
  // Changeability
  Str := GetPropValue(Node, ATTR_UML_CHANGEABILITY, NODE_UML_STRUCTURAL_CHANGEABILITY);
  if Str <> '' then Elem.Changeability := StringToChangeable(Str);
  // TargetScope
  Str := GetPropValue(Node, ATTR_UML_TARGET_SCOPE, NODE_UML_STRUCTURAL_TARGET_SCOPE);
  if Str <> '' then Elem.TargetScope := StringToScope(Str);
  // Type
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_TYPE);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_STRUCTURERAL_FEATURE_TYPE);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  Str := GetDataTypeFromList(XmiId);
  if Str <> '' then begin
    if Str = TYPE_UNDEFINED then Elem.TypeExpression := ''
    else Elem.TypeExpression := Str;
  end else begin
    TypeElem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if TypeElem <> nil then Elem.Type_ := TypeElem as IUMLClassifier;
  end;
  // Multiplicity
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_STRUCTURAL_MULTIPLICITY);
  if SubNode <> nil then begin
    Str := GetPropMultiplicity(SubNode);
    if Str <> '' then Elem.Multiplicity := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropAssociationEnd(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLAssociationEnd;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLAssociationEnd;
  Node := AWrapper.XMLNode;
  // IsNavigable
  Str := GetPropValue(Node, ATTR_UML_NAVIGABLE, NODE_UML_ASSOC_END_NAVIGABLE);
  if Str <> '' then Elem.IsNavigable := StringToBoolean(Str);
  // Ordering
  Str := GetPropValue(Node, ATTR_UML_ORDERING, NODE_UML_ASSOC_END_ORDERING);
  if Str <> '' then Elem.Ordering := StringToOrdering(Str);
  // Aggregation
  Str := GetPropValue(Node, ATTR_UML_AGGREGATION, NODE_UML_ASSOC_END_AGGREGATION);
  if Str <> '' then Elem.Aggregation := StringToAggregation(Str);
  // TargetScope
  Str := GetPropValue(Node, ATTR_UML_TARGET_SCOPE, NODE_UML_ASSOC_END_TARGET_SCOPE);
  if Str <> '' then Elem.TargetScope := StringToScope(Str);
  // Multiplicity
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOC_END_MULTIPLICITY);
  if SubNode <> nil then begin
    Str := GetPropMultiplicity(SubNode);
    if Str <> '' then Elem.Multiplicity := Str;
  end;
  // Changeability
  Str := GetPropValue(Node, ATTR_UML_CHANGEABILITY, NODE_UML_ASSOC_END_CHANGEABILITY);
  if Str <> '' then Elem.Changeability := StringToChangeable(Str);
end;

procedure PXMIToPlasticAdapter.ConvertPropAttribute(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLAttribute;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLAttribute;
  Node := AWrapper.XMLNode;
  // InitialValue
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ATTR_INITIAL_VALUE);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.InitialValue := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropBehavioralFeature(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLBehavioralFeature;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLBehavioralFeature;
  Node := AWrapper.XMLNode;
  // IsQuery
  Str := GetPropValue(Node, ATTR_UML_QUERY, NODE_BEHAVIORAL_IS_QUERY);
  if Str <> '' then Elem.IsQuery := StringToBoolean(Str);
end;

procedure PXMIToPlasticAdapter.ConvertPropOperation(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLOperation;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLOperation;
  Node := AWrapper.XMLNode;
  // Concurrency
  Str := GetPropValue(Node, ATTR_UML_CONCURRENCY, NODE_UML_OPERATION_CONCURRENCY);
  if Str <> '' then Elem.Concurrency := StringToCallConcurrency(Str);
  // IsRoot
  Str := GetPropValue(Node, ATTR_UML_ROOT, NODE_UML_OPERATION_IS_ROOT);
  if Str <> '' then Elem.IsRoot := StringToBoolean(Str);
  // IsLeaf
  Str := GetPropValue(Node, ATTR_UML_LEAF, NODE_UML_OPERATION_IS_LEAF);
  if Str <> '' then Elem.IsLeaf := StringToBoolean(Str);
  // IsAbstract
  Str := GetPropValue(Node, ATTR_UML_ABSTRACT, NODE_UML_OPERATION_IS_ABSTRACT);
  if Str <> '' then Elem.IsAbstract := StringToBoolean(Str);
  // Specification
  Str := GetPropValue2(Node, ATTR_UML_SPEC, NODE_UML_OPERATION_SPEC);
  if Str <> '' then Elem.Specification := Str;
end;

procedure PXMIToPlasticAdapter.ConvertPropParameter(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLParameter;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLParameter;
  Node := AWrapper.XMLNode;
  // DefaultValue
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_PARAM_DEFAULT);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.DefaultValue := Str;
  end;
  // DirectionKind
  Str := GetPropValue(Node, ATTR_UML_KIND, NODE_UML_PARAM_KIND);
  if Str <> '' then Elem.DirectionKind := StringToParameterDirection(Str);
  // Type
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_TYPE);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_PARAMETER_TYPE);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  Str := GetDataTypeFromList(XmiId);
  if Str <> '' then begin
    if Str = TYPE_UNDEFINED then Elem.TypeExpression := ''
    else Elem.TypeExpression := Str;
  end else begin
    TypeElem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if TypeElem <> nil then Elem.Type_ := TypeElem as IUMLClassifier;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropGeneralization(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLGeneralization;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLGeneralization;
  Node := AWrapper.XMLNode;
  // Discriminator
  Str := GetPropValue2(Node, ATTR_UML_DISCRIMINATOR, NODE_UML_GENERALIZATION_DISCRIMINATOR);
  if Str <> '' then Elem.Discriminator := Str;
  // Powertype
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_POWER_TYPE);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_GENERALIZATION_POWER_TYPE);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if TypeElem <> nil then Elem.Powertype := TypeElem as IUMLClassifier;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropRealization(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLRealization;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLRealization;
  Node := AWrapper.XMLNode;
  // Mapping
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ABSTRACTION_MAPPING);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.Mapping := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropAssociationClass(AWrapper: PXMIElementWrapper);
begin
  // nothing to do
end;

procedure PXMIToPlasticAdapter.ConvertPropComponent(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLComponent;
  Node, SubNode, SubNode2: IXMLNode;
  TypeElem: IElement;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLComponent;
  Node := AWrapper.XMLNode;
  // Resident
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_COMPONENT_RESIDENT);
  if SubNode = nil then Exit;
  for I := 0 to SubNode.ChildNodes.Count - 1 do begin
    SubNode2 := SubNode.ChildNodes.Nodes[I];
    if SubNode2.NodeName = NODE_UML_ELEMENT_RESIDENCE then begin
      XmiId := XMLUtil.GetAttributeValue(SubNode2, ATTR_UML_RESIDENT);
      if XmiId = '' then begin
        SubNode2 := XMLUtil.FindFirstNode(SubNode2, NODE_UML_ELEM_RESIDENCE_RESIDENT);
        XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode2, ATTR_XMI_REF);
      end;
      if XmiId <> '' then begin
        TypeElem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
        if TypeElem <> nil then Elem.AddResident(TypeElem as IUMLModelElement);
      end;
    end; 
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropNode(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLNode;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
  ElemWrapper: PXMIElementWrapper;
  Arr: PStrArray;
  I, J: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLNode;
  Node := AWrapper.XMLNode;
  // DeployedComponent
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_RESIDENT);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_RESIDENT);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      for J := 0 to FElementWrapperList.Count - 1 do begin
        ElemWrapper := FElementWrapperList.Items[J];
        if ElemWrapper.XmiId = XmiId then begin
          TypeElem := ElemWrapper.PlasticElement;
          if (TypeElem <> nil) and (TypeElem.IsKindOf(UML_COMPONENT)) then
            Elem.AddDeployedComponent(TypeElem as IUMLComponent);
        end;
      end;
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropTemplateParameter(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLTemplateParameter;
  TypeElem: IElement;
  Node, SubNode, RefNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLTemplateParameter;
  Node := AWrapper.XMLNode;
  // Name, ParameterType
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_MODEL_ELEM2);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TEMPLATE_PARAM_MODEL_ELEM2);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId = '' then begin
    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_MODEL_ELEMENT);
    if XmiId = '' then begin
      SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TEMPLATE_PARAMETER_MODEL_ELEMENT);
      if SubNode <> nil then
        XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    end;
  end;
  if XmiId <> '' then RefNode := GetParameterFromList(XmiId);
  if RefNode <> nil then begin
    Str := XMLUtil.GetAttributeValue(RefNode, ATTR_UML_NAME);
    if Str <> '' then Elem.Name := Str;
    XmiId := XMLUtil.GetAttributeValue(RefNode, ATTR_UML_TYPE);
    if XmiId = '' then begin
      SubNode := XMLUtil.FindFirstNode(RefNode, NODE_UML_PARAMETER_TYPE);
      if SubNode <> nil then
        XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    end;
    if XmiId <> '' then begin
      Str := GetDataTypeFromList(XmiId);
      if Str = '' then begin
        TypeElem := GetElementFromList(XmiId, ELEM_MODEL);
        if TypeElem <> nil then Str := (TypeElem as IModel).Name;
      end;
      if Str <> '' then Elem.ParameterType := Str;
    end;
  end;
  // DefaultValue
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_DEFAULT_ELEM);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TEMPLATE_PARAM_DEFAULT);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    RefNode := GetParameterFromList(XmiId);
    if RefNode <> nil then begin
      SubNode := XMLUtil.FindFirstNode(RefNode, NODE_UML_PARAM_DEFAULT);
      if SubNode <> nil then begin
        Str := GetPropExpressionValue(SubNode);
        if Str <> '' then Elem.DefaultValue := Str;
      end;
    end;
  end;
  // DefaultElement
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_DEFAULT_ELEM);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TEMPLATE_PARAM_DEFAULT);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
    if TypeElem <> nil then Elem.DefaultElement := TypeElem as IUMLModelElement;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSignal(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  ContextArr, SendArr: PStrArray;
  Elem: IUMLSignal;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLSignal;
  Node := AWrapper.XMLNode;
  // Context
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_CONTEXT);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_SIGNAL_CONTEXT);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    ContextArr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(ContextArr) - 1 do begin
      XmiId := ContextArr[I];
      TypeElem := GetElementFromList(XmiId, UML_BEHAVIORAL_FEATURE);
      if TypeElem <> nil then Elem.AddContext(TypeElem as IUMLBehavioralFeature);
    end;
  end;
  // SendAction
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_SEND_ACTION);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_SIGNAL_SEND_ACTION);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    SendArr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(SendArr) - 1 do begin
      XmiId := SendArr[I];
      TypeElem := GetElementFromList(XmiId, UML_SEND_ACTION);
      if TypeElem <> nil then Elem.AddSendAction(TypeElem as IUMLSendAction);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropAction(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLAction;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLAction;
  Node := AWrapper.XMLNode;
  // Recurrence
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ACTION_RECURRENCE);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.Recurrence := Str;
  end;
  // Target
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ACTION_TARGET);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.Target := Str;
  end;
  // IsAsynchronous
  Str := GetPropValue(Node, ATTR_UML_IS_ASYNCHRONOUS, NODE_UML_ACTION_IS_ASYNCHRONOUS);
  if Str <> '' then Elem.IsAsynchronous := StringToBoolean(Str);
  // Script
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ACTION_SCRIPT);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.Target := Str;
  end;
  // Not support
  if (XMLUtil.GetAttributeValue(Node, ATTR_UML_STIMULUS) <> '') or
     (XMLUtil.FindFirstNode(Node, NODE_UML_ACTION_STIMULUS) <> nil)
  then AppUtil.AddLog(Format(MSG_MODEL_ELEM_PROP_NOT_SUPPORT, [UML_ACTION, ATTR_UML_STIMULUS]));
end;

procedure PXMIToPlasticAdapter.ConvertPropCreateAction(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLCreateAction;
  Node: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLCreateAction;
  Node := AWrapper.XMLNode;
  // Instantiation
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_INSTANTIATION);
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if TypeElem <> nil then Elem.Instantiation := TypeElem as IUMLClassifier;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropLink(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLLink;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLLink;
  Node := AWrapper.XMLNode;
  // Association
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_ASSOCIATION);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_LINK_ASSOCIATION);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_ASSOCIATION);
    if TypeElem <> nil then Elem.Association := TypeElem as IUMLAssociation;
  end;
  // Not support
  if (XMLUtil.GetAttributeValue(Node, ATTR_UML_STIMULUS) <> '')
  then AppUtil.AddLog(Format(MSG_MODEL_ELEM_PROP_NOT_SUPPORT, [UML_LINK, ATTR_UML_STIMULUS]));
end;

procedure PXMIToPlasticAdapter.ConvertPropCallAction(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLCallAction;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLCallAction;
  Node := AWrapper.XMLNode;
  // Operation
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_OPERATION);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_CALL_ACTION_OPERATION);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_OPERATION);
    if TypeElem <> nil then Elem.Operation := TypeElem as IUMLOperation;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSendAction(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLSendAction;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLSendAction;
  Node := AWrapper.XMLNode;
  // Signal
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_SIGNAL);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_SEND_ACTION_SIGNAL);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_SIGNAL);
    if TypeElem <> nil then Elem.Signal := TypeElem as IUMLSignal;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropInstance(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLInstance;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLInstance;
  Node := AWrapper.XMLNode;
  // Classifier
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_CLASSIFIER);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_INSTANCE_CLASSIFIER);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if TypeElem <> nil then Elem.Classifier := TypeElem as IUMLClassifier;
  end;
  // ComponentInstance
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_COMPONENT_INSTANCE);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_INSTANCE_COMPONENT_INSTANCE);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_COMPONENT_INSTANCE);
    if TypeElem <> nil then Elem.ComponentInstance := TypeElem as IUMLComponentInstance;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropComponentInstance(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLComponentInstance;
  Node, SubNode: IXMLNode;
  Arr: PStrArray;
  TypeElem: IElement;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLComponentInstance;
  Node := AWrapper.XMLNode;
  // Resident
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_RESIDENT);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_COMPONENT_INSTANCE_NODE_INSTANCE);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_INSTANCE);
      if TypeElem <> nil then Elem.AddResident(TypeElem as IUMLInstance);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropNodeInstance(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLNodeInstance;
  Node, SubNode: IXMLNode;
  Arr: PStrArray;
  TypeElem: IElement;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLNodeInstance;
  Node := AWrapper.XMLNode;
  // Resident
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_RESIDENT);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_NODE_INSTANCE_RESIDENT);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_COMPONENT_INSTANCE);
      if TypeElem <> nil then Elem.AddResident(TypeElem as IUMLComponentInstance);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropExtend(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLExtend;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLExtend;
  Node := AWrapper.XMLNode;
  // Condition
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_EXTEND_CONDITION);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.Condition := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropEvent(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLEvent;
  Node, SubNode: IXMLNode;
  Arr: PStrArray;
  TypeElem: IElement;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLEvent;
  Node := AWrapper.XMLNode;
  // State
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_STATE);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_EVENT_STATE);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_STATE);
      if TypeElem <> nil then Elem.AddState(TypeElem as IUMLState);
    end;
  end;
  // Not support
  if (XMLUtil.FindFirstNode(Node, NODE_UML_EVENT_PARAM) <> nil)
  then AppUtil.AddLog(Format(MSG_MODEL_ELEM_PROP_NOT_SUPPORT, [UML_EVENT, ATTR_UML_PARAMETER]));
end;

procedure PXMIToPlasticAdapter.ConvertPropState(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLState;
  Node, SubNode: IXMLNode;
  Arr: PStrArray;
  TypeElem: IElement;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLState;
  Node := AWrapper.XMLNode;
  // DeferrableEvent
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_DEFERRABLE_EVENT);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_STATE_DEFERRABLE_EVENT);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_EVENT);
      if TypeElem <> nil then Elem.AddDeferrableEvent(TypeElem as IUMLEvent);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropCompositeState(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLCompositeState;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLCompositeState;
  Node := AWrapper.XMLNode;
  // IsConcurrent
  Str := GetPropValue(Node, ATTR_UML_IS_CONCURRENT, NODE_UML_COMPOSITE_STATE_CONCUR);
  if Str <> '' then Elem.IsConcurrent := StringToBoolean(Str);
end;

procedure PXMIToPlasticAdapter.ConvertPropTimeEvent(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLTimeEvent;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLTimeEvent;
  Node := AWrapper.XMLNode;
  // Condition
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TIME_EVENT_WHEN);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.When := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropCallEvent(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLCallEvent;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLCallEvent;
  Node := AWrapper.XMLNode;
  // Operation
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_OPERATION);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_CALL_EVENT_OPERATION);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_OPERATION);
    if TypeElem <> nil then Elem.Operation := TypeElem as IUMLOperation;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSignalEvent(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLSignalEvent;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLSignalEvent;
  Node := AWrapper.XMLNode;
  // Signal
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_SIGNAL);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_SIGNAL_EVENT_SIGNAL);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_SIGNAL);
    if TypeElem <> nil then Elem.Signal := TypeElem as IUMLSignal;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropTransition(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLTransition;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLTransition;
  Node := AWrapper.XMLNode;
  // GuardCondition
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TRANSITION_GUARD);
  if SubNode = nil then Exit;
  SubNode := XMLUtil.FindFirstNode(SubNode, NODE_UML_GUARD_EXPR);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.GuardCondition := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropChangeEvent(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLChangeEvent;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLChangeEvent;
  Node := AWrapper.XMLNode;
  // ChangeExpression
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_CHANGE_EVENT_EXPR);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.ChangeExpression := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropPseudoState(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLPseudostate;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLPseudostate;
  Node := AWrapper.XMLNode;
  // Kind
  Str := GetPropValue(Node, ATTR_UML_KIND, NODE_UML_PSEUDO_KIND);
  if Str <> '' then Elem.PseudostateKind := StringToPseudostate(Str);
end;

procedure PXMIToPlasticAdapter.ConvertPropCollaboration(AWrapper: PXMIElementWrapper);
var
  Node: IXMLNode;
begin
  Node := AWrapper.XMLNode;
  // Not support
  if (XMLUtil.GetAttributeValue(Node, ATTR_UML_CONSTRAINING_ELEM) <> '') or
     (XMLUtil.FindFirstNode(Node, NODE_UML_CONSTRAINING_ELEM) <> nil)
  then AppUtil.AddLog(Format(MSG_MODEL_ELEM_PROP_NOT_SUPPORT, [UML_COLLABORATION, ATTR_UML_CONSTRAINING_ELEM]));
end;

procedure PXMIToPlasticAdapter.ConvertPropSubmachineSate(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLSubmachineState;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLSubmachineState;
  Node := AWrapper.XMLNode;
  // Submachine
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_SUBMACHINE);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_SUBMACHINESTATE_SUBMACHINE);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_STATE_MACHINE);
    if TypeElem <> nil then Elem.Submachine := TypeElem as IUMLStatemachine;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropPartition(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLPartition;
  Node, SubNode: IXMLNode;
  Arr: PStrArray;
  TypeElem: IElement;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLPartition;
  Node := AWrapper.XMLNode;
  // Content
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_CONTENTS);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_PARTITION_CONENTS);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
      if TypeElem <> nil then Elem.AddContent(TypeElem as IUMLModelElement);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropClassifierRole(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLClassifierRole;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
  Arr: PStrArray;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLClassifierRole;
  Node := AWrapper.XMLNode;
  // Multiplicity
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_CLASSIFIER_ROLE_MULTIPLICITY);
  if SubNode <> nil then begin
    Str := GetPropMultiplicity(SubNode);
    if Str <> '' then Elem.Multiplicity := Str;
  end;
  // Base
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_BASE);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_CLASSIFIER_ROLE_BASE);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_CLASSIFIER);
    if TypeElem <> nil then Elem.Base := TypeElem as IUMLClassifier;
  end;
  // AvailableFeature
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_AVAILABLE_FEATURE);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_CLASSIFIER_ROLE_FEATURE);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_FEATURE);
      if TypeElem <> nil then Elem.AddAvailableFeature(TypeElem as IUMLFeature);
    end;
  end;
  // AvailableContent
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_AVAILABLE_CONTENTS);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_CLASSIFIER_ROLE_CONTENTS);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_MODEL_ELEMENT);
      if TypeElem <> nil then Elem.AddAvailableContent(TypeElem as IUMLModelElement);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropAssociationRole(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLAssociationRole;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
  Arr: PStrArray;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLAssociationRole;
  Node := AWrapper.XMLNode;
  // Multiplicity
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOC_ROLE_MULTIPLICITY);
  if SubNode <> nil then begin
    Str := GetPropMultiplicity(SubNode);
    if Str <> '' then Elem.Multiplicity := Str;
  end;
  // Base
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_BASE);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOCIATION_ROLE_BASE);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_ASSOCIATION);
    if TypeElem <> nil then Elem.Base := TypeElem as IUMLAssociation;
  end;
  // Message
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_MESSAGE);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOC_ROLE_MESSAGE);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_MESSAGE);
      if TypeElem <> nil then Elem.AddMessage(TypeElem as IUMLMessage);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropAssociationEndRole(AWrapper: PXMIElementWrapper);
var
  Str, XmiId: string;
  Elem: IUMLAssociationEndRole;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
  Arr: PStrArray;
  I: Integer;
begin
  Elem := AWrapper.PlasticElement as IUMLAssociationEndRole;
  Node := AWrapper.XMLNode;
  // CollaborationMultiplicity
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOC_END_ROLE_COLL_MULTIPLICITY);
  if SubNode <> nil then begin
    Str := GetPropMultiplicity(SubNode);
    if Str <> '' then Elem.CollaborationMultiplicity := Str;
  end;
  // Base
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_BASE);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOC_END_ROLE_BASE);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_ASSOCIATION_END);
    if TypeElem <> nil then Elem.Base := TypeElem as IUMLAssociationEnd;
  end;
  // AvailableQualifier
  Str := XMLUtil.GetAttributeValue(Node, ATTR_UML_AVAILABLE_QUALIFIER);
  if Str = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ASSOCIATION_END_ROLE_AVAILABLE_QUALIFIER);
    if SubNode <> nil then
      Str := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if Str <> '' then begin
    Arr := SplitStringWithMatch(Str, ' ');
    for I := 0 to Length(Arr) - 1 do begin
      XmiId := Arr[I];
      TypeElem := GetElementFromList(XmiId, UML_ATTRIBUTE);
      if TypeElem <> nil then Elem.AddAvailableQualifier(TypeElem as IUMLAttribute);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropMessage(AWrapper: PXMIElementWrapper);
var
  XmiId: string;
  Elem: IUMLMessage;
  Node, SubNode: IXMLNode;
  TypeElem: IElement;
begin
  Elem := AWrapper.PlasticElement as IUMLMessage;
  Node := AWrapper.XMLNode;
  // Activator
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_ACTIVATOR);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_MESSAGE_ACTIVATOR);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_MESSAGE);
    if TypeElem <> nil then Elem.Activator := TypeElem as IUMLMessage;
  end;
  // Predecessor
  XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_PREDECESSOR);
  if XmiId = '' then begin
    SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_MESSAGE_PREDECESSOR);
    if SubNode <> nil then
      XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
  end;
  if XmiId <> '' then begin
    TypeElem := GetElementFromList(XmiId, UML_MESSAGE);
    if TypeElem <> nil then Elem.Activator := TypeElem as IUMLMessage;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSubactivityState(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLSubactivityState;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLSubactivityState;
  Node := AWrapper.XMLNode;
  // IsDynamic
  Str := GetPropValue(Node, ATTR_UML_IS_DYNAMIC, NODE_UML_SUBACTIVITY_DYNAMIC);
  if Str <> '' then Elem.IsDynamic := StringToBoolean(Str);
  // DynamicArguments
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_SUBACTIVITY_ARGS);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.DynamicArguments := Str;
  end;
  // DynamicMultiplicity
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_SUBACTIVITY_MULTIPLICITY);
  if SubNode <> nil then begin
    Str := GetPropMultiplicity(SubNode);
    if Str <> '' then Elem.DynamicMultiplicity := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropActionState(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLActionState;
  Node, SubNode: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLActionState;
  Node := AWrapper.XMLNode;
  // IsDynamic
  Str := GetPropValue(Node, ATTR_UML_IS_DYNAMIC, NODE_UML_ACTION_STATE_DYNAMIC);
  if Str <> '' then Elem.IsDynamic := StringToBoolean(Str);
  // DynamicArguments
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ACTION_STATE_ARGS);
  if SubNode <> nil then begin
    Str := GetPropExpressionValue(SubNode);
    if Str <> '' then Elem.DynamicArguments := Str;
  end;
  // DynamicMultiplicity
  SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_ACTION_STATE_MULTIPLICITY);
  if SubNode <> nil then begin
    Str := GetPropMultiplicity(SubNode);
    if Str <> '' then Elem.DynamicMultiplicity := Str;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSubsystem(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLSubsystem;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLSubsystem;
  Node := AWrapper.XMLNode;
  // IsInstantiable
  Str := GetPropValue(Node, ATTR_UML_IS_INSTANTIALBLE, NODE_UML_SUBSYSTEM_IS_INSTANTIABLE);
  if Str <> '' then Elem.IsInstantiable := StringToBoolean(Str);
end;

procedure PXMIToPlasticAdapter.ConvertPropDiagram(AWrapper: PXMIElementWrapper);
var
  Str: string;
  Elem: IUMLDiagram;
  Node: IXMLNode;
begin
  Elem := AWrapper.PlasticElement as IUMLDiagram;
  Node := AWrapper.XMLNode;
  // Documentation
  Str := GetPropDiagramStyle(Node);
  if (Str <> '') and (Pos('Doc:', Str) >= 1) then
    Elem.Documentation := Copy(Str, 5, Length(Str));
end;

procedure PXMIToPlasticAdapter.ConvertPropViewFontSize(Elem: IView; Node: IXMLNode);
var Str: string;
begin
  try
    Str := GetPropDiagramElemStyleValue(Node, ATTR_FONT_SIZE);
    if Str <> '' then Elem.FontSize := StrToInt(Str);
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropViewFontFace(Elem: IView; Node: IXMLNode);
var Str: string;
begin
  try
    Str := GetPropDiagramElemStyleValue(Node, ATTR_FONT_FACE);
    if Str <> '' then Elem.FontFace := Str;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropViewFontColor(Elem: IView; Node: IXMLNode);
var Str: string;
begin
  try
    Str := StringToColor(
      GetPropDiagramElemStyleValue(Node, ATTR_FONT_COLOR_BLUE),
      GetPropDiagramElemStyleValue(Node, ATTR_FONT_COLOR_GREEN),
      GetPropDiagramElemStyleValue(Node, ATTR_FONT_COLOR_RED)
    );
    if Str <> '' then Elem.FontColor := Str;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropViewFontStyle(Elem: IView; Node: IXMLNode);
var Str: string;
begin
  try
    Str := StringToFontStyle(
      GetPropDiagramElemStyleValue(Node, ATTR_FONT_BOLD),
      GetPropDiagramElemStyleValue(Node, ATTR_FONT_ITALIC),
      GetPropDiagramElemStyleValue(Node, ATTR_FONT_UNDER_LINE),
      GetPropDiagramElemStyleValue(Node, ATTR_FONT_STRIKE)
    );
    if Str <> '' then Elem.FontStyle := StrToInt(Str);
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropViewLineColor(Elem: IView; Node: IXMLNode);
var Str: string;
begin
  try
    Str := StringToColor(
      GetPropDiagramElemStyleValue(Node, ATTR_LINE_COLOR_BLUE),
      GetPropDiagramElemStyleValue(Node, ATTR_LINE_COLOR_GREEN),
      GetPropDiagramElemStyleValue(Node, ATTR_LINE_COLOR_RED)
    );
    if Str <> '' then Elem.LineColor := Str;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropNodeViewFillColor(Elem: INodeView; Node: IXMLNode);
var Str: string;
begin
  try
    Str := StringToColor(
      GetPropDiagramElemStyleValue(Node, ATTR_FILL_COLOR_BLUE),
      GetPropDiagramElemStyleValue(Node, ATTR_FILL_COLOR_GREEN),
      GetPropDiagramElemStyleValue(Node, ATTR_FILL_COLOR_RED)
    );
    if Str <> '' then begin
      if GetPropDiagramElemStyleValue(Node, ATTR_FILL_COLOR_TRANSP) <> '0' then
      Elem.FillColor := Str;
    end;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropNodeViewAutoResize(Elem: INodeView; Node: IXMLNode);
var Str: string;
begin
  try
    Str := GetPropDiagramElemStyleValue(Node, ATTR_AUTO_RESIZE);
    if Str <> '' then Elem.AutoResize := StringToBoolean2(Str);
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropViewOpSignature(Elem: INodeView; Node: IXMLNode);
var
  AMeta: IMetaClass;
  Str: string;
begin
  try
    AMeta := Elem.GetMetaClass;
    if (AMeta <> nil) and AMeta.ExistsAttribute(ATTR_UML_SHOW_OP_SIG) then begin
      Str := GetPropDiagramElemStyleValue(Node, ATTR_SHOW_OP_SIG);
      if Str = '1' then begin
        if Elem.IsKindOf(UML_SUBSYSTEM_VIEW) then
          (Elem as IUMLSubsystemView).ShowOperationSignature := True
        else if (Elem.IsKindOf(UML_CLASSIFIER_VIEW)) then
          (Elem as IUMLClassifierView).ShowOperationSignature := True;
      end;
    end;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSuppressAttributes(Elem: INodeView; Node: IXMLNode);
var
  AMeta: IMetaClass;
  Str: string;
begin
  try
    AMeta := Elem.GetMetaClass;
    if (AMeta <> nil) and AMeta.ExistsAttribute(ATTR_UML_SUPPRESS_ATTR) then begin
      Str := GetPropDiagramElemStyleValue(Node, ATTR_SUPPRESS_ATTR);
      if Str <> '1' then begin
        Str := GetPropDiagramElemStyleValue(Node, ATTR_SHOW_ALL_ATTR);
        if Str = '0' then Str := '1'
        else Str := '0';
      end;
      if Str = '1' then begin
        if Elem.IsKindOf(UML_CLASSIFIER_VIEW) then
          (Elem as IUMLClassifierView).SuppressAttributes := True;
      end;
    end;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSuppressOperations(Elem: INodeView; Node: IXMLNode);
var
  AMeta: IMetaClass;
  Str: string;
begin
  try
    AMeta := Elem.GetMetaClass;
    if (AMeta <> nil) and AMeta.ExistsAttribute(ATTR_UML_SUPPRESS_OP) then begin
      Str := GetPropDiagramElemStyleValue(Node, ATTR_SUPPRESS_OP);
      if Str <> '1' then begin
        Str := GetPropDiagramElemStyleValue(Node, ATTR_SHOW_ALL_OP);
        if Str = '0' then Str := '1'
        else Str := '0';
      end;
      if Str = '1' then begin
        if Elem.IsKindOf(UML_SUBSYSTEM_VIEW) then
          (Elem as IUMLSubsystemView).SuppressOperations := True
        else if (Elem.IsKindOf(UML_CLASSIFIER_VIEW)) then
          (Elem as IUMLClassifierView).SuppressOperations := True;
      end;
    end;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropNodeViewRect(Elem: INodeView; Node: IXMLNode);
var
  Arr: PStrArray;
  L, T, W, H: Integer;
begin
  try
    Arr := GetConstructParamGeometry(Node);
    L := RationalRoseGeometryCalc(GetArrayValue(Arr, 1), GetArrayValue(Arr, 3)) div 3;
    T := RationalRoseGeometryCalc(GetArrayValue(Arr, 2), GetArrayValue(Arr, 4)) div 3;
    W := GetArrayValue(Arr, 3) div 3;
    H := GetArrayValue(Arr, 4) div 3;

    Elem.Left := L;
    Elem.Top := T;
    Elem.Width := W;
    Elem.Height := H;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSwimlaneViewRect(Elem: IUMLSwimlaneView; Node: IXMLNode);
var
  Arr: PStrArray;
  L, W: Integer;
begin
  try
    Arr := GetConstructParamGeometry(Node);
    L := RationalRoseGeometryCalc(GetArrayValue(Arr, 1), GetArrayValue(Arr, 3)) div 3;
    W := GetArrayValue(Arr, 3) div 3;
    Elem.Left := L + W;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertPropSeqMessageViewRect(DiagramView: IDiagramView;
  ElemView: IUMLCustomSeqMessageView; Node: IXMLNode);
var
  ElemMessage: IUMLMessage;
  ElemRole: IUMLClassifierRole;
  ElemRoleView: IUMLSeqClassifierRoleView;
  Arr: PStrArray;
  T: Integer;
  P1, P2: TPoint;
  Pts: IPoints;
begin
  try
    Arr := GetConstructParamGeometry(Node);
    T := RationalRoseGeometryCalc(GetArrayValue(Arr, 2), GetArrayValue(Arr, 4)) div 3;

    ElemMessage := ElemView.Model as IUMLMessage;
    if ElemMessage <> nil then begin
      P1.X := 0; P1.Y := 0;
      P2.X := 0; P2.Y := 0;
      ElemRole := ElemMessage.Sender;
      ElemRoleView := GetOwnedViewOfModel(DiagramView, ElemRole) as IUMLSeqClassifierRoleView;
      if ElemRoleView <> nil then begin
        P1.X := ElemRoleView.LifeLine.Left;
        P1.Y := T;
      end;
      ElemRole := ElemMessage.Receiver;
      ElemRoleView := GetOwnedViewOfModel(DiagramView, ElemRole) as IUMLSeqClassifierRoleView;
      if ElemRoleView <> nil then begin
        P2.X := ElemRoleView.LifeLine.Left;
        P2.Y := T;
      end;
      if (P1.Y <> 0) and (P2.Y <> 0) then begin
        Pts := ElemView.Points;
        try
          Pts.BeginUpdate;
          Pts.ClearPoints;
          Pts.AddPoint(P1.X, P1.Y);
          Pts.AddPoint(P2.X, P2.Y);
        finally
          Pts.EndUpdate;
        end;
      end;
    end;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElementAtFirstLoop(Node: IXMLNode);
var
  I: Integer;
  SubNode: IXMLNode;
  NodeName, XmiId: string;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    SubNode := Node.ChildNodes.Nodes[I];
    NodeName := SubNode.NodeName;
    XmiId := XMLUtil.GetAttributeValue(SubNode, ATTR_XMI_ID); 
    try
      Inc(FCurrentXMINodeIndex);
      StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');

           if NodeName = NODE_UML_MODEL then ConvertElemModel(SubNode)
      else if NodeName = NODE_UML_SUBSYSTEM then ConvertElemSubsystem(SubNode)
      else if NodeName = NODE_UML_PACKAGE then ConvertElemPackage(SubNode)
      else if NodeName = NODE_UML_CLASS then ConvertElemClass(SubNode)
      else if NodeName = NODE_UML_ASSOCIATION_CLASS then ConvertElemAssociationClass(SubNode)
      else if NodeName = NODE_UML_INTERFACE then ConvertElemInterface(SubNode)
      else if NodeName = NODE_UML_SIGNAL then ConvertElemSignal(SubNode)
      else if NodeName = NODE_UML_EXCEPTION then ConvertElemException(SubNode)
      else if NodeName = NODE_UML_COMPONENT then ConvertElemComponent(SubNode)
      else if NodeName = NODE_UML_COMPONENT_INSTANCE then ConvertElemComponentInstance(SubNode)
      else if NodeName = NODE_UML_NODE then ConvertElemNode(SubNode)
      else if NodeName = NODE_UML_NODE_INSTANCE then ConvertElemNodeInstance(SubNode)
      else if NodeName = NODE_UML_USECASE then ConvertElemUseCase(SubNode)
      else if NodeName = NODE_UML_ACTOR then ConvertElemActor(SubNode)
      else if NodeName = NODE_UML_ACTIVITY_GRAPH then ConvertElemActivityGraph(SubNode)
      else if NodeName = NODE_UML_STATE_MACHINE then ConvertElemStateMachine(SubNode)
      else if NodeName = NODE_UML_COLLABORATION then ConvertElemCollaboration(SubNode)
      else if NodeName = NODE_UML_INTERACTION then ConvertElemInteraction(SubNode)
      else if NodeName = NODE_UML_ACTION_STATE then ConvertElemActionState(SubNode)
      else if NodeName = NODE_UML_CALL_STATE then ConvertElemActionState(SubNode)
      else if NodeName = NODE_UML_SUBACTIVITY_STATE then ConvertElemSubactivityState(SubNode)
      else if NodeName = NODE_UML_PSEUDO_STATE then ConvertElemPseudostate(SubNode)
      else if NodeName = NODE_UML_FINAL_STATE then ConvertElemFinalState(SubNode)
      else if NodeName = NODE_UML_SUBMACHINE_STATE then ConvertElemSubmachineState(SubNode)
      else if NodeName = NODE_UML_PARTITION then ConvertElemPartition(SubNode)
      else if NodeName = NODE_UML_ATTRIBUTE then ConvertElemAttribute(SubNode)
      else if NodeName = NODE_UML_OPERATION then ConvertElemOperation(SubNode)
      else if NodeName = NODE_UML_PARAMETER then ConvertElemParameter(SubNode)
      else if NodeName = NODE_UML_TEMPLATE_PARAMETER then ConvertElemTemplateParameter(SubNode)
      else if NodeName = NODE_UML_CLASSIFIER_ROLE then ConvertElemClassifierRole(SubNode)
      else if NodeName = NODE_UML_OBJECT then ConvertElemObject(SubNode)
      else if NodeName = NODE_UML_COMPOSITE_STATE then ConvertElemCompositeState(SubNode)
      else if NodeName = NODE_UML_SIMPLE_STATE then ConvertElemCompositeState(SubNode)
      else if NodeName = NODE_UML_STATE then ConvertElemCompositeState(SubNode)
      else if NodeName = NODE_UML_OBJECT_FLOW_STATE then ConvertElemObjectFlowState(SubNode)
      else if NodeName = NODE_UML_COMMENT then ConvertElemNotSupport1(SubNode)
      else if NodeName = NODE_UML_STEREOTYPE then ConvertElemNotSupport1(SubNode)
      else if NodeName = NODE_UML_TAGGED_VALUE then ConvertElemNotSupport1(SubNode)
      else if NodeName = NODE_UML_DATA_TYPE then ConvertElemNotSupport1(SubNode)
      else if NodeName = NODE_UML_ACTION_SEQUENCE then ConvertElemNotSupport1(SubNode)
      else if NodeName = NODE_UML_GUARD then ConvertElemNotSupport1(SubNode)
      else if NodeName = NODE_UML_METHOD then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_PRESENTATION_ELEMENT then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_SYNC_STATE then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_STUB_STATE then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_CLASSIFIER_IN_STATE then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_FLOW then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_INSTANCE then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_DATA_VALUE then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_ATTRIBUTE_LINK then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_LINK_OBJECT then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_ARGUMENT then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_RECEPTION then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_USECASE_INSTANCE then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_EXTENSION_POINT then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_ELEMENT_IMPORT then ConvertElemNotSupport2(SubNode);
    except on E: Exception do
      begin
        AppUtil.AddLog(Format(MSG_ELEM_CONVERSION_FAILED, [NodeName, XmiId, E.Message]));
      end;
    end;
    // do again with child nodes
    if SubNode.ChildNodes.Count > 0 then ConvertElementAtFirstLoop(SubNode);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertElementAtSecondLoop(Node: IXMLNode);
var
  I: Integer;
  SubNode: IXMLNode;
  NodeName, XmiId: string;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    SubNode := Node.ChildNodes.Nodes[I];
    NodeName := SubNode.NodeName;
    XmiId := XMLUtil.GetAttributeValue(SubNode, ATTR_XMI_ID);
    try
      Inc(FCurrentXMINodeIndex);
      StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');

      if NodeName = NODE_UML_ASSOCIATION then ConvertElemAssociation(SubNode)
      else if NodeName = NODE_UML_ATTRIBUTE then ConvertElemQualifier(SubNode)
      else if NodeName = NODE_UML_TRANSITION then ConvertElemTransition(SubNode)
      else if NodeName = NODE_UML_GENERALIZATION then ConvertElemGeneralization(SubNode)
      else if NodeName = NODE_UML_DEPENDENCY then ConvertElemDependency(SubNode)
      else if NodeName = NODE_UML_ABATRACTION then ConvertElemAbstraction(SubNode)
      else if NodeName = NODE_UML_USAGE then ConvertElemDependencyWithStereotype(SubNode, TYPE_USAGE)
      else if NodeName = NODE_UML_PERMISSION then ConvertElemDependencyWithStereotype(SubNode, TYPE_PERMISSION)
      else if NodeName = NODE_UML_BINDING then ConvertElemDependencyWithStereotype(SubNode, TYPE_BINDING)
      else if NodeName = NODE_UML_INCLUDE then ConvertElemInclude(SubNode)
      else if NodeName = NODE_UML_EXTEND then ConvertElemExtend(SubNode)
      else if NodeName = NODE_UML_ASSOCIATION_ROLE then ConvertElemAssociationRole(SubNode)
      else if NodeName = NODE_UML_MESSAGE then ConvertElemMessage(SubNode)
      else if NodeName = NODE_UML_CALL_ACTION then ConvertElemUninterpretedAction(SubNode)
      else if NodeName = NODE_UML_SEND_ACTION then ConvertElemUninterpretedAction(SubNode)
      else if NodeName = NODE_UML_CREATE_ACTION then ConvertElemUninterpretedAction(SubNode)
      else if NodeName = NODE_UML_DESTROY_ACTION then ConvertElemUninterpretedAction(SubNode)
      else if NodeName = NODE_UML_RETURN_ACTION then ConvertElemUninterpretedAction(SubNode)
      else if NodeName = NODE_UML_TERMINATE_ACTION then ConvertElemUninterpretedAction(SubNode)
      else if NodeName = NODE_UML_UNINTERPRETED_ACTION then ConvertElemUninterpretedAction(SubNode)
      else if NodeName = NODE_UML_SIGNAL_EVENT then ConvertElemSignalEvent(SubNode)
      else if NodeName = NODE_UML_CALL_EVENT then ConvertElemCallEvent(SubNode)
      else if NodeName = NODE_UML_TIME_EVENT then ConvertElemTimeEvent(SubNode)
      else if NodeName = NODE_UML_CHANGE_EVENT then ConvertElemChangeEvent(SubNode)
      else if NodeName = NODE_UML_STIMULUS then ConvertElemNotSupport2(SubNode)
      else if NodeName = NODE_UML_LINK then ConvertElemNotSupport2(SubNode);
    except on E: Exception do
      begin
        AppUtil.AddLog(Format(MSG_ELEM_CONVERSION_FAILED, [NodeName, XmiId, E.Message]));
      end;
    end;
    // do again with child nodes
    if SubNode.ChildNodes.Count > 0 then ConvertElementAtSecondLoop(SubNode);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertProperties(AWrapper: PXMIElementWrapper);
var
  Elem: IElement;
  ElemName: string;
begin
  if (AWrapper = nil) then Exit;
  if (AWrapper.PlasticElement = nil) or (AWrapper.XMLNode = nil) then Exit;
  if AWrapper.Predefined then Exit;

  Elem := AWrapper.PlasticElement;
  try
    if Elem.IsKindOf(ELEM_MODEL) then ElemName := (Elem as IModel).Pathname
    else ElemName := Elem.GetClassName;

    if Elem.IsKindOf(ELEM_MODEL) then ConvertPropModel(AWrapper);
    if Elem.IsKindOf(UML_MODEL_ELEMENT) then ConvertPropModelElement(AWrapper);
    if Elem.IsKindOf(UML_GENERALIZABLE) then ConvertPropGeneralizableElement(AWrapper);
    if Elem.IsKindOf(UML_CLASSIFIER) then ConvertPropClassifier(AWrapper);
    if Elem.IsKindOf(UML_CLASS) then ConvertPropClass(AWrapper);
    if Elem.IsKindOf(UML_FEATURE) then ConvertPropFeature(AWrapper);
    if Elem.IsKindOf(UML_STRUCTURAL) then ConvertPropStructuralFeature(AWrapper);
    if Elem.IsKindOf(UML_ASSOCIATION_END) then ConvertPropAssociationEnd(AWrapper);
    if Elem.IsKindOf(UML_ATTRIBUTE) then ConvertPropAttribute(AWrapper);
    if Elem.IsKindOf(UML_BEHAVIORAL_FEATURE) then ConvertPropBehavioralFeature(AWrapper);
    if Elem.IsKindOf(UML_OPERATION) then ConvertPropOperation(AWrapper);
    if Elem.IsKindOf(UML_PARAMETER) then ConvertPropParameter(AWrapper);
    if Elem.IsKindOf(UML_GENERALIZATION) then ConvertPropGeneralization(AWrapper);
    if Elem.IsKindOf(UML_REALIZATION) then ConvertPropRealization(AWrapper);
    if Elem.IsKindOf(UML_ASSOCIATION_CLASS) then ConvertPropAssociationClass(AWrapper);
    if Elem.IsKindOf(UML_COMPONENT) then ConvertPropComponent(AWrapper);
    if Elem.IsKindOf(UML_NODE) then ConvertPropNode(AWrapper);
    if Elem.IsKindOf(UML_TEMPLATE_PARAMETER) then ConvertPropTemplateParameter(AWrapper);
    if Elem.IsKindOf(UML_SIGNAL) then ConvertPropSignal(AWrapper);
    if Elem.IsKindOf(UML_ACTION) then ConvertPropAction(AWrapper);
    if Elem.IsKindOf(UML_CREATE_ACTION) then ConvertPropCreateAction(AWrapper);
    if Elem.IsKindOf(UML_LINK) then ConvertPropLink(AWrapper);
    if Elem.IsKindOf(UML_CALL_ACTION) then ConvertPropCallAction(AWrapper);
    if Elem.IsKindOf(UML_SEND_ACTION) then ConvertPropSendAction(AWrapper);
    if Elem.IsKindOf(UML_INSTANCE) then ConvertPropInstance(AWrapper);
    if Elem.IsKindOf(UML_COMPONENT_INSTANCE) then ConvertPropComponentInstance(AWrapper);
    if Elem.IsKindOf(UML_NODE_INSTANCE) then ConvertPropNodeInstance(AWrapper);
    if Elem.IsKindOf(UML_EXTEND) then ConvertPropExtend(AWrapper);
    if Elem.IsKindOf(UML_EVENT) then ConvertPropEvent(AWrapper);
    if Elem.IsKindOf(UML_STATE) then ConvertPropState(AWrapper);
    if Elem.IsKindOf(UML_COMPOSITE_STATE) then ConvertPropCompositeState(AWrapper);
    if Elem.IsKindOf(UML_TIME_EVENT) then ConvertPropTimeEvent(AWrapper);
    if Elem.IsKindOf(UML_CALL_EVENT) then ConvertPropCallEvent(AWrapper);
    if Elem.IsKindOf(UML_SIGNAL_EVENT) then ConvertPropSignalEvent(AWrapper);
    if Elem.IsKindOf(UML_TRANSITION) then ConvertPropTransition(AWrapper);
    if Elem.IsKindOf(UML_CHANGE_EVENT) then ConvertPropChangeEvent(AWrapper);
    if Elem.IsKindOf(UML_PSEUDO_STATE) then ConvertPropPseudoState(AWrapper);
    if Elem.IsKindOf(UML_COLLABORATION) then ConvertPropCollaboration(AWrapper);
    if Elem.IsKindOf(UML_SUBMACHINE_STATE) then ConvertPropSubmachineSate(AWrapper);
    if Elem.IsKindOf(UML_PARTITION) then ConvertPropPartition(AWrapper);
    if Elem.IsKindOf(UML_CLASSIFIER_ROLE) then ConvertPropClassifierRole(AWrapper);
    if Elem.IsKindOf(UML_ASSOCIATION_ROLE) then ConvertPropAssociationRole(AWrapper);
    if Elem.IsKindOf(UML_ASSOCIATION_END_ROLE) then ConvertPropAssociationEndRole(AWrapper);
    if Elem.IsKindOf(UML_MESSAGE) then ConvertPropMessage(AWrapper);
    if Elem.IsKindOf(UML_SUBACTIVITY_STATE) then ConvertPropSubactivityState(AWrapper);
    if Elem.IsKindOf(UML_ACTION_STATE) then ConvertPropActionState(AWrapper);
    if Elem.IsKindOf(UML_SUBSYSTEM) then ConvertPropSubsystem(AWrapper);
    if Elem.IsKindOf(UML_DIAGRAM) then ConvertPropDiagram(AWrapper);
  except on E: Exception do
    begin
      AppUtil.AddLog(Format(MSG_PROP_CONVERSION_FAILED, [ElemName, E.Message]));
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertViewsProperties(AWrapper: PXMIElementWrapper);
var
  Elem: IView;
  Node: IXMLNode;
  DiagramView: IDiagramView;
begin
  if AWrapper = nil then Exit;
  if (AWrapper.PlasticElement = nil) or (AWrapper.XMLNode = nil) then Exit;

  try
    Elem := AWrapper.PlasticElement as IView;
    Node := AWrapper.XMLNode;
    DiagramView := Elem.GetDiagramView;

    ConvertPropViewFontSize(Elem, Node);
    ConvertPropViewFontFace(Elem, Node);
    ConvertPropViewFontColor(Elem, Node);
    ConvertPropViewFontStyle(Elem, Node);
    ConvertPropViewLineColor(Elem, Node);

    if Elem.IsKindOf(ELEM_NODE_VIEW) then begin
      ConvertPropNodeViewFillColor(Elem as INodeView, Node);
      ConvertPropNodeViewAutoResize(Elem as INodeView, Node);
      ConvertPropViewOpSignature(Elem as INodeView, Node);
      ConvertPropSuppressAttributes(Elem as INodeView, Node);
      ConvertPropSuppressOperations(Elem as INodeView, Node);
      if Elem.IsKindOf(UML_SWIMLANE_VIEW) then
        ConvertPropSwimlaneViewRect(Elem as IUMLSwimlaneView, Node)
      else
        ConvertPropNodeViewRect(Elem as INodeView, Node);
    end
    else if Elem.IsKindOf(UML_MESSAGE_VIEW) and
            DiagramView.IsKindOf(UML_SEQ_ROLE_DIAGRAM_VIEW) then
    begin
      ConvertPropSeqMessageViewRect(DiagramView, Elem as IUMLCustomSeqMessageView, Node);
    end;

  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertStreotypes(AWrapper: PXMIStereotypeWrapper);
var
  I: Integer;
  Node, SubNode: IXMLNode;
  StreotypeName, BaseName, XmiId: string;
  Elem: IElement;
begin
  if AWrapper = nil then Exit;

  try
    Node := AWrapper.XMLNode;
    StreotypeName := AWrapper.XmiName;
    BaseName := XMLUtil.GetAttributeValue(Node, ATTR_UML_BASE_CLASS);
    if BaseName = '' then begin
      SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_BASE_CLASS);
      if SubNode <> nil then BaseName := XMLUtil.GetNodeValue(SubNode);
    end;
    StreotypeName := LowerCase(StreotypeName);
    if (StreotypeName = TYPE_ENUMERATION) and
       (BaseName = TYPE_BASE_CLASS) then Exit;
    if (StreotypeName = TYPE_REALIZE) and
       (BaseName = TYPE_BASE_ABSTRACTION) then Exit;
    if ((StreotypeName = TYPE_SIMPLE) or (StreotypeName = TYPE_SYNCHRONOUS) or
        (StreotypeName = TYPE_PROCEDURAL) or (StreotypeName = TYPE_ASYNCHRONOUS) or
        (StreotypeName = TYPE_RETURN)) and
       (BaseName = TYPE_BASE_MESSAGE)
    then Exit;

    for I := 0 to AWrapper.FAppliedElements.Count - 1 do begin
      XmiId := AWrapper.FAppliedElements.Strings[I];
      Elem := GetElementFromList(XmiId, ELEM_EXTENSIBLE_MODEL);
      if Elem <> nil then
        (Elem as IExtensibleModel).SetStereotype(AWrapper.XmiName);
    end;
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertTaggedValues(AWrapper: PXMIElementWrapper);
var
  Node, SubNode: IXMLNode;
  Tag, Val, XmiId: string;
  Elem: IElement;
begin
  if AWrapper = nil then Exit;
  if AWrapper.XMLNode = nil then Exit;

  try
    Node := AWrapper.XMLNode;
    Tag := GetPropValue2(Node, ATTR_UML_TAG, NODE_UML_TAGGED_VALUE_TAG);
    if Tag = '' then Exit;
    if not ((Tag = TYPE_DOCUMENTATION) or (Tag = TYPE_ORDERING) or
       (Tag = TYPE_IS_MULTI_INSTANCE) or (Tag = TYPE_RETURN) or
       (Tag = TYPE_ARGUMENTS) or (Tag = TYPE_ITERATION) or
       (Tag = TYPE_BRANCH) or (Tag = TYPE_ATTACHMENT) or
       (Tag = TYPE_ROSE_ATTACH_FILE) or (Tag = TYPE_ROSE_ATTACH_URL))
    then Exit;
    Val := GetPropValue2(Node, ATTR_UML_VALUE, NODE_UML_TAGGED_VALUE_VALUE);
    if Val = '' then Exit;

    XmiId := XMLUtil.GetAttributeValue(Node, ATTR_UML_MODEL_ELEMENT);
    if XmiId = '' then begin
      SubNode := XMLUtil.FindFirstNode(Node, NODE_UML_TAGGED_VAL_MODEL_ELEM);
      if SubNode <> nil then
        XmiId := XMLUtil.GetAttributeValueFromSubNode(SubNode, ATTR_XMI_REF);
    end;
    if XmiId <> '' then begin
      Elem := GetElementFromList(XmiId);
      if Elem <> nil then begin
        if (Tag = TYPE_DOCUMENTATION) and (Elem.IsKindOf(ELEM_MODEL)) then
          (Elem as IModel).Documentation := Val
        else if (Tag = TYPE_ORDERING) and (Elem.IsKindOf(UML_STRUCTURAL)) then
          (Elem as IUMLStructuralFeature).Ordering := StringToOrdering(Val)
        else if (Tag = TYPE_IS_MULTI_INSTANCE) and (Elem.IsKindOf(UML_INSTANCE)) then
          (Elem as IUMLInstance).IsMultiInstance := StringToBoolean(Val)
        else if (Tag = TYPE_RETURN) and (Elem.IsKindOf(UML_MESSAGE)) then
          (Elem as IUMLMessage).Return := Val
        else if (Tag = TYPE_ARGUMENTS) and (Elem.IsKindOf(UML_MESSAGE)) then
          (Elem as IUMLMessage).Arguments := Val
        else if (Tag = TYPE_ITERATION) and (Elem.IsKindOf(UML_MESSAGE)) then
          (Elem as IUMLMessage).Iteration := Val
        else if (Tag = TYPE_BRANCH) and (Elem.IsKindOf(UML_MESSAGE)) then
          (Elem as IUMLMessage).Branch := Val
        else if (Tag = TYPE_ATTACHMENT) and (Elem.IsKindOf(UML_MODEL)) then
          (Elem as IModel).AddAttachment(Val)
        else if (Tag = TYPE_ROSE_ATTACH_FILE) and (Elem.IsKindOf(UML_MODEL)) then
          (Elem as IModel).AddAttachment(Val)
        else if (Tag = TYPE_ROSE_ATTACH_URL) and (Elem.IsKindOf(UML_MODEL)) then
          (Elem as IModel).AddAttachment(Val)
      end;
    end;
  except
  end;
end;

procedure PXMIToPlasticAdapter.SetProjectProperties(N: IXMLNode);
var
  HeaderNode, DocNode, SubNode: IXMLNode;
  Str: string;
begin
  if GetConstructParamNamespace(N) <> nil then Exit;

  Str := GetPropName(N);
  if (Str <> '') and CheckUMLElemNameValidation(Str) then
    FProject.Title := Str;                         // title

  HeaderNode := XMLUtil.FindFirstNode(nil, NODE_XMI_HEADER);
  if HeaderNode <> nil then begin
    DocNode := XMLUtil.FindFirstNode(HeaderNode, NODE_XMI_DOC);
    if DocNode <> nil then begin
      SubNode := XMLUtil.FindFirstNode(DocNode, NODE_XMI_OWNER);
      Str := XMLUtil.GetNodeValue(SubNode);
      if Str <> '' then FProject.Company := Str;   // company
      SubNode := XMLUtil.FindFirstNode(DocNode, NODE_XMI_CONTACT);
      Str := XMLUtil.GetNodeValue(SubNode);
      if Str <> '' then FProject.Author := Str;    // author
      SubNode := XMLUtil.FindFirstNode(DocNode, NODE_XMI_NOTICE);
      Str := XMLUtil.GetNodeValue(SubNode);
      if Str <> '' then FProject.Copyright := Str; // copyright
    end;
  end;
end;

procedure PXMIToPlasticAdapter.GatherPreparatoryInfo(N: IXMLNode);
var I: Integer;
begin
  if N <> nil then begin
    Inc(FTotalXMINodeCount);
    if N.NodeName = NODE_UML_STEREOTYPE then AddStreotypeToList(N);
    if N.NodeName = NODE_UML_CONSTRAINT then AddConstraintToList(N);
    if N.NodeName = NODE_UML_DATA_TYPE then AddDataTypeToList(N);
    if N.NodeName = NODE_UML_PARAMETER then AddParameterToList(N);
    if (N.NodeName = NODE_UML_CALL_ACTION) or
       (N.NodeName = NODE_UML_SEND_ACTION) or
       (N.NodeName = NODE_UML_CREATE_ACTION) or
       (N.NodeName = NODE_UML_DESTROY_ACTION) or
       (N.NodeName = NODE_UML_RETURN_ACTION) or
       (N.NodeName = NODE_UML_TERMINATE_ACTION) or
       (N.NodeName = NODE_UML_UNINTERPRETED_ACTION)
    then AddActionToList(N);

    if N.HasChildNodes then begin
      for I := 0 to N.ChildNodes.Count - 1 do
        GatherPreparatoryInfo(N.ChildNodes.Nodes[I]);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.GatherTaggedValues(N: IXMLNode);
var
  I: Integer;
  SN: IXMLNode;
begin
  if N <> nil then begin
    for I := 0 to N.ChildNodes.Count - 1 do begin
      SN := N.ChildNodes.Nodes[I];
      if SN.NodeName = NODE_UML_TAGGED_VALUE then
        AddTaggedValueToList(SN);
    end;
  end;
end;

procedure PXMIToPlasticAdapter.PrepareDiagramConversion(Node: IXMLNode);
var
  I: Integer;
  SubNode: IXMLNode;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    SubNode := Node.ChildNodes.Nodes[I];
    if SubNode.NodeName = NODE_UML_DIAGRAM then
      Inc(FTotalXMINodeCount);
  end;
end;

procedure PXMIToPlasticAdapter.ConvertDiagram(Node: IXMLNode);
var
  I: Integer;
  SubNode: IXMLNode;
  Diagram: IUMLDiagram;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    SubNode := Node.ChildNodes.Nodes[I];
    if SubNode.NodeName = NODE_UML_DIAGRAM then begin
      Inc(FCurrentXMINodeIndex);
      StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
      Diagram := ConvertElemDiagram(SubNode);
      if Diagram <> nil then begin
        AddDiagramToList(Diagram, SubNode);
      end;
    end;
  end;
end;

procedure PXMIToPlasticAdapter.ConvertViews(Node: IXMLNode);
var
  I: Integer;
  XmiId: string;
  SubNode: IXMLNode;
  Diagram: IUMLDiagram;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do begin
    SubNode := Node.ChildNodes.Nodes[I];
    if SubNode.NodeName = NODE_UML_DIAGRAM then begin
      Inc(FCurrentXMINodeIndex);
      StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
      XmiId := XMLUtil.GetAttributeValue(SubNode, ATTR_XMI_ID);
      Diagram := GetDiagramFromList(XmiId);
      if Diagram <> nil then begin
        SubNode := XMLUtil.FindFirstNode(SubNode, NODE_UML_DIAGRAM_OWNED_ELEMENT);
        if SubNode = nil then Continue;

        ConvertElemNodeTypeDiagramElement(SubNode, Diagram);
        ConvertElemEdgeTypeDiagramElement(SubNode, Diagram);
        ConvertElemNoteDiagramElement(SubNode, Diagram);
      end;
    end;
  end;
end;

procedure PXMIToPlasticAdapter.StimulateProgressEvent(Pos: Integer; Max: Integer; Msg: string);
begin
  if Assigned(FOnProgress) then FOnProgress(Pos, Max, Msg);
end;

procedure PXMIToPlasticAdapter.PrepareConversion(Content: IXMLNode);
var
  Node: IXMLNode;
begin
  { preparation convesion }
  FCurrentXMINodeIndex := 0;
  FTotalXMINodeCount := 0;
  StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, TXT_PREPARE_IMPORT);
  Node := XMLUtil.FindFirstNode(Content, NODE_UML_MODEL);
  try
    GatherPreparatoryInfo(Node);
    GatherTaggedValues(Content);
    FTotalXMINodeCount := TotalXMINodeCount * 2;
    if (NewProjectMode) and (Node <> nil) then SetProjectProperties(Node);
  except
  end;
end;

procedure PXMIToPlasticAdapter.DoFirstLoopConversion(Content: IXMLNode);
var
  Node: IXMLNode;
begin
  { 1st loop element conversion - esp. Node type elements }
  StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, TXT_CONVERT_ELEMENT);
  Node := XMLUtil.FindFirstNode(Content, NODE_UML_MODEL);
  AddElementToList(FRootElement, Node, True);
  Inc(FCurrentXMINodeIndex);
  StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
  ConvertElementAtFirstLoop(Node);
end;

procedure PXMIToPlasticAdapter.DoSecondLoopConversion(Content: IXMLNode);
var
  I: Integer;
  Node: IXMLNode;
  AWrapper: PXMIElementWrapper;
  AWrapperStereotype: PXMIStereotypeWrapper;
begin
  { 2nd loop element conversion - esp. Edge type elements }
  Node := XMLUtil.FindFirstNode(Content, NODE_UML_MODEL);
  ConvertElementAtSecondLoop(Node);
  StimulateProgressEvent(TotalXMINodeCount, TotalXMINodeCount, '');
  { set model elements properties }
  FCurrentXMINodeIndex := 0;
  FTotalXMINodeCount := FElementWrapperList.Count + FStereotypeWrapperList.Count +
                        FTaggedValueWrapperList.Count;
  StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, TXT_CONVERT_PROPERTY);
  for I := 0 to FElementWrapperList.Count - 1 do begin
    Inc(FCurrentXMINodeIndex);
    StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
    AWrapper := FElementWrapperList.Items[I];
    ConvertProperties(AWrapper);
  end;
  FCurrentXMINodeIndex := FElementWrapperList.Count;
  StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
  for I :=0 to FStereotypeWrapperList.Count - 1 do begin
    Inc(FCurrentXMINodeIndex);
    StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
    AWrapperStereotype := FStereotypeWrapperList.Items[I];
    ConvertStreotypes(AWrapperStereotype);
  end;
  FCurrentXMINodeIndex := FElementWrapperList.Count + FStereotypeWrapperList.Count;
  StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
  for I := 0 to FTaggedValueWrapperList.Count - 1 do begin
    Inc(FCurrentXMINodeIndex);
    StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
    AWrapper := FTaggedValueWrapperList.Items[I];
    ConvertTaggedValues(AWrapper);
  end;
  StimulateProgressEvent(TotalXMINodeCount, TotalXMINodeCount, '');
  { diagrams and views conversion }
  if CreateDiagramMode then begin
    FCurrentXMINodeIndex := 0;
    FTotalXMINodeCount := 0;
    { prepare }
    StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, TXT_PREPARE_IMPORT_DIAGRAM);
    PrepareDiagramConversion(Content);
    FTotalXMINodeCount := TotalXMINodeCount * 3;
    StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, TXT_CONVERT_DIAGRAM);
    { diagrams conversion }
    ConvertDiagram(Content);
    { diagrams properties }
    FCurrentXMINodeIndex := TotalXMINodeCount div 3;
    StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, TXT_CONVERT_DIAGRAM_PROPERTY);
    for I := 0 to FDiagramWrapperList.Count - 1 do begin
      Inc(FCurrentXMINodeIndex);
      StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
      AWrapper := FDiagramWrapperList.Items[I];
      ConvertProperties(AWrapper);
    end;
    { views conversion }
    FCurrentXMINodeIndex := (TotalXMINodeCount div 3) * 2;
    StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, TXT_CONVERT_VIEW);
    ConvertViews(Content);
    StimulateProgressEvent(TotalXMINodeCount, TotalXMINodeCount, '');
    { views properties }
    FCurrentXMINodeIndex := 0;
    FTotalXMINodeCount := FViewWrapperList.Count;
    StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, TXT_CONVERT_VIEW_PROPERTY);
    for I := 0 to FViewWrapperList.Count - 1 do begin
      Inc(FCurrentXMINodeIndex);
      StimulateProgressEvent(CurrentXMINodeIndex, TotalXMINodeCount, '');
      AWrapper := FViewWrapperList.Items[I];
      ConvertViewsProperties(AWrapper);
    end;
  end;
  StimulateProgressEvent(TotalXMINodeCount, TotalXMINodeCount, '');
end;

procedure PXMIToPlasticAdapter.FinalizeConversion;
  function HasAnotherMainDiagram(ModelElem: IUMLModelElement): Boolean;
  var
    Idx: Integer;
    B: Boolean;
  begin
    Result := False;
    B := False;
    for Idx := 0 to ModelElem.GetOwnedDiagramCount - 1 do begin
      if LowerCase(ModelElem.GetOwnedDiagramAt(Idx).Name) = LowerCase(ROSE_MAIN_DIAGRAM) then
      begin
        if B then begin
          Result := B;
          Break;
        end
        else B := True;
      end;
    end;
  end;
var
  I, J: Integer;
  Elem: IUMLModelElement;
  DiagramElem: IDiagram;
begin
  try
    StimulateProgressEvent(100, 100, TXT_IMPORT_FINALIZE);
    if NewProjectMode and RationalApproachMode then begin
      for I := 0 to FProject.GetOwnedElementCount - 1 do begin
        Elem := FProject.GetOwnedElementAt(I);
        if (Elem.Name = ROSE_LOGICAL_VIEW) or
           (Elem.Name = ROSE_USECASE_VIEW) or
           (Elem.Name = ROSE_COMPONENT_VIEW) or
           (Elem.Name = ROSE_DEPLOYMENT_VIEW)
        then begin
          if (Elem.Name = ROSE_USECASE_VIEW) and
             (LowerCase(Elem.StereotypeName) = LowerCase(TYPE_ROSE_USECASE_MODEL))
          then Elem.SetStereotype('');

          for J := 0 to Elem.GetOwnedDiagramCount - 1 do begin
            DiagramElem := Elem.GetOwnedDiagramAt(J);
            if LowerCase(DiagramElem.Name) = LowerCase(ROSE_MAIN_DIAGRAM) then begin
              if HasAnotherMainDiagram(Elem) and (DiagramElem.GetViewCount = 0) then begin
                FPlasticApp.DeleteModel(DiagramElem);
                Break;
              end else if Elem.Name = ROSE_DEPLOYMENT_VIEW then begin
                if (Elem.GetOwnedDiagramCount > 1) and (DiagramElem.GetViewCount = 0) then begin
                  FPlasticApp.DeleteModel(DiagramElem);
                  Break;
                end;
              end;
            end;
          end;

          if Elem.Name = ROSE_LOGICAL_VIEW then begin
            for J := 0 to Elem.GetOwnedDiagramCount - 1 do begin
              DiagramElem := Elem.GetOwnedDiagramAt(J);
              if LowerCase(DiagramElem.Name) = LowerCase(ROSE_MAIN_DIAGRAM) then begin
                DiagramElem.DefaultDiagram := True;
                FPlasticApp.OpenDiagram(DiagramElem);
              end;
            end;
          end;
        end;
      end;
    end;

    StimulateProgressEvent(100, 100, TXT_IMPORT_SUCCEEDE);
  except
  end;
end;

procedure PXMIToPlasticAdapter.ConvertXMIToPlastic(RootElem: IUMLPackage);
var
  Content: IXMLNode;
begin
  if (PlasticApp <> nil) and
     (XMLDocument <> nil) and
     (RootElem <> nil) then
  begin
    FRootElement := RootElem;
    FProject := PlasticApp.ProjectManager.Project;
    FFactory := PlasticApp.UMLFactory;
    XMLUtil.XMLDocument := XMLDocument;
    Content := XMLUtil.FindFirstNode(nil, NODE_XMI_CONTENT);
    if Content <> nil then begin
      PrepareConversion(Content);
      DoFirstLoopConversion(Content);
      DoSecondLoopConversion(Content);
      FinalizeConversion;
    end;
  end;
end;

// PXMIToPlasticAdapter
////////////////////////////////////////////////////////////////////////////////

end.



