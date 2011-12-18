
template<class T>
class SI
{
private:
        static T _tz;
};

template<class T> T SI<T>::_tz;


typedef void (Test::*_mp)(int);
extern fun1_t(_mp p);

template<class _R, class _Ty, class _A>
class mem_fun1_t
{
       typedef _R (_Ty::*mft_mp)();
public:
        mem_fun1_t(_R (_Ty::*_Pm)(_A));
        mem_fun1_t(mft_mp _Pm)
                : _Ptr(_Pm) {}
private:
        _R (_Ty::*_Ptr)();
        mft_mp _Ptr;
};




typedef void (Test::*_mp)(int);


extern fun1_t(_mp p);

template<class _R, class _Ty, class _A>
class mem_fun1_t
{
public:
        mem_fun1_t(mft_mp _Pm)
                : _Ptr(_Pm) {}
private:
        _R (_Ty::*_Ptr)();
};

template<class T>
class SI
{
private:
        static T _tz;
};

template<class T> T SI<T>::_tz;



class  bad_exception : public exception 
{
public:
        bad_exception(const char *_S = "bad exception") throw ()
                : exception(_S) {}
        virtual ~bad_exception() throw ()
                {}
};

void main()
{
	while (j-- > 1)
	{
	}
}

template<class T> class Tls;

template<class T>
class RegVar
{
	T _t;
};

struct s1
{
	static char *const & ref(const char * ptr)
		{ return (char*) (ptr+1); }
};


class Base
{
public:
	operator bool() const { return i != 0; }
private:
	int i;
};

template <class T>
class CComPtr
{
public:
	typedef T _PtrClass;
	CComPtr() {p=0;}
	CComPtr(T* lp)
	{
		if ((p = lp) != 0)
			p->AddRef();
	}
	CComPtr(const CComPtr<T>& lp)
	{
		if ((p = lp.p) != 0)
			p->AddRef();
	}
	~CComPtr() {if (p) p->Release();}
	void Release() {if (p) p->Release(); p=0;}
	operator T*() {return (T*)p;}
	T& operator*() {((void)0); return *p; }
	
	
	T** operator&() { ((void)0); return &p; }
	T* operator->() { ((void)0); return p; }
	T* operator=(T* lp){return (T*)AtlComPtrAssign((IUnknown**)&p, lp);}
	T* operator=(const CComPtr<T>& lp)
	{
		return (T*)AtlComPtrAssign((IUnknown**)&p, lp.p);
	}

	bool operator!(){return (p == 0);}



	T* p;
};


int foo()
{
	int a = (5,6,7);
	return a;
}
__inline size_t __cdecl _tclen(const char *_cpc) { return (_cpc,1); }


        virtual  HRESULT __stdcall Draw( 
             DWORD dwDrawAspect,
             LONG lindex,
             void  *pvAspect,
             DVTARGETDEVICE  *ptd,
             HDC hdcTargetDev,
             HDC hdcDraw,
             LPCRECTL lprcBounds,
             LPCRECTL lprcWBounds,
             BOOL ( __stdcall  *pfnContinue )( 
                DWORD dwContinue),
             DWORD dwContinue) = 0;


typedef enum tagCOINIT
{
  COINIT_APARTMENTTHREADED  = 0x2,      
} COINIT;

typedef 
enum tagMEMCTX
    {	MEMCTX_TASK	= 1+5,
	MEMCTX_SHARED	= 2,
	MEMCTX_MACSYSTEM	= 3,
	MEMCTX_UNKNOWN	= 1,
	MEMCTX_SAME	= -2
    }	MEMCTX;

typedef struct _RPC_SERVER_INTERFACE
{
    unsigned int Length;
    RPC_SYNTAX_IDENTIFIER InterfaceId;
    RPC_SYNTAX_IDENTIFIER TransferSyntax;
    PRPC_DISPATCH_TABLE DispatchTable;
    unsigned int RpcProtseqEndpointCount;
    PRPC_PROTSEQ_ENDPOINT RpcProtseqEndpoint;
    void  *DefaultManagerEpv;
    void const  *InterpreterInfo;
    unsigned int Flags ;
} RPC_SERVER_INTERFACE,  * PRPC_SERVER_INTERFACE;

typedef struct _LANA_ENUM {
    UCHAR   length;         
    UCHAR   lana[254+1];
} LANA_ENUM, *PLANA_ENUM;


void (__stdcall *ncb_post)( struct _NCB * ); 

typedef struct _NCB {
    UCHAR   ncb_command;            
    UCHAR   ncb_retcode;            
    UCHAR   ncb_lsn;                
    UCHAR   ncb_num;                
    PUCHAR  ncb_buffer;             
    WORD    ncb_length;             
    UCHAR   ncb_callname[16]; 
    UCHAR   ncb_name[16];     
    UCHAR   ncb_rto;                
    UCHAR   ncb_sto;                
    void (__stdcall *ncb_post)( struct _NCB * ); 
    UCHAR   ncb_lana_num;           
    UCHAR   ncb_cmd_cplt;           
    UCHAR   ncb_reserve[10];        
    HANDLE  ncb_event;              
} NCB, *PNCB;



typedef void (__stdcall DRVCALLBACK)(HDRVR hdrvr, UINT uMsg, DWORD dwUser, DWORD dw1, DWORD dw2);

typedef struct {
        unsigned short bAppReturnCode:8,
                 reserved:6,
                 fBusy:1,
		 fAck:1;
} DDEACK;

typedef LPMENUITEMINFOA LPMENUITEMINFO;

typedef MENUITEMINFOA const *LPCMENUITEMINFOA;

typedef int foo(int);

typedef
DWORD _cdecl
QUERYHANDLER (LPVOID keycontext, PVALCONTEXT val_list, DWORD num_vals,
          LPVOID outputbuffer, DWORD  *total_outlen, DWORD input_blen);

typedef int (*handler)(const char *line);

using ::foo;

class Test
{
        typedef int (*handler)(const char *line);
};

bool operator==(const FunctorBase &lhs,const FunctorBase &rhs);

class Friendly
{
public:
        int i;
};

class Test
{
        friend class Friendly;
public:
        bool operator==(const Test &lhs,const Test &rhs);
        friend bool operator==(const Test &lhs,const Test &rhs);
private:
        int j;
};


