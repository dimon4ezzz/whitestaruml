Unit        : verslab.pas
Description : A TCustomLabel derivative that displays Win32 VersionInfo data
Version     : 1.10, 11 March 2000
Status      : Freeware.
Copyright   : ©2000, First Internet Software House
Contact     : First Internet Software House - support@fishouse.com

-------------------
Simple Use
-------------------

Place on form. Set VersionResource property for required version information.
Run application.

See the description of the "Filename" property if you are using packages or
other DLLs.

-------------------
Events:
-------------------

No events defined

-------------------
Properties:
-------------------

property VersionResource: TVersionResources;
    This propery can set to display any one of 10 standard version info
    strings.
    TVersionResources = (vrCompanyName, vrFileDescription, vrFileVersion,
                         vrInternalName, vrLegalCopyright, vrOriginalFilename,
                         vrProductName, vrProductVersion, vrComments, vrFlags,
                         vrShortFileVersion, vrDateTime, vrFileSize);

    If vrFlags is selected the VersionResourceKey property is ignored and the
    label displays the contents of the 'private build, special build' etc
    checkboxes in the D3 project options VersionInfo tab.

    vrShortVersion displays a concatentation of the Major and Minor version
    numbers.

    vrDateTime and vrFileSize display the date/time stamp and file size
    respectively. See the FormatDateTime and FormatFileSize proprties for
    further info.

property VersionResourceKey: string;
    Set this to the name of the key that is to be returned with the
    GetFileVersionInfo call. If one of the 10 standard resource types are
    used this value is set automatically. If you insert a new (non-standard)
    key into the version resource table then set this property to the name
    of the key.

property InfoPrefix: String;
    Sets the text that is displayed in the label before the version
    information string.

property InfoString: string;
    Read only version of the current caption. Available so you can
    programatically access the version info. Publishing caption makes it
    read/write which is not desirable.

property ShowInfoPrefix: boolean;
    If set, the InfoPrefix text will be prepended to the version information
    displayed. If false, only the version information will be displayed.

property LangCharSet: string;
    The API help says (and I quote):
    'Specifies a value in a language-specific structure. The lang-charset
    name is a concatenation of a language and character-set identifier pair
    found in the translation table for the resource. The lang-charset name
    must be specified as a hexadecimal string.'

    This defaults to -1, which means that the component will try to
    figure it out at run time. If you get errors, mail me but try the following
    guidelines as well:

    The first 4 digits of this string are the language code, defaulting to
    0809 for UK English. 0409 is US English, look up VerLanguageName for
    the others. The last 4 digits represent a code page and for most
    environments they should not be changed from the default of 04E4.

property Filename: string;
    The name of the file to query for version info. If '' (default) then
    the current filename is used. If the versionlabel is on a form in a
    DLL, the "current filename" in this context is the name of the DLL. Thus
    the displayed version info is that of the DLL rather than the application.
    This is intentional as it quite likely to require version info on
    modules of an application. However it does mean that if the application is
    compiled with packages the default behaviour is to display version info
    from the package in which the TVersionLabel component resides. To overcome
    this, set the Filename property to "Application.Exename" somewhere in the
    main applicaton before displaying the form containing the version
    information.

property DateTimeFormat: String;
    This is a delphi date/time format string that controls the display of the
    file date and time when vrFileDateTime is the chosen version resource. It
    defaults to the delphi "ShortDate" setting
   
property FileSizeFormat: String;
    This is a delphi format string passed to the "FormatFloat" function. It
    controls the display of the file size if vrFileSize is the chosen version
    resource. It defaults to '#,#0" Bytes"'