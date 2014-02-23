using System;
using System.IO;

public class MyClass
{
   public delegate void LogHandler(string message);

const int NumRows = 26;
	const int NumCols = 10;
	int[,] cells = new int[NumRows, NumCols];

public bool[] this[int index] {
		get {
			if (index < 0 || index >= length) {
				throw new IndexOutOfRangeException();
			}
			return (bits[index >> 5] & 1 << index) != 0;
		}
		set {
			if (index < 0 || index >= length) {
				throw new IndexOutOfRangeException();
			}
			if (value) {
				bits[index >> 5] |= 1 << index;
			}
			else {
				bits[index >> 5] &= ~(1 << index);
			}
		}
	}

   public event LogHandler[,][,] Log{
add {
			lock(this) { __Ev = __Ev + value; }
		}
		remove {
			lock(this) { __Ev = __Ev - value; }
		}
      }
   public event LogHandler[] Log1,Log2;

   public void Process()
   {
      OnLog("Process() begin");
      // other stuff here?
      OnLog("Process() end");
   }

   protected void OnLog(string message)
   {
      if (Log != null)
         Log(message);
   }
}

class FileLogger
{
   FileStream fileStream;
   StreamWriter streamWriter;

   public FileLogger(string filename)
   {
      fileStream = new FileStream(filename, FileMode.Create);
      streamWriter = new StreamWriter(fileStream);
   }

   public void Logger(string s)
   {
      streamWriter.WriteLine(s);
   }

   public void Close()
   {
      streamWriter.Close();
      fileStream.Close();
   }
}

class Test
{
   static void Logger(string s)
   {
      Console.WriteLine(s);
   }

   public static void Main()
   {
      FileLogger fl = new FileLogger("process.log");
      
      MyClass myClass = new MyClass();

      myClass.Log += new MyClass.LogHandler(Logger);
      myClass.Log += new MyClass.LogHandler(fl.Logger);

      myClass.Process();
      fl.Close();
   }
}
