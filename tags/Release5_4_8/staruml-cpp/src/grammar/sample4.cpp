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


class PtrArray
{
private:
   char * Buffer;
   void ** Items;
   long NumItems;
   long ArraySize;
   void CheckBufferSize (void);

public:
__declspec(dllexport)
   PtrArray(void);
__declspec(dllexport)
   virtual ~PtrArray();
__declspec(dllexport)
   long Add (void * item);
__declspec(dllexport)
   long InsertAt (long index, void * item);
__declspec(dllexport)
   void * GetAt (long index) const;
__declspec(dllexport)
   long GetSize (void) const;
__declspec(dllexport)
   long GetUpperBound (void) const;
__declspec(dllexport)
   void RemoveAt(long nIndex);
__declspec(dllexport)
   void RemoveAll(void);
};

