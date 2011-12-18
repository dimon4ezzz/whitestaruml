<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Entity EJB' help='EntityEJB.htm' script='EntityEJB.js'>
  <DESCRIPTION>To express/save business domain data and configure relationships with databases.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='EntityBean' caption='Entity Bean' type='Element' elementKind='Class' >
      <DESCRIPTION>EJB for expressing business-related data.</DESCRIPTION>
      <DEFAULTVALUE>EntityBean</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='HomeInterface' caption='Home Interface' type='Element' elementKind='Interface' >
      <DESCRIPTION>Home Interface for EntityBean.</DESCRIPTION>
      <DEFAULTVALUE>EntityHome</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='RemoteInterface' caption='Remote Interface' type='Element' elementKind='Interface' >
      <DESCRIPTION>Remote Interface for EntityBean.</DESCRIPTION>
      <DEFAULTVALUE>Entity</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='EntityPK' caption='EJB Primary Key Class' type='Element' elementKind='Class' >
      <DESCRIPTION>Class for identifying EntityBean.</DESCRIPTION>
      <DEFAULTVALUE>EntityPK</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
