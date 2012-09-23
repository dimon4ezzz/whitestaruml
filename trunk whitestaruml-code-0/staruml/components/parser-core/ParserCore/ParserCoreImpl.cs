using System;
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
                currentNode = Root;
            else
                return null; // Cannot continue without search tree

            int token = 0;
            bool currentNodeFound = false;

            // Iterate the search path
            for (int i = 0; i < searchPathValues.Length; i++)
            {

                // choose a tree node corresponding to the specified path node
                currentNodeFound = false;
                for (int j = 0; j < currentNode.Count() && !currentNodeFound; j++)
                {
                    //GOLD.Reduction iteratedReduction = (GOLD.Reduction)currentNode[j].Data;
                    GOLD.Reduction iteratedReduction = currentNode[j].Data as GOLD.Reduction;

                    if (iteratedReduction == null)
                    {
                        string str = (string)currentNode[j].Data;
                        continue; // skip literal tokens
                    }

                    // Check tokens contained in the given reduction
                    for (token = 0; token < iteratedReduction.Count(); token++)
                    {

                        string currentNodeName = iteratedReduction[token].Parent.Name();
                        if (currentNodeName == searchPathValues[i])
                        {
                            currentNode = iteratedReduction;
                            currentNodeFound = true;
                            break;
                        }
                    }
                }
                //Debug.Assert(currentNodeFound); // Each iteration must find a corresponding reduction node
                if (!currentNodeFound)
                    return null;
            }

            if (currentNodeFound)
            {
                GOLD.Reduction leafReduction = (GOLD.Reduction)currentNode[token].Data;

                //while ( (leafReduction.Count() > 0) && (leafReduction[0].Data as GOLD.Reduction != null) )// skip embedded reductions 
                //    leafReduction = (GOLD.Reduction)leafReduction[0].Data;

                if (leafReduction.Count() > 0)
                    value = (string)leafReduction[0].Data;
                else
                    value = null;

            }
            else
                value = null;


            return value;
        }



    } // End of class ParserCoreImpl
}
