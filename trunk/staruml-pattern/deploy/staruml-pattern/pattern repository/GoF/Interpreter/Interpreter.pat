<?xml version="1.0" encoding="UTF-8" ?>
<PATTERN version='1.0' name='Interpreter' help='Interpreter.htm' script='Interpreter.js'>
  <DESCRIPTION>Given a language, define a represention for its grammar along with an interpreter that uses the representation to interpret sentences in the language.</DESCRIPTION>
  <PARAMETERS>
    <PARAMETER id='abstractExpression' caption='AbstractExpression' type='Element' elementKind='Class'>
      <DESCRIPTION>declares an abstract Interpret operation that is common to all nodes in the abstract syntax tree.</DESCRIPTION>
      <DEFAULTVALUE>AbstractExpression</DEFAULTVALUE>
    </PARAMETER>  
    <PARAMETER id='terminalExpression' caption='TerminalExpression' type='Element' elementKind='Class' >
      <DESCRIPTION>implements an Interpret operation associated with terminal symbols in the grammar. An instance is required for every terminal symbol in a sentence.</DESCRIPTION>
      <DEFAULTVALUE>TerminalExpression</DEFAULTVALUE>         
    </PARAMETER>
    <PARAMETER id='nonterminalExpression' caption='NonterminalExpression' type='ElementList' elementKind='Class'>
      <DESCRIPTION>implements an Interpret operation for nonterminal symbols in the grammar.</DESCRIPTION>
      <DEFAULTVALUE>NonterminalExpression</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='context' caption='Context' type='Element' elementKind='Class'>
      <DESCRIPTION>contains information that's global to the interpreter.</DESCRIPTION>
      <DEFAULTVALUE>Context</DEFAULTVALUE>
    </PARAMETER>
    <PARAMETER id='client' caption='Client' type='Element' elementKind='Class'>
      <DESCRIPTION>builds (or is given) an abstract syntax tree representing a particular sentence in the language that the grammar defines.</DESCRIPTION>
      <DEFAULTVALUE>Client</DEFAULTVALUE>
    </PARAMETER>
 </PARAMETERS>
</PATTERN>
