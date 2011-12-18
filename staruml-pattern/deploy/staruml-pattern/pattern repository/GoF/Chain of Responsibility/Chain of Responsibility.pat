<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Chain of Responsibility' help='Chain of Responsibility.htm' script='Chain of Responsibility.js'>
  <DESCRIPTION>Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='handler' caption='Handler' type='Element' elementKind='Class'>
      <DESCRIPTION>defines an interface for handling requests, and implements the successor link.</DESCRIPTION>
      <DEFAULTVALUE>Handler</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteHandler' caption='ConcreteHandler' type='ElementList' elementKind='Class' >
      <DESCRIPTION>handles requests it is responsible for, and can access its successor.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteHandler</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='client' caption='Client' type='Element' elementKind='Class' >
      <DESCRIPTION>initiates the request to a ConcreteHandler object on the chain.</DESCRIPTION>
      <DEFAULTVALUE>Client</DEFAULTVALUE>         
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
