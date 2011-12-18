<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Flyweight' help='Flyweight.htm' script='Flyweight.js'>
  <DESCRIPTION>Use sharing to support large numbers of fine-grained objects efficiently.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='flyweight' caption='Flyweight' type='Element' elementKind='Class'>
      <DESCRIPTION>declares an interface through which flyweights can receive and act on extrinsic state.</DESCRIPTION>
      <DEFAULTVALUE>Flyweight</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteFlyweight' caption='ConcreteFlyweight' type='ElementList' elementKind='Class' >
      <DESCRIPTION>implements the Flyweight interface and adds storage for intrinsic state, if any. </DESCRIPTION>
      <DEFAULTVALUE>ConcreteFlyweight</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='unsharedConcreteFlyweight' caption='UnsharedConcreteFlyweight' type='ElementList' elementKind='Class'>
      <DESCRIPTION>Not all Flyweight subclasses need to be shared. </DESCRIPTION>
      <DEFAULTVALUE>unsharedConcreteFlyweight</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='flyweightFactory' caption='FlyweightFactory' type='Element' elementKind='Class'>
      <DESCRIPTION>creates and manages flyweight objects.</DESCRIPTION>
      <DEFAULTVALUE>FlyweightFactory</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='client' caption='Client' type='Element' elementKind='Class'>
      <DESCRIPTION>maintains a reference to flyweights ,and computes or stores the extrinsic state of flyweight(s)</DESCRIPTION>
      <DEFAULTVALUE>Client</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
