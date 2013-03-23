<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Factory Method' help='Factory Method.htm' script='Factory Method.js'>
  <DESCRIPTION>Define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='product' caption='Product' type='Element' elementKind='Class'>
      <DESCRIPTION>defines the interface of objects the factory method creates.</DESCRIPTION>
      <DEFAULTVALUE>Product</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='concreteProduct' caption='ConcreteProduct' type='ElementList' elementKind='Class'>
      <DESCRIPTION>implements the Product interface.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteProduct</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='creator' caption='Creator' type='Element' elementKind='Class'>
      <DESCRIPTION>declares the factory method, which returns an object of type Product.</DESCRIPTION>
      <DEFAULTVALUE>Creator</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteCreator' caption='ConcreteCreator' type='ElementList' elementKind='Class'>
      <DESCRIPTION>overrides the factory method to return an instance of a ConcreteProduct.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteCreator</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
