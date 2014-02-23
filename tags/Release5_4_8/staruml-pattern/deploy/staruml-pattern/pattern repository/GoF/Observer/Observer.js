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
var SubConSubGenList = new Array();
var ObsConObsGenList = new Array();
var ConObsConSubAssoList = new Array();

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
// Class (Subject)

if (!HasSameOperation(subject, "Attach", "", vkPublic, new Array())){
  var subOp1 = factory.CreateOperation(subject);
  subOp1.Name = "Attach";
  var subOp1Param1 = factory.CreateParameter(subOp1);
  subOp1Param1.Name = "o";
  subOp1Param1.Type_ = observer;
}

if (!HasSameOperation(subject, "Detach", "", vkPublic, new Array())){
  var subOp2 = factory.CreateOperation(subject);
  subOp2.Name = "Detach";
  var subOp2Param1 = factory.CreateParameter(subOp2);
  subOp2Param1.Name = "o";
  subOp2Param1.Type_ = observer;
}

subOp3 = GetSingleOperation(subject, "Notify", "", vkPublic, new Array());
subOp3.Name = "Notify";

// Class (Observer)
observer.IsAbstract = true;

var obsOp1 = GetSingleOperation(observer, "Update", "", vkPublic, new Array());
obsOp1.Name = "Update";

// Class (ConcreteSubject)
// Class (ConcreteObserver)

// Generalization (Subject-ConcreteSubject)
for (var i = 0; i < concreteSubject.length; i++){
    var gen = GetSingleGeneralization(owner, "", subject, concreteSubject[i]);
    SubConSubGenList[SubConSubGenList.length] = gen;
}
// Generalization (Observer-ConcreteObserver)
for (var i = 0; i < concreteObserver.length; i++){
    var gen = GetSingleGeneralization(owner, "", observer, concreteObserver[i]);
    ObsConObsGenList[ObsConObsGenList.length] = gen;
}

// Association (Subject-Observer)
var assoc = GetSingleAssication(owner, "" ,subject , "" , akNone, "", false, observer, "observers", akNone, "*", true);
var assocEnd1 = assoc.GetConnectionAt(0);
var assocEnd2 = assoc.GetConnectionAt(1);
assocEnd2.Name = "observers";
assocEnd1.IsNavigable = false;
assocEnd2.Multiplicity = "*";

// Association (ConcreteObserver-ConcreteSubject)
for (var i = 0; i < concreteObserver.length; i++){
  for (var j = 0; j < concreteSubject.length; j++){
    var assoc = GetSingleAssication(owner, "" ,concreteObserver[i] , "" , akNone, "", false, concreteSubject[j], "subject", akNone, "", true);
    var assocEnd1 = assoc.GetConnectionAt(0);
    var assocEnd2 = assoc.GetConnectionAt(1);
    assocEnd1.IsNavigable = false;
    assocEnd2.Name = "subject";
    ConObsConSubAssoList[ConObsConSubAssoList.length] = assoc;
  }
}

// Model
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// View

// Class View (Subject)
var subView = GetSingleClassifierView(dgm.DiagramView, subject);
if(!ViewExist){
  subView.Left = 99;
  subView.Top = 100;
}

// Class View (Observer)
var obsView = GetSingleClassifierView(dgm.DiagramView, observer);
if(!ViewExist){
  obsView.Left = 365;
  obsView.Top = 100;
}

// Class View (ConcreteSubject)
var conSub_len = concreteSubject.length - 1;
var conSubView = GetSingleClassifierView(dgm.DiagramView, concreteSubject[conSub_len]);
if(!ViewExist){
  conSubView.Left = 106;
  conSubView.Top = 282;
}

// Class View (ConcreateObserver)
var conObs_len = concreteObserver.length - 1;
var conObsView = GetSingleClassifierView(dgm.DiagramView, concreteObserver[conObs_len]);
if(!ViewExist){
  conObsView.Left = 348;
  conObsView.Top = 282;
}

// Association View (Subject-Observer)
var AssocView1 = GetSingleAssociationView(dgm.DiagramView, assoc, subView, obsView);
if(!ViewExist){
  AssocView1.LineStyle = 0;
}

// Association View (ConcreteObserver-ConcreteSubject)
var conSubAsso_len = ConObsConSubAssoList.length - 1;
var newAssoc2 = ConObsConSubAssoList[conSubAsso_len];
var AssoView2 = GetSingleAssociationView(dgm.DiagramView, newAssoc2, conObsView, conSubView);


// Generalization View (Subject-ConcreteSubject)
var conSubGen_len = concreteSubject.length - 1;
var gen1 = SubConSubGenList[conSubGen_len];
var genView1 = GetSingleGeneralizationView(dgm.DiagramView, gen1, subView, conSubView);

// Generalization View (Observer-ConcreteObserver)
var conObs_len = concreteObserver.length - 1;
var gen2 = ObsConObsGenList[conObs_len];
var genView2 = GetSingleGeneralizationView(dgm.DiagramView, gen2, obsView, conObsView);


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
