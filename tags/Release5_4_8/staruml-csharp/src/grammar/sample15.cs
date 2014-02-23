/*//////////////////////////////////////////////////////////////////////
     John Robbins - Bugslayer Column - February 2001 MSDN Magazine

<remarks>
<para>
DESCRIPTION :
    The BugslayerWin32 class is a bunch of helper code to take care of
calling Win32 from the CLR.
</para>
</remarks>
//////////////////////////////////////////////////////////////////////*/

// All the usual suspects!
using System ;
using System.Runtime.InteropServices ;

// Start the namespace...
namespace Bugslayer
{

/*//////////////////////////////////////////////////////////////////////
<summary>
The OSVERSIONINFO structure to pass to GetVersionInfoEx
</summary>
//////////////////////////////////////////////////////////////////////*/
[structlayout(LayoutKind.Sequential)]
class OSVERSIONINFO
{
    public int dwOSVersionInfoSize ;
    public int dwMajorVersion ;
    public int dwMinorVersion ;
    public int dwBuildNumber ;
    public int dwPlatformId ;
    [marshal ( UnmanagedType.ByValTStr, Size=128 ) ]
    public String szCSDVersion ;

    // The constructor to get the structure size set.
    public OSVERSIONINFO ( )
    {
        dwOSVersionInfoSize = Marshal.SizeOf ( this ) ;
    }

    // Constants to get at the dwPlatformId field.
    public const int VER_PLATFORM_WIN32s        = 0 ;
    public const int VER_PLATFORM_WIN32_WINDOWS = 1 ;
    public const int VER_PLATFORM_WIN32_NT      = 2 ;
}

/*//////////////////////////////////////////////////////////////////////
<summary>
The USEROBJECTFLAGS structure to pass to GetUserObjectInformation
</summary>
//////////////////////////////////////////////////////////////////////*/
[structlayout(LayoutKind.Sequential)]
class USEROBJECTFLAGS
{
    public bool fInherit ;
    public bool fReserved ;
    public int  dwFlags ;

    public const int WSF_VISIBLE = 1 ;
    public const int DF_ALLOWOTHERACCOUNTHOOK = 1 ;
}


class BugslayerWin32
{

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Fills the OSVERSIONINFO class with the OS stats.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    [sysimport ( dll="kernel32.dll" , name="GetVersionEx") ]
    public static extern
                bool GetVersionEx (
                             [marshal(UnmanagedType.LPStruct)]
                                    OSVERSIONINFO osvi ) ;

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Gets the current window station.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    [sysimport ( dll="user32.dll" ) ]
    public static extern int GetProcessWindowStation ( ) ;

    /*//////////////////////////////////////////////////////////////////
    <summary>
    Gets information about the specified handle into the flags
    structure.
    </summary>
    //////////////////////////////////////////////////////////////////*/
    [sysimport ( dll="user32.dll" , name="GetUserObjectInformation")]
    private static extern
        bool InternalGetUserObjectInformationFlags ( int       hObj    ,
                                                     int       nIndex  ,
                                 [a, out , marshal(UnmanagedType.LPStruct)]
                                               USEROBJECTFLAGS uof     ,
                                                     int       nLength ,
                                 [out , marshal(UnmanagedType.I4)]
                                                     int       nNeeded);
    public const int UOI_FLAGS    = 1 ;
    public const int UOI_NAME     = 2 ;
    public const int UOI_TYPE     = 3 ;
    public const int UOI_USER_SID = 4 ;

    public static bool GetUserObjectInformationFlags ( int         hObj,
                                                    USEROBJECTFLAGS uof)
    {
        int Needed = 0 ;
        return ( InternalGetUserObjectInformationFlags ( hObj      ,
                                                         UOI_FLAGS ,
                                                         uof       ,
                                            Marshal.SizeOf ( uof ) ,
                                                         Needed     ) );

    }
}

// End of the Bugslayer namespace....
}
