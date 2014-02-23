<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Memento' help='Memento.htm' script='Memento.js'>
  <DESCRIPTION>Without violating encapsulation, capture and externalize an object's internal state so that the object can be restored to this state later.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='memento' caption='Memento' type='Element' elementKind='Class'>
      <DESCRIPTION>stores internal state of the Originator object.</DESCRIPTION>
      <DEFAULTVALUE>Memento</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='originator' caption='Originator' type='Element' elementKind='Class' >
      <DESCRIPTION>creates a memento containing a snapshot of its current internal state, and uses the memento to restore its internal state.</DESCRIPTION>
      <DEFAULTVALUE>Originator</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='caretaker' caption='Caretaker' type='Element' elementKind='Class'>
      <DESCRIPTION>is responsible for the memento's safekeeping, but never operates on or examines the contents of a memento.</DESCRIPTION>
      <DEFAULTVALUE>Caretaker</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
