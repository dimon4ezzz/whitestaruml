using System;
using System.IO;
using System.Resources;
using System.Diagnostics;
using System.Runtime.InteropServices;

// Registration for 32 bit Deplhi access
//c:\windows\Microsoft.NET\Framework\v2.0.50727\regasm /codebase ParserCore.dll /tlb:ParserCore.tlb

namespace ParserCore
{
    [Guid("C2D5AA24-3633-479b-9EA2-5AADBECE1ECE")]
    public interface IParserCore
    {
        bool Parse(string parserInputData);
        string FindNodeValue(string searchPath);
        string GetFailMessage();
    }

    
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

}
