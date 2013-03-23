using System;
using System.Runtime.CompilerServices;
using System.Collections;

class DelegateCache
{
   private Hashtable delegateStorage = new Hashtable();
   public Delegate Find(object key)
   {
      return((Delegate) delegateStorage[key]);      
   }
   public void Add(object key, Delegate myDelegate)
   {
      delegateStorage[key] = 
         Delegate.Combine((Delegate) delegateStorage[key], 
                myDelegate);
   }
   public void Remove(object key, Delegate myDelegate)
   {
      delegateStorage[key] = 
         Delegate.Remove((Delegate) delegateStorage[key], 
                myDelegate);
   }
}

public class MyClass
{
   public delegate void LogHandler(string message);

   private DelegateCache delegateCache = new DelegateCache();

   private static object logEventKey = new object(); // unique key
   public event LogHandler Log
   {
      [MethodImpl(MethodImplOptions.Synchronized)]
      add
      {
         delegateCache.Add(logEventKey, value);
      }

      [MethodImpl(MethodImplOptions.Synchronized)]
      remove
      {
         delegateCache.Remove(logEventKey, value);
      }
   }

   protected void OnLog(string message)
   {
      LogHandler lh = (LogHandler) delegateCache.Find(logEventKey);

      if (lh != null)
         lh(message);
   }

   public void Process()
   {
      OnLog("Process() begin");
      // other stuff here…
      OnLog("Process() end");
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
      MyClass myClass = new MyClass();

      myClass.Log += new MyClass.LogHandler(Logger);
      myClass.Log += new MyClass.LogHandler(Logger);

      myClass.Process();
      myClass.Log -= new MyClass.LogHandler(Logger);

      myClass.Process();
   }
}
