// ParserBase ver 1.1

using System.IO;

namespace ParserBase
{

    // Essential setup of Gold Parser and handling parsing events
    public class GrammarIndependentParserBase
    {
        protected GOLD.Parser m_coreParser = new GOLD.Parser();
        protected GOLD.Reduction m_root = null; // Stores the top of the parse tree

        public string FailMessage  // Updated if a parse error occured
        {
            get;
            private set;
        }

        //This procedure can be called to load the parse tables. The class can
        //read tables using a BinaryReader.
        public bool Setup(byte[] grammarTable)
        {
            return m_coreParser.LoadTables(new BinaryReader(new MemoryStream(grammarTable)));
        }

        // Encapsulation of call to GOLD.Parser.Parse() and analysing callbacks from production building
        public bool Parse(TextReader reader)
        {
            //This procedure starts the GOLD Parser Engine and handles each of the
            //messages it returns. Each time a reduction is made, you can create new
            //custom object and reassign the .CurrentReduction property. Otherwise, 
            //the system will use the Reduction object that was returned.
            //
            //The resulting tree will be a pure representation of the language 
            //and will be ready to implement.

            bool done = false;              //Controls when we leave the loop
            bool accepted = false;          //Was the parse successful?

            m_coreParser.Open(reader);
            m_coreParser.TrimReductions = false;  //Please read about this feature before enabling

            while (!done)
            {
                GOLD.ParseMessage response = m_coreParser.Parse();

                switch (response)
                {
                    case GOLD.ParseMessage.LexicalError:
                        //Cannot recognize token
                        OnLexicalError();
                        done = true;
                        break;

                    case GOLD.ParseMessage.SyntaxError:
                        //Expecting a different token
                        OnSyntaxError();
                        done = true;
                        break;

                    case GOLD.ParseMessage.Reduction:
                        OnReduction();
                        break;

                    case GOLD.ParseMessage.Accept:
                        //Accepted!
                        OnAccept();
                        done = true;
                        accepted = true;
                        break;

                    case GOLD.ParseMessage.TokenRead:
                        //You don't have to do anything here.
                        break;

                    case GOLD.ParseMessage.InternalError:
                        //INTERNAL ERROR! Something is horribly wrong.
                        OnInternalError();
                        done = true;
                        break;

                    case GOLD.ParseMessage.NotLoadedError:
                        //This error occurs if the CGT was not loaded.                   
                        OnNotLoadedError();
                        done = true;
                        break;

                    case GOLD.ParseMessage.GroupError:
                        //GROUP ERROR! Unexpected end of file
                        OnGroupError();
                        done = true;
                        break;
                }
            } // End of while

            return accepted;
        } // End of method Parse()


        // Hooks to override if required to handle parsing events

        protected void OnLexicalError()
        {
            FailMessage = "Lexical Error:\n" +
                     "Position: " + m_coreParser.CurrentPosition().Line + ", " + m_coreParser.CurrentPosition().Column + "\n" +
                     "Read: " + m_coreParser.CurrentToken().Data;
        }

        protected void OnSyntaxError()
        {
            FailMessage = "Syntax Error:\n" +
                   "Position: " + m_coreParser.CurrentPosition().Line + ", " + m_coreParser.CurrentPosition().Column + "\n" +
                   "Read: " + m_coreParser.CurrentToken().Data + "\n" +
                   "Expecting: " + m_coreParser.ExpectedSymbols().Text();
        }

        protected void OnAccept()
        {
            m_root = (GOLD.Reduction)m_coreParser.CurrentReduction;    // Save the root node 
        }


        protected void OnReduction() { }
        protected void OnInternalError() { }
        protected void OnNotLoadedError() { }
        protected void OnGroupError() { }
    }

    // Functions to pick values directly from the parse tree
    static class ParseTreeSearch
    {

        static internal string FindNodeValue(string searchPath, GOLD.Reduction topLevelNode)
        {
            string value = null;
            string[] searchPathValues = searchPath.Split('.');

            GOLD.Reduction currentNode;
            if (topLevelNode != null)
                //currentNode = Root[0].Data as GOLD.Reduction; // TODO: Update gramars to skip root production
                currentNode = topLevelNode;
            else
                return null; // Cannot continue without search tree

            //int token = 0;
            bool currentNodeFound = false;

            // Iterate over search path nodes
            for (int i = 0; i < searchPathValues.Length; i++)
            {

                // Match a tree node with the same name as the specified path node
                currentNodeFound = false;
                while (!currentNodeFound) // Guard loop allowing to recover from traversing top level grammar nodes
                {
                    for (int j = 0; j < currentNode.Count() && !currentNodeFound; j++)
                    {
                        string currentTokenProductionName = currentNode[j].Parent.Name();
                        if (currentTokenProductionName == searchPathValues[i])
                        {
                            GOLD.Reduction iteratedReduction = currentNode[j].Data as GOLD.Reduction;
                            currentNode = iteratedReduction;
                            currentNodeFound = true;
                            break;
                        }

                    } // End of for j
                    if (!currentNodeFound) // Searched path fragment not found in current production
                    {
                        if ((i == 0) && (currentNode.Count() == 1)) // Potentially a dummy top level grammar node, try to skip it
                            currentNode = currentNode[0].Data as GOLD.Reduction;
                        else
                            return null; // Cannot recover, specified path does not exist.
                    }
                } // End of while

            } // End of for i

            if (currentNodeFound)
            {
                System.Text.StringBuilder expressionText = new System.Text.StringBuilder();
                CollectExpressionText(expressionText, currentNode);

                if (expressionText.Length > 0)
                    value = expressionText.ToString();

            }

            return value;
        } // End of method FindNodeValue

        // Collects yield of given expression
        static private void CollectExpressionText(System.Text.StringBuilder expressionText, GOLD.Reduction reduction)
        {
            for (int n = 0; n < reduction.Count(); n++)
            {
                switch (reduction[n].Type())
                {
                    case GOLD.SymbolType.Nonterminal:
                        GOLD.Reduction subNode = (GOLD.Reduction)reduction[n].Data;
                        CollectExpressionText(expressionText, subNode);
                        break;

                    default:
                        string leafText = (string)reduction[n].Data;
                        expressionText.Append(leafText);
                        break;
                }
            }
        } // End of method CollectExpressionText 



    } // End of class ParserWithTreeSearch

} // End of namespace ParserBase
