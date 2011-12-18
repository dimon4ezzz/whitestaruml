<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Command' help='Command.htm' script='Command.js'>
  <DESCRIPTION>Encapsulate a request as an object, thereby letting you parameterize clients with different requests, queue or log requests, and support undoable operations.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='command' caption='Command' type='Element' elementKind='Class'>
      <DESCRIPTION>declares an interface for executing an operation.</DESCRIPTION>
      <DEFAULTVALUE>Command</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteCommand' caption='ConcreteCommand' type='ElementList' elementKind='Class' >
      <DESCRIPTION>defines a binding between a Receiver object and an action, and implements Execute by invoking the corresponding operation(s) on Receiver.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteCommand</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='invoker' caption='Invoker' type='Element' elementKind='Class'>
      <DESCRIPTION>asks the command to carry out the request.</DESCRIPTION>
      <DEFAULTVALUE>Invoker</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='client' caption='Client' type='Element' elementKind='Class'>
      <DESCRIPTION>creates a ConcreteCommand object and sets its receiver.</DESCRIPTION>
      <DEFAULTVALUE>Client</DEFAULTVALUE>
    </PARAMETER>        
    <PARAMETER id='receiver' caption='Receiver' type='ElementList' elementKind='Class'>
      <DESCRIPTION>knows how to perform the operations associated with carrying out a request.</DESCRIPTION>
      <DEFAULTVALUE>Receiver</DEFAULTVALUE>
    </PARAMETER>  
 </PARAMETERS>
</PATTERN>
