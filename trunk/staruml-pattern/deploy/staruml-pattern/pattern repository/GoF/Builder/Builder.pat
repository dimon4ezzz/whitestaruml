<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Builder' help='Builder.htm' script='Builder.js'>
  <DESCRIPTION>Separate the construction of a complex object from its representation so that the same construction process can create different representations.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='builder' caption='Builder' type='Element' elementKind='Class'>
      <DESCRIPTION>specifies an abstract interface for creating parts of a Product object.</DESCRIPTION>
      <DEFAULTVALUE>Builder</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='director' caption='Director' type='Element' elementKind='Class' >
      <DESCRIPTION>constructs an object using the Builder interface.</DESCRIPTION>
      <DEFAULTVALUE>Director</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='concreteBuilder' caption='ConcreteBuilder' type='ElementList' elementKind='Class'>
      <DESCRIPTION>constructs and assembles parts of the product by implementing the Builder interface. </DESCRIPTION>
      <DEFAULTVALUE>ConcreteBuilder</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='product' caption='Product' type='Element' elementKind='Class'>
      <DESCRIPTION>represents the complex object under construction.</DESCRIPTION>
      <DEFAULTVALUE>Product</DEFAULTVALUE>
    </PARAMETER>
  </PARAMETERS>
</PATTERN>
