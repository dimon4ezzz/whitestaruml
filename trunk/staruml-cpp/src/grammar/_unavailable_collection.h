
// E:\Test\CppSrc\eMule0.30d-Sources\src\MapKey.h

template<> inline UINT AFXAPI HashKey(const CCKey& key){
   return hash;
};  


// E:\Test\CppSrc\eMule0.30d-Sources\src\Jigle\stdsoap2.h

SOAP_FMAC1 int SOAP_FMAC2 soap_poll(struct soap*);
SOAP_FMAC1 int SOAP_FMAC2 soap_connect(struct soap*, const char*, const char*);


// E:\Test\CppSrc\grav-2061-src\SSPI.H

typedef SEC_CHAR SEC_FAR * SECURITY_PSTR;
typedef SEC_CHAR SEC_FAR * SECURITY_PCSTR;


//E:\Test\CppSrc\grav-2061-src\libwinface\include\compface.h

EXTERN char HexDigits[] INIT("0123456789ABCDEF");


// E:\Test\CppSrc\loki\loki\Borland\Functor.h

    template <typename R, typename P1, template <class> class ThreadingModel>
    class FunctorImpl<R, TYPELIST_1(P1), ThreadingModel>
        : public Private::FunctorImplBase<R, ThreadingModel>
    { };


// E:\Test\CppSrc\loki\loki\Borland\HierarchyGenerators.h

    template <class T, class H>
    typename H::template Rebind<T>::Result& Field(H& obj)
    {
        return obj;
    }


// E:\Test\CppSrc\loki\loki\Borland\SmartPtr.h

class A {
        bool Release(const P&)
        {
            if (!--*pCount_)
	            return false;
        }
};


// E:\Test\CppSrc\loki\loki\MSVC\1200\FunctorOld.h

        typedef typename Select
		<
			IsVoid<R>::value != 0,
			VoidAsType,
			R
		>::Result NewRType;


// E:\Test\CppSrc\loki\loki\MSVC\1200\HierarchyGenerators.h

	template <class T, class Unit>
	class GenScatterHierarchy : public Private::GenScatterImpl
	<
		IS_TYPELIST(T)::type_id
	>::template In<T, Unit>::type
	{
	public:
		typedef typename Select
		<
			TL::Private::IsTypelist<T>::value, T, void
		>::Result TList;
		
		typedef typename Private::GenScatterImpl
		<
			IS_TYPELIST(T)::type_id
		>::template In<T, Unit>::LeftBase LeftBase;
		typedef typename Private::GenScatterImpl
		<
			IS_TYPELIST(T)::type_id
		>::template In<T, Unit>::RightBase RightBase;
		
		template <typename U> struct Rebind
		{
			typedef ApplyInnerType<Unit, U>::type Result;
		};
	};


// E:\Test\CppSrc\loki\loki\MSVC\1200\SmartPtr.h

        bool Release(const P&)
        {
            if (!ThreadingModel::template In<RefCountedMT>::AtomicDecrement(*pCount_))
			return false;
        }



// E:\Test\CppSrc\loki\loki\MSVC\1200\Typelist.h

					typedef typename Select
					<
						type_id == Typelist_ID || type_id == AtomList_ID,
						Typelist_tag,
						typename Select<type_id == NullType_ID, NullType_tag, NoneList_tag>::Result
					>
					::Result type_tag;


// E:\Test\CppSrc\loki\loki\MSVC\1200\TypeTraits.h

        typedef TYPELIST_4(unsigned char, unsigned short int,
           unsigned int, unsigned long int) StdUnsignedInts;


// E:\Test\CppSrc\nestopia109src\source\core\mapper\NstMappers.h

struct MAPPER::CONTEXT
{
	UINT id;
};



class A {

inline friend bool a() { return false };

};


        typedef typename Private::GenLinearHierarchyHelper
        <
            typename TL::is_Typelist<typename TList::Tail>::type_tag
        >
        ::template In<TList, Unit, Root>::Result LinBase;


// VERSION, OSTRING 등이 macro로 정의된 문자열일 때.
// "sometext" "text" 처럼 문자열의 연속을 허용.
return QString("QuickDC_" VERSION "_" OSSTRING "");
