<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Composite' help='Composite.htm' script='Composite.js'>
  <DESCRIPTION>Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='component' caption='Component' type='Element' elementKind='Class'>
      <DESCRIPTION>declares the interface for objects in the composition.</DESCRIPTION>
      <DEFAULTVALUE>Component</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='leaf' caption='Leaf' type='ElementList' elementKind='Class' >
      <DESCRIPTION>represents leaf objects in the composition, and defines behavior for primitive objects in the composition.</DESCRIPTION>
      <DEFAULTVALUE>Leaf</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='composite' caption='Composite' type='Element' elementKind='Class'>
      <DESCRIPTION>defines behavior for components having children.</DESCRIPTION>
      <DEFAULTVALUE>Composite</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='client' caption='Client' type='Element' elementKind='Class'>
      <DESCRIPTION>manipulates objects in the composition through the Component interface.</DESCRIPTION>
      <DEFAULTVALUE>Client</DEFAULTVALUE>
    </PARAMETER>
  </PARAMETERS>
</PATTERN>
