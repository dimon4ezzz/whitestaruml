namespace ShareBaby
{
    using System;
	using System.WinForms;
	using System.IO;


    /// <summary>
    ///    Summary description for FileLister.
    /// </summary>
    public class FileLister
    {

		private string innerPath = null;
		private string innerExtension = null;
		private bool showChecks = false;


		public FileLister(string Path)
        {
            //
            // TODO: Add Constructor Logic here
            //
			innerPath = Path;
			innerExtension = "";
        }


		public FileLister(string Path, string extensionFilter)
        {
            //
            // TODO: Add Constructor Logic here
            //
			innerPath = Path;
			innerExtension = extensionFilter;
        }

		public static string[,] GetFileList(ListView value)
		{
			string[,] x = new string[3, value.ListItems.Count];

			for( int i = 0; i < value.ListItems.Count; i++)
			{
				x[0, i] = value.ListItems[i].Text;
				x[1, i] = value.ListItems[i].SubItems[0];
				x[2, i] = value.ListItems[i].SubItems[1];
			}

			return x;
		}


		public FileLister(string Path, string extensionFilter, bool ShowChecks)
        {
            //
            // TODO: Add Constructor Logic here
            //
			innerPath = Path;
			innerExtension = extensionFilter;
			showChecks = ShowChecks;
        }

		/// <summary>
		/// Initialize and populate a listview.
		/// </summary>
		/// <param name="value"> </param>

		public void InitandFillListView(ListView value)
		{

			int colsize = (value.Width - 6) / 3;



			value.BeginUpdate();

			value.Columns.Clear();
			value.ListItems.Clear();

			value.View = System.WinForms.View.Report;
			value.CheckBoxes = showChecks;
			value.Columns.Add("File Name", colsize, HorizontalAlignment.Left);
			value.Columns.Add("Size (Bytes)", colsize, HorizontalAlignment.Right);
			value.Columns.Add("Path", colsize, HorizontalAlignment.Left);

			FillListView(value);

			value.EndUpdate();
		}

		private void FillListView(ListView value)
		{

		//For each file in the identified path and the file name and sub elements
			string workPath = null;


			if(innerExtension.Length == 0)
			{
				workPath = "*";
			}
			else
			{
				if(innerExtension.StartsWith("."))
				{
					workPath = "*" + innerExtension;
				}
				else
				{
					workPath = "*." + innerExtension;
				}
			}

			foreach (File f in Directory.GetFilesInDirectory (innerPath, workPath))
			{
				try
				{
					value.ListItems.Add(f.Name, -1, new string[]
					 {string.Format("{0:n0}",  f.Length), f.DirectoryName});
				}
				catch
				{}
			}

	    }

    }
}

