using System;
using System.Collections;

class WordCountBoxedInt: WordCount
{
	public WordCountBoxedInt(string[] args): base(args)
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
				object value = wordTable[word];
				int count = 0;
				if (value != null)
					count = (int) value;
				wordTable[word] = count + 1;
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
		{
			//Console.WriteLine("{0} = {1}", word, wordTable[word]);
		}

		Console.WriteLine("BoxedInt: Counted {0} words ({1} unique) in {2}, delta = {3}", wordCount, words.Count, endTime - startTime, (endTime - startTime) - overhead);
	}
}
