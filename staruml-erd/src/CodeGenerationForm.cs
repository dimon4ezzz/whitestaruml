using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Windows.Forms;

namespace Erd
{
    /// <summary>
    /// Form controlling SQL code generation
    /// </summary>
    public partial class CodeGenerationForm : Form
    {

        /// <summary>
        /// Wrapper for IUMLClassDiagram inside ListBox item collection
        /// </summary>
        private class DiagramListBoxItemWrapper
        {
            internal DiagramListBoxItemWrapper(WhiteStarUML.IUMLClassDiagram diag)
            {
                Diagram = diag;
                m_name = diag.Name;
            }

            /// <summary>
            /// Retrieves IUMLClassDiagram element
            /// </summary>
            internal WhiteStarUML.IUMLClassDiagram Diagram
            { get; set; }

            private string m_name; // cashing diagram name to avoid subsequent COM calls

            /// <summary>
            /// Override of ToString()
            /// </summary>
            /// <returns>Name of stored IUMLClassDiagram item</returns>
            public override string ToString()
            { return m_name; }
        }


        public CodeGenerationForm()
        {
            InitializeComponent();
        }

        private void browseFolderButton_Click(object sender, EventArgs e)
        {
            BrowseOutputFolder();
        }

        /// <summary>
        /// Shows folder browse dialog and stores the result
        /// </summary>
        private void BrowseOutputFolder()
        {
            DialogResult res = folderBrowserDialog.ShowDialog();
            if (res == DialogResult.OK)
            {
                dirBox.Text = folderBrowserDialog.SelectedPath;
                codeGenErrorProvider.SetError(dirBox, null);
            }
        }

        /// <summary>
        /// Initial action on showing the form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CodeGenerationForm_Shown(object sender, EventArgs e)
        {
            InitTableBrowser();
            InitInputBoxes();
            SetupGenerationReady();
        }


        /// <summary>
        /// Sets initial values of input boxes
        /// </summary>
        private void InitInputBoxes()
        {
            fileBox.Text = CodeGenerator.Instance.FileName;
            dirBox.Text = CodeGenerator.Instance.FileDir;
        }

        /// <summary>
        /// Fills initial data of ERD table navigation control
        /// </summary>
        private void InitTableBrowser()
        {
            TreeViewUtils.CreateTopLevelNodes(packagesTreeView.Nodes);
        }

 
        private void fileBox_TextChanged(object sender, EventArgs e)
        {
            CodeGenerator.Instance.FileName = ((TextBox)sender).Text;
            SetupGenerationReady();
        }

        private void dirBox_TextChanged(object sender, EventArgs e)
        {
            CodeGenerator.Instance.FileDir = ((TextBox)sender).Text;
            SetupGenerationReady();

        }

        private void dirBox_Validating(object sender, CancelEventArgs e)
        {
            ValidateDirBox((Control)sender);
        }

        /// <summary>
        /// Validated correctness of chosen directory
        /// </summary>
        /// <param name="sender"></param>
        private void ValidateDirBox(Control sender)
        {
            string errorMsg = null;

            if (!DirBoxValid)
            {
                errorMsg = Symbols.ERR_DIRECTORY_NOT_VALID;
            }

            codeGenErrorProvider.SetError((Control)sender, errorMsg);

        }

        private bool DirBoxValid
        {
            get { return System.IO.Directory.Exists(dirBox.Text); }
        }

        private bool FileBoxValid
        {
            get { return GeneralUtils.ValidateName(fileBox.Text); }
        }

        private bool DiagramSelected
        {
            get { return (diagramListBox.SelectedIndex >= 0); }
        }

        /// <summary>
        /// Validates if all data required for SQL code generation is gathered correctly.
        /// </summary>
        /// <returns></returns>
        private bool ValidateGenerationReadyState()
        {
            return DirBoxValid && FileBoxValid && DiagramSelected;
        }

        /// <summary>
        /// Sets the state of Generate button
        /// </summary>
        private void SetupGenerationReady()
        {
            generateBtn.Enabled = ValidateGenerationReadyState();
        }


        private void fileBox_Validating(object sender, CancelEventArgs e)
        {
            ValideFileBox((Control)sender);
        }

        /// <summary>
        /// Validated correctness of chosen file name
        /// </summary>
        /// <param name="sender"></param>
        private void ValideFileBox(Control sender)
        {
            string errorMsg = null;

            if (!FileBoxValid)
            {
                errorMsg = Symbols.ERR_FILENAME_NOT_VALID;
            }
            codeGenErrorProvider.SetError(sender, errorMsg);

        }


        private void packagesTreeView_AfterSelect(object sender, TreeViewEventArgs e)
        {
            HandlePackagesTreeClick(e.Node);
        }

        /// <summary>
        /// Looks for diagrams inside of selected package and validates data
        /// </summary>
        /// <param name="treeNode"></param>
        private void HandlePackagesTreeClick(TreeNode treeNode)
        {
            collectChildDiagrams(treeNode);
            SetupGenerationReady();
        }


        /// <summary>
        /// Fills diagrams in list box
        /// </summary>
        /// <param name="parentNode"></param>
        private void collectChildDiagrams(TreeNode parentNode)
        {
            WhiteStarUML.IUMLPackage parentPackage = (WhiteStarUML.IUMLPackage)parentNode.Tag;

            List<WhiteStarUML.IUMLClassDiagram> diagrams = ProjectManagerHandler.Instance.GetOwnedErdDiagrams(parentPackage);

            diagramListBox.Items.Clear();
            foreach (var package in diagrams)
            {
                diagramListBox.Items.Add(new DiagramListBoxItemWrapper(package));
            }

        }

 
        private void diagramListBox_Validating(object sender, CancelEventArgs e)
        {
            ValidateDiagramListBox((Control)sender);
        }

        /// <summary>
        /// Validates if diagram for SQL code generation is correctly selected.
        /// </summary>
        /// <param name="sender"></param>
        private void ValidateDiagramListBox(Control sender)
        {
            string errorMsg = null;

            if (!DiagramSelected)
            {
                errorMsg = Symbols.ERR_DIAGRAM_NOT_SELECTED;
            }
            codeGenErrorProvider.SetError(sender, errorMsg);

        }

 
        private void diagramListBox_SelectedValueChanged(object sender, EventArgs e)
        {
            HandleDiagramListNewSelectedValue();
        }

        /// <summary>
        /// Handles selection of a new diagram
        /// </summary>
        private void HandleDiagramListNewSelectedValue()
        {
            // If no file name is set, fill it using diagram name
            if (fileBox.Text.Length == 0)
            {
                fileBox.Text = diagramListBox.SelectedItem.ToString() + ".sql";
                codeGenErrorProvider.SetError(fileBox, null);
            }
            SetupGenerationReady();
        }

        private void generateBtn_Click(object sender, EventArgs e)
        {
            HandleCodeGeneration();
        }

        /// <summary>
        /// Processes code generation request
        /// </summary>
        private void HandleCodeGeneration()
        {
            WhiteStarUML.IUMLClassDiagram selectedDiagram = ((DiagramListBoxItemWrapper)diagramListBox.SelectedItem).Diagram;

            bool operationSucceded = false;
            try
            {
                operationSucceded = CodeGenerator.Instance.GenerateCode(selectedDiagram);
            }
            catch (Exception e)
            {
                MessageBox.Show(this, e.Message, Symbols.MSG_GENERATION_FAILED, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (operationSucceded)
                MessageBox.Show(this, Symbols.MSG_GENERATION_SUCCEEDED_LONG,Symbols.MSG_GENERATION_SUCCEEDED, MessageBoxButtons.OK, MessageBoxIcon.Information);
            else
                MessageBox.Show(this, Symbols.ERR_NO_ERD_DATA, Symbols.MSG_GENERATION_FAILED, MessageBoxButtons.OK, MessageBoxIcon.Warning);

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
    } // End of class CodeGenerationForm


}