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
' Get CommunicationLink
' ------------------------------------------------------------------------------
Function GetCommunicationLink(Sender, Receiver, Interaction)
  Dim Owner, I, Lnk
  Set Owner = Interaction.Context
  For I = 0 To Owner.GetParticipatingLinkCount - 1
    Set Lnk = Owner.GetParticipatingLinkAt(I)
    If ((Lnk.GetConnectionAt(0).Instance Is Sender) And (Lnk.GetConnectionAt(1).Instance Is Receiver)) Or _
       ((Lnk.GetConnectionAt(0).Instance Is Receiver) And (Lnk.GetConnectionAt(1).Instance Is Sender)) Then
      Set GetCommunicationLink = Lnk
      Exit Function
    End If
  Next
  Set GetCommunicationLink = Facto.CreateLink(Owner, Sender, Receiver)
End Function

' ------------------------------------------------------------------------------
' Get AssociationRole
' ------------------------------------------------------------------------------
Function GetAssociationRole(Sender, Receiver, Interaction)
  Dim Owner, I, AssoRole
  Set Owner = Interaction.Context
  For I = 0 To Owner.GetOwnedElementCount - 1
    If Owner.GetOwnedElementAt(I).IsKindOf("UMLAssociationRole") Then
      Set AssoRole = Owner.GetOwnedElementAt(I)
      If ((AssoRole.GetConnectionAt(0).Participant Is Sender) And (AssoRole.GetConnectionAt(1).Participant Is Receiver)) Or _
         ((AssoRole.GetConnectionAt(0).Participant Is Receiver) And (AssoRole.GetConnectionAt(1).Participant Is Sender)) Then
        Set GetAssociationRole = AssoRole
        Exit Function
      End If
    End If
  Next
  Set GetAssociationRole = Facto.CreateAssociationRole(Owner, Sender, Receiver)
End Function

' ------------------------------------------------------------------------------
' Copy Stimulus To
' ------------------------------------------------------------------------------
Sub CopyStimulusTo(Stim, Interaction)
  Dim Lnk, StimKind, NewStim
  Set Lnk = GetCommunicationLink(Stim.Sender, Stim.Receiver, Interaction)
  StimKind = GetActionKind(Stim.Action)
  Set NewStim = Facto.CreateStimulus2(Interaction, Stim.Sender, Stim.Receiver, Lnk, StimKind)
  Call AssignStimulusOrMessage(Stim, NewStim)
  Call AssignAction(Stim.Action, NewStim.Action)
End Sub

' ------------------------------------------------------------------------------
' Copy Message To
' ------------------------------------------------------------------------------
Sub CopyMessageTo(Msg, Interaction)
  Dim AssoRole, MsgKind, NewMsg
  Set AssoRole = GetAssociationRole(Msg.Sender, Msg.Receiver, Interaction)
  MsgKind = GetActionKind(Msg.Action)
  Set NewMsg = Facto.CreateMessage2(Interaction, Msg.Sender, Msg.Receiver, AssoRole, MsgKind)
  Call AssignStimulusOrMessage(Msg, NewMsg)
  Call AssignAction(Msg.Action, NewMsg.Action)
End Sub

' ------------------------------------------------------------------------------
' GetLinkView
' ------------------------------------------------------------------------------
Function GetLinkView(ColDgm, Lnk)
  Dim I, V
  For I = 0 to ColDgm.GetOwnedViewCount - 1
    Set V = ColDgm.GetOwnedViewAt(I)
    If V.Model Is Lnk Then
      Set GetLinkView = V
      Exit Function
    End If
  Next
  Set GetLinkView = Null
End Function

' ------------------------------------------------------------------------------
' GetAssociationRoleView
' ------------------------------------------------------------------------------
Function GetAssociationRoleView(ColRoleDgm, AssoRole)
  Dim I, V
  For I = 0 to ColRoleDgm.GetOwnedViewCount - 1
    Set V = ColRoleDgm.GetOwnedViewAt(I)
    If V.Model Is AssoRole Then
      Set GetAssociationRoleView = V
      Exit Function
    End If
  Next
  Set GetAssociationRoleView = Null
End Function

' ------------------------------------------------------------------------------
' MakeCollaborationDiagram
' ------------------------------------------------------------------------------
Sub MakeCollaborationDiagram(ColDgm)
  Dim OwnerCol, OwnerInter, Obj, Stim, StimView, I
  ' Putting Objects
  Set OwnerInter = ColDgm.DiagramOwner
  Set OwnerCol = OwnerInter.Context
  For I = 0 To OwnerCol.GetParticipatingInstanceCount - 1
    Set Obj = OwnerCol.GetParticipatingInstanceAt(I)
    Call ColDgm.DiagramView.CreateViewOf(Obj, 100, 100)
  Next
  ' Putting Stimuli
  For I = 0 To OwnerInter.GetParticipatingStimulusCount - 1
    Set Stim = OwnerInter.GetParticipatingStimulusAt(I)
    Set StimView = Facto.CreateStimulusView(ColDgm.DiagramView, Stim, GetLinkView(ColDgm.DiagramView, Stim.CommunicationLink))
  Next
End Sub

' ------------------------------------------------------------------------------
' MakeCollaborationRoleDiagram
' ------------------------------------------------------------------------------
Sub MakeCollaborationRoleDiagram(ColRoleDgm)
  Dim OwnerCol, OwnerInter, Role, Msg, MsgView, I
  ' Putting ClassifierRoles
  Set OwnerInter = ColRoleDgm.DiagramOwner
  Set OwnerCol = OwnerInter.Context
  For I = 0 To OwnerCol.GetOwnedElementCount - 1
    If OwnerCol.GetOwnedElementAt(I).IsKindOf("UMLClassifierRole") Then
      Set Role = OwnerCol.GetOwnedElementAt(I)
      Call ColRoleDgm.DiagramView.CreateViewOf(Role, 100, 100)
    End If
  Next
  ' Putting Messages
  For I = 0 To OwnerInter.GetMessageCount - 1
    Set Msg = OwnerInter.GetMessageAt(I)
    Set MsgView = Facto.CreateMessageView(ColRoleDgm.DiagramView, Msg, GetAssociationRoleView(ColRoleDgm.DiagramView, Msg.CommunicationConnection))
  Next
End Sub
' ------------------------------------------------------------------------------
' Convert Sequence To Collaboration
' ------------------------------------------------------------------------------
Function ConvertSequenceToCollaboration(SeqDgm)
  ' Getting InteractionInstanceSet and CollaborationInstanceSet
  Dim OwnerInter, OwnerCol
  Dim NewInter, NewDgm, Stim
  Set OwnerInter = SeqDgm.DiagramOwner
  Set OwnerCol = OwnerInter.Context
  ' Copying InteractionInstanceSet
  Set NewInter = Facto.CreateInteractionInstanceSet(OwnerCol)
  NewInter.Name = OwnerInter.Name
  Call NewInter.SetStereotype2(OwnerInter.StereotypeProfile, OwnerInter.StereotypeName)
  NewInter.Visibility = OwnerInter.Visibility
  NewInter.IsSpecification = OwnerInter.IsSpecification
  ' Copying Diagram
  Set NewDgm = Facto.CreateCollaborationDiagram(NewInter)
  NewDgm.Name = SeqDgm.Name
  NewDgm.ShowSequenceNumber = SeqDgm.ShowSequenceNumber
  NewDgm.MessageSignature = SeqDgm.MessageSignature
  ' Copy InteractionInstanceSet for CollaborationDiagram
  For I = 0 To OwnerInter.GetParticipatingStimulusCount - 1
    Set Stim = OwnerInter.GetParticipatingStimulusAt(I)
    Call CopyStimulusTo(Stim, NewInter)
  Next
  ' Make A CollaborationDiagram
  Call MakeCollaborationDiagram(NewDgm)
  Set ConvertSequenceToCollaboration = NewDgm
End Function

' ------------------------------------------------------------------------------
' Convert SequenceRole To CollaborationRole
' ------------------------------------------------------------------------------
Function ConvertSequenceRoleToCollaborationRole(SeqRoleDgm)
  ' Getting Interaction and Collaboration
  Dim OwnerInter, OwnerCol
  Dim NewInter, NewDgm, Msg
  Set OwnerInter = SeqRoleDgm.DiagramOwner
  Set OwnerCol = OwnerInter.Context
  ' Copying Interaction
  Set NewInter = Facto.CreateInteraction(OwnerCol)
  NewInter.Name = OwnerInter.Name
  Call NewInter.SetStereotype2(OwnerInter.StereotypeProfile, OwnerInter.StereotypeName)
  NewInter.Visibility = OwnerInter.Visibility
  NewInter.IsSpecification = OwnerInter.IsSpecification
  ' Copying Diagram
  Set NewDgm = Facto.CreateCollaborationRoleDiagram(NewInter)
  NewDgm.Name = SeqRoleDgm.Name
  NewDgm.ShowSequenceNumber = SeqRoleDgm.ShowSequenceNumber
  NewDgm.MessageSignature = SeqRoleDgm.MessageSignature
  ' Copy Interaction for CollaborationRoleDiagram
  For I = 0 To OwnerInter.GetMessageCount - 1
    Set Msg = OwnerInter.GetMessageAt(I)
    Call CopyMessageTo(Msg, NewInter)
  Next
  ' Make A CollaborationRoleDiagram
  Call MakeCollaborationRoleDiagram(NewDgm)
  Set ConvertSequenceRoleToCollaborationRole = NewDgm
End Function

' ------------------------------------------------------------------------------
' Main
' ------------------------------------------------------------------------------
' Getting Application Object
Dim App, Facto, Sel
Dim ColDgm, ColRoleDgm
Set App = CreateObject("StarUML.StarUMLApplication")
Set Facto = App.UMLFactory
If App.SelectionManager.GetSelectedModelCount = 1 Then
  Set Sel = App.SelectionManager.GetSelectedModelAt(0)

  ' ---------------------------------
  ' (1) When SequenceDiagram Selected
  ' ---------------------------------
  If IsSelectedKindOf(App, "UMLSequenceDiagram") Then
    App.BeginGroupAction
    Set ColDgm = ConvertSequenceToCollaboration(Sel)
    ColDgm.DiagramView.LayoutDiagram
    App.EndGroupAction
    Call App.SelectInModelExplorer(ColDgm)
    Call App.OpenDiagram(ColDgm)
    MsgBox "Successfully Complete the SequenceDiagram to CollaborationDiagram Converion."

  ' -------------------------------------
  ' (2) When SequenceRoleDiagram Selected
  ' -------------------------------------
  ElseIf IsSelectedKindOf(App, "UMLSequenceRoleDiagram") Then
    App.BeginGroupAction
    Set ColRoleDgm = ConvertSequenceRoleToCollaborationRole(Sel)
    ColRoleDgm.DiagramView.LayoutDiagram
    App.EndGroupAction
    Call App.SelectInModelExplorer(ColRoleDgm)
    Call App.OpenDiagram(ColRoleDgm)
    MsgBox "Successfully Complete the SequenceRoleDiagram to CollaborationRoleDiagram Conversion."

  Else
    MsgBox "You must select a SequenceDiagram or a SequenceRoleDiagram, first."
  End If

End If

