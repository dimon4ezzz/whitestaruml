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

var ClientRecAssList = new Array();
var ClientConComDepenList = new Array();
var ComConComGenList = new Array();
var ReAssList = new Array();

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
//////////////////////////////////////////////////////////////////////////////////
// Model

// class(Command)
command.IsAbstract = true;
var commandOp1 = GetSingleOperation(command, "Execute", "", vkPublic, new Array());
commandOp1.Name = "Execute";

// Class (Receiver)
for(var i = 0; i < receiver.length; i++){
  var receiverOp1 = GetSingleOperation(receiver[i], "Action", "", vkPublic, new Array());
  receiverOp1.Name = "Action";
}
// Class (ConcreteBuilder)

// Association (Invoker-Command)
var assoc = GetSingleAssication(owner, "" ,invoker, "" , akAggregate, "", false, command, "", akNone, "", true);
var assocEnd1 = assoc.GetConnectionAt(0);
var assocEnd2 = assoc.GetConnectionAt(1);
assocEnd1.IsNavigable = false;
assocEnd1.Aggregation = akAggregate;

// Association (Client-Receiver)
for (var i = 0; i < receiver.length; i++){
    var assocCR = GetSingleAssication(owner, "" ,client, "" , akNone, "", false, receiver[i], "", akNone, "", true);
    var assocCREnd1 = assocCR.GetConnectionAt(0);
    var assocCREnd2 = assocCR.GetConnectionAt(1);
    assocCREnd1.IsNavigable = false;
    ClientRecAssList[ClientRecAssList.length] = assocCR;
}

// Association (ConcreteCommand-Receiver)
for (var i = 0; i < concreteCommand.length; i++){
  for (var j = 0; j < receiver.length; j++){
    var assocCCR = GetSingleAssication(owner, "" ,concreteCommand[i], "receiver" , akNone, "", false, receiver[j], "", akNone, "", true);
    var assocCCREnd1 = assocCCR.GetConnectionAt(0);
    var assocCCREnd2 = assocCCR.GetConnectionAt(1);
    assocCCREnd1.IsNavigable = false;
    assocCCREnd1.Name = "receiver";
    ReAssList[ReAssList.length] = assocCCR;
  }
}

// Dependency (Client-ConcreteCommand)
for (var i = 0; i < concreteCommand.length; i++){
    var Depen = GetSingleDependency(owner, client, concreteCommand[i], "", "");
    ClientConComDepenList[ClientConComDepenList.length] = Depen;
}

// Generalization (Command-ConcreteCommand)
for (var i = 0; i < concreteCommand.length; i++){
    var gen = GetSingleGeneralization(owner, "", command, concreteCommand[i]);
    ComConComGenList[ComConComGenList.length] = gen;
}
// Model
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// View

// Class View (Client)
var clientView = GetSingleClassifierView(dgm.DiagramView, client);
if(!ViewExist){
  clientView.Left = 96;
  clientView.Top = 98;
}

// Class View (Invoker)
var InvokerView = GetSingleClassifierView(dgm.DiagramView, invoker);
if(!ViewExist){
  InvokerView.Left = 256;
  InvokerView.Top = 98;
}

// Class View (Command)
var CommandView = GetSingleClassifierView(dgm.DiagramView, command);
if(!ViewExist){
  CommandView.Left = 456;
  CommandView.Top = 91;
}

// Class View (ConcreteCommand)
var conCom_len = concreteCommand.length - 1;
var ConComView = GetSingleClassifierView(dgm.DiagramView, concreteCommand[conCom_len]);
if(!ViewExist){
  ConComView.Left = 436;
  ConComView.Top = 242;
}

// Class View (Receiver)
var rec_len = receiver.length - 1;
var ReceiverView = GetSingleClassifierView(dgm.DiagramView, receiver[rec_len]);
if(!ViewExist){
  ReceiverView.Left = 256;
  ReceiverView.Top = 172;
}

// Association View (Invoker-Command)
var AssoView1 = GetSingleAssociationView(dgm.DiagramView, assoc, InvokerView, CommandView);
if(!ViewExist){
  AssoView1.LineStyle = 0;
}

// Association View (Client-Receiver)
var recAss_len = ClientRecAssList.length - 1;
var newAssoc1 = ClientRecAssList[recAss_len];
var AssoView2 = GetSingleAssociationView(dgm.DiagramView, newAssoc1, clientView, ReceiverView);
if(!ViewExist){
  AssoView2.LineStyle = 0;
  AssoView2.Points.BeginUpdate();
  AssoView2.Points.ClearPoints();
  AssoView2.Points.AddPoint(135, 140);
  AssoView2.Points.AddPoint(135, 192);
  AssoView2.Points.AddPoint(256, 192);
  AssoView2.Points.EndUpdate();
}

// Association View (ConcreteCommand-Receiver)

var recAss1_len = ReAssList.length - 1;
var newAssoc2 = ReAssList[recAss1_len];
var AssoView3 = GetSingleAssociationView(dgm.DiagramView, newAssoc2, ConComView, ReceiverView);
if(!ViewExist){
  AssoView3.LineStyle = 0;
  AssoView3.Points.BeginUpdate();
  AssoView3.Points.ClearPoints();
  AssoView3.Points.AddPoint(456, 242);
  AssoView3.Points.AddPoint(456, 204);
  AssoView3.Points.AddPoint(335, 204);
  AssoView3.Points.EndUpdate();
}

// Dependency View (Client-ConcreteCommand)
var conComDepen_len = concreteCommand.length - 1;
var Depen = ClientConComDepenList[conComDepen_len];
var DepenView = GetSingleDependencyView(dgm.DiagramView, Depen, clientView, ConComView);
if(!ViewExist){
  DepenView.LineStyle = 0;
  DepenView.Points.BeginUpdate();
  DepenView.Points.ClearPoints();
  DepenView.Points.AddPoint(120, 140);
  DepenView.Points.AddPoint(120, 264);
  DepenView.Points.AddPoint(436, 264);
  DepenView.Points.EndUpdate();
}

// Generalization View (Command-ConcreteCommand)
var conComGen_len = concreteCommand.length - 1;
var gen = ComConComGenList[conComGen_len];
var genView = GetSingleGeneralizationView(dgm.DiagramView, gen, CommandView, ConComView);
if(!ViewExist){
  genView.LineStyle = 0;
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

function HasSameParams(operation, params){

  return false;
}
