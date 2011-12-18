<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Mediator' help='Mediator.htm' script='Mediator.js'>
  <DESCRIPTION>Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly, and it lets you vary their interaction independently.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='mediator' caption='Mediator' type='Element' elementKind='Class'>
      <DESCRIPTION>defines an interface for communicating with Colleague objects.</DESCRIPTION>
      <DEFAULTVALUE>Mediator</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteMediator' caption='ConcreteMediator' type='Element' elementKind='Class' >
      <DESCRIPTION>implements cooperative behavior by coordinating Colleague objects, and knows and maintains its colleagues.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteMediator</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='colleague' caption='Colleague' type='Element' elementKind='Class'>
      <DESCRIPTION>Each Colleague class knows its Mediator object. Each colleague communicates with its mediator whenever it would have otherwise communicated with another colleague. </DESCRIPTION>
      <DEFAULTVALUE>Colleague</DEFAULTVALUE>
    </PARAMETER>    
  </PARAMETERS>
</PATTERN>
