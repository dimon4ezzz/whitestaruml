namespace ParserCore
{
    public abstract class ParserCoreImpl : ParserBase.GrammarIndependentParserBase
    {

        public string GetFailMessage()
        {
            return FailMessage;
        }

        public string FindNodeValue(string searchPath)
        {
            return ParserBase.ParseTreeSearch.FindNodeValue(searchPath, m_root);
        } 

    } // End of class ParserCoreImpl
}
