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
var ConComGenList = new Array();
var ConDecGenList = new Array();

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

// Class (Component)
component.IsAbstract = true;

var comOp1 = GetSingleOperation(component, "Operation", "", vkPublic, new Array());
comOp1.Name = "Operation";

// Class (ConcreteComponent)
// Class (Decorator)
// Class (ConcreteDecorator)

// Generalization (Component-ConcreteComponent)
for (var i = 0; i < concreteComponent.length; i++){
    var gen = GetSingleGeneralization(owner, "", component, concreteComponent[i]);
    ConComGenList[ConComGenList.length] = gen;
}

// Generalization (Component-Decorator)
var comDecgen = GetSingleGeneralization(owner, "", component, decorator);

// Association (Decorator-Component)
var assoc = GetSingleAssication(owner, "" ,decorator , "" , akAggregate, "", false, component, "component", akNone, "", true);
var assocEnd1 = assoc.GetConnectionAt(0);
var assocEnd2 = assoc.GetConnectionAt(1);
assocEnd1.IsNavigable = false;
assocEnd2.Name = "component";
assocEnd1.Aggregation = 1;

// Generalization (Decorator-ConcreteDecorator)
for (var i = 0; i < concreteDecorator.length; i++){
    var gen = GetSingleGeneralization(owner, "", decorator, concreteDecorator[i]);
    ConDecGenList[ConDecGenList.length] = gen;
}
// Model
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// View

// Class View (Component)
var componentView = GetSingleClassifierView(dgm.DiagramView, component);
if(!ViewExist){
  componentView.Left = 188;
  componentView.Top = 100;
}

// Class View (Decorator)
var decView = GetSingleClassifierView(dgm.DiagramView, decorator);
if(!ViewExist){
  decView.Left = 294;
  decView.Top = 244;
}

// Class View (ConcreteComponent)
var conCom_len = concreteComponent.length - 1;
var conComView = GetSingleClassifierView(dgm.DiagramView, concreteComponent[conCom_len]);
if(!ViewExist){
  conComView.Left = 52;
  conComView.Top = 244;
}

// Class View (ConcreteDecorator)
var conDec_len = concreteDecorator.length - 1;
var conDecView = GetSingleClassifierView(dgm.DiagramView, concreteDecorator[conDec_len]);
if(!ViewExist){
  conDecView.Left = 275;
  conDecView.Top = 340;
}

// Association View (Decorator-Component)
var AssoView = GetSingleAssociationView(dgm.DiagramView, assoc, decView, componentView);
if(!ViewExist){
  AssoView.LineStyle = 0;
  AssoView.Points.BeginUpdate();
  AssoView.Points.ClearPoints();
  AssoView.Points.AddPoint(356, 244);
  AssoView.Points.AddPoint(356, 132);
  AssoView.Points.AddPoint(267, 132);
  AssoView.Points.EndUpdate();
}

// Generalization View (Component-ConcreteComponent)
var conComGen_len = concreteComponent.length - 1;
var gen = ConComGenList[conComGen_len];
var genView = GetSingleGeneralizationView(dgm.DiagramView, gen, componentView, conComView);
if(!ViewExist){
  genView.LineStyle = 0;
  genView.Points.BeginUpdate();
  genView.Points.ClearPoints();
  genView.Points.AddPoint(116, 244);
  genView.Points.AddPoint(116, 204);
  genView.Points.AddPoint(228, 204);
  genView.Points.AddPoint(228, 155);
  genView.Points.EndUpdate();
}

// Generalization View (Component-Decorator)
var gen1View = GetSingleGeneralizationView(dgm.DiagramView, comDecgen, componentView, decView);
if(!ViewExist){
  gen1View.LineStyle = 0;
  gen1View.Points.BeginUpdate();
  gen1View.Points.ClearPoints();
  gen1View.Points.AddPoint(332, 244);
  gen1View.Points.AddPoint(332, 204);
  gen1View.Points.AddPoint(228, 204);
  gen1View.Points.AddPoint(228, 155);
  gen1View.Points.EndUpdate();
}

// Generalization View (Decorator-ConcreteDecorator)
var conDecGen_len = concreteDecorator.length - 1;
var gen1 = ConDecGenList[conDecGen_len];
var gen2View = GetSingleGeneralizationView(dgm.DiagramView, gen1, decView, conDecView);

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
