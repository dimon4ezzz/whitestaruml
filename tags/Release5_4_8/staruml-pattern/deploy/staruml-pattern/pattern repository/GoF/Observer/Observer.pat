<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Observer' help='Observer.htm' script='Observer.js'>
  <DESCRIPTION>Define a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='subject' caption='Subject' type='Element' elementKind='Class'>
      <DESCRIPTION>knows its observers. Any number of Observer objects may observe a subject.</DESCRIPTION>
      <DEFAULTVALUE>Subject</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='observer' caption='Observer' type='Element' elementKind='Class' >
      <DESCRIPTION>defines an updating interface for objects that should be notified of changes in a subject.</DESCRIPTION>
      <DEFAULTVALUE>Observer</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='concreteSubject' caption='ConcreteSubject' type='ElementList' elementKind='Class'>
      <DESCRIPTION>defines an updating interface for objects that should be notified of changes in a subject, and sends a notification to its observers when its state changes.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteSubject</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='concreteObserver' caption='ConcreteObserver' type='ElementList' elementKind='Class'>
      <DESCRIPTION>maintains a reference to a ConcreteSubject object, and stores state that should stay consistent with the subject's.</DESCRIPTION>
      <DEFAULTVALUE>ConcreteObserver</DEFAULTVALUE>
    </PARAMETER>
  </PARAMETERS>
</PATTERN>
