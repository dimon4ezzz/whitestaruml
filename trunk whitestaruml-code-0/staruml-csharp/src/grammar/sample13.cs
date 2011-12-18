using System;
using System.Collections;

class IntHolderClass
{
	int count;

	public IntHolderClass()
	{
		count = 1;
	}

	public int Count
	{
		get
		{
			return(count);
		}
		set
		{
			count = value;
		}
	}

	public override string ToString()
	{
		return(count.ToString());
	}
}

class WordCountIntHolder: WordCount
{
	public WordCountIntHolder(string[] args): base(args)
	{
	}

	public void DoCount(TimeSpan overhead)
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
				IntHolderClass value = (IntHolderClass) wordTable[word];
				if (value == null)
				{
					wordTable[word] = new IntHolderClass();
				}
				else
					value.Count++;
			}
		}
		stream.Close();
		f.Close();
		DateTime endTime = DateTime.Now;

		ArrayList words = new ArrayList();
		foreach (string word in wordTable.Keys)
		{
			words.Add(word);
		}
		words.Sort();
		
		//foreach (string word in words)
		//{
			//Console.WriteLine("{0} = {1}", word, wordTable[word]);
		//}

		Console.WriteLine("IntHolderClass: Counted {0} words ({1} unique) in {2}, delta = {3}", wordCount, words.Count, endTime - startTime, (endTime - startTime) - overhead);
	}
}
