using System.Collections.Generic;
using System.Windows.Forms;

namespace Erd
{
    /// <summary>
    /// Form showing problems with reading SQL statements
    /// </summary>
    public partial class ParsingErrorReportForm : Form
    {
        public ParsingErrorReportForm()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Set data relevant to reported problem
        /// </summary>
        /// <param name="fileName">File being read</param>
        /// <param name="errors">List of error messages</param>
        internal void SetErrorInfo(string fileName, List<string> errors)
        {
            fileNameLabel.Text = fileName;

            foreach (var error in errors)
            {
                int index = error.IndexOf(fileName);
                string displayError;
                if (index >= 0)
                    displayError = error.Remove(index, fileName.Length);
                else
                    displayError = error;

                errorListView.Items.Add(displayError);
            }
         }

        /// <summary>
        /// Utility function spawning ParsingErrorReportForm window
        /// </summary>
        /// <param name="fileName">File being read</param>
        /// <param name="errors">List of error messages</param>
        internal static void ReportErrors(string fileName, List<string> errors)
        {
            ParsingErrorReportForm reportFrm = new ParsingErrorReportForm();
            reportFrm.SetErrorInfo(fileName, errors);
            reportFrm.ShowDialog();
        }
    }
}
