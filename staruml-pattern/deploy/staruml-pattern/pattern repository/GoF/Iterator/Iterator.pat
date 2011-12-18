<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Iterator' help='Iterator.htm' script='Iterator.js'>
  <DESCRIPTION>Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='iterator' caption='Iterator' type='Element' elementKind='Class'>
      <DESCRIPTION>defines an interface for accessing and traversing elements.</DESCRIPTION>
      <DEFAULTVALUE>Iterator</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteIterator' caption='ConcreteIterator' type='ElementList' elementKind='Class' >
      <DESCRIPTION>implements the Iterator interface, and keeps track of the current position in the traversal of the aggregate.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteIterator</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='aggregate' caption='Aggregate' type='Element' elementKind='Class'>
      <DESCRIPTION>defines an interface for creating an Iterator object.</DESCRIPTION>
      <DEFAULTVALUE>Aggregate</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteAggregate' caption='ConcreteAggregate' type='ElementList' elementKind='Class'>
      <DESCRIPTION>implements the Iterator creation interface to return an instance of the proper ConcreteIterator.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteAggregate</DEFAULTVALUE>
    </PARAMETER>
  </PARAMETERS>
</PATTERN>
