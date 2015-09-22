using System.Runtime.InteropServices;
using WhiteStarUML;

// To register regasm /codebase ErdAddIn.dll

namespace Erd
{
    /// <summary>
    /// Implementation of IStarUMLAddIn interface
    /// Addin entry point
    /// </summary>
    [Guid("6A29627E-EC54-4437-AEC5-B5F3CE3724C7")]
    [ClassInterface(ClassInterfaceType.None)]
    [ProgId(Symbols.ADDIN_PROG_ID)]
    public class ErdAddIn : IStarUMLAddIn
    {
        #region Implementation of IStarUMLAddIn interface
        public void InitializeAddIn()
        {
            //s_StarUMLApp = new WhiteStarUMLApplication();
        }
        public void FinalizeAddIn()
        {
            m_MenuActionHandler = null;
            s_StarUMLApp = null;

            // Make sure COM references to StarUML app are released before this function leaves
            System.GC.Collect();
            System.GC.WaitForPendingFinalizers();
        }

        public void DoMenuAction(int ActionID)
        {
            if (m_MenuActionHandler == null)
                m_MenuActionHandler = new MenuActionHandler();
            m_MenuActionHandler.HandleAction(ActionID);
        }

        #endregion
        // Addin specific data

        /// <summary>
        /// Singleton ensuring access to the main program interface for the entire plugin module
        /// </summary>
        static internal IStarUMLApplication StarUMLApp
        {
            get
            {
                if (s_StarUMLApp == null)
                    s_StarUMLApp = new WhiteStarUMLApplication();
                return s_StarUMLApp;
            }
        }

        /// <summary>
        /// Reference to the main program interface
        /// </summary>
        static private IStarUMLApplication s_StarUMLApp = null;

        /// <summary>
        /// Menu action handler object
        /// </summary>
        private MenuActionHandler m_MenuActionHandler = null;

    }
}
