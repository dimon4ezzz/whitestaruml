namespace ShareBaby
{
    using System;
	using System.IO;
	using System.WinForms;

    /// <summary>
    ///    Summary description for OptionsLoader.
    /// </summary>
    public class OptionsLoader
    {
		string path = null;
		int port = 8081;
		string connection = "LAN";
		string serviceurl = "http://localhost/services/p2pservice.asmx";

		string fileName = "ShareBaby.dat";

        public OptionsLoader()
        {
            //
            // TODO: Add Constructor Logic here
            //
			setBaseDir();
			loadOptions();

        }
		public OptionsLoader(string Path)
		{
			if(Path.Length == 0)
			{
				setBaseDir();
			}
			loadOptions();

		}
		public string Path 
		{
			get 
			{
				return path;
			}
			set 
			{
				path = value;
			}
		}

		public string Connection 
		{
			get 
			{
				return connection;
			}
			set 
			{
				connection = value;
			}
		}

		public string ServiceUrl 
		{
			get 
			{
				return serviceurl;
			}
			set 
			{
				serviceurl = value;
			}
		}

		public int Port 
		{
			get 
			{
				return port;
			}
			set 
			{
				port = value;
			}
		}
		public void Update()
		{
			FileStream x = new FileStream(fileName, FileMode.OpenOrCreate);
			StreamWriter y = new StreamWriter(x);	

			y.WriteLine(path);
			y.WriteLine(port.ToString());
			y.WriteLine(connection);
			y.WriteLine(serviceurl);

			y.Close();
			x.Close();
		}
		private void loadOptions()
		{			
			Stream x = File.Open(fileName,FileMode.OpenOrCreate);
			StreamReader y = new StreamReader(x);
			
			string a1 = null;
			string newpath, newcon, newsrvurl = null;

			newpath = y.ReadLine();
			if(null != newpath)
			{
				path = newpath;
			}
			if (null != (a1 = y.ReadLine()))
			{
				port = a1.ToInt32();
			}
			newcon = y.ReadLine();
			if(null != newcon)
			{
				connection = newcon;
			}
			newsrvurl = y.ReadLine();
			if(null != newsrvurl)
			{
				serviceurl = newsrvurl;
			}

			y.Close();			
			x.Close();
		}

		private void setBaseDir()
		{
			path = Environment.CurrentDirectory;			
		}
    }
}

