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
var ConFacAbsFacGenList = new Array();
var ConProAbsProGenList = new Array();
var ConFacAbsFacDepenList = new Array();

// UMLAggregationKind
var akNone = 00000000;
var akAggregate = 00000001;
var akComposite = 00000002;

// tagUMLVisibilityKind
var  vkPublic = 00000000;
var  vkProtected = 00000001;
var  vkPrivate = 00000002;
var  vkPackage = 00000003;
//
var ViewExist;

//////////////////////////////////////////////////////////////////////////////////
// Model
abstractFactory.IsAbstract = true;

var absFacOp1 = GetSingleOperation(abstractFactory, "CreateProduct", "", vkPublic, new Array());
absFacOp1.Name = "CreateProduct";

// Class (Client)
// Class (AbstractProduct)
abstractProduct.IsAbstract = true;

// Class (AbstractProduct)
// Class (ConcreteFactory)
// Class (ConcreteProduct)


// Association (Client-ConcreteFactory)
var assoc1 = GetSingleAssication(owner, "" ,client, akNone, "", false, abstractFactory, akNone, "", true);
var assoc1End1 = assoc1.GetConnectionAt(0);
var assoc1End2 = assoc1.GetConnectionAt(1);
assoc1End1.IsNavigable = false;

// Association (Client-ConcreteProduct)
var assoc2 = GetSingleAssication(owner, "" ,client, akNone, "", false, abstractProduct, akNone, "", true);;
var assoc2End1 = assoc2.GetConnectionAt(0);
var assoc2End2 = assoc2.GetConnectionAt(1);
assoc2End1.IsNavigable = false;

// Generalization (AbstractFactory-ConcreteFactory)
for (var i = 0; i < concreteFactory.length; i++){
    var gen = GetSingleGeneralization(owner, "", abstractFactory, concreteFactory[i]);
    ConFacAbsFacGenList[ConFacAbsFacGenList.length] = gen;
}
// Generalization (AbstractProduct-ConcreteProduct)
for (var i = 0; i < concreteProduct.length; i++){
    var gen = GetSingleGeneralization(owner, "", abstractProduct, concreteProduct[i]);
    ConProAbsProGenList[ConProAbsProGenList.length] = gen;
}

//dependency (ConcreteProduct-ConcreteFactory)
for (var i = 0; i < concreteProduct.length; i++){
  for (var j = 0; j < concreteFactory.length; j++){
    var depen = GetSingleDependency(owner, concreteFactory[j], concreteProduct[i], "", "");
    ConFacAbsFacDepenList[ConFacAbsFacDepenList.length] = depen;
  }
}

// Model
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// View

// Class View (Client)
var clientView = GetSingleClassifierView(dgm.DiagramView, client);
if(!ViewExist){
  clientView.Left = 232;
  clientView.Top = 104;
}

// Class View (AbstractFactory)
var absFacView = GetSingleClassifierView(dgm.DiagramView, abstractFactory);
if(!ViewExist){
  absFacView.Left = 108;
  absFacView.Top = 192;
}

// Class View (AbstractProduct)
var absProView = GetSingleClassifierView(dgm.DiagramView, abstractProduct);
if(!ViewExist){
  absProView.Left = 350;
  absProView.Top = 192;
}

// Class View (ConcreteFactory)
var ConFac_len = concreteFactory.length - 1;
var conFacView = GetSingleClassifierView(dgm.DiagramView, concreteFactory[ConFac_len]);
if(!ViewExist){
  conFacView.Left = 107;
  conFacView.Top = 308;
}

// Class View (ConcreateProduct)
var ConPro_len = concreteProduct.length - 1;
var conProView = GetSingleClassifierView(dgm.DiagramView, concreteProduct[ConPro_len]);
if(!ViewExist){
  conProView.Left = 349;
  conProView.Top = 308;
}

// Association View (Client-AbstractFactory)
var assocView = GetSingleAssociationView(dgm.DiagramView, assoc1, clientView, absFacView);
if(!ViewExist){
  assocView.LineStyle = 0;
  assocView.Points.BeginUpdate();
  assocView.Points.ClearPoints();
  assocView.Points.AddPoint(272, 146);
  assocView.Points.AddPoint(272, 172);
  assocView.Points.AddPoint(156, 172);
  assocView.Points.AddPoint(156, 192);
  assocView.Points.EndUpdate();
}

// Association View (Client-AbstractProduct)
var assocView1 = GetSingleAssociationView(dgm.DiagramView, assoc2, clientView, absProView);
if(!ViewExist){
  assocView1.LineStyle = 0;
  assocView1.Points.BeginUpdate();
  assocView1.Points.ClearPoints();
  assocView1.Points.AddPoint(272, 146);
  assocView1.Points.AddPoint(272, 172);
  assocView1.Points.AddPoint(404, 172);
  assocView1.Points.AddPoint(404, 192);
  assocView1.Points.EndUpdate();
}

// Dependency View (ConcreteFactory-ConcreateProduct)
var ConFacDepen_len = ConFacAbsFacDepenList.length -1;
var depenView = GetSingleDependencyView(dgm.DiagramView, ConFacAbsFacDepenList[ConFacDepen_len], conFacView, conProView);
if(!ViewExist){
  depenView.LineStyle = 0;
}

// Generalization View (AbstractFactory-ConcreteFactory)
var AbsFacGen_len = concreteFactory.length - 1;
var gen = ConFacAbsFacGenList[AbsFacGen_len];
var genView = GetSingleGeneralizationView(dgm.DiagramView, gen, absFacView, conFacView);


// Generalization View (AbstractProduct-ConcreteProduct)
var AbsConGen_len = concreteProduct.length - 1;
var gen1 = ConProAbsProGenList[AbsConGen_len];
var genView1 = GetSingleGeneralizationView(dgm.DiagramView, gen1, absProView, conProView);

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

function GetSingleAssication(Owner, Name ,End1Classifier, End1Type, End1Multi, End1Nav, End2Classifier, End2Type, End2Multi, End2Nav){
var Association, AssEnd1, AssEnd2;

  for(var i = 0; i < End1Classifier.GetAssociationCount(); i++){
    AssEnd1 = End1Classifier.GetAssociationAt(i);
    AssEnd2 = AssEnd1.GetOtherSide();
    Association = AssEnd1.Association;
    if((Association.Name == Name) &&
       (AssEnd1.Aggregation == End1Type) &&
       (AssEnd1.Multiplicity == End1Multi) &&
       (AssEnd1.IsNavigable == End1Nav) &&
       (AssEnd2.Participant == End2Classifier) &&
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
