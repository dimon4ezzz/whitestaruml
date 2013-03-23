namespace ShareBaby
{
    using System;
    using System.Drawing;
    using System.Collections;
    using System.ComponentModel;
    using System.WinForms;
	using System.Web.Services;
	using System.Net;	
	using System.Net.Sockets;
    using System.Threading;
	using System.Text;
	using sb.localhost;

    /// <summary>
    ///    Summary description for Form1.
    /// </summary>
    public class Form1 : System.WinForms.Form
    {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components;
		private System.WinForms.Label label4;
		private System.WinForms.TextBox txtURL;
		private System.WinForms.ColumnHeader clFilePath;
		private System.WinForms.Label label2;
		private System.WinForms.TextBox txtConnection;
		private System.WinForms.Label label8;
		private System.WinForms.TextBox txtPath;
		private System.WinForms.Label label7;
		private System.WinForms.TextBox txtPort;
		private System.WinForms.Label label6;
		private System.WinForms.Label label5;
		private System.WinForms.Panel panel1;
		private System.WinForms.Button btnDownload;
		private System.WinForms.ColumnHeader clPing;
		private System.WinForms.Timer tmrLogon;
		private System.WinForms.TabPage tabOptions;
		private System.WinForms.ListView lstLibrary;
		private System.WinForms.ColumnHeader columnHeader4;
		private System.WinForms.ColumnHeader columnHeader3;
		private System.WinForms.ColumnHeader columnHeader2;
		private System.WinForms.ColumnHeader columnHeader1;
		private System.WinForms.Label label3;
		private System.WinForms.Button btnFind;
		private System.WinForms.TextBox txtSearch;
		private System.WinForms.Label label1;
		private System.WinForms.ListView lstResults;
		private System.WinForms.ColumnHeader clFileName;
		private System.WinForms.ColumnHeader clMachineName;
		private System.WinForms.ColumnHeader clConnection;
		private System.WinForms.ColumnHeader clSize;
		private System.WinForms.TabPage tabLibrary;
		private System.WinForms.TabPage tabSearch;
		private System.WinForms.TabControl tabControl1;
		private System.WinForms.StatusBarPanel pnlTotalData;
		private System.WinForms.StatusBarPanel pnlNumUsers;
		private System.WinForms.StatusBar statusBar1;
		private Transfer GlobalTransfer;
		private Thread GlobalThread;
		private Boolean EnableListen;
		private string GlobalHostName;
		private string GlobalIPAddress;
		private Boolean ServiceAvailable;


		

        public Form1()
        {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

			// Now start up the listener
			InitializeTransfer();

			// The host name is useful to have around as it is treated as the 
			// identifier for the peer - You could do this with the IP address instead
			// if you want to avoid using DNS
			GetGlobalHostName();			
			
			// Initialize the options page
			InitializeOptions();
			ServiceAvailable = true;
			
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
        }
		
		private void InitializeOptions()
		{
			OptionsLoader ol = new OptionsLoader();	
			this.txtPath.Text = ol.Path;
			this.txtPort.Text = ol.Port.ToString();			
			this.txtConnection.Text = ol.Connection;
			this.txtURL.Text = ol.ServiceUrl;
			
		}

		private void GetGlobalHostName()
		{
			GlobalHostName = DNS.GetHostName();				
			GlobalHostName = DNS.GetHostByName(GlobalHostName).Hostname;
			GlobalIPAddress = DNS.GetHostByName(GlobalHostName).AddressList[0].ToString();			
		}

		private void InitializeTransfer()
		{
			EnableListen = new Boolean();			
			EnableListen = true;
			GlobalTransfer = new Transfer();
			GlobalThread = new Thread(new ThreadStart(GlobalTransfer.ListenForPeers));
			GlobalThread.Start();			
		}

        /// <summary>
        ///    Clean up any resources being used.
        /// </summary>
        public override void Dispose()
        {
			
            base.Dispose();
            components.Dispose();
        }

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container ();
			this.label1 = new System.WinForms.Label ();
			this.label7 = new System.WinForms.Label ();
			this.label3 = new System.WinForms.Label ();
			this.label2 = new System.WinForms.Label ();
			this.btnDownload = new System.WinForms.Button ();
			this.txtPort = new System.WinForms.TextBox ();
			this.label8 = new System.WinForms.Label ();
			this.label5 = new System.WinForms.Label ();
			this.clPing = new System.WinForms.ColumnHeader ();
			this.txtURL = new System.WinForms.TextBox ();
			this.tabSearch = new System.WinForms.TabPage ();
			this.columnHeader2 = new System.WinForms.ColumnHeader ();
			this.label6 = new System.WinForms.Label ();
			this.tabLibrary = new System.WinForms.TabPage ();
			this.statusBar1 = new System.WinForms.StatusBar ();
			this.tmrLogon = new System.WinForms.Timer (this.components);
			this.clConnection = new System.WinForms.ColumnHeader ();
			this.lstResults = new System.WinForms.ListView ();
			this.tabControl1 = new System.WinForms.TabControl ();
			this.pnlNumUsers = new System.WinForms.StatusBarPanel ();
			this.clMachineName = new System.WinForms.ColumnHeader ();
			this.clFilePath = new System.WinForms.ColumnHeader ();
			this.clSize = new System.WinForms.ColumnHeader ();
			this.txtSearch = new System.WinForms.TextBox ();
			this.lstLibrary = new System.WinForms.ListView ();
			this.tabOptions = new System.WinForms.TabPage ();
			this.txtPath = new System.WinForms.TextBox ();
			this.clFileName = new System.WinForms.ColumnHeader ();
			this.btnFind = new System.WinForms.Button ();
			this.panel1 = new System.WinForms.Panel ();
			this.pnlTotalData = new System.WinForms.StatusBarPanel ();
			this.columnHeader4 = new System.WinForms.ColumnHeader ();
			this.columnHeader3 = new System.WinForms.ColumnHeader ();
			this.label4 = new System.WinForms.Label ();
			this.columnHeader1 = new System.WinForms.ColumnHeader ();
			this.txtConnection = new System.WinForms.TextBox ();
			pnlNumUsers.BeginInit ();
			pnlTotalData.BeginInit ();
			//@this.TrayHeight = 90;
			//@this.TrayLargeIcon = false;
			//@this.TrayAutoArrange = true;
			label1.Location = new System.Drawing.Point (0, 16);
			label1.Text = "Search For:";
			label1.Size = new System.Drawing.Size (64, 16);
			label1.TabIndex = 1;
			label7.Location = new System.Drawing.Point (24, 160);
			label7.Text = "Communication Settings";
			label7.Size = new System.Drawing.Size (123, 13);
			label7.AutoSize = true;
			label7.TabIndex = 5;
			label3.Location = new System.Drawing.Point (0, 24);
			label3.Text = "Shared Files:";
			label3.Size = new System.Drawing.Size (344, 16);
			label3.TabIndex = 1;
			label2.Location = new System.Drawing.Point (16, 232);
			label2.Text = "Conn Speed:";
			label2.Size = new System.Drawing.Size (68, 13);
			label2.AutoSize = true;
			label2.TabIndex = 9;
			btnDownload.Location = new System.Drawing.Point (544, 8);
			btnDownload.Size = new System.Drawing.Size (104, 24);
			btnDownload.TabIndex = 2;
			btnDownload.Text = "&Download";
			btnDownload.Click += new System.EventHandler (this.btnDownload_Click);
			txtPort.Location = new System.Drawing.Point (104, 196);
			txtPort.Text = "8081";
			txtPort.TabIndex = 2;
			txtPort.Size = new System.Drawing.Size (56, 20);
			txtPort.Leave += new System.EventHandler (this.txtPort_Leave);
			label8.Location = new System.Drawing.Point (24, 32);
			label8.Text = "File Settings";
			label8.Size = new System.Drawing.Size (65, 13);
			label8.AutoSize = true;
			label8.TabIndex = 7;
			label5.Location = new System.Drawing.Point (48, 200);
			label5.Text = "Port:";
			label5.Size = new System.Drawing.Size (27, 13);
			label5.AutoSize = true;
			label5.TabIndex = 2;
			clPing.Text = "Ping";
			clPing.TextAlign = System.WinForms.HorizontalAlignment.Left;
			txtURL.Location = new System.Drawing.Point (104, 272);
			txtURL.Text = "http://localhost/services/p2pservice.asmx";
			txtURL.TabIndex = 4;
			txtURL.Size = new System.Drawing.Size (352, 20);
			txtURL.Leave += new System.EventHandler (this.txtPath_Leave);
			tabSearch.Text = "Search";
			tabSearch.Size = new System.Drawing.Size (672, 411);
			tabSearch.BorderStyle = System.WinForms.BorderStyle.Fixed3D;
			tabSearch.TabIndex = 0;
			columnHeader2.Text = "ColumnHeader";
			columnHeader2.TextAlign = System.WinForms.HorizontalAlignment.Left;
			label6.Location = new System.Drawing.Point (48, 64);
			label6.Text = "File Path:";
			label6.Size = new System.Drawing.Size (50, 13);
			label6.AutoSize = true;
			label6.TabIndex = 3;
			tabLibrary.Text = "Library";
			tabLibrary.Size = new System.Drawing.Size (672, 411);
			tabLibrary.BorderStyle = System.WinForms.BorderStyle.Fixed3D;
			tabLibrary.TabIndex = 1;
			statusBar1.BackColor = System.Drawing.SystemColors.Control;
			statusBar1.Location = new System.Drawing.Point (0, 450);
			statusBar1.Size = new System.Drawing.Size (690, 29);
			statusBar1.TabIndex = 7;
			statusBar1.ShowPanels = true;
			statusBar1.Panels.All = new System.WinForms.StatusBarPanel[2] {this.pnlNumUsers, this.pnlTotalData};
			//@tmrLogon.SetLocation (new System.Drawing.Point (216, 7));
			tmrLogon.Interval = 2000;
			tmrLogon.Enabled = true;
			tmrLogon.Tick += new System.EventHandler (this.tmrLogon_Tick);
			clConnection.Text = "Connection";
			clConnection.Width = 97;
			clConnection.TextAlign = System.WinForms.HorizontalAlignment.Left;
			lstResults.Location = new System.Drawing.Point (0, 40);
			lstResults.Size = new System.Drawing.Size (664, 368);
			lstResults.HideSelection = false;
			lstResults.View = System.WinForms.View.Report;
			lstResults.ForeColor = System.Drawing.SystemColors.WindowText;
			lstResults.TabIndex = 3;
			lstResults.DoubleClick += new System.EventHandler (this.btnDownload_Click);
			lstResults.Columns.All = new System.WinForms.ColumnHeader[6] {this.clFileName, this.clFilePath, this.clSize, this.clConnection, this.clMachineName, this.clPing};
			tabControl1.Location = new System.Drawing.Point (8, 8);
			tabControl1.Size = new System.Drawing.Size (680, 440);
			tabControl1.SelectedIndex = 0;
			tabControl1.Appearance = System.WinForms.TabAppearance.FlatButtons;
			tabControl1.TabIndex = 8;
			//@pnlNumUsers.SetLocation (new System.Drawing.Point (7, 7));
			pnlNumUsers.Text = "There are currently N users in the Share Baby community";
			pnlNumUsers.Width = 292;
			pnlNumUsers.AutoSize = System.WinForms.StatusBarPanelAutoSize.Contents;
			clMachineName.Text = "IP Address";
			clMachineName.Width = 99;
			clMachineName.TextAlign = System.WinForms.HorizontalAlignment.Left;
			clFilePath.Text = "Path";
			clFilePath.Width = 200;
			clFilePath.TextAlign = System.WinForms.HorizontalAlignment.Left;
			clSize.Text = "Size";
			clSize.Width = 81;
			clSize.TextAlign = System.WinForms.HorizontalAlignment.Left;
			txtSearch.Location = new System.Drawing.Point (64, 8);
			txtSearch.TabIndex = 0;
			txtSearch.Size = new System.Drawing.Size (328, 20);
			lstLibrary.Location = new System.Drawing.Point (0, 40);
			lstLibrary.Size = new System.Drawing.Size (664, 368);
			lstLibrary.View = System.WinForms.View.Report;
			lstLibrary.ForeColor = System.Drawing.SystemColors.WindowText;
			lstLibrary.TabIndex = 4;
			lstLibrary.Columns.All = new System.WinForms.ColumnHeader[4] {this.columnHeader4, this.columnHeader1, this.columnHeader2, this.columnHeader3};
			tabOptions.Text = "Options";
			tabOptions.Size = new System.Drawing.Size (672, 411);
			tabOptions.BorderStyle = System.WinForms.BorderStyle.Fixed3D;
			tabOptions.TabIndex = 3;
			txtPath.Location = new System.Drawing.Point (104, 64);
			txtPath.Text = "c:\\files";
			txtPath.TabIndex = 0;
			txtPath.Size = new System.Drawing.Size (352, 20);
			txtPath.Leave += new System.EventHandler (this.txtPath_Leave);
			clFileName.Text = "File Name";
			clFileName.Width = 120;
			clFileName.TextAlign = System.WinForms.HorizontalAlignment.Left;
			btnFind.Location = new System.Drawing.Point (416, 8);
			btnFind.Size = new System.Drawing.Size (104, 24);
			btnFind.TabIndex = 1;
			btnFind.Text = "&Find";
			btnFind.Click += new System.EventHandler (this.btnFind_Click_1);
			panel1.Size = new System.Drawing.Size (656, 400);
			panel1.TabIndex = 0;
			//@pnlTotalData.SetLocation (new System.Drawing.Point (114, 7));
			pnlTotalData.Text = "A total of N files are being shared";
			pnlTotalData.Width = 382;
			pnlTotalData.AutoSize = System.WinForms.StatusBarPanelAutoSize.Spring;
			columnHeader4.Text = "ColumnHeader";
			columnHeader4.TextAlign = System.WinForms.HorizontalAlignment.Left;
			columnHeader3.Text = "ColumnHeader";
			columnHeader3.TextAlign = System.WinForms.HorizontalAlignment.Left;
			label4.Location = new System.Drawing.Point (16, 272);
			label4.Text = "Service URL:";
			label4.Size = new System.Drawing.Size (69, 13);
			label4.AutoSize = true;
			label4.TabIndex = 11;
			columnHeader1.Text = "ColumnHeader";
			columnHeader1.TextAlign = System.WinForms.HorizontalAlignment.Left;
			txtConnection.Location = new System.Drawing.Point (104, 232);
			txtConnection.Text = "LAN";
			txtConnection.TabIndex = 3;
			txtConnection.Size = new System.Drawing.Size (56, 20);
			txtConnection.Leave += new System.EventHandler (this.txtPath_Leave);
			pnlNumUsers.EndInit ();
			pnlTotalData.EndInit ();
			this.Text = "Share Baby - Content Finder";
			this.MaximizeBox = false;
			this.StartPosition = System.WinForms.FormStartPosition.CenterParent;
			this.AutoScaleBaseSize = new System.Drawing.Size (5, 13);
			this.BorderStyle = System.WinForms.FormBorderStyle.FixedDialog;
			this.AcceptButton = this.btnFind;
			this.ClientSize = new System.Drawing.Size (690, 479);
			this.Closing += new System.ComponentModel.CancelEventHandler (this.Form1_Closing);
			tabOptions.Controls.Add (this.panel1);
			this.Controls.Add (this.tabControl1);
			this.Controls.Add (this.statusBar1);
			panel1.Controls.Add (this.label4);
			panel1.Controls.Add (this.txtURL);
			panel1.Controls.Add (this.label2);
			panel1.Controls.Add (this.txtConnection);
			panel1.Controls.Add (this.label5);
			panel1.Controls.Add (this.label6);
			panel1.Controls.Add (this.txtPort);
			panel1.Controls.Add (this.label7);
			panel1.Controls.Add (this.txtPath);
			panel1.Controls.Add (this.label8);
			tabControl1.Controls.Add (this.tabSearch);
			tabControl1.Controls.Add (this.tabLibrary);
			tabControl1.Controls.Add (this.tabOptions);
			tabLibrary.Controls.Add (this.lstLibrary);
			tabLibrary.Controls.Add (this.label3);
			tabSearch.Controls.Add (this.btnDownload);
			tabSearch.Controls.Add (this.btnFind);
			tabSearch.Controls.Add (this.txtSearch);
			tabSearch.Controls.Add (this.label1);
			tabSearch.Controls.Add (this.lstResults);
		}

		protected void txtConnection_TextChanged (object sender, System.EventArgs e)
		{

		}

		protected void Form1_Closing (object sender, System.ComponentModel.CancelEventArgs e)
		{
			
			if(ServiceAvailable)
			{
				P2PService p = new P2PService();
				OptionsLoader ol = new OptionsLoader();
				p.Url = ol.ServiceUrl;
				p.ClearEntriesForPeer(GlobalIPAddress);					
			}

			GlobalThread.Abort();
			GlobalTransfer.TransferShutdown();
			SaveValues();
			EnableListen = false;
		}

		protected void checkBox1_CheckedChanged (object sender, System.EventArgs e)
		{
			SaveValues();
		}

		protected void txtPath_Leave (object sender, System.EventArgs e)
		{
			SaveValues();
		}

		protected void txtPort_Leave (object sender, System.EventArgs e)
		{
			SaveValues();
		}

		protected void SaveValues()
		{
			OptionsLoader ol = new OptionsLoader();
			ol.Port = txtPort.Text.ToInt32();
			ol.Path = txtPath.Text;
			ol.Connection = txtConnection.Text;
			ol.ServiceUrl = this.txtURL.Text;
			ol.Update();			
		}

		protected void btnDownload_Click (object sender, System.EventArgs e)
		{
			Cursor = Cursors.WaitCursor;			
			string remoteFile = null;
			string server = null;
			string remotePath = null;
			string fullRemotePath = null;
			

			for( int i = 0; i < this.lstResults.ListItems.Count; i++)
			{
				if(this.lstResults.ListItems[i].Selected == true )
				{
					remotePath = this.lstResults.ListItems[i].SubItems[0];
					remoteFile =  this.lstResults.ListItems[i].Text;					
					fullRemotePath = remotePath + "\\" + remoteFile;
					server = this.lstResults.ListItems[i].SubItems[3];					
				}					
			}
			
			if(server == null)
			{
				MessageBox.Show("Please select a file to be downloaded","ShareBaby", MessageBox.IconExclamation);	
				Cursor = Cursors.Default;	
				return;
			}


			if(server != this.GlobalIPAddress)
			{
				try
				{
					OptionsLoader ol = new OptionsLoader();
					string path = ol.Path;								
					
					string localFile = path + "\\" + remoteFile; // Name the two files the same, change the paths
					Transfer trans = new Transfer();
					trans.DownloadToClient(server, fullRemotePath, localFile);			
					MessageBox.Show("Successfully transferred " + localFile, "Download Complete", MessageBox.IconInformation);					
				}
				catch(Exception exc)
				{
					MessageBox.Show(exc.ToString(), "Error Tranferring File", MessageBox.IconError);
				}
			}
			else
			{
				MessageBox.Show("This is a local file and does not need to be downloaded","ShareBaby", MessageBox.IconExclamation);	
			}
			Cursor = Cursors.Default;			
		}

		protected void btnFind_Click_1 (object sender, System.EventArgs e)
		{
			Cursor = Cursors.WaitCursor;
			Pinger ping = new Pinger();			

			if( txtSearch.Text != "")
			{
				lstResults.ListItems.Clear();
				P2PService p = new P2PService();
				OptionsLoader ol = new OptionsLoader();
				p.Url = ol.ServiceUrl;
				PeerFile[] FoundFiles = p.FindPeersWithFiles(txtSearch.Text);
				this.LogOnToService(); // Update the file info
                int PingTime = 0;
				string pingEntry = null;
				if (null != FoundFiles)
				{
					foreach (PeerFile file in FoundFiles)
					{			
						PingTime = ping.GetPingTime(file.IpAddress);
						if(PingTime <=10)
						{
							pingEntry = "< 10 ms";
						}
						else
						{
							pingEntry = Convert.ToString(PingTime) + " ms";
						}
						string[] Entry = new string[5];
					    Entry[0] = file.Path;
						Entry[1] = file.Size;
						Entry[2] = file.Connection;
						Entry[3] = file.IpAddress;
						Entry[4] = pingEntry;
						lstResults.InsertItem(0,file.Name,0,Entry);					
					}
				}
				else //prepare default entry
				{
					string[] Entry = new string[5];
					Entry[0] = "n/a";
					Entry[1] = "n/a";
					Entry[2] = "n/a";
					Entry[3] = "n/a";
					Entry[4] = "n/a";
					lstResults.InsertItem(0,"No Results Found",0,Entry);					
				}
			}			
			Cursor = Cursors.Default;
		}

		protected void tmrLogon_Tick (object sender, System.EventArgs e)
		{
			Cursor = Cursors.WaitCursor;
			tmrLogon.Enabled = false;
			StringBuilder sb = new StringBuilder("");
			InitializeFileTab();	
			try
			{
				PublishFiles();
				LogOnToService();							
				
			}
			catch
			{
				sb.Append("There was an error logging into the ShareBaby Web Service.");
				sb.Append("  Please ensure it is set up and working correctly and then restart the ShareBaby client.  Note that if you are developing with");
				sb.Append(" this sample, you will need to change the server name from 'localhost' to your actual server ");
				sb.Append("name so the ShareBaby clients know which remote server to hit once they are deployed.");
				
				MessageBox.Show(sb.ToString(), "ShareBaby", MessageBox.IconError);
				ServiceAvailable = false;
				this.pnlNumUsers.Text = " Unable to log in to the ShareBaby service";
				this.pnlTotalData.Text = " No files are being shared on the ShareBaby service at this time";
				this.btnDownload.Enabled = false;
				this.btnFind.Enabled = false;
			}
			
			Cursor = Cursors.Default;
		}

		public void InitializeFileTab()
		{
			OptionsLoader ol = new OptionsLoader();	
			string path = ol.Path;			
			FileLister lister = new FileLister(path, "",false);
			lister.InitandFillListView(this.lstLibrary);
		}

		public void PublishFiles()
		{
			OptionsLoader ol = new OptionsLoader();	
			string Connection = "LAN";
			Connection = ol.Connection;
			
			// Make sure the user wants these files published and the service is available
			if(ServiceAvailable)
			{
				this.pnlNumUsers.Text = " Publishing content list to the ShareBaby service...";
				string[,] z = FileLister.GetFileList(this.lstLibrary);
				P2PService p = new P2PService();
				p.Url = ol.ServiceUrl;
				p.ClearEntriesForPeer(GlobalIPAddress);
				
				for (int i =0 ; i <= z.GetUpperBound(1) ; i++)
				{
					p.RegisterFile(GlobalIPAddress, z[0, i], Connection, z[1, i], z[2, i]);
				}		
			}
		}

		public void LogOnToService()
		{
			this.pnlNumUsers.Text = " Logging on to the ShareBaby service...";
			if(ServiceAvailable)
			{				
				OptionsLoader ol = new OptionsLoader();
				P2PService p = new P2PService();
				p.Url = ol.ServiceUrl;				
				int NumUsers = p.GetNumUsers();			
				this.pnlNumUsers.Text = " You are now logged into the ShareBaby service - " + NumUsers + " Users sharing files";
				int NumFiles = p.GetNumFiles();
				this.pnlTotalData.Text = " A total of " + NumFiles + " files are currently being shared on the service";	
			}
			else
			{
				this.pnlNumUsers.Text = " Unable to log in to the ShareBaby service";
				this.pnlTotalData.Text = " No files are being shared on the ShareBaby service at this time";	
			}
				
			return;
		}

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        public static void Main(string[] args) 
        {
            Application.Run(new Form1());
        }
    }
}

