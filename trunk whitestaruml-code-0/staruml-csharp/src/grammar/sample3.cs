using System;
using System.Runtime.CompilerServices;

public class MyClass
{
   public delegate void LogHandler(string message);

   private LogHandler log;
   public event LogHandler Log
   {
      [MethodImpl(MethodImplOptions.Synchronized)]
      add
      {
         log = (LogHandler) Delegate.Combine(log, value);         
      }

      [MethodImpl(MethodImplOptions.Synchronized)]
      remove
      {
         log = (LogHandler) Delegate.Remove(log, value);
      }
   }
   protected void OnLog(string message)
   {
      if (log != null)
         log(message);
   }
}

