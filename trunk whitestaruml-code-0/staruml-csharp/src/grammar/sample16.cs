/*//////////////////////////////////////////////////////////////////////
     John Robbins - Bugslayer Column - February 2001 MSDN Magazine

<remarks>
<para>
DESCRIPTION :
    The BugslayerTraceSwitch class extends the System.Diagnostics
TraceSwitch class to allow you to set switch value from a file.  The
file settings override any registry and environment variable settings.
    The constructor takes the name of a file which contains your
settings  The file format is as follows:
<code>
; Lines that start with a semicolon are comments
[DisplayName]=[value]
; Here's an example:
HappyAppyClassSwitch=2

; Value settings:
; 0 = Off
; 1 = Errors
; 2 = Warnings
; 3 = Info
; 4 = Verbose.

</code>
</para>
</remarks>
//////////////////////////////////////////////////////////////////////*/

// All the usual suspects!
using System ;
using System.Diagnostics ;
using System.IO ;

// Start the namespace...
namespace Bugslayer
{

public class BugslayerTraceSwitch : TraceSwitch
{
    private const String OuttaRange = "Item is out of range: " ;

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Constructs the class.
    <param name="inputFile">The file to read settings from.
    The complete file and path must be passed in order to find the
    file.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    public BugslayerTraceSwitch ( String displayName ,
                                  String description ,
                                  String inputFile    )
                        : base ( displayName , description )
    {
        // I eat all exceptions to make life simpler for users.
        try
        {

            // If the file is null, this just becomes a TraceSwitch
            // class.
            if ( null != inputFile )
            {
                StreamReader inStream = File.OpenText ( inputFile ) ;
                String str ;

                while ( null != ( str = inStream.ReadLine ( ) ) )
                {
                    try
                    {
                        // Lop off any extra spaces.
                        str.Trim ( ) ;

                        // Only work on non-empty strnigs.  Also,
                        // semicolon's are treated as comments.
                        if ( ( str.Length > 0 )  && ( ';' != str[ 0 ] ))
                        {
                            int equalSpot = str.IndexOf ( '=' ) ;
                            if ( -1 != equalSpot )
                            {
                                String strItem = str.Substring ( 0 ,
                                                             equalSpot);
                                String strVal =
                                        str.Substring ( equalSpot + 1 );

                                strItem.Trim ( ) ;
                                strVal.Trim ( ) ;

                                if ( strItem == displayName )
                                {
                                    int iVal = strVal.ToInt32 ( ) ;
                                    if ( ( iVal < 0 ) || ( iVal > 4 ) )
                                    {
                                        Debug.Write ( OuttaRange ) ;
                                        Debug.WriteLine ( str ) ;
                                    }
                                    else
                                    {
                                        SetSwitchSetting ( iVal ) ;
                                        return ;
                                    }
                                }
                            }
                        }
                    }
                    catch ( Exception )
                    {
                    }
                }

            }
        }
        catch ( Exception )
        {
        }
    }

}

// End Bugslayer the namespace...
}


