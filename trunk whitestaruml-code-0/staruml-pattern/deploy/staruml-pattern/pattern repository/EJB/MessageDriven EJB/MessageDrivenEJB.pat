<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='MessageDriven EJB' help='MessageDrivenEJB.htm' script='MessageDrivenEJB.js'>
  <DESCRIPTION>To enable application of asynchronous message passing that allows the sender to send a message and terminate execution regardless of the receiver's status.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='MsgDrivenBean' caption='Class Name' type='Element' elementKind='Class'>
      <DESCRIPTION>EJB for receiving and processing JMS (Java Message Service) messages.</DESCRIPTION>
      <DEFAULTVALUE>MessageDrivenBean</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
