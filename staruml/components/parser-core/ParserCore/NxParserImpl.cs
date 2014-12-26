using System;
using System.IO;

namespace ParserCore
{
    // Interfacing COM independent IExprBuilder Implementation
    public interface IPrivateExprBuilder
    {
        void EndOperation();
        void IdentExpr(string Id, int Pos);
        void NewDrawBitmapOperation(string Filepath, int Pos);
        void NewNotationOperation(string Filepath, int Pos);        
        void NewOperation(string Oper, int Pos);
        void PrimExpr(object Value, int Pos);
    }
    
    public class NxParserImpl : ParserBase.NxGrammarParserWithTreeProcessing
    {
        public NxParserImpl()
        {
            Setup(ParserCore.Properties.Resources.NxGrammar);
        }

        private IPrivateExprBuilder m_builder = null;
        private string m_inputFile;

        public string GetFailMessage() { return FailMessage; }

        public bool Parse(string fileName, IPrivateExprBuilder builder) 
        {
            m_builder = builder;
            m_inputFile = fileName;
            bool parseStatus = false;

            using (StreamReader Reader = new StreamReader(m_inputFile))
            {
                parseStatus = Parse(Reader);
            }
            
            if (parseStatus)
                AnalyzeParseTree();

            m_builder = null;
            return parseStatus;  
        }


        private void AnalyzeParseTree()
        {
            AddProductionHandler(ProductionIndex.@Functional_expr_end_Rparen, HandleRparen);
            AddProductionHandler(ProductionIndex.@Notation_expr_Notation, HandleNotationOper);
            AddProductionHandler(ProductionIndex.@Onarrange_expr_Onarrange, HandleOper);
            AddProductionHandler(ProductionIndex.@Ondraw_expr_Ondraw, HandleOper);
            AddProductionHandler(ProductionIndex.@Oper_Ident, HandleOper);
            AddProductionHandler(ProductionIndex.@Oper_Math_oper, HandleOper);
            AddProductionHandler(ProductionIndex.@Expr_Int, HandleInt);
            AddProductionHandler(ProductionIndex.@Expr_Flt, HandleFloat);
            AddProductionHandler(ProductionIndex.@Expr_Str, HandleString);
            AddProductionHandler(ProductionIndex.@Expr_Bool, HandleBool);
            AddProductionHandler(ProductionIndex.@Expr_Nil, HandleNil);
            AddProductionHandler(ProductionIndex.@Expr_Ident, HandleIdent);

            ProcessParseTree(m_root);
        }

        private int CurrentLine(GOLD.Token token)
        {
            int curLine = token.Position().Line + 1; // Assumed 1-based line counting
            return curLine;
        }
        
 
        private void HandleRparen(GOLD.Reduction productionNode)
        {
            m_builder.EndOperation();
        }

 
        private void HandleNotationOper(GOLD.Reduction productionNode)
        {
            GOLD.Token operToken = productionNode[1];
            string operText = (string)operToken.Data;

            m_builder.NewNotationOperation(m_inputFile, CurrentLine(operToken));
        }
        
        private void HandleOper(GOLD.Reduction productionNode)
        {
            GOLD.Token operToken = productionNode[1];
            string operText = (string)operToken.Data;

            if (operText == "drawbitmap") // Special case with an extra parameter
            {
                m_builder.NewDrawBitmapOperation(Path.GetFullPath(m_inputFile), CurrentLine(operToken));
            }
            else
                m_builder.NewOperation(operText, CurrentLine(operToken));

        }

        private void HandleInt(GOLD.Reduction productionNode)
        {
            GOLD.Token intToken = productionNode[0];
            string intText = (string)intToken.Data;

            m_builder.PrimExpr(int.Parse(intText), CurrentLine(intToken));
        }

        private void HandleFloat(GOLD.Reduction productionNode)
        {
            GOLD.Token floatToken = productionNode[0];
            string floatText = (string)floatToken.Data;

            m_builder.PrimExpr(double.Parse(floatText), CurrentLine(floatToken));
        }

        private void HandleString(GOLD.Reduction productionNode)
        {
            GOLD.Token strToken = productionNode[0];
            string text = (string)strToken.Data;
            string textDiscardDelimiters = text.Substring(1, text.Length - 2);

            m_builder.PrimExpr(textDiscardDelimiters, CurrentLine(strToken));
        }

        private void HandleBool(GOLD.Reduction productionNode)
        {
            GOLD.Token boolToken = productionNode[0];
            string boolText = (string)boolToken.Data;

            m_builder.PrimExpr(Boolean.Parse(boolText), CurrentLine(boolToken));
        }

        private void HandleNil(GOLD.Reduction productionNode)
        {
            GOLD.Token nilToken = productionNode[0];
            m_builder.PrimExpr(null, CurrentLine(nilToken));
        }

        private void HandleIdent(GOLD.Reduction productionNode)
        {
            GOLD.Token identToken = productionNode[0];
            string identText = (string)identToken.Data;
            m_builder.IdentExpr(identText, CurrentLine(identToken));
        }

    } // End of class NxParserImpl
} // End of namespace NxParserImpl
