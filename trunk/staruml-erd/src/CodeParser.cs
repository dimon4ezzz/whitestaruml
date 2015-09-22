using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Erd
{
    using IR = ModelIntermediateRepresentation;

    internal class CodeParser
    {
        internal string InputFile { get; set; }
        internal string DiagramName { get; set; }

        internal bool ParseCode(WhiteStarUML.IUMLPackage parentPackage)
        {
            // Get IR data from file
            MsgTextWriter errorWriter = new MsgTextWriter();
            List<IR.Table> tables = ParseERDTables(errorWriter);
            LastParseLog = errorWriter.Errors;

            bool parseSucceded = (LastParseLog.Count() == 0);

            if (parseSucceded)
            {
                try
                {
                    UMLFactoryHandler.Instance.AddErdDiagram(parentPackage, DiagramName, tables);
                }
                catch (System.Runtime.InteropServices.COMException e)
                {
                    LastParseLog = new List<string>();
                    LastParseLog.Add(e.Message);
                    LastParseLog.Add(Symbols.ERR_INVALID_OPERATION);
                    return false;
                }
            }

            return parseSucceded; // Successful if no problems reported
        }

        private List<IR.Table> ParseERDTables(System.IO.TextWriter errorWriter)
        {
            SqlDdlReaderLexer lex = new SqlDdlReaderLexer(new Antlr.Runtime.ANTLRFileStream(InputFile));
            Antlr.Runtime.CommonTokenStream tokens = new Antlr.Runtime.CommonTokenStream(lex);
            SqlDdlReaderParser parser = new SqlDdlReaderParser(tokens);
            parser.TraceDestination = errorWriter;

            return parser.Process();
                
        }

        internal List<string> LastParseLog { get; private set; }


        /// <summary>
        /// Singleton object ensuring access to class instance
        /// </summary>
        static internal CodeParser Instance
        {
            get
            {
                if (s_Instance == null)
                    s_Instance = new CodeParser();
                return s_Instance;
            }
        }

        static private CodeParser s_Instance = null;

    }

    internal class MsgTextWriter : System.IO.TextWriter
    {
        public override void Write(string msg)
        {
            Errors.Add(msg);
        }

        public override void WriteLine(string msg)
        {
            Errors.Add(msg);
        }

        public override Encoding Encoding
        {
            get { return Encoding.Default; }
        }

        internal List<string> Errors { get { return m_lines; } }

        private List<string> m_lines = new List<string>();
    }


}
