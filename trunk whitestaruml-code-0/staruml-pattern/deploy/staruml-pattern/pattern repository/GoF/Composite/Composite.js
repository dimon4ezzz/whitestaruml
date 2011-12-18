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
var LeafGenList = new Array();

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
var ParamExist;

// Class (Component)
component.IsAbstract = true;

var comOp1 = GetSingleOperation(component, "Operation", "", vkPublic, new Array());
comOp1.Name = "Operation";

ParamExist = HasSameOperation(component, "Add", "", vkPublic, new Array())
var comOp2 = GetSingleOperation(component, "Add", "", vkPublic, new Array());
comOp2.Name = "Add";
if(!ParamExist){
  var comOp2Param1 = factory.CreateParameter(comOp2);
  comOp2Param1.Type_ = component;
}
ParamExist = HasSameOperation(component, "Remove", "", vkPublic, new Array())
var comOp3 = GetSingleOperation(component, "Remove", "", vkPublic, new Array());
comOp3.Name = "Remove";
if(!ParamExist){
  var comOp3Param1 = factory.CreateParameter(comOp3);
  comOp3Param1.Type_ = component;
}
ParamExist = HasSameOperation(component, "GetChild", "", vkPublic, new Array())
var comOp4 = GetSingleOperation(component, "GetChild", "", vkPublic, new Array());
comOp4.Name = "GetChild";
if(!ParamExist){
  var comOp4Param1 = factory.CreateParameter(comOp4);
  comOp4Param1.Name = "int";
}


// Class (Composite)

// Generalization (Component-Leaf)
for (var i = 0; i < leaf.length; i++){
    var gen = GetSingleGeneralization(owner, "", component, leaf[i]);
    LeafGenList[LeafGenList.length] = gen;
}

// Generalization (Component-Composite)
var gen = GetSingleGeneralization(owner, "", component, composite);

// Association (Composite-Component)
var assoc = GetSingleAssication(owner, "" ,composite , "" , akAggregate, "", false, component, "", akNone, "*", true);
var assocEnd1 = assoc.GetConnectionAt(0);
var assocEnd2 = assoc.GetConnectionAt(1);
assocEnd1.IsNavigable = false;
assocEnd2.Multiplicity = "*";
assocEnd1.Aggregation = 1;

// Association (Client-Component)
var assoc1 = GetSingleAssication(owner, "" ,client , "" , akNone, "", false, component, "", akNone, "", true);
var assoc1End1 = assoc1.GetConnectionAt(0);
var assoc1End2 = assoc1.GetConnectionAt(1);
assoc1End1.IsNavigable = false;

// Model
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// View

// Class View(Client)
var clientView = GetSingleClassifierView(dgm.DiagramView, client);
if(!ViewExist){
  clientView.Left = 72;
  clientView.Top = 108;
}

// Class View (Component)
var componentView = GetSingleClassifierView(dgm.DiagramView, component);
if(!ViewExist){
  componentView.Left = 264;
  componentView.Top = 108;
}

// Class View (Composite)
var compositeView = GetSingleClassifierView(dgm.DiagramView, composite);
if(!ViewExist){
  compositeView.Left = 440;
  compositeView.Top = 300;
}

// Class View (Leaf)
var leaf_len = leaf.length - 1;
var leafView = GetSingleClassifierView(dgm.DiagramView, leaf[leaf_len]);
if(!ViewExist){
  leafView.Left = 196;
  leafView.Top = 296;
}

// Association View (Composite-Component)
var AssoView = GetSingleAssociationView(dgm.DiagramView, assoc, compositeView, componentView);
if(!ViewExist){
  AssoView.LineStyle = 0;
  AssoView.Points.BeginUpdate();
  AssoView.Points.ClearPoints();
  AssoView.Points.AddPoint(500, 300);
  AssoView.Points.AddPoint(500, 156);
  AssoView.Points.AddPoint(446, 156);
  AssoView.Points.EndUpdate();
}

// Association View (Client-Component)
var AssoView1 = GetSingleAssociationView(dgm.DiagramView, assoc1, clientView, componentView);
if(!ViewExist){
  AssoView1.LineStyle = 0;
}

// Generalization View (Component-Composite)
var gen1View = GetSingleGeneralizationView(dgm.DiagramView, gen, componentView, compositeView);
if(!ViewExist){
  gen1View.LineStyle = 0;
  gen1View.Points.BeginUpdate();
  gen1View.Points.ClearPoints();
  gen1View.Points.AddPoint(480, 300);
  gen1View.Points.AddPoint(480, 252);
  gen1View.Points.AddPoint(356, 252);
  gen1View.Points.AddPoint(356, 202);
  gen1View.Points.EndUpdate();
}

// Generalization View (Component-Leaf)
var leafGen_len = leaf.length - 1;
var gen1 = LeafGenList[leafGen_len];
var genView = GetSingleGeneralizationView(dgm.DiagramView, gen1, componentView, leafView);
if(!ViewExist){
  genView.LineStyle = 0;
  genView.Points.BeginUpdate();
  genView.Points.ClearPoints();
  genView.Points.AddPoint(235, 296);
  genView.Points.AddPoint(235, 252);
  genView.Points.AddPoint(356, 252);
  genView.Points.AddPoint(356, 202);
  genView.Points.EndUpdate();
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
