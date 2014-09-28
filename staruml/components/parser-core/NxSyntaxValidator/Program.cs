
namespace NxSyntaxValidator
{
    // Dummy iplementation of IExprBuilder
    class ExprBuilderDummy : NxParserImpl.IExprBuilder
    {
        public void EndOperation() { }
        public void IdentExpr(string Id, int Pos) { }
        public void NewDrawBitmapOperation(string Filepath, int Pos) { }
        public void NewNotationOperation(string Filepath, int Pos) { }
        public void NewOperation(string Oper, int Pos) { }
        public void PrimExpr(object Value, int Pos) { }
    }


    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 0)
                System.Console.WriteLine("Usage: NxSyntaxValidator <filename>");
            else
            {
                string fileName = args[0];
                System.Console.WriteLine("Testing file: {0}", fileName);

                NxParserImpl.NxParserImpl parser = new NxParserImpl.NxParserImpl();
                NxParserImpl.IExprBuilder builder = new ExprBuilderDummy();

                bool parseStatus = parser.Parse(fileName, builder);

                if (parseStatus)
                    System.Console.WriteLine("Syntax is correct");
                else
                {
                    System.Console.WriteLine(parser.FailMessage);
                }
            }

        }
    }
}
