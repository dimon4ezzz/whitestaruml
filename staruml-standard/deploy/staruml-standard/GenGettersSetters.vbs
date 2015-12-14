' GenGettetsSetters.vbs

' Getting Application Object
Set App = CreateObject("WhiteStarUML.WhiteStarUMLApplication")

If IsSelectedKindOf(App, "UMLAttribute") Then
  App.BeginGroupAction
  Set Facto = App.UMLFactory
  Set Sel = App.SelectionManager.GetSelectedModelAt(0)
  Set OwnerClass = Sel.Owner

  ' Create setter
  Set SetterOper = Facto.CreateOperation(OwnerClass)
  SetterOper.Name = "Set" + Sel.Name
  Set Param = Facto.CreateParameter(SetterOper)
  Param.Name = "new" + Sel.Name
  Param.TypeExpression = Sel.TypeExpression
  
  'Create getter
  Set GetterOper = Facto.CreateOperation(OwnerClass)
  GetterOper.Name = "Get" + Sel.Name
  Set RetValue = Facto.CreateParameter(GetterOper)
  RetValue.Name = ""
  RetValue.DirectionKind = 3 ' Return Type
  RetValue.TypeExpression = Sel.TypeExpression
  
  App.EndGroupAction
Else
  MsgBox "Make sure an attribute is selected in Model Explorer!"
End If

' ------------------------------------------------------------------------------
' Check Kind Of SelectedModel
' ------------------------------------------------------------------------------
Function IsSelectedKindOf(StarUMLApp, ClassName)
  Dim S
  If StarUMLApp.SelectionManager.GetSelectedModelCount <> 1 Then
    IsSelectedKindOf = False
  Else
    Set S = StarUMLApp.SelectionManager.GetSelectedModelAt(0)
    IsSelectedKindOf = S.IsKindOf(ClassName)
  End If
End Function
