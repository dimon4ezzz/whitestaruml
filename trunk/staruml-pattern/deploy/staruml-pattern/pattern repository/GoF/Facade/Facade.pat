<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Facade' help='Facade.htm' script='Facade.js'>
  <DESCRIPTION>Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='facade' caption='Facade' type='Element' elementKind='Class'>
      <DESCRIPTION>knows which subsystem classes are responsible for a request, and delegates client requests to appropriate subsystem objects.</DESCRIPTION>
      <DEFAULTVALUE>Facade</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='subsystem' caption='Subsystem Classes' type='ElementList' elementKind='Class' >
      <DESCRIPTION>implement subsystem functionality, and handle work assigned by the Facade object, but have no knowledge of the facade; that is, they keep no references to it.</DESCRIPTION>
      <DEFAULTVALUE>Subsystem Classes</DEFAULTVALUE>         
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
