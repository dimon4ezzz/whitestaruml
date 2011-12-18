/*//////////////////////////////////////////////////////////////////////
Include the usual necessary classes.
//////////////////////////////////////////////////////////////////////*/
// The usual suspects.
using System ;
// Needed for the TraceListener class.
using System.Diagnostics ;
// Needed for the MessageBox class.
using System.WinForms ;
// Needed for the StringBuilder class.
using System.Text ;
// Needed for the TextWriter class.
using System.IO ;
// Needed to look up all the managed code info...
using System.Reflection ;

// Everything falls within the Bugslayer namespace.
namespace Bugslayer
{

public class BugslayerTraceListener : TraceListener
{
    // The PDC release of .NET indicates there are resource files in
    // which you can place items that need internationalization.
    // Unfortunately, all the sections are marked at [TBD] in the
    // documentation.  For now, I will just make them constants.
    const String MsgBoxTitle = "Assertion Failed! Abort=Quit, Retry=Debug, Ignore=Continue" ;
    const String AssertionMsg = "ASSERTION FAILURE!\r\n" ;

    // The boolean flags which indicate where output should go.

    /*//////////////////////////////////////////////////////////////////
    <value>
    Show trace statements in any attached debuggers.  This is true by
    default.
    </value>
    //////////////////////////////////////////////////////////////////*/
    private bool m_ShowDebugLog = true ;
    public bool ShowDebugLog
    {
        get
        {
            return ( m_ShowDebugLog ) ;
        }
        set
        {
            m_ShowDebugLog = value ;
            if ( true == ShowDebugLog )
            {
                TurnAllOff = false ;
            }
        }
    }

    /*//////////////////////////////////////////////////////////////////
    <value>
    Show trace statements through the operating system
    OutputDebugString call.  This is true by default for backwards
    compatibility, bug if you are using this class in productions, you
    will want to turn this off until absolutely needed.
    </value>
    //////////////////////////////////////////////////////////////////*/
    private bool m_ShowOutputDebugString = true ;
    public bool ShowOutputDebugString
    {
        get
        {
            return ( m_ShowOutputDebugString ) ;
        }
        set
        {
            m_ShowOutputDebugString = value ;
            if ( true == ShowOutputDebugString )
            {
                TurnAllOff = false ;
            }
        }
    }

    /*//////////////////////////////////////////////////////////////////
    <value>
    Show assertions in message boxes.  This is on by default.  Also note
    that all output will also be directed based on the
    ShowOutputDebugString and ShowDebugLog properties.
    </value>
    //////////////////////////////////////////////////////////////////*/
    private bool m_ShowMessageBoxAssertions = true ;
    public bool ShowMessageBoxAssertions
    {
        get
        {
            return ( m_ShowMessageBoxAssertions ) ;
        }
        set
        {
            m_ShowMessageBoxAssertions = value ;
            if ( true == ShowMessageBoxAssertions )
            {
                TurnAllOff = false ;
            }
        }
    }

    /*//////////////////////////////////////////////////////////////////
    <value>
    Turns off all processing in this object.  Calling the Close method
    does the same thing.
    </value>
    //////////////////////////////////////////////////////////////////*/
    private bool m_TurnAllOff = false ;
    public bool TurnAllOff
    {
        get
        {
            return ( m_TurnAllOff ) ;
        }
        set
        {
            if ( null != Writer )
            {
                Writer.Close ( ) ;
            }
            m_TurnAllOff = value ;
        }
    }



    /*//////////////////////////////////////////////////////////////////
    <value>
    Show trraces in the event log.  This is off by default.  You must
    set the <seealso cref="EventSource"/> name before traces will be
    sent to the event log.
    </value>
    //////////////////////////////////////////////////////////////////*/
    private bool m_ShowEventLogTraces = true ;
    public bool ShowEventLogTraces
    {
        get
        {
            return ( m_ShowEventLogTraces ) ;
        }
        set
        {
            m_ShowEventLogTraces = value ;
            if ( true == m_ShowEventLogTraces )
            {
                TurnAllOff = false ;
            }

        }
    }

    /*//////////////////////////////////////////////////////////////////
    <value>
    Sets the name of the event source.  Setting this name will allow
    assertions to be written to the event log.  You can set
    <seealso cref="ShowEventLogTraces"/> so that trace statements go
    to the event log as well.
    </value>
    //////////////////////////////////////////////////////////////////*/
    private String m_EventSource ;
    public String EventSource
    {
        get
        {
            return ( m_EventSource ) ;
        }
        set
        {
            // If I've already got an event trace open, it doesn't
            // matter.  The magic of garbage collection at work!
            m_EventSource = value ;

            // If the new setting is null, kill the existing log.
            if ( null == m_EventSource )
            {
                if ( null != m_EventLogTrace )
                {
                    m_EventLogTrace = null ;
                    ShowEventLogTraces = false ;
                }
            }
            // Open the event log and create the event log tracer.
            else if ( false == EventLog.SourceExists ( m_EventSource ) )
            {
                EventLog.CreateEventSource ( m_EventSource ,
                                             m_EventSource  ) ;
                m_EventLogTrace =
                           new EventLogTraceListener ( m_EventSource ) ;
            }
        }
    }
    /*//////////////////////////////////////////////////////////////////
    <value>
    The internal EventLogTraceListener I keep around to do the event
    log writing.
    </value>
    //////////////////////////////////////////////////////////////////*/
    private EventLogTraceListener m_EventLogTrace = null ;

    /*//////////////////////////////////////////////////////////////////
    <value>
    The TextStream for file/pipe/whatever logging.  Setting this
    property will direct tracing and assertions to the file.  Keep in
    mind that you might want to ensure that this writer is synchronized
    because this one is used across all threads.  Additionally, you will
    need to reopen/reinitialize this class if you call the
    <seealso cref="Close"/> method or set
    <paramref TurnAllOff="TurnAllOff"/> to true.
    </value>
    //////////////////////////////////////////////////////////////////*/
    private TextWriter m_Writer = null ;
    public TextWriter Writer
    {
        get
        {
            return ( m_Writer ) ;
        }
        set
        {
            m_Writer = value ;
        }
    }

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Tells me if I'm running as an interactive user.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    private bool m_IsInteractive = true ;

    /*//////////////////////////////////////////////////////////////////
    <summary>
    The standard constructor.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    public BugslayerTraceListener ( )
    {
        // Gotta figure out which platform I'm running on so I can
        // properly determine if the process is running interactively
        // or not.
        m_IsInteractive = IsInteractiveUser ( ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Closes the
    Closes the <paramref TextWriter="TextWriter"/> stream so that it
    no longer recieves tracing and disables all other logging across the
    board.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    public override void Close ( )
    {
        TurnAllOff = true ;
    }

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Depending on the flags, outputs failed items with callstacks and
    such.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    public override void Fail ( String Message )
    {
        // Am I supposed to do anything at all?
        if ( true == TurnAllOff )
        {
            return ;
        }
        Fail ( Message , null ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Depending on the flags, outputs failed items with callstacks and
    such.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    public override void Fail ( String Message , String DetailMessage )
    {
        // Am I supposed to do anything at all?
        if ( true == TurnAllOff )
        {
            return ;
        }
        // Put the string together.
        StringBuilder StrBuild = new StringBuilder ( ) ;

        StrBuild.Append ( AssertionMsg ) ;
        StrBuild.Append ( Message ) ;
        StrBuild.Append ( "\r\n" ) ;
        if ( null != DetailMessage )
        {
            StrBuild.Append ( DetailMessage ) ;
            StrBuild.Append ( "\r\n" ) ;
        }

        // Stick on the stack trace.
        StackTrace StkTrace = new StackTrace ( true ) ;

        for ( int i = 1 ; i < StkTrace.FrameCount ; i++ )
        {
            StackFrame StkFrame = StkTrace.GetFrame ( i ) ;

            String FrameString = FrameToString ( StkFrame ) ;
            if ( null != FrameString )
            {
                StrBuild.Append ( FrameString ) ;
                StrBuild.Append ( "\r\n" ) ;
            }
        }

        // Plop the output to where it's supposed to go
        DoTheOutput ( StrBuild.ToString ( ) , true ) ;

        if ( ( true == ShowMessageBoxAssertions ) &&
             ( true == m_IsInteractive          )    )
        {
            PopTheMessageBox ( StrBuild.ToString ( ) ) ;
        }

    }


    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    new public virtual void Write ( Object Obj , String Message )
    {
        StringBuilder Str = new StringBuilder ( Message ) ;
        Str.Append ( ": " ) ;
        Str.Append ( Obj.GetType().ToString ( ) ) ;
        DoTheOutput ( Str.ToString ( ) , false ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    new public virtual void Write ( String Message , String Category )
    {
        StringBuilder Str = new StringBuilder ( Category ) ;
        Str.Append ( ": " ) ;
        Str.Append ( Message ) ;
        DoTheOutput ( Str.ToString ( ) , false ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    public override void Write ( String Message )
    {
        DoTheOutput ( Message , false ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    new public virtual void Write ( Object Obj )
    {
        DoTheOutput ( Obj.GetType().ToString ( ) , false ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    new public virtual void WriteLine ( String Message  ,
                                        String Category  )
    {
        StringBuilder Str = new StringBuilder ( Category ) ;
        Str.Append ( ": " ) ;
        Str.Append ( Message ) ;
        DoTheOutput ( Str.ToString ( ) , true ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    new public virtual void WriteLine ( Object Obj , String Message )
    {
        StringBuilder Str = new StringBuilder ( Message ) ;
        Str.Append ( ": " ) ;
        Str.Append ( Obj.GetType().ToString ( ) ) ;
        DoTheOutput ( Str.ToString ( ) , true ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    public override void WriteLine ( String Message )
    {
        DoTheOutput ( Message , true ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    new public virtual void WriteLine ( Object Obj )
    {
        DoTheOutput ( Obj.GetType().ToString ( ) , true ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    private void DoTheOutput ( String Message , bool DoCRLF )
    {
        if ( false == TurnAllOff )
        {
            if ( ( true == ShowDebugLog           ) &&
                 ( true == Debugger.IsLogging ( ) )    )
            {
                Debugger.Log ( 0 , null , Message ) ;
                if ( true == DoCRLF )
                {
                    Debugger.Log ( 0 , null , "\r\n" ) ;
                }
            }
            if ( true == ShowOutputDebugString )
            {
                OutputDebugStringA ( Message ) ;
                if ( true == DoCRLF )
                {
                    OutputDebugStringA ( "\r\n" ) ;
                }
            }
            if ( ( true == ShowEventLogTraces ) &&
                 ( null != m_EventLogTrace    )    )
            {
                m_EventLogTrace.WriteLine ( Message ) ;
            }
            if ( null != Writer )
            {
                if ( false == DoCRLF )
                {
                    Writer.Write ( Message ) ;
                }
                else
                {
                    Writer.WriteLine ( Message ) ;
                }
            }
        }
    }

    /*//////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////*/
    [conditional ( "DEBUG" )]
    private void PopTheMessageBox ( String Message )
    {
        // Do the message box!
        DialogResult DlgRes =
                      MessageBox.Show ( Message                     ,
                                        MsgBoxTitle                 ,
                                        MessageBox.AbortRetryIgnore  ) ;
        switch ( DlgRes )
        {
            case DialogResult.Abort  :
                {
                    // Whack the current process!
                    Process Proc = Process.GetCurrentProcess ( ) ;
                    Proc.Kill ( ) ;
                }
                break ;
            case DialogResult.Retry :
                {
                    if ( true == Debugger.IsAttached )
                    {
                        Debugger.Break ( ) ;
                    }
                    else
                    {
                        // No debugger is attached, launch it!
                        Debugger.Launch ( ) ;
                    }
                }
                break ;
            default     :
                break ;
        }
    }

    /*//////////////////////////////////////////////////////////////////
    <summary>
    A private function to convert a single stack frame into something
    readable.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    private String FrameToString ( StackFrame StkFrm )
    {
        // Allocate our string builder.
        StringBuilder Str = new StringBuilder ( ) ;

        // Get the method from all the cool reflection stuff.
        MethodBase Meth = StkFrm.GetMethod ( ) ;

        // If nothing is returned, get out now.
        if ( null == Meth )
        {
            return ( null ) ;
        }

        // This is to help get the stack lined up to the user's
        // source code.  Right now, this is obviously hardcoded.  In
        // the future, I want to fix this up to be a little more
        // dynamic.
        String StrMethName = Meth.ReflectedType.Name ;
        if ( ( "BugslayerTraceListener" == StrMethName ) ||
             ( "TraceInternal"          == StrMethName ) ||
             ( "Debug"                  == StrMethName ) ||
             ( "Trace"                  == StrMethName )   )
        {
            return ( null ) ;
        }

        // Get the class type and name on there.
        Str.Append ( StrMethName ) ;
        Str.Append ( "." ) ;
        Str.Append ( Meth.Name ) ;
        Str.Append ( "(" ) ;

        // Slap the parameters on, including all param names.
        ParameterInfo[] Params = Meth.GetParameters ( ) ;
        for ( int i = 0 ; i < Params.Length ; i++ )
        {
            ParameterInfo CurrParam = Params[ i ] ;
            Str.Append ( CurrParam.ParameterType.Name ) ;
            Str.Append ( " " ) ;
            Str.Append ( CurrParam.Name ) ;
            if ( i != ( Params.Length - 1 ) )
            {
                Str.Append ( ", " ) ;
            }
        }

        Str.Append ( ")\r\n\t " ) ;

        // Get the file and line of the problem on here.
        Str.Append ( StkFrm.GetFileName ( ) ) ;
        Str.Append ( "(" ) ;
        Str.Append ( StkFrm.GetFileLineNumber ( ).ToString ( ) ) ;
        Str.Append ( ")" ) ;

        return ( Str.ToString ( ) ) ;
    }

    [sysimport(dll="kernel32.dll")]
    private static extern void OutputDebugStringA ( String s ) ;

    private bool IsInteractiveUser ( )
    {
        bool RetVal = true ;

        OSVERSIONINFO osvi = new OSVERSIONINFO ( ) ;
        BugslayerWin32.GetVersionEx ( osvi ) ;

        // If it's not NT, it's one of those "other" OSes which is
        // always interactive.
        if ( OSVERSIONINFO.VER_PLATFORM_WIN32_NT == osvi.dwPlatformId )
        {
            // Get the windows station this process is spinning on.
            int hStation = BugslayerWin32.GetProcessWindowStation ( ) ;
            if ( 0 != hStation )
            {
                USEROBJECTFLAGS uof = new USEROBJECTFLAGS ( ) ;
                if ( true ==
                            BugslayerWin32.GetUserObjectInformationFlags ( hStation ,
                                                             uof      ))
                {
                    return ( USEROBJECTFLAGS.WSF_VISIBLE ==
                           (USEROBJECTFLAGS.WSF_VISIBLE & uof.dwFlags));
                }
                else
                {
                    // Assume the worst.
                    RetVal = false ;
                }
            }
            else
            {
                // Some kind of serious error so play it safe....
                RetVal = false ;
            }
        }
        return ( RetVal ) ;
    }

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Since this class can write to the event log, this method provides
    a safe way to delete those extra keys.  Additionally, it protects
    against trying to delete very important things such as the
    Application and Security keys!
    </summary>
    //////////////////////////////////////////////////////////////////*/
    public static void SafeEventLogDelete ( String LogToDelete )
    {
        if ( null == LogToDelete )
        {
            throw new ArgumentNullException ( "LogToDelete" ) ;
        }

        // Make sure the user's not going to delete something scary!
        if ( ( "Application Log"          != LogToDelete ) ||
             ( "Security Log"             != LogToDelete ) ||
             ( "Directory Service"        != LogToDelete ) ||
             ( "DNS Service"              != LogToDelete ) ||
             ( "File Replication Service" != LogToDelete )   )
        {
            // Do the dirty deed!
            EventLog.Delete ( LogToDelete ) ;
        }
    }


}

// End of the Bugslayer namespace
}

