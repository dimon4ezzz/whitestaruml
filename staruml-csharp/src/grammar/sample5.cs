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
   public static void Main()
   {
      FileLogger fl = new FileLogger("process.log");
      
      MyClass myClass = new MyClass();

      MyClass.LogHandler lh = new MyClass.LogHandler(fl.Logger);
   
      myClass.Process(lh);
      fl.Close();
   }
}

