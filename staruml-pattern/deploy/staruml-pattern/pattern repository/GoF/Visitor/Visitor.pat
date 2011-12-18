<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Visitor' help='Visitor.htm' script='Visitor.js'>
  <DESCRIPTION>Represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation without changing the classes of the elements on which it operates.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='visitor' caption='Visitor' type='Element' elementKind='Class'>
      <DESCRIPTION>declares a Visit operation for each class of ConcreteElement in the object structure.</DESCRIPTION>
      <DEFAULTVALUE>Visitor</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteVisitor' caption='ConcreteVisitor' type='ElementList' elementKind='Class' >
      <DESCRIPTION>implements each operation declared by Visitor.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteVisitor</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='element' caption='Element' type='Element' elementKind='Class'>
      <DESCRIPTION>defines an Accept operation that takes a visitor as an argument. </DESCRIPTION>
      <DEFAULTVALUE>Element</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteElement' caption='ConcreateElement' type='ElementList' elementKind='Class'>
      <DESCRIPTION>implements an Accept operation that takes a visitor as an argument.</DESCRIPTION>
      <DEFAULTVALUE>ConcreateElement</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='objectStructure' caption='ObjectStruture' type='Element' elementKind='Class'>
      <DESCRIPTION>can enumerate its elements, and may provide a high-level interface to allow the visitor to visit its elements.</DESCRIPTION>
      <DEFAULTVALUE>ObjectStruture</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
