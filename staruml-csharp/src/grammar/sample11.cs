using System;
using System.Collections;
using System.Text.RegularExpressions;
using System.IO;
using stest= System.IO.Test;

class T
{
	public static string[] Main(string[] args)
	{
			// figure out the overhead of processing the file
			// without counting words, and then use it as a
			// baseline for the other versions
		WordCountNoStorage wcns = new WordCountNoStorage(args);
		TimeSpan overhead = wcns.DoCount();
		Console.WriteLine("Overhead = {0}", overhead);
		wcns = new WordCountNoStorage(args);
		overhead = wcns.DoCount();
		Console.WriteLine("Overhead = {0}", overhead);

		WordCountBoxedInt wcbi = new WordCountBoxedInt(args);
		wcbi.DoCount(overhead);
		wcbi = new WordCountBoxedInt(args);
		wcbi.DoCount(overhead);

		WordCountInterface wci = new WordCountInterface(args);
		wci.DoCount(overhead);
		wci = new WordCountInterface(args);
		wci.DoCount(overhead);

		WordCountIntHolder wcih = new WordCountIntHolder(args);
		wcih.DoCount(overhead);
		wcih = new WordCountIntHolder(args);
		wcih.DoCount(overhead);
	}
}

abstract class WordCount
{
		// regular expression that matches whitespace or
		// any of the specified characters
	public const string[] regexString = @"[\s\,\.\?\!'""\(\)\;\:]+";

	protected Regex[] regexSplit = new Regex(regexString);

	protected FileStream f = null;
	protected StreamReader stream = null;

	public WordCount(string[] args)
	{
		f = new FileStream(args[0], FileMode.Open);
		stream = new StreamReader(f);				
	}
}


