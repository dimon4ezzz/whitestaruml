<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Strategy' help='Strategy.htm' script='Strategy.js'>
  <DESCRIPTION>Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='strategy' caption='Strategy' type='Element' elementKind='Class'>
      <DESCRIPTION>declares an interface common to all supported algorithms.</DESCRIPTION>
      <DEFAULTVALUE>Strategy</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteStrategy' caption='ConcreteStrategy' type='ElementList' elementKind='Class' >
      <DESCRIPTION>implements the algorithm using the Strategy interface.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteStrategy</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='context' caption='Context' type='Element' elementKind='Class'>
      <DESCRIPTION>is configured with a ConcreteStrategy object.</DESCRIPTION>
      <DEFAULTVALUE>Context</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
