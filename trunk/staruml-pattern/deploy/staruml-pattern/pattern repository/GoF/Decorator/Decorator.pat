<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Decorator' help='Decorator.htm' script='Decorator.js'>
  <DESCRIPTION>Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='decorator' caption='Decorator' type='Element' elementKind='Class'>
      <DESCRIPTION>maintains a reference to a Component object and defines an interface that conforms to Component's interface.</DESCRIPTION>
      <DEFAULTVALUE>Decorator</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteDecorator' caption='ConcreteDecorator'  type='ElementList' elementKind='Class' >
      <DESCRIPTION>adds responsibilities to the component.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteDecorator</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='component' caption='Component' type='Element' elementKind='Class'>
      <DESCRIPTION>defines the interface for objects that can have responsibilities added to them dynamically.</DESCRIPTION>
      <DEFAULTVALUE>Component</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteComponent' caption='ConcreateComponent' type='ElementList' elementKind='Class'>
      <DESCRIPTION>defines an object to which additional responsibilities can be attached.</DESCRIPTION>
      <DEFAULTVALUE>ConcreateComponent</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
