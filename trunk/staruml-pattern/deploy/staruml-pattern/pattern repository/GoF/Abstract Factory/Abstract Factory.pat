<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Abstract Factory' help='Abstract Factory.htm' script='Abstract Factory.js'>
  <DESCRIPTION>Provide an interface for creating families of related or dependent objects without specifying their concrete classes.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='abstractFactory' caption='AbstractFactory' type='Element' elementKind='Class' >
      <DESCRIPTION>declares an interface for operations that create abstract product objects.</DESCRIPTION>
      <DEFAULTVALUE>AbstractFactory</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='abstractProduct' caption='AbstractProduct' type='Element' elementKind='Class'>
      <DESCRIPTION>declares an interface for a type of product object.</DESCRIPTION>
      <DEFAULTVALUE>AbstractProduct</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='concreteFactory' caption='ConcreteFactory' type='ElementList' elementKind='Class'>
      <DESCRIPTION>implements the operations to create concrete product objects.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteFactory</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteProduct' caption='ConcreteProduct' type='ElementList' elementKind='Class'>
      <DESCRIPTION>defines a product object to be created by the corresponding concrete factory, and implements the AbstractProduct interface.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteProduct</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='client' caption='Client' type='Element' elementKind='Class'>
      <DESCRIPTION>uses only interfaces declared by AbstractFactory and AbstractProduct classes.</DESCRIPTION>
      <DEFAULTVALUE>Client</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
