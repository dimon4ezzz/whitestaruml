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
var AggConAggGenList = new Array();
var IterConIterGenList = new Array();
var ConAggConIterDepenList = new Array();
var ConIterConAggAssoList = new Array();

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

// Class(Aggregate)
aggregate.IsAbstract = true;
var aggreOp1 = GetSingleOperation(aggregate, "CreateIterator", "", vkPublic, new Array());
aggreOp1.Name = "CreateIterator";

// Class(Iterator)
iterator.IsAbstract = true;

var iterOp1 = GetSingleOperation(iterator, "First", "", vkPublic, new Array());
iterOp1.Name = "First";

var iterOp2 = GetSingleOperation(iterator, "Next", "", vkPublic, new Array());
iterOp2.Name = "Next";

var iterOp3 = GetSingleOperation(iterator, "IsDone", "", vkPublic, new Array());
iterOp3.Name = "IsDone";

var iterOp4 = GetSingleOperation(iterator, "CurrentItem", "", vkPublic, new Array());
iterOp4.Name = "CurrentItem";

// Generalization (Aggregate-ConcreteAggregate)
for (var i = 0; i < concreteAggregate.length; i++){
    var gen = GetSingleGeneralization(owner, "", aggregate, concreteAggregate[i]);
    AggConAggGenList[AggConAggGenList.length] = gen;
}

// Generalization (Iterator-ConcreteIterator)
for (var i = 0; i < concreteIterator.length; i++){
    var gen = GetSingleGeneralization(owner, "", iterator, concreteIterator[i]);
    IterConIterGenList[IterConIterGenList.length] = gen;
}

// Association (ConcreteIterator-ConcreteAggregate)
for (var i = 0; i < concreteIterator.length; i++){
  for (var j = 0; j < concreteAggregate.length; j++){
    var assoc = GetSingleAssication(owner, "" ,concreteIterator[i] , "" , akNone, "", false, concreteAggregate[j], "", akNone, "", true);
    var assocEnd1 = assoc.GetConnectionAt(0);
    var assocEnd2 = assoc.GetConnectionAt(1);
    assocEnd1.IsNavigable = false;
    ConIterConAggAssoList[ConIterConAggAssoList.length] = assoc;
  }
}

// Dependency (ConcreteAggregate-ConcreteIterator)
for (var i = 0; i < concreteAggregate.length; i++){
  for (var j = 0; j < concreteIterator.length; j++){
    var Depen = GetSingleDependency(owner, concreteAggregate[i], concreteIterator[j], "", "");
    ConAggConIterDepenList[ConAggConIterDepenList.length] = Depen;
  }
}

// Model
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// View

// Class View (Aggregate)
var aggreView = GetSingleClassifierView(dgm.DiagramView, aggregate);
if(!ViewExist){
  aggreView.Left = 100;
  aggreView.Top = 100;
}

// Class View (Iterator)
var iterView = GetSingleClassifierView(dgm.DiagramView, iterator);
if(!ViewExist){
  iterView.Left = 395;
  iterView.Top = 100;
}

// Class View (ConcreteAggregate)
var conAggre_len = concreteAggregate.length - 1;
var ConAggreView = GetSingleClassifierView(dgm.DiagramView, concreteAggregate[conAggre_len]);
if(!ViewExist){
  ConAggreView.Left = 88;
  ConAggreView.Top = 288;
}

// Class View (ConcreteIterator)
var conIter_len = concreteAggregate.length - 1;
var ConIterView = GetSingleClassifierView(dgm.DiagramView, concreteIterator[conIter_len]);
if(!ViewExist){
  ConIterView.Left = 384;
  ConIterView.Top = 288;
}

// Generalization View (Aggregate-ConcreteAggregate)
var conAggreGen_len = concreteAggregate.length - 1;
var gen = AggConAggGenList[conAggreGen_len];
var genView = GetSingleGeneralizationView(dgm.DiagramView, gen, aggreView, ConAggreView);

// Generalization View (Iterator-ConcreteIterator)
var conIterGen_len = concreteIterator.length - 1;
var gen1 = IterConIterGenList[conIterGen_len];
var genView1 = GetSingleGeneralizationView(dgm.DiagramView, gen1, iterView, ConIterView);

// Association View (ConcreteIterator-ConcreteAggregate)
var conAggreAss1_len = ConIterConAggAssoList.length - 1;
var newAssoc1 = ConIterConAggAssoList[conAggreAss1_len];
var AssoView1 = GetSingleAssociationView(dgm.DiagramView, newAssoc1, ConIterView, ConAggreView);
if(!ViewExist){
  AssoView1.LineStyle = 0;
  AssoView1.Points.BeginUpdate();
  AssoView1.Points.ClearPoints();
  AssoView1.Points.AddPoint(384, 316);
  AssoView1.Points.AddPoint(208, 316);
  AssoView1.Points.EndUpdate();
}

// Dependency View (ConcreteAggregate-ConcreteIterator)
var conIterDepen_len = ConAggConIterDepenList.length - 1;
var depen = ConAggConIterDepenList[conIterDepen_len];
var depenView = GetSingleDependencyView(dgm.DiagramView, depen, ConAggreView, ConIterView);
if(!ViewExist){
  depenView.LineStyle = 0;
  depenView.Points.BeginUpdate();
  depenView.Points.ClearPoints();
  depenView.Points.AddPoint(208, 300);
  depenView.Points.AddPoint(384, 300);
  depenView.Points.EndUpdate();
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
