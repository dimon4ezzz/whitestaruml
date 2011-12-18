' ------------------------------------------------------------------------------                                                                             
'                StarUML - The Open Source UML/MDA Platform.                   
'                                                                              
'              Copyright (C) 2002-2005 - Plastic Software, Inc.                
'                                                                              
'                                                                              
' This program is free software; you can redistribute it and/or modify it      
' under the terms of the GNU General Public License as published by the Free   
' Software Foundation; either version 2 of the License, or (at your option)    
' any later version.                                                           
'                                                                              
' This program is distributed in the hope that it will be useful, but WITHOUT  
' ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        
' FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     
' more details.                                                                
'                                                                              
' You should have received a copy of the GNU General Public License along with 
' this program; if not, write to the Free Software Foundation, Inc., 51        
' Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          
'                                                                              
' Linking StarUML statically or dynamically with other modules is making a     
' combined work based on StarUML. Thus, the terms and conditions of the GNU    
' General Public License cover the whole combination.                          
'                                                                              
' In addition, as a special exception, Plastic Software give you permission to 
' combine StarUML program with free software programs or libraries that are    
' released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the 
' standard release of ExpressBar, ExpressNavBar, ExpressInspector,             
' ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    
' modified versions of such code, with unchanged license). You may copy and    
' distribute such a system following the terms of the GNU GPL for StarUML and  
' the licenses of the other code concerned, provided that you include the      
' source code of that other code when and as the GNU GPL requires distribution 
' of source code. Plastic Software also give you permission to combine StarUML 
' program with dynamically linking plug-in (or add-in) programs that are       
' released under the GPL-incompatible and proprietary license.                 
'                                                                              
' Note that people who make modified versions of StarUML are not obligated to  
' grant this special exception for their modified versions; it is their choice 
' whether to do so. The GNU General Public License gives permission to release 
' a modified version without this exception; this exception also makes it      
' possible to release a modified version which carries forward this exception. 
' ------------------------------------------------------------------------------

Const LeftMargin = 20
Const TopMargin = 20
Const ObjectInterval = 150
Const MessageStartY = 100
Const MessageInterval = 50

' ------------------------------------------------------------------------------
' Check Kind Of SelectedModel
' ------------------------------------------------------------------------------
Function IsSelectedKindOf(StarUMLApp, ClassName)
  Dim S
  If StarUMLApp.SelectionManager.GetSelectedModelCount <> 1 Then
    IsSelectedKindOf = False
  Else
    Set S = StarUMLApp.SelectionManager.GetSelectedModelAt(0)
    If S.IsKindOf(ClassName) Then
      IsSelectedKindOf = True
    Else
      IsSelectedKindOf = False
    End If
  End If
End Function

' ------------------------------------------------------------------------------
' Get Action Kind
' ------------------------------------------------------------------------------
Function GetActionKind(Action)
  If Action.IsKindOf("UMLCallAction") Then
    GetActionKind = 0
  ElseIf Action.IsKindOf("UMLSendAction") Then
    GetActionKind = 1
  ElseIf Action.IsKindOf("UMLReturnAction") Then
    GetActionKind = 2
  ElseIf Action.IsKindOf("UMLCreateAction") Then
    GetActionKind = 3
  ElseIf Action.IsKindOf("UMLDestroyAction") Then
    GetActionKind = 4
  Else
    GetActionKind = 0
  End If
End Function

' ------------------------------------------------------------------------------
' Assign Stimulus Or Message
' ------------------------------------------------------------------------------
Sub AssignStimulusOrMessage(FromStimOrMsg, ToStimOrMsg)
  ToStimOrMsg.Name = FromStimOrMsg.Name
  Call ToStimOrMsg.SetStereotype2(FromStimOrMsg.StereotypeProfile, FromStimOrMsg.StereotypeName)
  ToStimOrMsg.Visibility = FromStimOrMsg.Visibility
  ToStimOrMsg.IsSpecification = FromStimOrMsg.IsSpecification
  ToStimOrMsg.Arguments = FromStimOrMsg.Arguments
  ToStimOrMsg.Return = FromStimOrMsg.Return
  ToStimOrMsg.Iteration = FromStimOrMsg.Iteration
  ToStimOrMsg.Branch = FromStimOrMsg.Branch
End Sub

' ------------------------------------------------------------------------------
' Assign Action
' ------------------------------------------------------------------------------
Sub AssignAction(FromAction, ToAction)
  ToAction.Name = FromAction.Name
  Call ToAction.SetStereotype2(FromAction.StereotypeProfile, FromAction.StereotypeName)
  ToAction.Visibility = FromAction.Visibility
  ToAction.IsSpecification = FromAction.IsSpecification
  ToAction.Target = FromAction.Target
  ToAction.IsAsynchronous = FromAction.IsAsynchronous
  ToAction.Script = FromAction.Script
  If ToAction.IsKindOf("UMLCallAction") Then
    Set ToAction.Operation = FromAction.Operation
  ElseIf ToAction.IsKindOf("UMLSendAction") Then
    Set ToAction.Signal = FromAction.Signal
  ElseIf ToAction.IsKindOf("UMLCreateAction") Then
    Set ToAction.Instantiation = FromAction.Instantiation
  End If
End Sub

' ------------------------------------------------------------------------------
' Copy Stimulus To
' ------------------------------------------------------------------------------
Sub CopyStimulusTo(Stim, Interaction)
  Dim StimKind, NewStim
  StimKind = GetActionKind(Stim.Action)
  Set NewStim = Facto.CreateStimulus(Interaction, Stim.Sender, Stim.Receiver, StimKind)
  Call AssignStimulusOrMessage(Stim, NewStim)
  Call AssignAction(Stim.Action, NewStim.Action)
End Sub

' ------------------------------------------------------------------------------
' Copy Message To
' ------------------------------------------------------------------------------
Sub CopyMessageTo(Msg, Interaction)
  Dim MsgKind, NewMsg
  MsgKind = GetActionKind(Msg.Action)
  Set NewMsg = Facto.CreateMessage(Interaction, Msg.Sender, Msg.Receiver, MsgKind)
  Call AssignStimulusOrMessage(Msg, NewMsg)
  Call AssignAction(Msg.Action, NewMsg.Action)
End Sub

' ------------------------------------------------------------------------------
' Get ObjectView
' ------------------------------------------------------------------------------
Function GetObjectView(SeqDgmView, Obj)
  Dim I, V
  For I = 0 To SeqDgmView.GetOwnedViewCount - 1
    Set V = SeqDgmView.GetOwnedViewAt(I)
    If (V.IsKindOf("UMLSeqObjectView") And (V.Model Is Obj)) Then
      Set GetObjectView = V
      Exit Function
    End If
  Next
  Set GetObjectView = Null
End Function

' ------------------------------------------------------------------------------
' Get ClassifierRoleView
' ------------------------------------------------------------------------------
Function GetClassifierRoleView(SeqDgmView, Role)
  Dim I, V
  For I = 0 To SeqDgmView.GetOwnedViewCount - 1
    Set V = SeqDgmView.GetOwnedViewAt(I)
    If (V.IsKindOf("UMLSeqClassifierRoleView") And (V.Model Is Role)) Then
      Set GetClassifierRoleView = V
      Exit Function
    End If
  Next
  Set GetClassifierRoleView = Null
End Function

' ------------------------------------------------------------------------------
' Make SequenceDiagram
' ------------------------------------------------------------------------------
Sub MakeSequenceDiagram(SeqDgm)
  Dim OwnerCol, OwnerInter, Obj, Stim, ObjView, StimView, I
  ' Putting Objects
  Set OwnerInter = SeqDgm.DiagramOwner
  Set OwnerCol = OwnerInter.Context
  For I = 0 To OwnerCol.GetParticipatingInstanceCount - 1
    Set Obj = OwnerCol.GetParticipatingInstanceAt(I)
    Set ObjView = SeqDgm.DiagramView.CreateViewOf(Obj, LeftMargin + (I * ObjectInterval), TopMargin)
  Next
  ' Putting Stimuli
  For I = 0 To OwnerInter.GetParticipatingStimulusCount - 1
    Set Stim = OwnerInter.GetParticipatingStimulusAt(I)
    Set StimView = Facto.CreateSeqStimulusView(SeqDgm.DiagramView, Stim, GetObjectView(SeqDgm.DiagramView, Stim.Sender), GetObjectView(SeqDgm.DiagramView, Stim.Receiver))
    StimView.Points.BeginUpdate
    StimView.Points.ClearPoints
    Call StimView.Points.AddPoint(StimView.Tail.Left, MessageStartY + (I * MessageInterval))
    Call StimView.Points.AddPoint(StimView.Head.Left, MessageStartY + (I * MessageInterval))
    StimView.Points.EndUpdate
  Next
End Sub

' ------------------------------------------------------------------------------
' Make SequenceRoleDiagram
' ------------------------------------------------------------------------------
Sub MakeSequenceRoleDiagram(SeqRoleDgm)
  Dim OwnerCol, OwnerInter, Role, Msg, RoleView, MsgView, I
  ' Putting ClassifierRoles
  Set OwnerInter = SeqRoleDgm.DiagramOwner
  Set OwnerCol = OwnerInter.Context
  For I = 0 To OwnerCol.GetOwnedElementCount - 1
    If OwnerCol.GetOwnedElementAt(I).IsKindOf("UMLClassifierRole") Then
      Set Role = OwnerCol.GetOwnedElementAt(I)
      Call SeqRoleDgm.DiagramView.CreateViewOf(Role, LeftMargin + (I * ObjectInterval), TopMargin)
    End If
  Next
  ' Putting Messages
  For I = 0 To OwnerInter.GetMessageCount - 1
    Set Msg = OwnerInter.GetMessageAt(I)
    Set MsgView = Facto.CreateSeqMessageView(SeqRoleDgm.DiagramView, Msg, GetClassifierRoleView(SeqRoleDgm.DiagramView, Msg.Sender), GetClassifierRoleView(SeqRoleDgm.DiagramView, Msg.Receiver))
    MsgView.Points.BeginUpdate
    MsgView.Points.ClearPoints
    Call MsgView.Points.AddPoint(MsgView.Tail.Left, MessageStartY + (I * MessageInterval))
    Call MsgView.Points.AddPoint(MsgView.Head.Left, MessageStartY + (I * MessageInterval))
    MsgView.Points.EndUpdate
  Next
End Sub

' ------------------------------------------------------------------------------
' Convert Collaboration To Sequence
' ------------------------------------------------------------------------------
Function ConvertCollaborationToSequence(ColDgm)
  ' Getting InteractionInstanceSet and CollaborationInstanceSet
  Dim OwnerInter, OwnerCol
  Dim NewInter, NewDgm, Stim
  Set OwnerInter = ColDgm.DiagramOwner
  Set OwnerCol = OwnerInter.Context
  ' Copying InteractionInstanceSet
  Set NewInter = Facto.CreateInteractionInstanceSet(OwnerCol)
  NewInter.Name = OwnerInter.Name
  Call NewInter.SetStereotype2(OwnerInter.StereotypeProfile, OwnerInter.StereotypeName)
  NewInter.Visibility = OwnerInter.Visibility
  NewInter.IsSpecification = OwnerInter.IsSpecification
  ' Copying Diagram
  Set NewDgm = Facto.CreateSequenceDiagram(NewInter)
  NewDgm.Name = ColDgm.Name
  NewDgm.ShowSequenceNumber = ColDgm.ShowSequenceNumber
  NewDgm.MessageSignature = ColDgm.MessageSignature
  ' Copy InteractionInstanceSet for SequenceDiagram
  For I = 0 To OwnerInter.GetParticipatingStimulusCount - 1
    Set Stim = OwnerInter.GetParticipatingStimulusAt(I)
    Call CopyStimulusTo(Stim, NewInter)
  Next
  ' Make A SequenceDiagram
  Call MakeSequenceDiagram(NewDgm)
  Set ConvertCollaborationToSequence = NewDgm
End Function

' ------------------------------------------------------------------------------
' Convert CollaborationRole To SequenceRole
' ------------------------------------------------------------------------------
Function ConvertCollaborationRoleToSequenceRole(ColRoleDgm)
  ' Getting Interaction and Collaboration
  Dim OwnerInter, OwnerCol
  Dim NewInter, NewDgm, Msg
  Set OwnerInter = ColRoleDgm.DiagramOwner
  Set OwnerCol = OwnerInter.Context
  ' Copying Interaction
  Set NewInter = Facto.CreateInteraction(OwnerCol)
  NewInter.Name = OwnerInter.Name
  Call NewInter.SetStereotype2(OwnerInter.StereotypeProfile, OwnerInter.StereotypeName)
  NewInter.Visibility = OwnerInter.Visibility
  NewInter.IsSpecification = OwnerInter.IsSpecification
  ' Copying Diagram
  Set NewDgm = Facto.CreateSequenceRoleDiagram(NewInter)
  NewDgm.Name = ColRoleDgm.Name
  NewDgm.ShowSequenceNumber = ColRoleDgm.ShowSequenceNumber
  NewDgm.MessageSignature = ColRoleDgm.MessageSignature
  ' Copy Interaction for SequenceRoleDiagram
  For I = 0 To OwnerInter.GetMessageCount - 1
    Set Msg = OwnerInter.GetMessageAt(I)
    Call CopyMessageTo(Msg, NewInter)
  Next
  ' Make A SequenceRoleDiagram
  Call MakeSequenceRoleDiagram(NewDgm)
  Set ConvertCollaborationRoleToSequenceRole = NewDgm
End Function

' ------------------------------------------------------------------------------
' Main
' ------------------------------------------------------------------------------
' Getting Application Object
Dim App, Facto, Sel
Dim SeqDgm, SeqRoleDgm
Set App = CreateObject("StarUML.StarUMLApplication")
Set Facto = App.UMLFactory
If App.SelectionManager.GetSelectedModelCount = 1 Then
  Set Sel = App.SelectionManager.GetSelectedModelAt(0)

  ' --------------------------------------
  ' (1) When CollaborationDiagram Selected
  ' --------------------------------------
  If IsSelectedKindOf(App, "UMLCollaborationDiagram") Then
    App.BeginGroupAction
    Set SeqDgm = ConvertCollaborationToSequence(Sel)
    SeqDgm.DiagramView.LayoutDiagram
    App.EndGroupAction
    Call App.SelectInModelExplorer(SeqDgm)
    Call App.OpenDiagram(SeqDgm)
    MsgBox "Successfully Complete the CollaborationDiagram to SequenceDiagram Conversion."

  ' ------------------------------------------
  ' (2) When CollaborationRoleDiagram Selected
  ' ------------------------------------------
  ElseIf IsSelectedKindOf(App, "UMLCollaborationRoleDiagram") Then
    App.BeginGroupAction
    Set SeqRoleDgm = ConvertCollaborationRoleToSequenceRole(Sel)
    SeqRoleDgm.DiagramView.LayoutDiagram
    App.EndGroupAction
    Call App.SelectInModelExplorer(SeqRoleDgm)
    Call App.OpenDiagram(SeqRoleDgm)
    MsgBox "Successfully Complete the CollaborationRoleDiagram to SequenceRoleDiagram Conversion."

  Else
    MsgBox "You must select a CollaborationDiagram or a CollaborationRoleDiagram, first."
  End If

End If

