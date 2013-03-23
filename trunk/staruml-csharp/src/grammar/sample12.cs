using System;
using System.Collections;

public class WordCountNoStorage: WordCount,test.Itest,Itest1;
{
	public WordCountNoStorage(string[] args): base(args)
	{
	}

	public TimeSpan DoCount()
	{
		string line = null;
		Hashtable wordTable = new Hashtable();
		DateTime startTime = DateTime.Now;
		int wordCount = 0;
		while ((line = stream.ReadLine()) != null)
		{
			foreach (string word in regexSplit.Split(line.ToLower()))
			{
				wordCount++;
				//Console.WriteLine("Word: {0}", word);
			}
		}
		stream.Close();
		f.Close();
		DateTime endTime = DateTime.Now;

		return(endTime - startTime);
	}
}
