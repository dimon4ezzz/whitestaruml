#pragma once
#pragma pack(push,8)
extern "C" {
typedef unsigned int size_t;
typedef unsigned short wchar_t;
typedef wchar_t wint_t;
typedef wchar_t wctype_t;
typedef char *  va_list;
struct _iobuf {
        char *_ptr;
        int   _cnt;
        char *_base;
        int   _flag;
        int   _file;
        int   _charbuf;
        int   _bufsiz;
        char *_tmpfname;
        };
typedef struct _iobuf FILE;
extern FILE _iob[];
typedef __int64 fpos_t;
int __cdecl _filbuf(FILE *);
 int __cdecl _flsbuf(int, FILE *);
 FILE * __cdecl _fsopen(const char *, const char *, int);
 void __cdecl clearerr(FILE *);
 int __cdecl fclose(FILE *);
 int __cdecl _fcloseall(void);

 FILE * __cdecl _fdopen(int, const char *);
 int __cdecl feof(FILE *);
 int __cdecl ferror(FILE *);
 int __cdecl fflush(FILE *);
 int __cdecl fgetc(FILE *);
 int __cdecl _fgetchar(void);
 int __cdecl fgetpos(FILE *, fpos_t *);
 char * __cdecl fgets(char *, int, FILE *);
 int __cdecl _fileno(FILE *);

 int __cdecl _flushall(void);
 FILE * __cdecl fopen(const char *, const char *);
 int __cdecl fprintf(FILE *, const char *, ...);
 int __cdecl fputc(int, FILE *);
 int __cdecl _fputchar(int);
 int __cdecl fputs(const char *, FILE *);
 size_t __cdecl fread(void *, size_t, size_t, FILE *);
 FILE * __cdecl freopen(const char *, const char *, FILE *);
 int __cdecl fscanf(FILE *, const char *, ...);
 int __cdecl fsetpos(FILE *, const fpos_t *);
 int __cdecl fseek(FILE *, long, int);
 long __cdecl ftell(FILE *);
 size_t __cdecl fwrite(const void *, size_t, size_t, FILE *);
 int __cdecl getc(FILE *);
 int __cdecl getchar(void);
 int __cdecl _getmaxstdio(void);
 char * __cdecl gets(char *);
 int __cdecl _getw(FILE *);
 void __cdecl perror(const char *);
 int __cdecl _pclose(FILE *);
 FILE * __cdecl _popen(const char *, const char *);
 int __cdecl printf(const char *, ...);
 int __cdecl putc(int, FILE *);
 int __cdecl putchar(int);
 int __cdecl puts(const char *);
 int __cdecl _putw(int, FILE *);
 int __cdecl remove(const char *);
 int __cdecl rename(const char *, const char *);
 void __cdecl rewind(FILE *);
 int __cdecl _rmtmp(void);
 int __cdecl scanf(const char *, ...);
 void __cdecl setbuf(FILE *, char *);
 int __cdecl _setmaxstdio(int);
 int __cdecl setvbuf(FILE *, char *, int, size_t);
 int __cdecl _snprintf(char *, size_t, const char *, ...);
 int __cdecl sprintf(char *, const char *, ...);
 int __cdecl sscanf(const char *, const char *, ...);
 char * __cdecl _tempnam(const char *, const char *);
 FILE * __cdecl tmpfile(void);
 char * __cdecl tmpnam(char *);
 int __cdecl ungetc(int, FILE *);
 int __cdecl _unlink(const char *);
 int __cdecl vfprintf(FILE *, const char *, va_list);
 int __cdecl vprintf(const char *, va_list);
 int __cdecl _vsnprintf(char *, size_t, const char *, va_list);
 int __cdecl vsprintf(char *, const char *, va_list);

 FILE * __cdecl _wfsopen(const wchar_t *, const wchar_t *, int);


 wint_t __cdecl fgetwc(FILE *);
 wint_t __cdecl _fgetwchar(void);
 wint_t __cdecl fputwc(wint_t, FILE *);
 wint_t __cdecl _fputwchar(wint_t);
 wint_t __cdecl getwc(FILE *);
 wint_t __cdecl getwchar(void);
 wint_t __cdecl putwc(wint_t, FILE *);
 wint_t __cdecl putwchar(wint_t);
 wint_t __cdecl ungetwc(wint_t, FILE *);

 wchar_t * __cdecl fgetws(wchar_t *, int, FILE *);
 int __cdecl fputws(const wchar_t *, FILE *);
 wchar_t * __cdecl _getws(wchar_t *);
 int __cdecl _putws(const wchar_t *);

 int __cdecl fwprintf(FILE *, const wchar_t *, ...);
 int __cdecl wprintf(const wchar_t *, ...);
 int __cdecl _snwprintf(wchar_t *, size_t, const wchar_t *, ...);
 int __cdecl swprintf(wchar_t *, const wchar_t *, ...);
 int __cdecl vfwprintf(FILE *, const wchar_t *, va_list);
 int __cdecl vwprintf(const wchar_t *, va_list);
 int __cdecl _vsnwprintf(wchar_t *, size_t, const wchar_t *, va_list);
 int __cdecl vswprintf(wchar_t *, const wchar_t *, va_list);
 int __cdecl fwscanf(FILE *, const wchar_t *, ...);
 int __cdecl swscanf(const wchar_t *, const wchar_t *, ...);
 int __cdecl wscanf(const wchar_t *, ...);

 FILE * __cdecl _wfdopen(int, const wchar_t *);
 FILE * __cdecl _wfopen(const wchar_t *, const wchar_t *);
 FILE * __cdecl _wfreopen(const wchar_t *, const wchar_t *, FILE *);
 void __cdecl _wperror(const wchar_t *);
 FILE * __cdecl _wpopen(const wchar_t *, const wchar_t *);
 int __cdecl _wremove(const wchar_t *);
 wchar_t * __cdecl _wtempnam(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl _wtmpnam(wchar_t *);

 int __cdecl fcloseall(void);
 FILE * __cdecl fdopen(int, const char *);
 int __cdecl fgetchar(void);
 int __cdecl fileno(FILE *);
 int __cdecl flushall(void);
 int __cdecl fputchar(int);
 int __cdecl getw(FILE *);
 int __cdecl putw(int, FILE *);
 int __cdecl rmtmp(void);
 char * __cdecl tempnam(const char *, const char *);
 int __cdecl unlink(const char *);

}

#pragma pack(pop)
#pragma once
extern "C" {
        void *  __cdecl memcpy(void *, const void *, size_t);
        int     __cdecl memcmp(const void *, const void *, size_t);
        void *  __cdecl memset(void *, int, size_t);
        char *  __cdecl _strset(char *, int);
        char *  __cdecl strcpy(char *, const char *);
        char *  __cdecl strcat(char *, const char *);
        int     __cdecl strcmp(const char *, const char *);
        size_t  __cdecl strlen(const char *);

 void *  __cdecl _memccpy(void *, const void *, int, unsigned int);
 void *  __cdecl memchr(const void *, int, size_t);
 int     __cdecl _memicmp(const void *, const void *, unsigned int);

 void *  __cdecl memmove(void *, const void *, size_t);

 char *  __cdecl strchr(const char *, int);
 int     __cdecl _strcmpi(const char *, const char *);
 int     __cdecl _stricmp(const char *, const char *);
 int     __cdecl strcoll(const char *, const char *);
 int     __cdecl _stricoll(const char *, const char *);
 int     __cdecl _strncoll(const char *, const char *, size_t);
 int     __cdecl _strnicoll(const char *, const char *, size_t);
 size_t  __cdecl strcspn(const char *, const char *);
 char *  __cdecl _strdup(const char *);
 char *  __cdecl _strerror(const char *);
 char *  __cdecl strerror(int);
 char *  __cdecl _strlwr(char *);
 char *  __cdecl strncat(char *, const char *, size_t);
 int     __cdecl strncmp(const char *, const char *, size_t);
 int     __cdecl _strnicmp(const char *, const char *, size_t);
 char *  __cdecl strncpy(char *, const char *, size_t);
 char *  __cdecl _strnset(char *, int, size_t);
 char *  __cdecl strpbrk(const char *, const char *);
 char *  __cdecl strrchr(const char *, int);
 char *  __cdecl _strrev(char *);
 size_t  __cdecl strspn(const char *, const char *);
 char *  __cdecl strstr(const char *, const char *);
 char *  __cdecl strtok(char *, const char *);
 char *  __cdecl _strupr(char *);
 size_t  __cdecl strxfrm (char *, const char *, size_t);

 void * __cdecl memccpy(void *, const void *, int, unsigned int);
 int __cdecl memicmp(const void *, const void *, unsigned int);
 int __cdecl strcmpi(const char *, const char *);
 int __cdecl stricmp(const char *, const char *);
 char * __cdecl strdup(const char *);
 char * __cdecl strlwr(char *);
 int __cdecl strnicmp(const char *, const char *, size_t);
 char * __cdecl strnset(char *, int, size_t);
 char * __cdecl strrev(char *);
        char * __cdecl strset(char *, int);
 char * __cdecl strupr(char *);
 wchar_t * __cdecl wcscat(wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcschr(const wchar_t *, wchar_t);
 int __cdecl wcscmp(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcscpy(wchar_t *, const wchar_t *);
 size_t __cdecl wcscspn(const wchar_t *, const wchar_t *);
 size_t __cdecl wcslen(const wchar_t *);
 wchar_t * __cdecl wcsncat(wchar_t *, const wchar_t *, size_t);
 int __cdecl wcsncmp(const wchar_t *, const wchar_t *, size_t);
 wchar_t * __cdecl wcsncpy(wchar_t *, const wchar_t *, size_t);
 wchar_t * __cdecl wcspbrk(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcsrchr(const wchar_t *, wchar_t);
 size_t __cdecl wcsspn(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcsstr(const wchar_t *, const wchar_t *);
 wchar_t * __cdecl wcstok(wchar_t *, const wchar_t *);

 wchar_t * __cdecl _wcsdup(const wchar_t *);
 int __cdecl _wcsicmp(const wchar_t *, const wchar_t *);
 int __cdecl _wcsnicmp(const wchar_t *, const wchar_t *, size_t);
 wchar_t * __cdecl _wcsnset(wchar_t *, wchar_t, size_t);
 wchar_t * __cdecl _wcsrev(wchar_t *);
 wchar_t * __cdecl _wcsset(wchar_t *, wchar_t);

 wchar_t * __cdecl _wcslwr(wchar_t *);
 wchar_t * __cdecl _wcsupr(wchar_t *);
 size_t __cdecl wcsxfrm(wchar_t *, const wchar_t *, size_t);
 int __cdecl wcscoll(const wchar_t *, const wchar_t *);
 int __cdecl _wcsicoll(const wchar_t *, const wchar_t *);
 int __cdecl _wcsncoll(const wchar_t *, const wchar_t *, size_t);
 int __cdecl _wcsnicoll(const wchar_t *, const wchar_t *, size_t);

 wchar_t * __cdecl wcsdup(const wchar_t *);
 int __cdecl wcsicmp(const wchar_t *, const wchar_t *);
 int __cdecl wcsnicmp(const wchar_t *, const wchar_t *, size_t);
 wchar_t * __cdecl wcsnset(wchar_t *, wchar_t, size_t);
 wchar_t * __cdecl wcsrev(wchar_t *);
 wchar_t * __cdecl wcsset(wchar_t *, wchar_t);
 wchar_t * __cdecl wcslwr(wchar_t *);
 wchar_t * __cdecl wcsupr(wchar_t *);
 int __cdecl wcsicoll(const wchar_t *, const wchar_t *);

}

#pragma once
#pragma pack(push,8)
extern "C" {

typedef int (__cdecl * _onexit_t)(void);

typedef struct _div_t {
        int quot;
        int rem;
} div_t;

typedef struct _ldiv_t {
        long quot;
        long rem;
} ldiv_t;


 extern int __mb_cur_max;


 extern int errno;               
 extern unsigned long _doserrno; 
 extern char * _sys_errlist[];   
 extern int _sys_nerr;   
 extern int __argc;          
 extern char ** __argv;      

 extern wchar_t ** __wargv;  





 extern char **    _environ; 

 extern wchar_t ** _wenviron;    



 extern int _fmode;          
 extern int _fileinfo;       

 extern char * _pgmptr;      

 extern wchar_t * _wpgmptr;  




 extern unsigned int _osver;
 extern unsigned int _winver;
 extern unsigned int _winmajor;
 extern unsigned int _winminor;






 void   __cdecl abort(void);




        int    __cdecl abs(int);

        int    __cdecl atexit(void (__cdecl *)(void));
 double __cdecl atof(const char *);
 int    __cdecl atoi(const char *);
 long   __cdecl atol(const char *);



 void * __cdecl bsearch(const void *, const void *, size_t, size_t,
        int (__cdecl *)(const void *, const void *));
 void * __cdecl calloc(size_t, size_t);
 div_t  __cdecl div(int, int);
 void   __cdecl exit(int);
 void   __cdecl free(void *);
 char * __cdecl getenv(const char *);
 char * __cdecl _itoa(int, char *, int);

 char * __cdecl _i64toa(__int64, char *, int);
 char * __cdecl _ui64toa(unsigned __int64, char *, int);
 __int64 __cdecl _atoi64(const char *);




        long __cdecl labs(long);

 ldiv_t __cdecl ldiv(long, long);
 char * __cdecl _ltoa(long, char *, int);
 void * __cdecl malloc(size_t);
 int    __cdecl mblen(const char *, size_t);
 size_t __cdecl _mbstrlen(const char *s);
 int    __cdecl mbtowc(wchar_t *, const char *, size_t);
 size_t __cdecl mbstowcs(wchar_t *, const char *, size_t);
 void   __cdecl qsort(void *, size_t, size_t, int (__cdecl *)
        (const void *, const void *));
 int    __cdecl rand(void);
 void * __cdecl realloc(void *, size_t);
 int    __cdecl _set_error_mode(int);
 void   __cdecl srand(unsigned int);
 double __cdecl strtod(const char *, char **);
 long   __cdecl strtol(const char *, char **, int);



 unsigned long __cdecl strtoul(const char *, char **, int);

 int    __cdecl system(const char *);

 char * __cdecl _ultoa(unsigned long, char *, int);
 int    __cdecl wctomb(char *, wchar_t);
 size_t __cdecl wcstombs(char *, const wchar_t *, size_t);






 wchar_t * __cdecl _itow (int, wchar_t *, int);
 wchar_t * __cdecl _ltow (long, wchar_t *, int);
 wchar_t * __cdecl _ultow (unsigned long, wchar_t *, int);
 double __cdecl wcstod(const wchar_t *, wchar_t **);
 long   __cdecl wcstol(const wchar_t *, wchar_t **, int);
 unsigned long __cdecl wcstoul(const wchar_t *, wchar_t **, int);
 wchar_t * __cdecl _wgetenv(const wchar_t *);
 int    __cdecl _wsystem(const wchar_t *);
 int __cdecl _wtoi(const wchar_t *);
 long __cdecl _wtol(const wchar_t *);

 wchar_t * __cdecl _i64tow(__int64, wchar_t *, int);
 wchar_t * __cdecl _ui64tow(unsigned __int64, wchar_t *, int);
 __int64   __cdecl _wtoi64(const wchar_t *);








 char * __cdecl _ecvt(double, int, int *, int *);
 void   __cdecl _exit(int);
 char * __cdecl _fcvt(double, int, int *, int *);
 char * __cdecl _fullpath(char *, const char *, size_t);
 char * __cdecl _gcvt(double, int, char *);
        unsigned long __cdecl _lrotl(unsigned long, int);
        unsigned long __cdecl _lrotr(unsigned long, int);

 void   __cdecl _makepath(char *, const char *, const char *, const char *,
        const char *);

        _onexit_t __cdecl _onexit(_onexit_t);
 void   __cdecl perror(const char *);
 int    __cdecl _putenv(const char *);
        unsigned int __cdecl _rotl(unsigned int, int);
        unsigned int __cdecl _rotr(unsigned int, int);
 void   __cdecl _searchenv(const char *, const char *, char *);

 void   __cdecl _splitpath(const char *, char *, char *, char *, char *);

 void   __cdecl _swab(char *, char *, int);






 wchar_t * __cdecl _wfullpath(wchar_t *, const wchar_t *, size_t);
 void   __cdecl _wmakepath(wchar_t *, const wchar_t *, const wchar_t *, const wchar_t *,
        const wchar_t *);
 void   __cdecl _wperror(const wchar_t *);
 int    __cdecl _wputenv(const wchar_t *);
 void   __cdecl _wsearchenv(const wchar_t *, const wchar_t *, wchar_t *);
 void   __cdecl _wsplitpath(const wchar_t *, wchar_t *, wchar_t *, wchar_t *, wchar_t *);








 void __cdecl _seterrormode(int);
 void __cdecl _beep(unsigned, unsigned);
 void __cdecl _sleep(unsigned long);




 int __cdecl tolower(int);
 int __cdecl toupper(int);
 char * __cdecl ecvt(double, int, int *, int *);
 char * __cdecl fcvt(double, int, int *, int *);
 char * __cdecl gcvt(double, int, char *);
 char * __cdecl itoa(int, char *, int);
 char * __cdecl ltoa(long, char *, int);
        _onexit_t __cdecl onexit(_onexit_t);
 int    __cdecl putenv(const char *);
 void   __cdecl swab(char *, char *, int);
 char * __cdecl ultoa(unsigned long, char *, int);

}

#pragma pack(pop)

typedef long PGTREENODE;

class PGParseTree;

struct SearchTerm 
{
	long ChildNum;		
	char SymbolName[64];
	int  Direction;			
	int  SearchRecursive;

	
	PGTREENODE FromNode;
	PGTREENODE CurrNode;
};

class PGTREEPOS 
{
protected:
	SearchTerm Terms[32];
	void BuildSearchTerms( const char* SearchString );
	const PGParseTree* pParseTree;
	int NumTerms;
	int StackIndex;
	void Push( PGTREENODE FromNode );
	void Pop();
	char MatchValue[256];
	PGTREENODE __find_next();
public:
__declspec(dllexport) 
	PGTREEPOS();
	void Initialize( const PGParseTree* pParseTree,
					PGTREENODE StartNode,
					const char* SearchString );
	PGTREENODE CurrNode;
	PGTREENODE FindNext();
	__declspec(dllexport) int operator== (const int& ) const ;
	__declspec(dllexport) int operator!= (const int& ) const ;
};


			

class ProGrammarAPI;			
class PGGrammar;				
class PGParseTree;				
class PGExternalSymbol;			
class PGError;
class PGErrorManager;
class PGParseEventListener;
class PGInputStream;

class ProGrammarAPI
{
public:
	__declspec(dllexport)
	ProGrammarAPI();

	__declspec(dllexport)
	~ProGrammarAPI();

	__declspec(dllexport)
	int Init();	

	__declspec(dllexport)
	PGGrammar* _stdcall LoadGrammar( const char* lpszGrammarFilename );

	__declspec(dllexport)
	PGGrammar* _stdcall LoadGrammarFromBuffer( const char* lpszGrammarBuffer );

	__declspec(dllexport)
	PGParseTree* _stdcall 
			Parse ( PGGrammar		* pPGGrammar,
				    const char	* StartSymbolName,	
					const char	* InputBuffer,
					long          InputBufferLength  = 0,
					unsigned long ParseFlags		   = 0x01);

	__declspec(dllexport)
	PGParseTree* _stdcall 
			Parse ( PGGrammar	  * pPGGrammar,
				    const char	  * StartSymbolName,	
					PGInputStream * pStream,
					unsigned long ParseFlags		   = 0x01);

	__declspec(dllexport)
	void _stdcall UnloadGrammar (PGGrammar * pPGGrammar);

	__declspec(dllexport)
	void _stdcall DeleteParseTree (PGParseTree * pParseTree);

	

	__declspec(dllexport)
	PGError* _stdcall GetLastError();		

	__declspec(dllexport)
	PGError* _stdcall GetPrevError (PGError * pCurrError);

	__declspec(dllexport)
	PGError* _stdcall GetFirstWarning();	

	__declspec(dllexport)
	PGError* _stdcall GetNextWarning (PGError * pCurrError);

	__declspec(dllexport)
	void _stdcall ClearErrors();

	__declspec(dllexport)
	void _stdcall ClearWarnings();

	__declspec(dllexport)
	static long _stdcall GetFileSize (const char * lpszFilename);

	__declspec(dllexport)
	static long _stdcall LoadFile (const char * lpszFilename, char * lpszStringBuf, long nMaxCount);


	__declspec(dllexport)
	PGInputStream* _stdcall OpenFileStream( const char* lpszFilename, long BufferSize = 0);

	__declspec(dllexport)
	PGInputStream* _stdcall OpenBufferStream( const char* lpszBuffer, 
												long BufferSize = 0);

	__declspec(dllexport)
	void _stdcall CloseStream( PGInputStream* pStream );

	
	PGErrorManager* m_pErrorManager;

	__declspec(dllexport)
	PGError* _stdcall ThrowError  (long ErrorCode);

	__declspec(dllexport)
	PGError* _stdcall PostWarning (long ErrorCode);

	__declspec(dllexport)
	long _stdcall GetNumErrors();

	__declspec(dllexport)
	long _stdcall GetNumWarnings();
};



class PGGrammar
{
protected:
	virtual ~PGGrammar() {}
	PGGrammar() {}

public:
	__declspec(dllexport)
	virtual const char* _stdcall GetDefStartSymbolName (char * StartSymbolName, 
												size_t MaxNameSize) const = 0;

	__declspec(dllexport)
	virtual const char* _stdcall GetQualifiedSymbolName( long SymbolID,
										 char * Buffer,
										 size_t MaxBufferSize ) const = 0;
	__declspec(dllexport)
	virtual long _stdcall GetSymbolID (const char * QualifiedSymbolName) const = 0;

	__declspec(dllexport)
	virtual int  _stdcall RegisterExternalSymbol   (const char * SymbolName,
										   PGExternalSymbol * pExternalSymbol) = 0;
	__declspec(dllexport)
	virtual void _stdcall UnregisterExternalSymbol (PGExternalSymbol * pExternalSymbol) = 0;

	__declspec(dllexport)
	virtual int _stdcall RegisterParseEventListener (
						const char * SymbolName,
						long EventMask,
						PGParseEventListener * pListener) = 0;

	__declspec(dllexport)
	virtual void _stdcall UnregisterParseEventListener (PGParseEventListener * pListener) = 0;
};



class PGParseTree
{
protected:
	virtual ~PGParseTree();
	PGParseTree();

public:
	__declspec(dllexport)
	virtual long _stdcall GetNodeCount()	const = 0;

	__declspec(dllexport)
	virtual PGTREENODE _stdcall GetRoot() const = 0;
	
	__declspec(dllexport)
	virtual PGTREENODE _stdcall GetParent ( PGTREENODE TreeNode ) const = 0;
	
	__declspec(dllexport)
	virtual PGTREENODE _stdcall GetChild ( PGTREENODE TreeNode, long ChildIndex) const = 0;

	__declspec(dllexport)
	virtual long _stdcall CountChildren ( PGTREENODE TreeNode ) const = 0;

	__declspec(dllexport)
	virtual int _stdcall IsLeafNode (PGTREENODE TreeNode) const = 0;

	__declspec(dllexport)
	virtual PGTREEPOS _stdcall FindFirst(const char* SearchString,
								PGTREENODE StartNode = 0,	
								long SearchFlags = (0x01 | 0x04) ) const = 0;

	__declspec(dllexport)
	virtual PGTREENODE _stdcall FindNext ( PGTREEPOS & pos ) const = 0;

	__declspec(dllexport)
	virtual PGTREENODE _stdcall Find ( const char * SearchString,
							PGTREENODE StartNode	= 0,	
							long SearchFlags		= (0x01 | 0x04)  ) const = 0;

	
	__declspec(dllexport)
	virtual PGTREENODE _stdcall FindRecursive ( const char * SearchString,
							PGTREENODE StartNode	= 0,	
							PGTREENODE SubtreeRoot	= 0,	
							long SearchFlags		= (0x01 | 0x04)
						  ) const = 0;
	
	__declspec(dllexport)
	virtual const char* _stdcall GetLabel ( PGTREENODE TreeNode,
									char * LabelBuffer,
									size_t BufferSize ) const = 0;

	__declspec(dllexport)
	virtual const char* _stdcall GetValue ( PGTREENODE TreeNode,
									char* ValueBuffer,
									size_t BufferSize ) const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetValueLong( PGTREENODE TreeNode ) const = 0;

	__declspec(dllexport)
	virtual int _stdcall GetValueInt( PGTREENODE TreeNode ) const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetValueSize( PGTREENODE TreeNode ) const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetValueStartPos( PGTREENODE TreeNode ) const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetSymbolType( PGTREENODE TreeNode ) const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetSymbolID( PGTREENODE TreeNode ) const = 0;
};



class PGError
{
public:
	__declspec(dllexport)
	virtual long _stdcall GetErrorCode() = 0;
	
	__declspec(dllexport)
	virtual const char* _stdcall GetStringParam (const char * ParamName) = 0;
	
	__declspec(dllexport)
	virtual long _stdcall GetLongParam (const char * ParamName) = 0;

	__declspec(dllexport)
	virtual void _stdcall SetStringParam (const char * ParamName, const char * ParamValue) = 0;
	
	__declspec(dllexport)
	virtual void _stdcall SetLongParam (const char * ParamName, long ParamValue) = 0;

	__declspec(dllexport)
	virtual const char* _stdcall GetParametersString (char * Buffer, size_t MaxBufferSize) = 0;

	__declspec(dllexport)
	virtual const char* _stdcall GetErrorString (char * Buffer, size_t MaxBufferSize) = 0;
};


class PGParsingContext
{
public:
	__declspec(dllexport)
	virtual _stdcall ~PGParsingContext();

	__declspec(dllexport)
	virtual const PGGrammar* _stdcall GetGrammar() const = 0;

	__declspec(dllexport)
	virtual const PGParseTree* _stdcall GetParseTree() const = 0;

	__declspec(dllexport)
	virtual PGTREENODE _stdcall GetCurrNode() const = 0;

	__declspec(dllexport)
	virtual void _stdcall SetStackItemData(long ItemData) const = 0;

	__declspec(dllexport) 
	virtual long _stdcall GetStackItemData(int SearchPrevious = 0) const = 0;

	__declspec(dllexport) 
	virtual PGInputStream* _stdcall GetInputStream() const = 0;

	__declspec(dllexport)
	virtual const char* _stdcall GetValue( char* pBuffer, long BufferSize) const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetValueStartPos() const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetValueNumChars() const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetSymbolID() const = 0;

	__declspec(dllexport)
	virtual long _stdcall GetCurrOffset() const = 0;

	__declspec(dllexport)
	virtual PGError* _stdcall ThrowError  (long ErrorCode) = 0;

	__declspec(dllexport)
	virtual PGError* _stdcall PostWarning (long ErrorCode) = 0;
};



class PGExternalSymbol
{
public:
	__declspec(dllexport)
	virtual long _stdcall ParseExternalSymbol ( long SymbolID,
									   const char * InputPtr,
									   long MaxLength,
									   int  bMatchCase,
									   const char * SkipChars,
		   							   PGParsingContext * pPGParsingContext) = 0;
};



class PGParseEventListener
{
public:
	inline virtual ~PGParseEventListener() {}

	__declspec(dllexport)
	virtual long _stdcall ProcessEvent (long  SymbolID,
							   long  EventType,
							   PGParsingContext * pPGParsingContext) = 0;
};


class PGInputStream
{
public:
	inline virtual ~PGInputStream() {}
	virtual long GetLength()						= 0;
	virtual char GetChar()							= 0;
	virtual long Read(char* buffer, long NumBytes)	= 0;
	virtual long Seek(long SeekPos)					= 0;
	virtual long Tell()								= 0;
	virtual const char* GetVolatilePtr(long Pos, long NumBytes) = 0;
	virtual const char* GetConstBuffer()			= 0;	
	virtual void SetItemData( long ItemData )		= 0;
	virtual long GetItemData()						= 0;
};

ProGrammarAPI pgmrAPI;

long EvaluateExpr   (PGParseTree * pParseTree, PGTREENODE ExprNode);
long EvaluateTerm   (PGParseTree * pParseTree, PGTREENODE TermNode);
long EvaluateFactor (PGParseTree * pParseTree, PGTREENODE FactorNode);


void main (int argc, char * argv[])
{
	PGGrammar   * pExprGrammar;		
	PGParseTree * pParseTree;		
	const char  * pExprString;		

	if (argc < 2)
	{
		printf ("Usage:\n\tEvaluator <expression>\n");
		return;
	}

	
	pExprString = argv[1];

	
	if ( ! pgmrAPI.Init() )
	{
		printf ("Error initializing the ProGrammar library\n");
		return;
	}

	pExprGrammar = pgmrAPI.LoadGrammar ("Expression.GMR");

	if ( pExprGrammar == 0 )
	{
		printf ("Error loading the grammar.\n");
		return;
	}

	
	pParseTree = pgmrAPI.Parse (pExprGrammar,	
							   "expr",			
							   pExprString);	

	if ( pParseTree == 0 )
	{
		
		printf ("Error parsing the expression.");
	}
	else
	{
		

		long result = EvaluateExpr (pParseTree, 
									pParseTree->Find("expr"));

		printf ("result = %ld\n", result);

		
		pgmrAPI.DeleteParseTree (pParseTree);
	}

	pgmrAPI.UnloadGrammar(pExprGrammar);
}



long EvaluateExpr (PGParseTree * pParseTree, PGTREENODE ExprNode)
{
	char TermOp = '\0';	

	long Result = 0;	

	char LabelBuffer[256];

	PGTREEPOS pos = pParseTree->FindFirst( "{term}.", ExprNode );

	while (pos != 0)
	{
		PGTREENODE CurrNode = pParseTree->FindNext( pos );

		pParseTree->GetLabel( CurrNode, LabelBuffer, sizeof(LabelBuffer));

		if (stricmp(LabelBuffer,"term") == 0)
		{
			switch( TermOp )
			{
			case '-': Result -= EvaluateTerm (pParseTree, CurrNode); break;
			case '+': Result += EvaluateTerm (pParseTree, CurrNode); break;
			default:  Result =  EvaluateTerm (pParseTree, CurrNode); break;
			}
		}
		else if (stricmp (LabelBuffer,"term_op") == 0)
		{
			pParseTree->GetValue( CurrNode, & TermOp, 1);
		}
	}
	return Result;
}

long EvaluateTerm (PGParseTree * pParseTree, PGTREENODE TermNode)
{
	char FactorOp = '\0';	

	long Result = 1;		

	char LabelBuffer[256];

	PGTREEPOS pos = pParseTree->FindFirst( "{factor}.", TermNode );

	while (pos != 0)
	{
		PGTREENODE CurrNode = pParseTree->FindNext( pos );

		pParseTree->GetLabel( CurrNode, LabelBuffer, sizeof(LabelBuffer));

		if (stricmp(LabelBuffer,"factor") == 0)
		{
			switch( FactorOp )
			{
			case '*':  Result *= EvaluateFactor (pParseTree, CurrNode); break;
			case '/':  Result /= EvaluateFactor (pParseTree, CurrNode); break;
			case '%':  Result  = Result % EvaluateFactor (pParseTree, CurrNode); break;
			default:   Result  = EvaluateFactor (pParseTree, CurrNode); break;
			}
		}
		else if (stricmp (LabelBuffer,"factor_op") == 0)
		{
			pParseTree->GetValue( CurrNode, & FactorOp, 1);
		}
	}
	return Result;
}

long EvaluateFactor (PGParseTree * pParseTree, PGTREENODE FactorNode)
{
	
	
	

	PGTREENODE ExprNode = pParseTree->Find ("expr", FactorNode);

	if (ExprNode)
	{
		return EvaluateExpr (pParseTree, ExprNode);
	}
	else
	{
		return pParseTree->GetValueLong (FactorNode);
	}
}


