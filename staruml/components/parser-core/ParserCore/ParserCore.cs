using System.IO;
using System.Runtime.InteropServices;

// Registration for 32 bit Delphi access
//c:\windows\Microsoft.NET\Framework\v2.0.50727\regasm /codebase ParserCore.dll /tlb:ParserCore.tlb

namespace ParserCore
{
    [ComVisible(true)]
    [Guid("C2D5AA24-3633-479b-9EA2-5AADBECE1ECE")]
    public interface IParserCore
    {
        bool Parse(string parserInputData);
        string FindNodeValue(string searchPath);
        string GetFailMessage();
    }

    [ComVisible(true)]
    [Guid("41B17622-6FBA-4683-AACD-402F7F021D17")]
    [ClassInterface(ClassInterfaceType.None)]
    public class NameExprParserCoreImpl : ParserCoreImpl, IParserCore 
    {
        public bool Parse(string parserInputData)
        {
            Setup(Properties.Resources.NameExpr);
            return Parse(new StringReader(parserInputData));
        }

    }

    [ComVisible(true)]
    [Guid("90971B47-C855-4e13-96C0-4B2896D03E45")]
    [ClassInterface(ClassInterfaceType.None)]
    public class AttrExprParserCoreImpl : ParserCoreImpl, IParserCore
    {
        public bool Parse(string parserInputData)
        {
            Setup(Properties.Resources.AttrExpr);
            return Parse(new StringReader(parserInputData));
        }

    }

    [ComVisible(true)]
    [Guid("822AEBDE-A58E-4a2f-8D21-C676237A8F9A")]
    [ClassInterface(ClassInterfaceType.None)]
    public class MsgExprParserCoreImpl : ParserCoreImpl, IParserCore
    {
        public bool Parse(string parserInputData)
        {
            Setup(Properties.Resources.MsgExpr);
            return Parse(new StringReader(parserInputData));
        }

    }


    [ComVisible(true)]
    [Guid("CB20E29D-DC2D-496d-B7FC-5A85D7D2B22E")]
    [ClassInterface(ClassInterfaceType.None)]
    public class ObjExprParserCoreImpl : ParserCoreImpl, IParserCore
    {
        public bool Parse(string parserInputData)
        {
            Setup(Properties.Resources.ObjExpr);
            return Parse(new StringReader(parserInputData));
        }

    }

    [ComVisible(true)]
    [Guid("0A4BD2B2-518C-48aa-A472-FB8A02296FC6")]
    [ClassInterface(ClassInterfaceType.None)]
    public class OperExprParserCoreImpl : ParserCoreImpl, IParserCore
    {
        public bool Parse(string parserInputData)
        {
            Setup(Properties.Resources.OperExpr);
            return Parse(new StringReader(parserInputData));
        }

    }

    [ComVisible(true)]
    [Guid("E4D99203-E233-4961-B2C3-9E728E92D980")]
    [ClassInterface(ClassInterfaceType.None)]
    public class RoleExprParserCoreImpl : ParserCoreImpl, IParserCore
    {
        public bool Parse(string parserInputData)
        {
            Setup(Properties.Resources.RoleExpr);
            return Parse(new StringReader(parserInputData));
        }

    }

    [ComVisible(true)]
    [Guid("958DCE18-DB33-4f20-8ADE-B3B6D97260BF")]
    [ClassInterface(ClassInterfaceType.None)]
    public class TransExprParserCoreImpl : ParserCoreImpl, IParserCore
    {
        public bool Parse(string parserInputData)
        {
            Setup(Properties.Resources.TransExpr);
            return Parse(new StringReader(parserInputData));
        }

    }

    [ComVisible(true)]
    [Guid("DD062285-0F54-4871-9F59-42A3BA4C46AF")]
    public interface INxParser
    {
        bool Parse(string fileName, WhiteStarUML.IExprBuilder builder);
        string GetFailMessage();
    }

    // IExprBuilder implementation as a wrapper over COM object
    class ExprBuilderWrapper : ParserCore.IPrivateExprBuilder
    { 
        private WhiteStarUML.IExprBuilder m_builder;
        internal ExprBuilderWrapper(WhiteStarUML.IExprBuilder builder) { m_builder = builder; }

        public void EndOperation() { m_builder.EndOperation(); }
        public void IdentExpr(string Id, int Pos) { m_builder.IdentExpr(Id, Pos); }
        public void NewDrawBitmapOperation(string Filepath, int Pos) { m_builder.NewDrawBitmapOperation(Filepath, Pos); }
        public void NewNotationOperation(string Filepath, int Pos) { m_builder.NewNotationOperation(Filepath, Pos); }
        public void NewOperation(string Oper, int Pos) { m_builder.NewOperation(Oper, Pos); }
        public void PrimExpr(object Value, int Pos) { m_builder.PrimExpr(Value, Pos); }
    }

    [ComVisible(true)]
    [Guid("88EDE9D0-6E37-4b00-86D7-B689C9748661")]
    [ClassInterface(ClassInterfaceType.None)]
    public class NxParser : NxParserImpl, INxParser
    {

        public bool Parse(string fileName, WhiteStarUML.IExprBuilder builder)
        {
            ExprBuilderWrapper wrapper = new ExprBuilderWrapper(builder);
            bool result = Parse(fileName, wrapper);
            Marshal.ReleaseComObject(builder);
            return result;
        }
    
    }

}
