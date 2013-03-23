<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Prototype' help='Prototype.htm' script='Prototype.js'>
  <DESCRIPTION>Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='prototype' caption='Prototype' type='Element' elementKind='Class' >
      <DESCRIPTION>declares an interface for cloning itself.</DESCRIPTION>
      <DEFAULTVALUE>Prototype</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='concretePrototype' caption='ConcretePrototype' type='ElementList' elementKind='Class'>
      <DESCRIPTION>implements an operation for cloning itself.</DESCRIPTION>
      <DEFAULTVALUE>ConcretePrototype</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='client' caption='Client' type='Element' elementKind='Class'>
      <DESCRIPTION>creates a new object by asking a prototype to clone itself.</DESCRIPTION>
      <DEFAULTVALUE>Client</DEFAULTVALUE>
    </PARAMETER>      
 </PARAMETERS>
</PATTERN>
