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
var ConFlyGenList = new Array();
var UnConFlyGenList = new Array();
var CliConFlyAssoList = new Array();
var CliUnConFlyAssoList = new Array();

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

// Class (FlyweightFactory)
if (!HasSameOperation(flyweightFactory, "GetFlyweight", "", vkPublic, new Array())){
  var flyOp1 = factory.CreateOperation(flyweightFactory);
  flyOp1.Name = "GetFlyweight";
  var flyOp1Param1 = factory.CreateParameter(flyOp1);
  flyOp1Param1.Name = "key";
}

// Class (Flyweight)
flyweight.IsAbstract = true;
var flyweightOp1 = GetSingleOperation(flyweight, "Operation", "", vkPublic, new Array());
flyweightOp1.Name = "Operation";

// Generalization (flyweight-concreteFlyweight)
for (var i = 0; i < concreteFlyweight.length; i++){
    var gen = GetSingleGeneralization(owner, "", flyweight, concreteFlyweight[i]);
    ConFlyGenList[ConFlyGenList.length] = gen;
}
// Generalization (Flyweight-UnsharedConcreteFlyweight)
for (var i = 0; i < unsharedConcreteFlyweight.length; i++){
    var gen = GetSingleGeneralization(owner, "", flyweight, unsharedConcreteFlyweight[i]);
    UnConFlyGenList[UnConFlyGenList.length] = gen;
}
// Association (FlyweightFactory-Flyweight)
var assocFF = GetSingleAssication(owner, "" ,flyweightFactory , "" , akAggregate, "", false, flyweight, "flyweights", akNone, "*", true);
var assocEnd1 = assocFF.GetConnectionAt(0);
var assocEnd2 = assocFF.GetConnectionAt(1);
assocEnd1.IsNavigable = false;
assocEnd2.Name = "flyweights";
assocEnd2.Multiplicity = "*";
assocEnd1.Aggregation = 1;

// Association (Client-FlyweightFactory)
var assoc1 = GetSingleAssication(owner, "" ,client , "" , akNone, "", false, flyweightFactory, "", akNone, "", true);
var assoc1End1 = assoc1.GetConnectionAt(0);
var assoc1End2 = assoc1.GetConnectionAt(1);
assoc1End1.IsNavigable = false;

// Association (Client-ConcreteFlyweight)
for (var i = 0; i < concreteFlyweight.length; i++){
    var assoc = GetSingleAssication(owner, "" ,client , "" , akNone, "", false, concreteFlyweight[i], "", akNone, "", true);
    var assocEnd1 = assoc.GetConnectionAt(0);
    var assocEnd2 = assoc.GetConnectionAt(1);
    assocEnd1.IsNavigable = false;
    CliConFlyAssoList[CliConFlyAssoList.length] = assoc;
}

// Association (Client-UnsharedConcreteFlyweight)
for (var i = 0; i < unsharedConcreteFlyweight.length; i++){
    var assoc = GetSingleAssication(owner, "" ,client , "" , akNone, "", false, unsharedConcreteFlyweight[i], "", akNone, "", true);
    var assocEnd1 = assoc.GetConnectionAt(0);
    var assocEnd2 = assoc.GetConnectionAt(1);
    assocEnd1.IsNavigable = false;
    CliUnConFlyAssoList[CliUnConFlyAssoList.length] = assoc;
}

// Model
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// View

// Class View (FlyweightFactory)
var flyFacView = GetSingleClassifierView(dgm.DiagramView, flyweightFactory);
if(!ViewExist){
  flyFacView.Left = 100;
  flyFacView.Top = 100;
}

// Class View (Flyweight)
var flyView = GetSingleClassifierView(dgm.DiagramView, flyweight);
if(!ViewExist){
  flyView.Left = 348;
  flyView.Top = 100;
}

// Class View (Client)
var clientView = GetSingleClassifierView(dgm.DiagramView, client);
if(!ViewExist){
  clientView.Left = 108;
  clientView.Top = 316;
}

// Class View (ConcreteFlyweight)
var conFly_len = concreteFlyweight.length - 1;
var conFlyView = GetSingleClassifierView(dgm.DiagramView, concreteFlyweight[conFly_len]);
if(!ViewExist){
  conFlyView.Left = 248;
  conFlyView.Top = 250;
}

// Class View (UnsharedConcreteFlyweight)
var unConFly_len = unsharedConcreteFlyweight.length - 1;
var unConFlyView = GetSingleClassifierView(dgm.DiagramView, unsharedConcreteFlyweight[unConFly_len]);
if(!ViewExist){
  unConFlyView.Left = 410;
  unConFlyView.Top = 250;
}

// Generalization View (Flyweight-ConcreteFlyweight)
var conFlyGen_len = concreteFlyweight.length - 1;
var gen1 = ConFlyGenList[conFlyGen_len];
var gen1View = GetSingleGeneralizationView(dgm.DiagramView, gen1, flyView, conFlyView);
if(!ViewExist){
  gen1View.LineStyle = 0;
  gen1View.Points.BeginUpdate();
  gen1View.Points.ClearPoints();
  gen1View.Points.AddPoint(304, 250);
  gen1View.Points.AddPoint(304, 228);
  gen1View.Points.AddPoint(388, 228);
  gen1View.Points.AddPoint(388, 155);
  gen1View.Points.EndUpdate();
}

// Generalization View (Flyweight-UnsharedConcreteFlyweight)
var unConFlyGen_len = unsharedConcreteFlyweight.length - 1;
var gen2 = UnConFlyGenList[unConFlyGen_len];
var gen2View = GetSingleGeneralizationView(dgm.DiagramView, gen2, flyView, unConFlyView);
if(!ViewExist){
  gen2View.LineStyle = 0;
  gen2View.Points.BeginUpdate();
  gen2View.Points.ClearPoints();
  gen2View.Points.AddPoint(492, 250);
  gen2View.Points.AddPoint(492, 228);
  gen2View.Points.AddPoint(388, 228);
  gen2View.Points.AddPoint(388, 155);
  gen2View.Points.EndUpdate();
}

// Association View (Client-UnsharedConcreteFlyweight)
var conUnFlyAss_len = CliUnConFlyAssoList.length - 1;
var newAssoc = CliUnConFlyAssoList[conUnFlyAss_len];
var AssoView1 = GetSingleAssociationView(dgm.DiagramView, newAssoc, clientView, unConFlyView);
if(!ViewExist){
  AssoView1.LineStyle = 0;
  AssoView1.Points.BeginUpdate();
  AssoView1.Points.ClearPoints();
  AssoView1.Points.AddPoint(187, 336);
  AssoView1.Points.AddPoint(384, 336);
  AssoView1.Points.AddPoint(384, 264);
  AssoView1.Points.AddPoint(410, 264);
  AssoView1.Points.EndUpdate();
}

// Association View (Client-ConcreteFlyweight)
var conFlyAss_len = CliConFlyAssoList.length - 1;
var newAssoc1 = CliConFlyAssoList[conFlyAss_len];
var AssoView2 = GetSingleAssociationView(dgm.DiagramView, newAssoc1, clientView, conFlyView);
if(!ViewExist){
  AssoView2.LineStyle = 0;
  AssoView2.Points.BeginUpdate();
  AssoView2.Points.ClearPoints();
  AssoView2.Points.AddPoint(187, 336);
  AssoView2.Points.AddPoint(228, 336);
  AssoView2.Points.AddPoint(228, 264);
  AssoView2.Points.AddPoint(248, 264);
  AssoView2.Points.EndUpdate();
}

// Association View (Client-FlyweightFactory)
var AssoView3 = GetSingleAssociationView(dgm.DiagramView, assoc1, clientView, flyFacView);
if(!ViewExist){
  AssoView3.LineStyle = 0;
}

// Association View (FlyweightFactory-Flyweight)
var AssoView = GetSingleAssociationView(dgm.DiagramView, assocFF, flyFacView, flyView);
if(!ViewExist){
  AssoView.LineStyle = 0;
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
