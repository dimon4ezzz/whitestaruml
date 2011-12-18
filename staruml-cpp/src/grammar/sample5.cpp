main(){
memcpy(m_wstr, wstr1, (l1 + 1) * sizeof(wchar_t));
}

void (* T)();

typedef struct
{
   int foo;
} X, *X;

void foo()
{
	double x = 1.0, y = 2.0;

	x = y*3.14+2/3;
}

class X : public Y, private Z, virtual B
{
};

template <class T, int i> class TestClass {
public:
   char buffer[i];
   T testFunc(T* p1 );
};

TestClass<char, 5> ClassInst;

template <class T> void MySwap( T& a, T& b )
{
    T c( a );
    a = b; b = c;
}

template <class T, int i>
T TestClass<T,i>::testFunc(T* p1) {
    return *(p1++);
};

template <class T, int i> class TempClass { public: TempClass( void ); ~TempClass( void ); int MemberSet( T a, int b ); private: T Tarray[i]; int arraysize; };

template <class T, int i> 
    int TempClass< T, i >::MemberSet( T a, int b )
    {
        if( ( b >= 0 ) && (b < i) )
        {
           Tarray[b++] = a;
           return sizeof( a );
        }
        else
           return -1;
    }


void foo( CString<POINT,POINT&>& inout_pstSp)
{
}

template <class T, int i> 
TempClass< T, i >::TempClass( void )
{
    TRACE( "TempClass created.\n" );
}

template <class T, int i> 
TempClass< T, i >::~TempClass( void )
{
    TRACE( "TempClass destroyed.\n" );
}
template<class T> T min (T i, T j) { return ((i < j) ? i : j); }

template <class T, int i> class MyStack
{
    T StackBuffer[i];
    int cItems;
public:
    void MyStack( void ) : cItems( i ) {};
    void push( const T item );
    T pop( void );
};

template <class T, int i> void MyStack< T, i >::push( const T item )
{
    if( cItems > 0 )
     StackBuffer[--cItems] = item;
    else
     throw ("Stack overflow error.");
    return;
}

template <class T, int i> T MyStack< T, i >::pop( void )
{
    if( cItems < i )
     return StackBuffer[cItems++];
    else

     throw ("Stack underflow error.");
}


