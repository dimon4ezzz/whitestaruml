<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='State' help='State.htm' script='State.js'>
  <DESCRIPTION>Allow an object to alter its behavior when its internal state changes. The object will appear to change its class.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='state' caption='State' type='Element' elementKind='Class'>
      <DESCRIPTION>defines an interface for encapsulating the behavior associated with a particular state of the Context.</DESCRIPTION>
      <DEFAULTVALUE>State</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteState' caption='ConcreteState' type='ElementList' elementKind='Class' >
      <DESCRIPTION>each subclass implements a behavior associated with a state of the Context.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteState</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='context' caption='Context' type='Element' elementKind='Class'>
      <DESCRIPTION>defines the interface of interest to clients.</DESCRIPTION>
      <DEFAULTVALUE>Context</DEFAULTVALUE>
    </PARAMETER>  
 </PARAMETERS>
</PATTERN>
