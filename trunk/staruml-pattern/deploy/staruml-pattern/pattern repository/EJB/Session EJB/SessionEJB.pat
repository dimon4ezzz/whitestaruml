<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Session EJB' help='SessionEJB.htm' script='SessionEJB.js'>
  <DESCRIPTION>To implement business service layers.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='SessionBean' caption='SessionBean' type='Element' elementKind='Class' >
      <DESCRIPTION>Bean for implementing business logic.</DESCRIPTION>
      <DEFAULTVALUE>SessionBean</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='HomeInterface' caption='HomeInterface' type='Element' elementKind='Interface' >
      <DESCRIPTION>Home Interface that defines the method that manages the SessionBean life cycle.</DESCRIPTION>
      <DEFAULTVALUE>SessionHome</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='RemoteInterface' caption='RemoteInterface' type='Element' elementKind='Interface' >
      <DESCRIPTION>Remote Interface that defines the business logic.</DESCRIPTION>
      <DEFAULTVALUE>Session</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
