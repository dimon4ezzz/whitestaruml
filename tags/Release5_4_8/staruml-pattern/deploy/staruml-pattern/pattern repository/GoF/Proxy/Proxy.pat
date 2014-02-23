<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Proxy' help='Proxy.htm' script='Proxy.js'>
  <DESCRIPTION>Provide a surrogate or placeholder for another object to control access to it.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='proxy' caption='Proxy' type='ElementList' elementKind='Class'>
      <DESCRIPTION>maintains a reference that lets the proxy access the real subject. Proxy may refer to a Subject if the RealSubject and Subject interfaces are the same.</DESCRIPTION>
      <DEFAULTVALUE>Proxy</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='subject' caption='Subject' type='Element' elementKind='Class' >
      <DESCRIPTION>defines the common interface for RealSubject and Proxy so that a Proxy can be used anywhere a RealSubject is expected.</DESCRIPTION>
      <DEFAULTVALUE>Subject</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='realSubject' caption='RealSubject' type='Element' elementKind='Class'>
      <DESCRIPTION>defines the real object that the proxy represents.</DESCRIPTION>
      <DEFAULTVALUE>RealSubject</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
