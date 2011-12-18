////////////////////////////////////////////////////////////////////////////////
//                                                                              
//                StarUML - The Open Source UML/MDA Platform.                   
//                                                                              
//              Copyright (C) 2002-2005 - Plastic Software, Inc.                
//                                                                              
//                                                                              
// This program is free software; you can redistribute it and/or modify it      
// under the terms of the GNU General Public License as published by the Free   
// Software Foundation; either version 2 of the License, or (at your option)    
// any later version.                                                           
//                                                                              
// This program is distributed in the hope that it will be useful, but WITHOUT  
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     
// more details.                                                                
//                                                                              
// You should have received a copy of the GNU General Public License along with 
// this program; if not, write to the Free Software Foundation, Inc., 51        
// Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          
//                                                                              
// Linking StarUML statically or dynamically with other modules is making a     
// combined work based on StarUML. Thus, the terms and conditions of the GNU    
// General Public License cover the whole combination.                          
//                                                                              
// In addition, as a special exception, Plastic Software give you permission to 
// combine StarUML program with free software programs or libraries that are    
// released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the 
// standard release of ExpressBar, ExpressNavBar, ExpressInspector,             
// ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    
// modified versions of such code, with unchanged license). You may copy and    
// distribute such a system following the terms of the GNU GPL for StarUML and  
// the licenses of the other code concerned, provided that you include the      
// source code of that other code when and as the GNU GPL requires distribution 
// of source code. Plastic Software also give you permission to combine StarUML 
// program with dynamically linking plug-in (or add-in) programs that are       
// released under the GPL-incompatible and proprietary license.                 
//                                                                              
// Note that people who make modified versions of StarUML are not obligated to  
// grant this special exception for their modified versions; it is their choice 
// whether to do so. The GNU General Public License gives permission to release 
// a modified version without this exception; this exception also makes it      
// possible to release a modified version which carries forward this exception. 
////////////////////////////////////////////////////////////////////////////////

// Global Val
var VisitorGenList = new Array();
var ElementGenList = new Array();

// UMLAggregationKind
var akNone = 00000000;
var akAggregate = 00000001;
var akComposite = 00000002;

// tagUMLVisibilityKind
var  vkPublic = 00000000;
var  vkProtected = 00000001;
var  vkPrivate = 00000002;
var  vkPackage = 00000003;

var ViewExist;
////////////////////////////////////////////////////////////////////////////////
// Model

// Class (Element)
element.IsAbstract = true;
if (!HasSameOperation(element, "Accept", "", vkPublic, new Array())){
  var elemOp1 = factory.CreateOperation(element);
  elemOp1.Name = "Accept";
  var elemOp1Param1 = factory.CreateParameter(elemOp1);
  elemOp1Param1.Name = "v";
  elemOp1Param1.Type_ = visitor;
}

// Class (Visitor)
visitor.IsAbstract = true;
for (var i = 0; i < concreteElement.length; i++){
  if (!HasSameOperation(visitor, "Visit" + concreteElement[i].Name, "", vkPublic, new Array())){
    var op = factory.CreateOperation(visitor);
    op.Name = "Visit" + concreteElement[i].Name;
    var param = factory.CreateParameter(op);
    param.Name = "elem";
    param.Type_ = concreteElement[i];
  }
}

// Class (ConcreteElement)
// Class (ConcreteVisitor)
// Class (ObjectStructure)

// Association (ObjectStruture-Element)
var assoc = GetSingleAssication(owner, "" , objectStructure, "" , akNone, "", false, element, "", akNone, "*", true);
var assocEnd1 = assoc.GetConnectionAt(0);
var assocEnd2 = assoc.GetConnectionAt(1);
assocEnd1.IsNavigable = false;
assocEnd2.Multiplicity = "*";

// Generalization (Visitor-ConcreteVisitor)
for (var i = 0; i < concreteVisitor.length; i++){
    var gen = GetSingleGeneralization(owner, "", visitor, concreteVisitor[i]);
    VisitorGenList[VisitorGenList.length] = gen;
}

// Generalization (Element-ConcreteElement)
for (var i = 0; i < concreteElement.length; i++){
    var gen = GetSingleGeneralization(owner, "", visitor, concreteElement[i]);
    ElementGenList[ElementGenList.length] = gen;
}

// Sequence Diagram
var aCollaboration;
var aInteraction;
var aSequenceDgm;
var objStructRole, conElementRole, conVisitorRole;
var message1, message2, message3;
var message1Action, message2Action;

if (concreteElement.length > 0 && concreteVisitor.length > 0){
    // Collaboration (Collaboration of Visitor Pattern)
    aCollaboration = factory.CreateCollaboration(owner);
    aCollaboration.Name = "Collaboration of Visitor Pattern";

    // Interaction (Interaction of Visitor Pattern)
    aInteraction = factory.CreateInteraction(aCollaboration);
    aInteraction.Name = "Interaction of Visitor Pattern";

    // Sequence Diagram (Visitor Pattern)
    aSequenceDgm = factory.CreateSequenceRoleDiagram(aInteraction);

    // ClassifierRole (ObjectStructure)
    objStructRole = factory.CreateClassifierRole(aCollaboration);
    objStructRole.Name = "";
    objStructRole.Base = objectStructure;

    // ClassifierRole (ConcreteElement)
    conElementRole = factory.CreateClassifierRole(aCollaboration);
    conElementRole.Name = "";
    conElementRole.Base = concreteElement[0];

    // ClassifierRole (ConcreteVisitor)
    conVisitorRole = factory.CreateClassifierRole(aCollaboration);
    conVisitorRole.Name = "";
    conVisitorRole.Base = concreteVisitor[0];

    // Message (ObjectStructure-ConcreteElement)
    message1 = factory.CreateMessage(aInteraction, objStructRole, conElementRole, 0);
    message1Action = message1.Action;
    message1Action.Operation = element.GetOperationAt(element.GetOperationCount() - 1);

    // Message (ConcreteElement-ConcreteVisitor)
    message2 = factory.CreateMessage(aInteraction, conElementRole, conVisitorRole, 0);
    message2Action = message2.Action;
    message2Action.Operation = visitor.GetOperationAt(visitor.GetOperationCount() - 1);

    // Message (ConcreteVisitor-ConcreteElement)
    message3 = factory.CreateMessage(aInteraction, conVisitorRole, conElementRole, 0);
}

// Model
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// View
var VIEW_OFFSET_X = 50;
var VIEW_OFFSET_Y = 70;
// Class View (Visitor)
var visitorView = GetSingleClassifierView(dgm.DiagramView, visitor);
if(!ViewExist){
  visitorView.Left = 40;
  visitorView.Top = 100;
}

// Class View (Element)
var elemView = GetSingleClassifierView(dgm.DiagramView, element);
if(!ViewExist){
  elemView.Left = 350;
  elemView.Top = 100;
}

// Class View (ConcreteVisitor)
var conVisit_len = 0; concreteVisitor.length - 1;
var conVisitorView = GetSingleClassifierView(dgm.DiagramView, concreteVisitor[conVisit_len]);
if(!ViewExist){
  conVisitorView.Left = 116;
  conVisitorView.Top = 300;
}

// Class View (ConcreteElement)
var conEle_len = concreteElement.length - 1;
var conElemView = GetSingleClassifierView(dgm.DiagramView, concreteElement[conEle_len]);
if(!ViewExist){
  conElemView.Left = 344;
  conElemView.Top = 300;
}

// Class View (ObjectStructure)
var strucView = GetSingleClassifierView(dgm.DiagramView, objectStructure);
if(!ViewExist){
  strucView.Left = 550;
  strucView.Top = 100;
}

// Association View (ObjectStruture-Element)
var assocView = GetSingleAssociationView(dgm.DiagramView, assoc, strucView, elemView);
if(!ViewExist){
  assocView.LineStyle = 0;
}

// Generalization View (Visitor-ConcreteVisitor)
var conVisitGen_len = concreteVisitor.length - 1;
var gen1 = VisitorGenList[conVisitGen_len];
var genView1 = GetSingleGeneralizationView(dgm.DiagramView, gen1, visitorView, conVisitorView);

// Generalization View (Element-ConcreteElement)
var conEle_len = concreteElement.length - 1;
var gen2 = ElementGenList[conEle_len];
var genView2 = GetSingleGeneralizationView(dgm.DiagramView, gen2, elemView, conElemView);

// Sequence Diagram
if (concreteElement.length > 0 && concreteVisitor.length > 0){
    // ClassifierRole View (ObjectStructure)
    var objStructRoleView = factory.CreateSeqClassifierRoleView(aSequenceDgm.DiagramView, objStructRole);
    objStructRoleView.Left = 100;
    objStructRoleView.Top = 50;

    // ClassifierRole View (ConcreteElement)
    var conElementRoleView = factory.CreateSeqClassifierRoleView(aSequenceDgm.DiagramView, conElementRole);
    conElementRoleView.Left = 100 + (VIEW_OFFSET_X * 4);
    conElementRoleView.Top = 50;

    // ClassifierRole View (ConcreteVisitor)
    var conVisitorRoleView = factory.CreateSeqClassifierRoleView(aSequenceDgm.DiagramView, conVisitorRole);
    conVisitorRoleView.Left = 100 + (VIEW_OFFSET_X * 8);
    conVisitorRoleView.Top = 50;

    // Message View (ObjectStructure-ConcreteElement)
    var message1View = factory.CreateSeqMessageView(aSequenceDgm.DiagramView, message1, objStructRoleView, conElementRoleView);
    var pointXArray = new Array();
    var pointYArray = new Array();
    for (var i = 0; i < message1View.Points.GetPointCount(); i++){
        pointXArray[i] = message1View.Points.GetPointX(i);
        pointYArray[i] = message1View.Points.GetPointY(i);
    }
    message1View.Points.BeginUpdate();
    message1View.Points.ClearPoints();
    for (var i = 0; i < pointXArray.length; i++){
        message1View.Points.AddPoint(pointXArray[i], pointYArray + 130);
    }
    message1View.Points.EndUpdate();

    // Message View (ConcreteElement-ConcreteVisitor)
    var message2View = factory.CreateSeqMessageView(aSequenceDgm.DiagramView, message2, conElementRoleView, conVisitorRoleView);
    var pointXArray = new Array();
    var pointYArray = new Array();
    for (var i = 0; i < message2View.Points.GetPointCount(); i++){
        pointXArray[i] = message2View.Points.GetPointX(i);
        pointYArray[i] = message2View.Points.GetPointY(i);
    }
    message2View.Points.BeginUpdate();
    message2View.Points.ClearPoints();
    for (var i = 0; i < pointXArray.length; i++){
        message2View.Points.AddPoint(pointXArray[i], pointYArray + 200);
    }
    message2View.Points.EndUpdate();
    var activationView = message2View.Activation;
    activationView.Height = 100;

    // Message View (ConcreteVisitor-ConcreteElement)
    var message3View = factory.CreateSeqMessageView(aSequenceDgm.DiagramView, message3, conVisitorRoleView, conElementRoleView);
    var pointXArray = new Array();
    var pointYArray = new Array();
    for (var i = 0; i < message3View.Points.GetPointCount(); i++){
        pointXArray[i] = message3View.Points.GetPointX(i);
        pointYArray[i] = message3View.Points.GetPointY(i);
    }
    message3View.Points.BeginUpdate();
    message3View.Points.ClearPoints();
    for (var i = 0; i < pointXArray.length; i++){
        message3View.Points.AddPoint(pointXArray[i], pointYArray + 270);
    }
    message3View.Points.EndUpdate();

    // Note View (ConcreteVisitor-ConcreteElement Message)
    var noteView = factory.CreateNoteView(aSequenceDgm.DiagramView);
    noteView.Left = 450;
    noteView.Top = 370;
    noteView.Text = "Call an Operation";
    var noteLinkView = factory.CreateNoteLinkView(aSequenceDgm.DiagramView, noteView, message3View);
}

// View
////////////////////////////////////////////////////////////////////////////////
///////////////////////  Common /////////////////////////////////////////////
//
function GetSingleGeneralization(Owner, Name, Parent, Child){
var Generalization;
  for(var i = 0; i < Child.GetGeneralizationCount(); i++){
    Generalization = Child.GetGeneralizationAt(i);
    if((Generalization.Name == Name) && (Generalization.Parent == Parent))
      return Generalization;
  }

  return factory.CreateGeneralization(Owner, Parent, Child);
}

function GetSingleAssication(Owner, Name ,End1Classifier, End1Name, End1Type, End1Multi, End1Nav, End2Classifier, End2Name, End2Type, End2Multi, End2Nav){
var Association, AssEnd1, AssEnd2;

  for(var i = 0; i < End1Classifier.GetAssociationCount(); i++){
    AssEnd1 = End1Classifier.GetAssociationAt(i);
    AssEnd2 = AssEnd1.GetOtherSide();
    Association = AssEnd1.Association;
    if((Association.Name == Name) &&
       (AssEnd1.Name == End1Name) &&
       (AssEnd1.Aggregation == End1Type) &&
       (AssEnd1.Multiplicity == End1Multi) &&
       (AssEnd1.IsNavigable == End1Nav) &&
       (AssEnd2.Participant == End2Classifier) &&
       (AssEnd2.Name == End2Name) &&
       (AssEnd2.Aggregation == End2Type) &&
       (AssEnd2.Multiplicity == End2Multi) &&
       (AssEnd2.IsNavigable == End2Nav)
       )
       return Association;
  }
  return factory.CreateAssociation(Owner, End1Classifier, End2Classifier);
}

function HasView(OwnedDiagram, AModel){
var ModelView;

  for (var i = 0 ; i < AModel.GetViewCount(); i++){
    ModelView = AModel.GetViewAt(i);
    if(ModelView.OwnerDiagramView == OwnedDiagram){
      return true;
    }
  }
  return false;
}

function GetSingleGeneralizationView(OwnedDiagram, Generalization, Parent, Child){
var GeneralizationView;
  ViewExist = HasView(OwnedDiagram, Generalization);

  for (var i = 0; i < Generalization.GetViewCount(); i++){
    GeneralizationView = Generalization.GetViewAt(i);
    if(GeneralizationView.OwnerDiagramView == OwnedDiagram)
      return GeneralizationView;
  }

  return factory.CreateGeneralizationView(OwnedDiagram, Generalization, Parent, Child);
}

function GetSingleAssociationView(OwnedDiagram, Association, End1View, End2View){
var AssociationView;
  ViewExist = HasView(OwnedDiagram, Association);

  for (var i = 0; i < Association.GetViewCount(); i++){
    AssociationView = Association.GetViewAt(i);
    if(AssociationView.OwnerDiagramView == OwnedDiagram)
      return AssociationView;
  }

  return factory.CreateAssociationView(OwnedDiagram, Association, End1View, End2View);
}

function GetSingleDependencyView(OwnedDiagram, Dependency, ClientView, SupilierView){
var DependencyView;
  ViewExist = HasView(OwnedDiagram, Dependency);

  for (var i = 0; i < Dependency.GetViewCount(); i++){
    DependencyView = Dependency.GetViewAt(i);
    if(DependencyView.OwnerDiagramView == OwnedDiagram)
      return DependencyView;
  }

  return factory.CreateDependencyView(OwnedDiagram, Dependency, ClientView, SupilierView);
}

function GetSingleClassifierView(OwnedDiagram, Classifer){
var ClassifierView;
  ViewExist = HasView(OwnedDiagram, Classifer);

  for (var i = 0 ; i < Classifer.GetViewCount(); i++){
    ClassifierView = Classifer.GetViewAt(i);
    if(ClassifierView.OwnerDiagramView == OwnedDiagram){
      return ClassifierView;
    }
  }

  if (Classifer.IsKindOf("UMLClass")){
    return factory.CreateClassView(OwnedDiagram, Classifer);
  }else if(Classifer.IsKindOf("UMLInterface")){
    return factory.CreateInterfaceView(OwnedDiagram, Classifer);
  }

  return null;
}

function GetSingleDependency(owner, client, suplier, name, stereotype){
var dependency;

  for(var i = 0; i < suplier.GetSupplierDependencyCount(); i++){
    dependency = suplier.GetSupplierDependencyAt(i);
    if ((dependency.Client == client) && (dependency.name == name) && (dependency.StereotypeName == stereotype))
      return dependency;
  }
    return factory.CreateDependency(owner, client, suplier);
}

function HasSameAttribute(classifier, name, type, stereotype, visibility){
var attr;
  for (var i = 0 ; i < classifier.GetAttributeCount(); i ++ ){
    attr = classifier.GetAttributeAt(i);

    if( (attr.name == name) &&
        (attr.TypeExpression == type) &&
        (attr.Visibility == visibility) &&
        (attr.StereotypeName == stereotype))
      return true;
  }
  return false;
}

function GetSingleOperation(classifier, name, stereotype, visibility, params){
var opt;
  for (var i =0 ; i < classifier.GetOperationCount() ; i ++ ){
    opt = classifier.GetOperationAt(i);
    if( (opt.name == name) &&
        (opt.Visibility == visibility) &&
        (opt.StereotypeName == stereotype))
      return opt;
  }
  return factory.CreateOperation(classifier);
}

function HasSameOperation(classifier, name, stereotype, visibility, params){
var opt;
  for (var i =0 ; i < classifier.GetOperationCount() ; i ++ ){
    opt = classifier.GetOperationAt(i);
    if( (opt.name == name) &&
        (opt.Visibility == visibility) &&
        (opt.StereotypeName == stereotype))
      return true;
  }
  return false;
}

function HasSameParams(operation, params){
  return false;
}
