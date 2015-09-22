using System.Windows.Forms;

namespace Erd
{

    /// <summary>
    /// Encapsulation of StarUML routines available through IExtensionManager interface
    /// </summary> 
    internal class ExtensionManagerHandler
    {
        internal ExtensionManagerHandler()
        {
            m_StarUMLExtensionManager = ErdAddIn.StarUMLApp.ExtensionManager; 
        }


        /// <summary>
        /// Checks if profile is available for reversing SQL code
        /// </summary>
        /// <returns>True if profile is available</returns>
        internal bool CheckReverseProfile()
        {
            bool result = false;
            
            if ( CheckProfileIncluded() ) // Profile already included
                result = true;

            else if ( CheckProfileAvailable() ) // Profile not included but available, try to include it
            {
                if ( MessageBox.Show(Symbols.QUERY_REVERSE_PROFILE_LOAD, Symbols.APP_NAME, 
                    MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes )
                {
                    try
                    {
                        m_StarUMLExtensionManager.IncludeProfile(Symbols.ERD_PROFILE_NAME);
                        result = true;
                    }
                    catch { }
                }
            }

            else // Profile not available
            {
                MessageBox.Show(Symbols.ERR_PROFILE_NOT_DEFINED, Symbols.APP_NAME, 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        
            return result;
        }


        /// <summary>
        /// Checks if ERD profile is included
        /// </summary>
        /// <returns>True if ERD profile is included</returns>
        internal bool CheckProfileIncluded()
        {
            try
            {
                return (m_StarUMLExtensionManager.FindIncludedProfile(Symbols.ERD_PROFILE_NAME) != null);
            }
            catch { return false; }
       }

        /// <summary>
        /// Checks if ERD profile is available in Profile Manager
        /// </summary>
        /// <returns>True if ERD profile is available in Profile Manager</returns>
        private bool CheckProfileAvailable()
        {
            try
            {
                return (m_StarUMLExtensionManager.FindAvailableProfile(Symbols.ERD_PROFILE_NAME) != null);
            }
            catch { return false; }
        }


        /// <summary>
        /// Stored reference to WhiteStarUML.IExtensionManager
        /// </summary>
        private WhiteStarUML.IExtensionManager m_StarUMLExtensionManager;
    }
}
