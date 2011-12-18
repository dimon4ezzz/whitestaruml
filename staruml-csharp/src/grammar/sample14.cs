using System;
using System.Collections;

interface IIncrement
{
	void Increment();
}

struct IntHolderStruct: IIncrement
{
	int value;

	public IntHolderStruct(int value)
	{
		this.value = value;
	}
	public int Value
	{
		get
		{
			return(value);
		}
	}

	public void Increment()
	{
		value++;
	}

	public override string ToString()
	{
		return(value.ToString());
	}
}


class WordCountInterface: WordCount
{
	public WordCountInterface(string[] args): base(args)
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
				if (value == null)
				{
					value = new IntHolderStruct(1);
					wordTable[word] = value;
				}
				else
					((IIncrement) value).Increment();
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

		Console.WriteLine("Interface: Counted {0} words ({1} unique) in {2}, delta = {3}", wordCount, words.Count, endTime - startTime, (endTime - startTime) - overhead);
	}
}

