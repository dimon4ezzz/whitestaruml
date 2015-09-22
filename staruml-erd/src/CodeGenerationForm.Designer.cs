namespace Erd
{
    partial class CodeGenerationForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CodeGenerationForm));
            this.outputFileLabel = new System.Windows.Forms.Label();
            this.folderBrowserDialog = new System.Windows.Forms.FolderBrowserDialog();
            this.fileBox = new System.Windows.Forms.TextBox();
            this.outputFolderLabel = new System.Windows.Forms.Label();
            this.dirBox = new System.Windows.Forms.TextBox();
            this.generateBtn = new System.Windows.Forms.Button();
            this.closeBtn = new System.Windows.Forms.Button();
            this.packagesTreeView = new System.Windows.Forms.TreeView();
            this.outputFileGroupBox = new System.Windows.Forms.GroupBox();
            this.browseFolderBtn = new System.Windows.Forms.Button();
            this.totalImageList = new System.Windows.Forms.ImageList(this.components);
            this.codeGenErrorProvider = new System.Windows.Forms.ErrorProvider(this.components);
            this.packageLabel = new System.Windows.Forms.Label();
            this.diagramListBox = new System.Windows.Forms.ListBox();
            this.diagramLabel = new System.Windows.Forms.Label();
            this.inputDiagramGroupBox = new System.Windows.Forms.GroupBox();
            this.codeGenToolTip = new System.Windows.Forms.ToolTip(this.components);
            this.outputFileGroupBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.codeGenErrorProvider)).BeginInit();
            this.inputDiagramGroupBox.SuspendLayout();
            this.SuspendLayout();
            // 
            // outputFileLabel
            // 
            this.outputFileLabel.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.outputFileLabel.AutoSize = true;
            this.outputFileLabel.Location = new System.Drawing.Point(11, 73);
            this.outputFileLabel.Name = "outputFileLabel";
            this.outputFileLabel.Size = new System.Drawing.Size(58, 13);
            this.outputFileLabel.TabIndex = 0;
            this.outputFileLabel.Text = "Output file:";
            // 
            // fileBox
            // 
            this.fileBox.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.fileBox.Location = new System.Drawing.Point(84, 70);
            this.fileBox.Name = "fileBox";
            this.fileBox.Size = new System.Drawing.Size(169, 20);
            this.fileBox.TabIndex = 1;
            this.fileBox.TextChanged += new System.EventHandler(this.fileBox_TextChanged);
            this.fileBox.Validating += new System.ComponentModel.CancelEventHandler(this.fileBox_Validating);
            // 
            // outputFolderLabel
            // 
            this.outputFolderLabel.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.outputFolderLabel.AutoSize = true;
            this.outputFolderLabel.Location = new System.Drawing.Point(11, 107);
            this.outputFolderLabel.Name = "outputFolderLabel";
            this.outputFolderLabel.Size = new System.Drawing.Size(71, 13);
            this.outputFolderLabel.TabIndex = 2;
            this.outputFolderLabel.Text = "Output folder:";
            // 
            // dirBox
            // 
            this.dirBox.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.dirBox.Location = new System.Drawing.Point(84, 107);
            this.dirBox.Name = "dirBox";
            this.dirBox.Size = new System.Drawing.Size(169, 20);
            this.dirBox.TabIndex = 3;
            this.dirBox.TextChanged += new System.EventHandler(this.dirBox_TextChanged);
            this.dirBox.Validating += new System.ComponentModel.CancelEventHandler(this.dirBox_Validating);
            // 
            // generateBtn
            // 
            this.generateBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.generateBtn.Location = new System.Drawing.Point(616, 199);
            this.generateBtn.Name = "generateBtn";
            this.generateBtn.Size = new System.Drawing.Size(75, 23);
            this.generateBtn.TabIndex = 5;
            this.generateBtn.Text = "Generate";
            this.codeGenToolTip.SetToolTip(this.generateBtn, "Ready for code generation");
            this.generateBtn.UseVisualStyleBackColor = true;
            this.generateBtn.Click += new System.EventHandler(this.generateBtn_Click);
            // 
            // closeBtn
            // 
            this.closeBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.closeBtn.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.closeBtn.Location = new System.Drawing.Point(697, 199);
            this.closeBtn.Name = "closeBtn";
            this.closeBtn.Size = new System.Drawing.Size(75, 23);
            this.closeBtn.TabIndex = 6;
            this.closeBtn.Text = "Close";
            this.codeGenToolTip.SetToolTip(this.closeBtn, "Quit ERD code generation");
            this.closeBtn.UseVisualStyleBackColor = true;
            // 
            // packagesTreeView
            // 
            this.packagesTreeView.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.packagesTreeView.Location = new System.Drawing.Point(8, 45);
            this.packagesTreeView.Name = "packagesTreeView";
            this.packagesTreeView.Size = new System.Drawing.Size(168, 121);
            this.packagesTreeView.TabIndex = 8;
            this.packagesTreeView.BeforeExpand += new System.Windows.Forms.TreeViewCancelEventHandler(this.packagesTreeView_BeforeExpand);
            this.packagesTreeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.packagesTreeView_AfterSelect);
            // 
            // outputFileGroupBox
            // 
            this.outputFileGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.outputFileGroupBox.Controls.Add(this.fileBox);
            this.outputFileGroupBox.Controls.Add(this.outputFileLabel);
            this.outputFileGroupBox.Controls.Add(this.dirBox);
            this.outputFileGroupBox.Controls.Add(this.outputFolderLabel);
            this.outputFileGroupBox.Controls.Add(this.browseFolderBtn);
            this.outputFileGroupBox.Location = new System.Drawing.Point(366, 12);
            this.outputFileGroupBox.Name = "outputFileGroupBox";
            this.outputFileGroupBox.Size = new System.Drawing.Size(406, 181);
            this.outputFileGroupBox.TabIndex = 9;
            this.outputFileGroupBox.TabStop = false;
            this.outputFileGroupBox.Text = "Output file location";
            // 
            // browseFolderBtn
            // 
            this.browseFolderBtn.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.browseFolderBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.browseFolderBtn.ImageKey = "BrowseFolder.ico";
            this.browseFolderBtn.ImageList = this.totalImageList;
            this.browseFolderBtn.Location = new System.Drawing.Point(288, 103);
            this.browseFolderBtn.Name = "browseFolderBtn";
            this.browseFolderBtn.Size = new System.Drawing.Size(101, 27);
            this.browseFolderBtn.TabIndex = 4;
            this.browseFolderBtn.Text = "Browse Folder";
            this.browseFolderBtn.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.browseFolderBtn.UseVisualStyleBackColor = true;
            this.browseFolderBtn.Click += new System.EventHandler(this.browseFolderButton_Click);
            // 
            // totalImageList
            // 
            this.totalImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("totalImageList.ImageStream")));
            this.totalImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.totalImageList.Images.SetKeyName(0, "BrowseFolder.ico");
            // 
            // codeGenErrorProvider
            // 
            this.codeGenErrorProvider.ContainerControl = this;
            // 
            // packageLabel
            // 
            this.packageLabel.AutoSize = true;
            this.packageLabel.Location = new System.Drawing.Point(5, 25);
            this.packageLabel.Name = "packageLabel";
            this.packageLabel.Size = new System.Drawing.Size(85, 13);
            this.packageLabel.TabIndex = 10;
            this.packageLabel.Text = "Select package:";
            // 
            // diagramListBox
            // 
            this.diagramListBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.diagramListBox.FormattingEnabled = true;
            this.diagramListBox.Location = new System.Drawing.Point(179, 45);
            this.diagramListBox.Name = "diagramListBox";
            this.diagramListBox.Size = new System.Drawing.Size(160, 121);
            this.diagramListBox.TabIndex = 11;
            this.diagramListBox.SelectedValueChanged += new System.EventHandler(this.diagramListBox_SelectedValueChanged);
            this.diagramListBox.Validating += new System.ComponentModel.CancelEventHandler(this.diagramListBox_Validating);
            // 
            // diagramLabel
            // 
            this.diagramLabel.AutoSize = true;
            this.diagramLabel.Location = new System.Drawing.Point(176, 25);
            this.diagramLabel.Name = "diagramLabel";
            this.diagramLabel.Size = new System.Drawing.Size(80, 13);
            this.diagramLabel.TabIndex = 12;
            this.diagramLabel.Text = "Select diagram:";
            // 
            // inputDiagramGroupBox
            // 
            this.inputDiagramGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.inputDiagramGroupBox.Controls.Add(this.diagramLabel);
            this.inputDiagramGroupBox.Controls.Add(this.diagramListBox);
            this.inputDiagramGroupBox.Controls.Add(this.packageLabel);
            this.inputDiagramGroupBox.Controls.Add(this.packagesTreeView);
            this.inputDiagramGroupBox.Location = new System.Drawing.Point(7, 12);
            this.inputDiagramGroupBox.Name = "inputDiagramGroupBox";
            this.inputDiagramGroupBox.Size = new System.Drawing.Size(345, 181);
            this.inputDiagramGroupBox.TabIndex = 13;
            this.inputDiagramGroupBox.TabStop = false;
            this.inputDiagramGroupBox.Text = "Input ERD diagram selection";
            // 
            // CodeGenerationForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.closeBtn;
            this.ClientSize = new System.Drawing.Size(784, 234);
            this.Controls.Add(this.inputDiagramGroupBox);
            this.Controls.Add(this.outputFileGroupBox);
            this.Controls.Add(this.closeBtn);
            this.Controls.Add(this.generateBtn);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(800, 272);
            this.Name = "CodeGenerationForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ERD Code Generation";
            this.Shown += new System.EventHandler(this.CodeGenerationForm_Shown);
            this.outputFileGroupBox.ResumeLayout(false);
            this.outputFileGroupBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.codeGenErrorProvider)).EndInit();
            this.inputDiagramGroupBox.ResumeLayout(false);
            this.inputDiagramGroupBox.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label outputFileLabel;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog;
        private System.Windows.Forms.TextBox fileBox;
        private System.Windows.Forms.Label outputFolderLabel;
        private System.Windows.Forms.TextBox dirBox;
        private System.Windows.Forms.Button browseFolderBtn;
        private System.Windows.Forms.Button generateBtn;
        private System.Windows.Forms.Button closeBtn;
        private System.Windows.Forms.TreeView packagesTreeView;
        private System.Windows.Forms.GroupBox outputFileGroupBox;
        private System.Windows.Forms.ErrorProvider codeGenErrorProvider;
        private System.Windows.Forms.Label diagramLabel;
        private System.Windows.Forms.ListBox diagramListBox;
        private System.Windows.Forms.Label packageLabel;
        private System.Windows.Forms.GroupBox inputDiagramGroupBox;
        private System.Windows.Forms.ImageList totalImageList;
        private System.Windows.Forms.ToolTip codeGenToolTip;
    }
}