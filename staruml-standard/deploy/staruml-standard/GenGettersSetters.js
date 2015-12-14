// GenGettetsSetters.js

// Getting Application Object
var App = new ActiveXObject("WhiteStarUML.WhiteStarUMLApplication");
var Shell = new ActiveXObject("WScript.Shell");  


if ( IsSelectedKindOf(App, "UMLAttribute") )
{
  App.BeginGroupAction();
  
  var Facto = App.UMLFactory;
  var Sel = App.SelectionManager.GetSelectedModelAt(0);
  var OwnerClass = Sel.Owner;

  // Create setter
  var SetterOper = Facto.CreateOperation(OwnerClass);
  SetterOper.Name = "Set" + Sel.Name;
  var Param = Facto.CreateParameter(SetterOper);
  Param.Name = "new" + Sel.Name;
  Param.TypeExpression = Sel.TypeExpression;
  
  // Create getter
  var GetterOper = Facto.CreateOperation(OwnerClass);
  GetterOper.Name = "Get" + Sel.Name;
  var RetValue = Facto.CreateParameter(GetterOper);
  RetValue.Name = "";
  RetValue.DirectionKind = 3; // Return Type
  RetValue.TypeExpression = Sel.TypeExpression;
  
  App.EndGroupAction();
}
else
 Shell.Popup("Make sure an attribute is selected in Model Explorer!");


// ------------------------------------------------------------------------------
// Check Kind Of Selected Model
// ------------------------------------------------------------------------------
function IsSelectedKindOf(StarUMLApp, ClassName)
{
  if ( StarUMLApp.SelectionManager.GetSelectedModelCount() != 1 )
    return false;
  else
  {
    var S = StarUMLApp.SelectionManager.GetSelectedModelAt(0);
    return S.IsKindOf(ClassName);
  }    
}