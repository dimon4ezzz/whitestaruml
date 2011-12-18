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
var NonExPGenList = new Array();
var NonExpAssoList = new Array();

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

// Class (AbstractExpression)
abstractExpression.IsAbstract = true;
var abexpOp1 = GetSingleOperation(abstractExpression, "Interpret", "", vkPublic, new Array());
abexpOp1.Name = "Interpret";

// Class (TerminalExpression)
// Class (NonTerminalExpression)


// Generalization (AbstractExpression-TerminalExpression)
var gen= GetSingleGeneralization(owner, "", abstractExpression, terminalExpression);

// Generalization (AbstractExpression-NonTerminalExpression)
for (var i = 0; i < nonterminalExpression.length; i++){
    var gen1 = GetSingleGeneralization(owner, "", abstractExpression, nonterminalExpression[i]);
    NonExPGenList[NonExPGenList.length] = gen1;
}

// Association (Client-Context)
var assoc1 = GetSingleAssication(owner, "" ,client , "" , akNone, "", false, context, "", akNone, "", true);
var assoc1End1 = assoc1.GetConnectionAt(0);
var assoc1End2 = assoc1.GetConnectionAt(1);
assoc1End1.IsNavigable = false;

// Association (Client-AbstractExpression)
var assoc2 = GetSingleAssication(owner, "" ,client , "" , akNone, "", false, abstractExpression, "", akNone, "", true);
var assoc2End1 = assoc2.GetConnectionAt(0);
var assoc2End2 = assoc2.GetConnectionAt(1);
assoc2End1.IsNavigable = false;

// Association (AbstractExpression-NonTerminalExpression)
for (var i = 0; i < nonterminalExpression.length; i++){
    var assoc3 = GetSingleAssication(owner, "" ,nonterminalExpression[i] , "" , akAggregate, "", false, abstractExpression, "", akNone, "*", true);
    var assoc3End1 = assoc3.GetConnectionAt(0);
    var assoc3End2 = assoc3.GetConnectionAt(1);
    assoc3End1.IsNavigable = false;
    assoc3End2.Multiplicity = "*";
    assoc3End1.Aggregation = 1;
    NonExpAssoList[NonExpAssoList.length] = assoc3;
}
// Model
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// View

// Class View (Context)
var contextView = GetSingleClassifierView(dgm.DiagramView, context);
if(!ViewExist){
  contextView.Left = 300;
  contextView.Top = 80;
}

// Class View (Client)
var clientView = GetSingleClassifierView(dgm.DiagramView, client);
if(!ViewExist){
  clientView.Left = 96;
  clientView.Top = 136;
}

// Class View (AbstractExpression)
var absExpView = GetSingleClassifierView(dgm.DiagramView, abstractExpression);
if(!ViewExist){
  absExpView.Left = 300;
  absExpView.Top = 156;
}

// Class View (TerminalExpression)
var terExpView = GetSingleClassifierView(dgm.DiagramView, terminalExpression);
if(!ViewExist){
  terExpView.Left = 204;
  terExpView.Top = 280;
}

// Class View (NonTerminalExpression)
var nonTerExp_len = nonterminalExpression.length - 1;
var nonExpView = GetSingleClassifierView(dgm.DiagramView, nonterminalExpression[nonTerExp_len]);
if(!ViewExist){
  nonExpView.Left = 396;
  nonExpView.Top = 280;
}

// Association View (Client-Context)
var AssoView1 = GetSingleAssociationView(dgm.DiagramView, assoc1, clientView, contextView);
if(!ViewExist){
  AssoView1.LineStyle = 0;
  AssoView1.Points.BeginUpdate();
  AssoView1.Points.ClearPoints();
  AssoView1.Points.AddPoint(175, 148);
  AssoView1.Points.AddPoint(212, 148);
  AssoView1.Points.AddPoint(212, 96);
  AssoView1.Points.AddPoint(300, 96);
  AssoView1.Points.EndUpdate();
}

// Association View (Client-AbstractExpression)
var AssoView2 = GetSingleAssociationView(dgm.DiagramView, assoc2, clientView, absExpView);
if(!ViewExist){
  AssoView2.LineStyle = 0;
}

// Association View (NonTerminalExpression-AbstractExpression)
var NonExpAsso_len = nonterminalExpression.length - 1;
var assoc3 = NonExpAssoList[NonExpAsso_len];
var AssoView3 = GetSingleAssociationView(dgm.DiagramView, assoc3, nonExpView, absExpView);
if(!ViewExist){
  AssoView3.LineStyle = 0;
  AssoView3.Points.BeginUpdate();
  AssoView3.Points.ClearPoints();
  AssoView3.Points.AddPoint(504, 280);
  AssoView3.Points.AddPoint(504, 168);
  AssoView3.Points.AddPoint(419, 168);
  AssoView3.Points.EndUpdate();
}

// Generalization View (AbstractExpression-TerminalExpression)
var genView1 = GetSingleGeneralizationView(dgm.DiagramView, gen, absExpView, terExpView);
if(!ViewExist){
  genView1.LineStyle = 0;
  genView1.Points.BeginUpdate();
  genView1.Points.ClearPoints();
  genView1.Points.AddPoint(260, 280);
  genView1.Points.AddPoint(260, 260);
  genView1.Points.AddPoint(360, 260);
  genView1.Points.AddPoint(360, 211);
  genView1.Points.EndUpdate();
}

// Generalization View (Flyweight-UnsharedConcreteFlyweight)
var nonExpGen_len = nonterminalExpression.length - 1;
var gen1 = NonExPGenList[nonExpGen_len];
var genView2 = GetSingleGeneralizationView(dgm.DiagramView, gen1, absExpView, nonExpView);
if(!ViewExist){
  genView2.LineStyle = 0;
  genView2.Points.BeginUpdate();
  genView2.Points.ClearPoints();
  genView2.Points.AddPoint(464, 280);
  genView2.Points.AddPoint(464, 260);
  genView2.Points.AddPoint(360, 260);
  genView2.Points.AddPoint(360, 211);
  genView2.Points.EndUpdate();
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
