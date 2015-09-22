namespace Erd
{
    partial class CodeParsingForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CodeParsingForm));
            this.closeBtn = new System.Windows.Forms.Button();
            this.parseBtn = new System.Windows.Forms.Button();
            this.InputFileGroupBox = new System.Windows.Forms.GroupBox();
            this.browseFileBtn = new System.Windows.Forms.Button();
            this.totalImageList = new System.Windows.Forms.ImageList(this.components);
            this.inputFileTextBox = new System.Windows.Forms.TextBox();
            this.fileNameLabel = new System.Windows.Forms.Label();
            this.browseFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.outputDiagramGroupBox = new System.Windows.Forms.GroupBox();
            this.diagramLocationLabel = new System.Windows.Forms.Label();
            this.diagramNameTextBox = new System.Windows.Forms.TextBox();
            this.diagramNameLabel = new System.Windows.Forms.Label();
            this.packagesTreeView = new System.Windows.Forms.TreeView();
            this.codeGenErrorProvider = new System.Windows.Forms.ErrorProvider(this.components);
            this.codeGenToolTip = new System.Windows.Forms.ToolTip(this.components);
            this.InputFileGroupBox.SuspendLayout();
            this.outputDiagramGroupBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.codeGenErrorProvider)).BeginInit();
            this.SuspendLayout();
            // 
            // closeBtn
            // 
            this.closeBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.closeBtn.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.closeBtn.Location = new System.Drawing.Point(472, 233);
            this.closeBtn.Name = "closeBtn";
            this.closeBtn.Size = new System.Drawing.Size(75, 23);
            this.closeBtn.TabIndex = 0;
            this.closeBtn.Text = "Close";
            this.closeBtn.UseVisualStyleBackColor = true;
            // 
            // parseBtn
            // 
            this.parseBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.parseBtn.Location = new System.Drawing.Point(391, 233);
            this.parseBtn.Name = "parseBtn";
            this.parseBtn.Size = new System.Drawing.Size(75, 23);
            this.parseBtn.TabIndex = 1;
            this.parseBtn.Text = "Parse";
            this.parseBtn.UseVisualStyleBackColor = true;
            this.parseBtn.Click += new System.EventHandler(this.parseBtn_Click);
            // 
            // InputFileGroupBox
            // 
            this.InputFileGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.InputFileGroupBox.Controls.Add(this.browseFileBtn);
            this.InputFileGroupBox.Controls.Add(this.inputFileTextBox);
            this.InputFileGroupBox.Controls.Add(this.fileNameLabel);
            this.InputFileGroupBox.Location = new System.Drawing.Point(12, 12);
            this.InputFileGroupBox.Name = "InputFileGroupBox";
            this.InputFileGroupBox.Size = new System.Drawing.Size(280, 131);
            this.InputFileGroupBox.TabIndex = 2;
            this.InputFileGroupBox.TabStop = false;
            this.InputFileGroupBox.Text = "Input SQL file location";
            // 
            // browseFileBtn
            // 
            this.browseFileBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.browseFileBtn.ImageKey = "BrowseFolder.ico";
            this.browseFileBtn.ImageList = this.totalImageList;
            this.browseFileBtn.Location = new System.Drawing.Point(0, 78);
            this.browseFileBtn.Name = "browseFileBtn";
            this.browseFileBtn.Size = new System.Drawing.Size(86, 29);
            this.browseFileBtn.TabIndex = 2;
            this.browseFileBtn.Text = "Browse file";
            this.browseFileBtn.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.browseFileBtn.UseVisualStyleBackColor = true;
            this.browseFileBtn.Click += new System.EventHandler(this.browseFileBtn_Click);
            // 
            // totalImageList
            // 
            this.totalImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("totalImageList.ImageStream")));
            this.totalImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.totalImageList.Images.SetKeyName(0, "BrowseFolder.ico");
            // 
            // inputFileTextBox
            // 
            this.inputFileTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.inputFileTextBox.Location = new System.Drawing.Point(6, 42);
            this.inputFileTextBox.Name = "inputFileTextBox";
            this.inputFileTextBox.Size = new System.Drawing.Size(268, 20);
            this.inputFileTextBox.TabIndex = 1;
            this.inputFileTextBox.TextChanged += new System.EventHandler(this.inputFileTextBox_TextChanged);
            this.inputFileTextBox.Validating += new System.ComponentModel.CancelEventHandler(this.inputFileTextBox_Validating);
            // 
            // fileNameLabel
            // 
            this.fileNameLabel.AutoSize = true;
            this.fileNameLabel.Location = new System.Drawing.Point(3, 26);
            this.fileNameLabel.Name = "fileNameLabel";
            this.fileNameLabel.Size = new System.Drawing.Size(55, 13);
            this.fileNameLabel.TabIndex = 0;
            this.fileNameLabel.Text = "File name:";
            // 
            // browseFileDialog
            // 
            this.browseFileDialog.FileName = "openFileDialog1";
            // 
            // outputDiagramGroupBox
            // 
            this.outputDiagramGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.outputDiagramGroupBox.Controls.Add(this.diagramLocationLabel);
            this.outputDiagramGroupBox.Controls.Add(this.diagramNameTextBox);
            this.outputDiagramGroupBox.Controls.Add(this.diagramNameLabel);
            this.outputDiagramGroupBox.Controls.Add(this.packagesTreeView);
            this.outputDiagramGroupBox.Location = new System.Drawing.Point(298, 12);
            this.outputDiagramGroupBox.Name = "outputDiagramGroupBox";
            this.outputDiagramGroupBox.Size = new System.Drawing.Size(249, 215);
            this.outputDiagramGroupBox.TabIndex = 3;
            this.outputDiagramGroupBox.TabStop = false;
            this.outputDiagramGroupBox.Text = "Target ERD diagram";
            // 
            // diagramLocationLabel
            // 
            this.diagramLocationLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.diagramLocationLabel.AutoSize = true;
            this.diagramLocationLabel.Location = new System.Drawing.Point(6, 76);
            this.diagramLocationLabel.Name = "diagramLocationLabel";
            this.diagramLocationLabel.Size = new System.Drawing.Size(89, 13);
            this.diagramLocationLabel.TabIndex = 12;
            this.diagramLocationLabel.Text = "Diagram location:";
            // 
            // diagramNameTextBox
            // 
            this.diagramNameTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.diagramNameTextBox.Location = new System.Drawing.Point(9, 42);
            this.diagramNameTextBox.Name = "diagramNameTextBox";
            this.diagramNameTextBox.Size = new System.Drawing.Size(175, 20);
            this.diagramNameTextBox.TabIndex = 11;
            this.diagramNameTextBox.TextChanged += new System.EventHandler(this.diagramNameTextBox_TextChanged);
            this.diagramNameTextBox.Validating += new System.ComponentModel.CancelEventHandler(this.diagramNameTextBox_Validating);
            // 
            // diagramNameLabel
            // 
            this.diagramNameLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.diagramNameLabel.AutoSize = true;
            this.diagramNameLabel.Location = new System.Drawing.Point(6, 26);
            this.diagramNameLabel.Name = "diagramNameLabel";
            this.diagramNameLabel.Size = new System.Drawing.Size(78, 13);
            this.diagramNameLabel.TabIndex = 10;
            this.diagramNameLabel.Text = "Diagram name:";
            // 
            // packagesTreeView
            // 
            this.packagesTreeView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.packagesTreeView.Location = new System.Drawing.Point(9, 94);
            this.packagesTreeView.Name = "packagesTreeView";
            this.packagesTreeView.Size = new System.Drawing.Size(220, 115);
            this.packagesTreeView.TabIndex = 9;
            this.packagesTreeView.BeforeExpand += new System.Windows.Forms.TreeViewCancelEventHandler(this.packagesTreeView_BeforeExpand);
            this.packagesTreeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.packagesTreeView_AfterSelect);
            this.packagesTreeView.Validating += new System.ComponentModel.CancelEventHandler(this.packagesTreeView_Validating);
            // 
            // codeGenErrorProvider
            // 
            this.codeGenErrorProvider.ContainerControl = this;
            // 
            // CodeParsingForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.CancelButton = this.closeBtn;
            this.ClientSize = new System.Drawing.Size(566, 268);
            this.Controls.Add(this.outputDiagramGroupBox);
            this.Controls.Add(this.InputFileGroupBox);
            this.Controls.Add(this.parseBtn);
            this.Controls.Add(this.closeBtn);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(582, 306);
            this.Name = "CodeParsingForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ERD Code Parsing";
            this.Shown += new System.EventHandler(this.CodeParsingForm_Shown);
            this.InputFileGroupBox.ResumeLayout(false);
            this.InputFileGroupBox.PerformLayout();
            this.outputDiagramGroupBox.ResumeLayout(false);
            this.outputDiagramGroupBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.codeGenErrorProvider)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button closeBtn;
        private System.Windows.Forms.Button parseBtn;
        private System.Windows.Forms.GroupBox InputFileGroupBox;
        private System.Windows.Forms.TextBox inputFileTextBox;
        private System.Windows.Forms.Label fileNameLabel;
        private System.Windows.Forms.OpenFileDialog browseFileDialog;
        private System.Windows.Forms.Button browseFileBtn;
        private System.Windows.Forms.ImageList totalImageList;
        private System.Windows.Forms.GroupBox outputDiagramGroupBox;
        private System.Windows.Forms.TreeView packagesTreeView;
        private System.Windows.Forms.ErrorProvider codeGenErrorProvider;
        private System.Windows.Forms.ToolTip codeGenToolTip;
        private System.Windows.Forms.Label diagramLocationLabel;
        private System.Windows.Forms.TextBox diagramNameTextBox;
        private System.Windows.Forms.Label diagramNameLabel;
    }
}