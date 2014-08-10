using System;
using System.Text;
using System.IO;
using System.Resources;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace ParserCore
{
    public abstract class ParserCoreImpl : ParserBase.GrammarIndependentParserBase
    {

        public string GetFailMessage()
        {
            return m_failMessage;
        }

        public string FindNodeValue(string searchPath)
        {
            return ParserBase.ParseTreeSearch.FindNodeValue(searchPath, m_root);
        } 


        private GOLD.Reduction m_root;  // Stores the top of the tree
        private string m_failMessage;  // Updated if a parsing error occured


        protected override void OnLexicalError()
        {
            m_failMessage = String.Format("Lexical Error:\nPosition: {0}, {1}\nRead: {2}", m_coreParser.CurrentPosition().Line,
                m_coreParser.CurrentPosition().Column, m_coreParser.CurrentToken().Data);
        }

        protected override void OnSyntaxError()
        {
            m_failMessage = String.Format("Syntax Error:\nPosition: {0}, {1}\nRead: {2}\nExpecting: {3}", m_coreParser.CurrentPosition().Line,
                m_coreParser.CurrentPosition().Column, m_coreParser.CurrentToken().Data, m_coreParser.ExpectedSymbols().Text());
        }

        protected override void OnAccept()
        {
            m_root = (GOLD.Reduction)m_coreParser.CurrentReduction;    //The root node! 
        }


    } // End of class ParserCoreImpl
}
