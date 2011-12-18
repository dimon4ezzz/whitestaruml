<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Bridge' help='Bridge.htm' script='Bridge.js'>
  <DESCRIPTION>Decouple an abstraction from its implementation so that the two can vary independently.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='abstraction' caption='Abstraction' type='Element' elementKind='Class' >
      <DESCRIPTION>defines the abstraction's interface, and maintains a reference to an object of type Implementor.</DESCRIPTION>
      <DEFAULTVALUE>Abstraction</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='refinedAbstraction' caption='RefinedAbstraction' type='ElementList' elementKind='Class'>
      <DESCRIPTION>extends the interface defined by Abstraction.</DESCRIPTION>
      <DEFAULTVALUE>RefinedAbstraction</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='implementor' caption='Implementor' type='Element' elementKind='Class'>
      <DESCRIPTION>defines the interface for implementation classes.</DESCRIPTION>
      <DEFAULTVALUE>Implementor</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteImplementor' caption='ConcreteImplementor' type='ElementList' elementKind='Class'>
      <DESCRIPTION>implements the Implementor interface and defines its concrete implementation.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteImplementor</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
