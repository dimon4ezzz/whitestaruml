<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Template Method' help='Template Method.htm' script='Template Method.js'>
  <DESCRIPTION>Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm's structure.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='abstractClass' caption='AbstractClass' type='Element' elementKind='Class'>
      <DESCRIPTION>defines abstract primitive operations that concrete subclasses define to implement steps of an algorithm.</DESCRIPTION>
      <DEFAULTVALUE>AbstractClass</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteClass' caption='ConcreteClass' type='ElementList' elementKind='Class' >
      <DESCRIPTION>implements the primitive operations to carry out subclass-specific steps of the algorithm.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteClass</DEFAULTVALUE>         
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
