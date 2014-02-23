using System;
using System.Text;
using System.IO;
using System.Resources;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace ParserCore
{
    [ClassInterface(ClassInterfaceType.None)]
    public abstract class ParserCoreImpl
    {
        private GOLD.Parser parser = new GOLD.Parser();

        private GOLD.Reduction Root;     //Store the top of the tree
        private string FailMessage;  // Updated if a parse error occured

        public bool Setup(byte[] grammarTable)
        {
            return parser.LoadTables(new BinaryReader(new MemoryStream(grammarTable)));
        }

        public bool Parse(TextReader reader)
        {

            GOLD.ParseMessage response;
            bool done;                      //Controls when we leave the loop
            bool accepted = false;          //Was the parse successful?

            parser.Open(reader);
            parser.TrimReductions = false;  //Please read about this feature before enabling  

            done = false;
            while (!done)
            {
                response = parser.Parse();

                switch (response)
                {
                    case GOLD.ParseMessage.LexicalError:
                        //Cannot recognize token
                        FailMessage = "Lexical Error:\n" +
                                      "Position: " + parser.CurrentPosition().Line + ", " + parser.CurrentPosition().Column + "\n" +
                                      "Read: " + parser.CurrentToken().Data;
                        done = true;
                        break;

                    case GOLD.ParseMessage.SyntaxError:
                        //Expecting a different token
                        FailMessage = "Syntax Error:\n" +
                                      "Position: " + parser.CurrentPosition().Line + ", " + parser.CurrentPosition().Column + "\n" +
                                      "Read: " + parser.CurrentToken().Data + "\n" +
                                      "Expecting: " + parser.ExpectedSymbols().Text();
                        done = true;
                        break;

                    case GOLD.ParseMessage.Reduction:
                        //For this project, we will let the parser build a tree of Reduction objects
                        //parser.CurrentReduction = CreateNewObject(parser.CurrentReduction);
                        break;

                    case GOLD.ParseMessage.Accept:
                        //Accepted!
                        Root = (GOLD.Reduction)parser.CurrentReduction;    //The root node!                                  
                        done = true;
                        accepted = true;
                        break;

                    case GOLD.ParseMessage.TokenRead:
                        //You don't have to do anything here.
                        break;

                    case GOLD.ParseMessage.InternalError:
                        //INTERNAL ERROR! Something is horribly wrong.
                        done = true;
                        break;

                    case GOLD.ParseMessage.NotLoadedError:
                        //This error occurs if the CGT was not loaded.                   
                        FailMessage = "Tables not loaded";
                        done = true;
                        break;

                    case GOLD.ParseMessage.GroupError:
                        //GROUP ERROR! Unexpected end of file
                        FailMessage = "Runaway group";
                        done = true;
                        break;
                }
            } //while

            return accepted;
        }

        public string GetFailMessage()
        {
            return FailMessage;
        }

        public string FindNodeValue(string searchPath)
        {
            string value = null;
            string[] searchPathValues = searchPath.Split('.');

            GOLD.Reduction currentNode;
            if (Root != null)
                //currentNode = Root[0].Data as GOLD.Reduction; // TODO: Update gramars to skip root production
                currentNode = Root;
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
                StringBuilder expressionText = new StringBuilder();
                collectExpressionText(expressionText, currentNode);

                if (expressionText.Length > 0)
                    value = expressionText.ToString();
            
            }
  
            return value;
        } // End of func FindNodeValue

        private void collectExpressionText(StringBuilder expressionText, GOLD.Reduction reduction)
        {
            for (int n = 0; n < reduction.Count(); n++)
            {
                switch (reduction[n].Type())
                {
                    case GOLD.SymbolType.Nonterminal:
                        GOLD.Reduction subNode = (GOLD.Reduction)reduction[n].Data;
                        collectExpressionText(expressionText, subNode);
                        break;

                    default:
                        string leafText = (string)reduction[n].Data;
                        expressionText.Append(leafText);
                        break;
                }
            }
        }



    } // End of class ParserCoreImpl
}
