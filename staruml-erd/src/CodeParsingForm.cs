using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Windows.Forms;


namespace Erd
{
    public partial class CodeParsingForm : Form
    {
        public CodeParsingForm()
        {
            InitializeComponent();
        }

        private void InitInputBoxes()
        {
            inputFileTextBox.Text = CodeParser.Instance.InputFile;
            diagramNameTextBox.Text = CodeParser.Instance.DiagramName;
        }

        private void InitTableBrowser()
        {
            TreeViewUtils.CreateTopLevelNodes(packagesTreeView.Nodes);
        }

        private bool DiagramNameBoxValid
        {
            get { return GeneralUtils.ValidateName(diagramNameTextBox.Text); }
        }


        private void ValidateDiagramNameBox(Control sender)
        {
            string errorMsg = null;

            if (!DiagramNameBoxValid)
            {
                errorMsg = Symbols.ERR_DIAGRAM_NAME_NOT_VALID;
            }
            codeGenErrorProvider.SetError(sender, errorMsg);

        }

        private void diagramNameTextBox_Validating(object sender, CancelEventArgs e)
        {
            ValidateDiagramNameBox((Control)sender);
        }


        private bool FileBoxValid
        {
            get { return System.IO.File.Exists(inputFileTextBox.Text); }
        }

        private void ValidateFileBox(Control sender)
        {
            string errorMsg = null;

            if (!FileBoxValid)
            {
                errorMsg = Symbols.ERR_FILENAME_NOT_VALID;
            }
            codeGenErrorProvider.SetError(sender, errorMsg);

        }


         private void inputFileTextBox_Validating(object sender, CancelEventArgs e)
        {
            ValidateFileBox((Control)sender);
        }

        private bool PackageSelected
        {
            get { return (packagesTreeView.SelectedNode != null); }
        }

        private void ValidatePackageSelected(Control sender)
        {
            string errorMsg = null;

            if (!PackageSelected)
            {
                errorMsg = Symbols.ERR_DIAGRAM_NOT_SELECTED;
            }
            codeGenErrorProvider.SetError(sender, errorMsg);

        }

        private void packagesTreeView_Validating(object sender, CancelEventArgs e)
        {
            ValidatePackageSelected((Control)sender);
        }

        private bool ValidateGenerationReadyState()
        {
            return DiagramNameBoxValid && FileBoxValid && PackageSelected;
        }

        private void SetupGenerationReady()
        {
            parseBtn.Enabled = ValidateGenerationReadyState();
        }

        private void CodeParsingForm_Shown(object sender, EventArgs e)
        {
            InitTableBrowser();
            InitInputBoxes();
            SetupGenerationReady();
        }

        private void packagesTreeView_BeforeExpand(object sender, TreeViewCancelEventArgs e)
        {
            HandleTreeViewExpand(e.Node);
        }

        private void HandleTreeViewExpand(TreeNode node)
        {
            TreeViewUtils.UpdateTreeView(node);
            SetupGenerationReady();
        }

        private void packagesTreeView_AfterSelect(object sender, TreeViewEventArgs e)
        {
            HandleTreeViewSelectElem();
        }

        private void HandleTreeViewSelectElem()
        {
            SetupGenerationReady();
        }

        private void BrowseInputFile()
        {
            DialogResult res = browseFileDialog.ShowDialog();
            if (res == DialogResult.OK)
            {
                inputFileTextBox.Text = browseFileDialog.FileName;
                codeGenErrorProvider.SetError(inputFileTextBox, null);
            }
        }

        private void browseFileBtn_Click(object sender, EventArgs e)
        {
            BrowseInputFile();
        }

        private void inputFileTextBox_TextChanged(object sender, EventArgs e)
        {
            HandleInputFileTextChanged();
        }

        private void HandleInputFileTextChanged()
        {
            if (diagramNameTextBox.Text.Length == 0)
            {
                string diagramName = System.IO.Path.GetFileNameWithoutExtension(inputFileTextBox.Text);
                diagramNameTextBox.Text = diagramName;
                codeGenErrorProvider.SetError(diagramNameTextBox, null);
            }
            CodeParser.Instance.InputFile = inputFileTextBox.Text;
            SetupGenerationReady();
        }

        private void diagramNameTextBox_TextChanged(object sender, EventArgs e)
        {
            HandleDiagramNameTextChanged();
        }

        private void HandleDiagramNameTextChanged()
        {
            CodeParser.Instance.DiagramName = diagramNameTextBox.Text;
            SetupGenerationReady();
        }

        private void parseBtn_Click(object sender, EventArgs e)
        {
            HandleParse();
        }

        private void HandleParse()
        {
            var parentPackage = (WhiteStarUML.IUMLPackage) packagesTreeView.SelectedNode.Tag;
            bool parseSucceded = CodeParser.Instance.ParseCode(parentPackage);

            if (parseSucceded)
                MessageBox.Show(this, Symbols.MSG_PARSING_SUCCEEDED_LONG, Symbols.MSG_PARSING_SUCCEEDED, MessageBoxButtons.OK, MessageBoxIcon.Information);
            else
            {
                ParsingErrorReportForm.ReportErrors(CodeParser.Instance.InputFile, CodeParser.Instance.LastParseLog);
            }
        }
    }
}
