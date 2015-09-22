using System.Windows.Forms;

namespace Erd
{
    /// <summary>
    /// Utility class to process menu action passed from the main program
    /// </summary>
    internal class MenuActionHandler
    {
        /// <summary>
        /// Assigning labels to actions
        /// </summary>
        private enum Actions
        {
            Reserved = 1,
            GenerateSQL = 2,
            ReverseSQL = 3
        }
        
        internal MenuActionHandler()
        {
            m_ExtMgrHandler = new ExtensionManagerHandler();
        }

        /// <summary>
        /// Matching and handling actions
        /// </summary>
        /// <param name="ActionID">Action passed from the main program</param>
        internal void HandleAction(int ActionID)
        {
            switch ( (Actions)ActionID )
            {
                case Actions.Reserved: break;
                
                case Actions.GenerateSQL:
                    GenerateSQL();
                    break;
                
                case Actions.ReverseSQL:
                    ReverseSQL();
                    break;
            }          
        }

        /// <summary>
        /// Starts generating SQL code
        /// </summary>
        private void GenerateSQL() 
        {
            if (m_ExtMgrHandler.CheckProfileIncluded()) // For generating SQL code profile must be included
            {
                if (m_CodeGenForm == null)
                    m_CodeGenForm = new CodeGenerationForm();
                DialogResult res = m_CodeGenForm.ShowDialog();
            }
            else
                MessageBox.Show(Symbols.ERR_PROFILE_NOT_INCLUDED);
        }

        /// <summary>
        /// Starts parsing SQL code
        /// </summary>
        private void ReverseSQL() 
        {
            if (m_ExtMgrHandler.CheckReverseProfile())
            {
                if (m_CodeParserForm == null)
                    m_CodeParserForm = new CodeParsingForm();

                DialogResult res = m_CodeParserForm.ShowDialog();
            }
        }

        /// <summary>
        /// Reference to extension manager handler
        /// </summary>
        private ExtensionManagerHandler m_ExtMgrHandler = null;

        /// <summary>
        /// Code Generation Form object
        /// </summary>
        private CodeGenerationForm m_CodeGenForm = null;

        /// <summary>
        /// /// <summary>
        /// Code Parsing Form object
        /// </summary>
        /// </summary>
        private CodeParsingForm m_CodeParserForm = null;

    }
}
