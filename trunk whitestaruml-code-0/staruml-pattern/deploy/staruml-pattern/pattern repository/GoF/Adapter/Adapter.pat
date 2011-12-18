<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Adapter' help='Adapter.htm' script='Adapter.js'>
  <DESCRIPTION>Convert the interface of a class into another interface clients expect.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='adaptee' caption='Adaptee' type='Element' elementKind='Class' >
      <DESCRIPTION>defines an existing interface that needs adapting.</DESCRIPTION>
      <DEFAULTVALUE>Adaptee</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='target' caption='Target' type='Element' elementKind='Class'>
      <DESCRIPTION>defines the domain-specific interface that Client uses.</DESCRIPTION>
      <DEFAULTVALUE>Target</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='adapter' caption='Adapter' type='Element' elementKind='Class'>
      <DESCRIPTION>adapts the interface of Adaptee to the Target interface.</DESCRIPTION>
      <DEFAULTVALUE>Adapter</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='client' caption='Client' type='Element' elementKind='Class'>
      <DESCRIPTION>collaborates with objects conforming to the Target interface.</DESCRIPTION>
      <DEFAULTVALUE>Client</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
