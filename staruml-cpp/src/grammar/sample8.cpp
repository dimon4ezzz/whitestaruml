
class _bstr_t {
public:
	
	
	_bstr_t() throw();
	_bstr_t(const _bstr_t& s) throw();
	_bstr_t(const char* s) throw(_com_error);
	_bstr_t(const wchar_t* s) throw(_com_error);
	_bstr_t(const _variant_t& var) throw(_com_error);
	_bstr_t(BSTR bstr, bool fCopy) throw(_com_error);

	
	
	~_bstr_t() throw();

	
	
	_bstr_t& operator=(const _bstr_t& s) throw();
	_bstr_t& operator=(const char* s) throw(_com_error);
	_bstr_t& operator=(const wchar_t* s) throw(_com_error);
	_bstr_t& operator=(const _variant_t& var) throw(_com_error);

	
	
	_bstr_t& operator+=(const _bstr_t& s) throw(_com_error);
	_bstr_t operator+(const _bstr_t& s) const throw(_com_error);

	
	
	friend _bstr_t operator+(const char* s1, const _bstr_t& s2);
	friend _bstr_t operator+(const wchar_t* s1, const _bstr_t& s2);

	
	
	operator const wchar_t*() const throw();
	operator wchar_t*() const throw();
	operator const char*() const throw(_com_error);
	operator char*() const throw(_com_error);

	
	
	bool operator!() const throw();
	bool operator==(const _bstr_t& str) const throw();
	bool operator!=(const _bstr_t& str) const throw();
	bool operator<(const _bstr_t& str) const throw();
	bool operator>(const _bstr_t& str) const throw();
	bool operator<=(const _bstr_t& str) const throw();
	bool operator>=(const _bstr_t& str) const throw();

	
	
	BSTR copy() const throw(_com_error);
	unsigned int length() const throw();

	

private:
	
	
	class Data_t {
	public:
		
		
		Data_t(const char* s) throw();
		Data_t(const wchar_t* s) throw();
		Data_t(const BSTR bstr, bool fCopy) throw();
		Data_t(const _bstr_t& s1, const _bstr_t& s2);

		
		
		unsigned long AddRef() throw();
		unsigned long Release() throw();

		
		
		operator const wchar_t*() const throw();
		operator const char*() const throw();

		
		
		const wchar_t* GetWString() const throw();
		const char* GetString() const throw();

		BSTR Copy() const throw(_com_error);
		unsigned int Length() const throw();
		int Compare(const Data_t& str) const throw();

	private:
		wchar_t*		m_wstr;
		mutable char*	m_str;
		unsigned long	m_RefCount;

		
		
		Data_t() throw();

		
		
		Data_t(const Data_t& s) throw();

		
		
		~Data_t() throw();

		void _Free() throw();
	};

private:
	
	
	Data_t* m_Data;

private:
	
	
	void _AddRef() throw();
	void _Free() throw();
	int _Compare(const _bstr_t& str) const throw();
};









inline _bstr_t::_bstr_t() throw()
	: m_Data(0)
{
}



inline _bstr_t::_bstr_t(const _bstr_t& s) throw()
	: m_Data(s.m_Data)
{
	_AddRef();
}



inline _bstr_t::_bstr_t(const char* s) throw(_com_error)
	: m_Data(new Data_t(s))
{
	if (m_Data == 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}



inline _bstr_t::_bstr_t(const wchar_t* s) throw(_com_error)
	: m_Data(new Data_t(s))
{
	if (m_Data == 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}




inline _bstr_t::_bstr_t(BSTR bstr, bool fCopy) throw(_com_error)
	: m_Data(new Data_t(bstr, fCopy))
{
	if (m_Data == 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}



inline _bstr_t::~_bstr_t() throw()
{
	_Free();
}









inline _bstr_t& _bstr_t::operator=(const _bstr_t& s) throw()
{
	_Free();
	m_Data = s.m_Data;
	_AddRef();

	return *this;
}



inline _bstr_t& _bstr_t::operator=(const char* s) throw(_com_error)
{
	_Free();
	m_Data = new Data_t(s);

	return *this;
}



inline _bstr_t& _bstr_t::operator=(const wchar_t* s) throw(_com_error)
{
	_Free();
	m_Data = new Data_t(s);

	return *this;
}









inline _bstr_t& _bstr_t::operator+=(const _bstr_t& s) throw(_com_error)
{
	Data_t* newData = new Data_t(*this, s);

	_Free();
	m_Data = newData;

	return *this;
}



inline _bstr_t _bstr_t::operator+(const _bstr_t& s) const throw(_com_error)
{
	_bstr_t b = *this;
	b += s;

	return b;
}









inline _bstr_t operator+(const char* s1, const _bstr_t& s2) throw(_com_error)
{
	_bstr_t b = s1; 
	b += s2;

	return b;
}



inline _bstr_t operator+(const wchar_t* s1, const _bstr_t& s2) throw(_com_error)
{
	_bstr_t b = s1; 
	b += s2;

	return b;
}









inline _bstr_t::operator const wchar_t*() const throw()
{
	return (m_Data != 0) ? m_Data->GetWString() : 0;
}



inline _bstr_t::operator wchar_t*() const throw()
{
	return const_cast<wchar_t*>((m_Data != 0) ? m_Data->GetWString() : 0);
}



inline _bstr_t::operator const char*() const throw()
{
	return (m_Data != 0) ? m_Data->GetString() : 0;
}



inline _bstr_t::operator char*() const throw()
{
	return const_cast<char*>((m_Data != 0) ? m_Data->GetString() : 0);
}







inline bool _bstr_t::operator!() const throw()
{
	return (m_Data != 0) ? !m_Data->GetWString() : true;
}

inline bool _bstr_t::operator==(const _bstr_t& str) const throw()
{
	return _Compare(str) == 0;
}

inline bool _bstr_t::operator!=(const _bstr_t& str) const throw()
{
	return _Compare(str) != 0;
}

inline bool _bstr_t::operator<(const _bstr_t& str) const throw()
{
	return _Compare(str) < 0;
}

inline bool _bstr_t::operator>(const _bstr_t& str) const throw()
{
	return _Compare(str) > 0;
}

inline bool _bstr_t::operator<=(const _bstr_t& str) const throw()
{
	return _Compare(str) <= 0;
}

inline bool _bstr_t::operator>=(const _bstr_t& str) const throw()
{
	return _Compare(str) >= 0;
}









inline BSTR _bstr_t::copy() const throw(_com_error)
{
	return (m_Data != 0) ? m_Data->Copy() : 0;
}



inline unsigned int _bstr_t::length() const throw()
{
	return (m_Data != 0) ? m_Data->Length() : 0;
}



inline void _bstr_t::_AddRef() throw()
{
	if (m_Data != 0) {
		m_Data->AddRef();
	}
}



inline void _bstr_t::_Free() throw()
{
	if (m_Data != 0) {
		m_Data->Release();
		m_Data = 0;
	}
}



inline int _bstr_t::_Compare(const _bstr_t& str) const throw()
{
	if (m_Data == str.m_Data) {
		return 0;
	}

	if (m_Data == 0) {
		return -1;
	}

	if (str.m_Data == 0) {
		return 1;
	}

	return m_Data->Compare(*str.m_Data);
}









inline _bstr_t::Data_t::Data_t(const char* s) throw(_com_error)
	: m_str(0), m_RefCount(1)
{
	m_wstr = _com_util::ConvertStringToBSTR(s);

	if (m_wstr == 0 && s != 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}



inline _bstr_t::Data_t::Data_t(const wchar_t* s) throw(_com_error)
	: m_str(0), m_RefCount(1)
{
	m_wstr = ::SysAllocString(s);

	if (m_wstr == 0 && s != 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}




inline _bstr_t::Data_t::Data_t(BSTR bstr, bool fCopy) throw(_com_error)
	: m_str(0), m_RefCount(1)
{
	if (fCopy && bstr != 0) {
		m_wstr = ::SysAllocStringByteLen(reinterpret_cast<char*>(bstr),
										 ::SysStringByteLen(bstr));

		if (m_wstr == 0) {
			_com_issue_error(((HRESULT)0x8007000EL));
		}
	}
	else {
		m_wstr = bstr;
	}
}



inline _bstr_t::Data_t::Data_t(const _bstr_t& s1, const _bstr_t& s2) throw(_com_error)
	: m_str(0), m_RefCount(1)
{
	const unsigned int l1 = s1.length();
	const unsigned int l2 = s2.length();

	m_wstr = ::SysAllocStringByteLen(0, (l1 + l2) * sizeof(wchar_t));

	if (m_wstr == 0) {
		if (l1 + l2 == 0) {
			return;
		}
		_com_issue_error(((HRESULT)0x8007000EL));
	}

	const wchar_t* wstr1 = static_cast<const wchar_t*>(s1);

	if (wstr1 != 0) {
		memcpy(m_wstr, wstr1, (l1 + 1) * sizeof(wchar_t));
	}

	const wchar_t* wstr2 = static_cast<const wchar_t*>(s2);

	if (wstr2 != 0) {
		memcpy(m_wstr + l1, wstr2, (l2 + 1) * sizeof(wchar_t));
	}
}







inline unsigned long _bstr_t::Data_t::AddRef() throw()
{
	InterlockedIncrement(reinterpret_cast<long*>(&m_RefCount));
	return m_RefCount;
}

inline unsigned long _bstr_t::Data_t::Release() throw()
{
	if (!InterlockedDecrement(reinterpret_cast<long*>(&m_RefCount))) {
		delete this;
		return 0;
	}

	return m_RefCount;
}









inline _bstr_t::Data_t::operator const wchar_t*() const throw()
{
	return m_wstr;
}



inline _bstr_t::Data_t::operator const char*() const throw(_com_error)
{
	return GetString();
}







inline const wchar_t* _bstr_t::Data_t::GetWString() const throw()
{
	return m_wstr;
}

inline const char* _bstr_t::Data_t::GetString() const throw(_com_error)
{
	if (m_str == 0) {
		m_str = _com_util::ConvertBSTRToString(m_wstr);

		if (m_str == 0 && m_wstr != 0) {
			_com_issue_error(((HRESULT)0x8007000EL));
		}
	}

	return m_str;
}



inline BSTR _bstr_t::Data_t::Copy() const throw(_com_error)
{
	if (m_wstr != 0) {
		BSTR bstr = ::SysAllocStringByteLen(reinterpret_cast<char*>(m_wstr),
											::SysStringByteLen(bstr));

		if (bstr == 0) {
			_com_issue_error(((HRESULT)0x8007000EL));
		}

		return bstr;
	}

	return 0;
}



inline unsigned int _bstr_t::Data_t::Length() const throw()
{
	return m_wstr ? ::SysStringLen(m_wstr) : 0;
}



inline int _bstr_t::Data_t::Compare(const _bstr_t::Data_t& str) const throw()
{
	if (m_wstr == 0) {
		return str.m_wstr ? -1 : 0;
	}

	if (str.m_wstr == 0) {
		return 1;
	}

	const unsigned int l1 = ::SysStringLen(m_wstr);
	const unsigned int l2 = ::SysStringLen(str.m_wstr);

	unsigned int len = l1;
	if (len > l2) {
		len = l2;
	}

	BSTR bstr1 = m_wstr;
	BSTR bstr2 = str.m_wstr;

	while (len-- > 0) {
		if (*bstr1++ != *bstr2++) {
			return bstr1[-1] - bstr2[-1];
		}
	}

	return (l1 < l2) ? -1 : (l1 == l2) ? 0 : 1;
}



inline _bstr_t::Data_t::~Data_t() throw()
{
	_Free();
}



inline void _bstr_t::Data_t::_Free() throw()
{
	if (m_wstr != 0) {
		::SysFreeString(m_wstr);
	}

	if (m_str != 0) {
		delete [] m_str;
	}
}






























































class _variant_t : public ::tagVARIANT {
public:
	
	
	_variant_t() throw();

	_variant_t(const VARIANT& varSrc) throw(_com_error);
	_variant_t(const VARIANT* pSrc) throw(_com_error);
	_variant_t(const _variant_t& varSrc) throw(_com_error);

	_variant_t(VARIANT& varSrc, bool fCopy) throw(_com_error);			

	_variant_t(short sSrc, VARTYPE vtSrc = VT_I2) throw(_com_error);	
	_variant_t(long lSrc, VARTYPE vtSrc = VT_I4) throw(_com_error);		
	_variant_t(float fltSrc) throw();									
	_variant_t(double dblSrc, VARTYPE vtSrc = VT_R8) throw(_com_error);	
	_variant_t(const CY& cySrc) throw();								
	_variant_t(const _bstr_t& bstrSrc) throw(_com_error);				
	_variant_t(const wchar_t *pSrc) throw(_com_error);					
	_variant_t(const char* pSrc) throw(_com_error);						
	_variant_t(IDispatch* pSrc, bool fAddRef = true) throw();			
	_variant_t(bool bSrc) throw();										
	_variant_t(IUnknown* pSrc, bool fAddRef = true) throw();			
	_variant_t(const DECIMAL& decSrc) throw();							
	_variant_t(BYTE bSrc) throw();										

	
	
	~_variant_t() throw(_com_error);

	
	
	operator short() const throw(_com_error);			
	operator long() const throw(_com_error);			
	operator float() const throw(_com_error);			
	operator double() const throw(_com_error);			
	operator CY() const throw(_com_error);				
	operator _bstr_t() const throw(_com_error);			
	operator IDispatch*() const throw(_com_error);		
	operator bool() const throw(_com_error);			
	operator IUnknown*() const throw(_com_error);		
	operator DECIMAL() const throw(_com_error);			
	operator BYTE() const throw(_com_error);			
	
	
	
	_variant_t& operator=(const VARIANT& varSrc) throw(_com_error);
	_variant_t& operator=(const VARIANT* pSrc) throw(_com_error);
	_variant_t& operator=(const _variant_t& varSrc) throw(_com_error);

	_variant_t& operator=(short sSrc) throw(_com_error);				
	_variant_t& operator=(long lSrc) throw(_com_error);					
	_variant_t& operator=(float fltSrc) throw(_com_error);				
	_variant_t& operator=(double dblSrc) throw(_com_error);				
	_variant_t& operator=(const CY& cySrc) throw(_com_error);			
	_variant_t& operator=(const _bstr_t& bstrSrc) throw(_com_error);	
	_variant_t& operator=(const wchar_t* pSrc) throw(_com_error);		
	_variant_t& operator=(const char* pSrc) throw(_com_error);			
	_variant_t& operator=(IDispatch* pSrc) throw(_com_error);			
 	_variant_t& operator=(bool bSrc) throw(_com_error);					
	_variant_t& operator=(IUnknown* pSrc) throw(_com_error);			
	_variant_t& operator=(const DECIMAL& decSrc) throw(_com_error);		
	_variant_t& operator=(BYTE bSrc) throw(_com_error);					

	
	
	bool operator==(const VARIANT& varSrc) const throw(_com_error);
	bool operator==(const VARIANT* pSrc) const throw(_com_error);

	bool operator!=(const VARIANT& varSrc) const throw(_com_error);
	bool operator!=(const VARIANT* pSrc) const throw(_com_error);

	
	
	void Clear() throw(_com_error);

	void Attach(VARIANT& varSrc) throw(_com_error);
	VARIANT Detach() throw(_com_error);

	void ChangeType(VARTYPE vartype, const _variant_t* pSrc = 0) throw(_com_error);

	void SetString(const char* pSrc) throw(_com_error); 
};









inline _variant_t::_variant_t() throw()
{
	::VariantInit(this);
}



inline _variant_t::_variant_t(const VARIANT& varSrc) throw(_com_error)
{
	::VariantInit(this);
	_com_util::CheckError(::VariantCopy(this, const_cast<VARIANT*>(&varSrc)));
}



inline _variant_t::_variant_t(const VARIANT* pSrc) throw(_com_error)
{
	::VariantInit(this);
	_com_util::CheckError(::VariantCopy(this, const_cast<VARIANT*>(pSrc)));
}



inline _variant_t::_variant_t(const _variant_t& varSrc) throw(_com_error)
{
	::VariantInit(this);
	_com_util::CheckError(::VariantCopy(this, const_cast<VARIANT*>(static_cast<const VARIANT*>(&varSrc))));
}




inline _variant_t::_variant_t(VARIANT& varSrc, bool fCopy) throw(_com_error)
{
	if (fCopy) {
		::VariantInit(this);
		_com_util::CheckError(::VariantCopy(this, &varSrc));
	} else {
		memcpy(this, &varSrc, sizeof(varSrc));
		((&varSrc)->vt) = VT_EMPTY;
	}
}




inline _variant_t::_variant_t(short sSrc, VARTYPE vtSrc) throw(_com_error)
{
	if ((vtSrc != VT_I2) && (vtSrc != VT_BOOL)) {
		_com_issue_error(((HRESULT)0x80070057L));
	}

	if (vtSrc == VT_BOOL) {
		((this)->vt) = VT_BOOL;
		((this)->boolVal) = (sSrc ? ((VARIANT_BOOL)0xffff) : ((VARIANT_BOOL)0));
	}
	else {
		((this)->vt) = VT_I2;
		((this)->iVal) = sSrc;
	}
}




inline _variant_t::_variant_t(long lSrc, VARTYPE vtSrc) throw(_com_error)
{
	if ((vtSrc != VT_I4) && (vtSrc != VT_ERROR) && (vtSrc != VT_BOOL)) {
		_com_issue_error(((HRESULT)0x80070057L));
	}

	if (vtSrc == VT_ERROR) {
		((this)->vt) = VT_ERROR;
		((this)->scode) = lSrc;
	}
	else if (vtSrc == VT_BOOL) {
		((this)->vt) = VT_BOOL;
		((this)->boolVal) = (lSrc ? ((VARIANT_BOOL)0xffff) : ((VARIANT_BOOL)0));
	}
	else {
		((this)->vt) = VT_I4;
		((this)->lVal) = lSrc;
	}
}



inline _variant_t::_variant_t(float fltSrc) throw()
{
	((this)->vt) = VT_R4;
	((this)->fltVal) = fltSrc;
}




inline _variant_t::_variant_t(double dblSrc, VARTYPE vtSrc) throw(_com_error)
{
	if ((vtSrc != VT_R8) && (vtSrc != VT_DATE)) {
		_com_issue_error(((HRESULT)0x80070057L));
	}

	if (vtSrc == VT_DATE) {
		((this)->vt) = VT_DATE;
		((this)->date) = dblSrc;
	}
	else {
		((this)->vt) = VT_R8;
		((this)->dblVal) = dblSrc;
	}
}



inline _variant_t::_variant_t(const CY& cySrc) throw()
{
	((this)->vt) = VT_CY;
	((this)->cyVal) = cySrc;
}



inline _variant_t::_variant_t(const _bstr_t& bstrSrc) throw(_com_error)
{
	((this)->vt) = VT_BSTR;

	BSTR bstr = static_cast<wchar_t*>(bstrSrc);
	((this)->bstrVal) = ::SysAllocStringByteLen(reinterpret_cast<char*>(bstr),
										   ::SysStringByteLen(bstr));

	if (((this)->bstrVal) == 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}



inline _variant_t::_variant_t(const wchar_t* pSrc) throw(_com_error)
{
	((this)->vt) = VT_BSTR;
	((this)->bstrVal) = ::SysAllocString(pSrc);

	if (((this)->bstrVal) == 0 && pSrc != 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}



inline _variant_t::_variant_t(const char* pSrc) throw(_com_error)
{
	((this)->vt) = VT_BSTR;
	((this)->bstrVal) = _com_util::ConvertStringToBSTR(pSrc);

	if (((this)->bstrVal) == 0 && pSrc != 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}



inline _variant_t::_variant_t(IDispatch* pSrc, bool fAddRef) throw()
{
	((this)->vt) = VT_DISPATCH;
	((this)->pdispVal) = pSrc;

	
	
	
	if (fAddRef) {
		((this)->pdispVal)->AddRef();
	}
}



inline _variant_t::_variant_t(bool bSrc) throw()
{
	((this)->vt) = VT_BOOL;
	((this)->boolVal) = (bSrc ? ((VARIANT_BOOL)0xffff) : ((VARIANT_BOOL)0));
}



inline _variant_t::_variant_t(IUnknown* pSrc, bool fAddRef) throw()
{
	((this)->vt) = VT_UNKNOWN;
	((this)->punkVal) = pSrc;

	
	
	
	if (fAddRef) {
		((this)->punkVal)->AddRef();
	}
}



inline _variant_t::_variant_t(const DECIMAL& decSrc) throw()
{
	
	
	((this)->decVal) = decSrc;
	((this)->vt) = VT_DECIMAL;
}



inline _variant_t::_variant_t(BYTE bSrc) throw()
{
	((this)->vt) = VT_UI1;
	((this)->bVal) = bSrc;
}









inline _variant_t::operator short() const throw(_com_error)
{
	if (((this)->vt) == VT_I2) {
		return ((this)->iVal); 
	}

	_variant_t varDest;

	varDest.ChangeType(VT_I2, this);

	return ((&varDest)->iVal);
}



inline _variant_t::operator long() const throw(_com_error)
{
	if (((this)->vt) == VT_I4) {
		return ((this)->lVal); 
	}

	_variant_t varDest;

	varDest.ChangeType(VT_I4, this);

	return ((&varDest)->lVal);
}



inline _variant_t::operator float() const throw(_com_error)
{
	if (((this)->vt) == VT_R4) {
		return ((this)->fltVal); 
	}

	_variant_t varDest;

	varDest.ChangeType(VT_R4, this);

	return ((&varDest)->fltVal);
}



inline _variant_t::operator double() const throw(_com_error)
{
	if (((this)->vt) == VT_R8) {
		return ((this)->dblVal); 
	}

	_variant_t varDest;

	varDest.ChangeType(VT_R8, this);

	return ((&varDest)->dblVal);
}



inline _variant_t::operator CY() const throw(_com_error)
{
	if (((this)->vt) == VT_CY) {
		return ((this)->cyVal); 
	}

	_variant_t varDest;

	varDest.ChangeType(VT_CY, this);

	return ((&varDest)->cyVal);
}



inline _variant_t::operator _bstr_t() const throw(_com_error)
{
	if (((this)->vt) == VT_BSTR) {
		return ((this)->bstrVal);
	}

	_variant_t varDest;

	varDest.ChangeType(VT_BSTR, this);

	return ((&varDest)->bstrVal);
}



inline _variant_t::operator IDispatch*() const throw(_com_error)
{
	if (((this)->vt) == VT_DISPATCH) {
		((this)->pdispVal)->AddRef();
		return ((this)->pdispVal);
	}

	_variant_t varDest;

	varDest.ChangeType(VT_DISPATCH, this);

	((&varDest)->pdispVal)->AddRef();
	return ((&varDest)->pdispVal);
}



inline _variant_t::operator bool() const throw(_com_error)
{
	if (((this)->vt) == VT_BOOL) {
		return ((this)->boolVal) ? true : false;
	}

	_variant_t varDest;

	varDest.ChangeType(VT_BOOL, this);

	return ((&varDest)->boolVal) ? true : false;
}



inline _variant_t::operator IUnknown*() const throw(_com_error)
{
	if (((this)->vt) == VT_UNKNOWN) {
		return ((this)->punkVal);
	}

	_variant_t varDest;

	varDest.ChangeType(VT_UNKNOWN, this);

	return ((&varDest)->punkVal);
}



inline _variant_t::operator DECIMAL() const throw(_com_error)
{
	if (((this)->vt) == VT_DECIMAL) {
		return ((this)->decVal);
	}

	_variant_t varDest;

	varDest.ChangeType(VT_DECIMAL, this);

	return ((&varDest)->decVal);
}



inline _variant_t::operator BYTE() const throw(_com_error)
{
	if (((this)->vt) == VT_UI1) {
		return ((this)->bVal);
	}

	_variant_t varDest;

	varDest.ChangeType(VT_UI1, this);

	return ((&varDest)->bVal);
}









inline _variant_t& _variant_t::operator=(const VARIANT& varSrc) throw(_com_error)
{
	_com_util::CheckError(::VariantCopy(this, const_cast<VARIANT*>(&varSrc)));

	return *this;
}



inline _variant_t& _variant_t::operator=(const VARIANT* pSrc) throw(_com_error)
{
	_com_util::CheckError(::VariantCopy(this, const_cast<VARIANT*>(pSrc)));

	return *this;
}



inline _variant_t& _variant_t::operator=(const _variant_t& varSrc) throw(_com_error)
{
	_com_util::CheckError(::VariantCopy(this, const_cast<VARIANT*>(static_cast<const VARIANT*>(&varSrc))));

	return *this;
}




inline _variant_t& _variant_t::operator=(short sSrc) throw(_com_error)
{
	if (((this)->vt) == VT_I2) {
		((this)->iVal) = sSrc;
	}
	else if (((this)->vt) == VT_BOOL) {
		((this)->boolVal) = (sSrc ? ((VARIANT_BOOL)0xffff) : ((VARIANT_BOOL)0));
	}
	else {
		
		
		Clear();

		((this)->vt) = VT_I2;
		((this)->iVal) = sSrc;
	}

	return *this;
}




inline _variant_t& _variant_t::operator=(long lSrc) throw(_com_error)
{
	if (((this)->vt) == VT_I4) {
		((this)->lVal) = lSrc;
	}
	else if (((this)->vt) == VT_ERROR) {
		((this)->scode) = lSrc;
	}
	else if (((this)->vt) == VT_BOOL) {
		((this)->boolVal) = (lSrc ? ((VARIANT_BOOL)0xffff) : ((VARIANT_BOOL)0));
	}
	else {
		
		
		Clear();

		((this)->vt) = VT_I4;
		((this)->lVal) = lSrc;
	}

	return *this;
}



inline _variant_t& _variant_t::operator=(float fltSrc) throw(_com_error)
{
	if (((this)->vt) != VT_R4) {
		
		
		Clear();

		((this)->vt) = VT_R4;
	}

	((this)->fltVal) = fltSrc;

	return *this;
}




inline _variant_t& _variant_t::operator=(double dblSrc) throw(_com_error)
{
	if (((this)->vt) == VT_R8) {
		((this)->dblVal) = dblSrc;
	}
	else if(((this)->vt) == VT_DATE) {
		((this)->date) == dblSrc;
	}
	else {
		
		
		Clear();

		((this)->vt) = VT_R8;
		((this)->dblVal) = dblSrc;
	}

	return *this;
}



inline _variant_t& _variant_t::operator=(const CY& cySrc) throw(_com_error)
{
	if (((this)->vt) != VT_CY) {
		
		
		Clear();

		((this)->vt) = VT_CY;
	}

	((this)->cyVal) = cySrc;

	return *this;
}



inline _variant_t& _variant_t::operator=(const _bstr_t& bstrSrc) throw(_com_error)
{
	
	
	Clear();

	((this)->vt) = VT_BSTR;

	if (!bstrSrc) {
		((this)->bstrVal) = 0;
	}
	else {
		BSTR bstr = static_cast<wchar_t*>(bstrSrc);
		((this)->bstrVal) = ::SysAllocStringByteLen(reinterpret_cast<char*>(bstr),
											   ::SysStringByteLen(bstr));

		if (((this)->bstrVal) == 0) {
			_com_issue_error(((HRESULT)0x8007000EL));
		}
	}

	return *this;
}



inline _variant_t& _variant_t::operator=(const wchar_t* pSrc) throw(_com_error)
{
	
	
	Clear();

	((this)->vt) = VT_BSTR;

	if (pSrc == 0) {
		((this)->bstrVal) = 0;
	}
	else {
		((this)->bstrVal) = ::SysAllocString(pSrc);

		if (((this)->bstrVal) == 0) {
			_com_issue_error(((HRESULT)0x8007000EL));
		}
	}

	return *this;
}



inline _variant_t& _variant_t::operator=(const char* pSrc) throw(_com_error)
{
	
	
	Clear();

	((this)->vt) = VT_BSTR;
	((this)->bstrVal) = _com_util::ConvertStringToBSTR(pSrc);

	if (((this)->bstrVal) == 0 && pSrc != 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}

	return *this;
}



inline _variant_t& _variant_t::operator=(IDispatch* pSrc) throw(_com_error)
{
	
	
	Clear();

	((this)->vt) = VT_DISPATCH;
	((this)->pdispVal) = pSrc;

	
	
	((this)->pdispVal)->AddRef();

	return *this;
}



inline _variant_t& _variant_t::operator=(bool bSrc) throw(_com_error)
{
	if (((this)->vt) != VT_BOOL) {
		
		
		Clear();

		((this)->vt) = VT_BOOL;
	}

	((this)->boolVal) = (bSrc ? ((VARIANT_BOOL)0xffff) : ((VARIANT_BOOL)0));

	return *this;
}



inline _variant_t& _variant_t::operator=(IUnknown* pSrc) throw(_com_error)
{
	
	
	Clear();

	((this)->vt) = VT_UNKNOWN;
	((this)->punkVal) = pSrc;

	
	
	((this)->punkVal)->AddRef();

	return *this;
}



inline _variant_t& _variant_t::operator=(const DECIMAL& decSrc) throw(_com_error)
{
	if (((this)->vt) != VT_DECIMAL) {
		
		
		Clear();
	}

	
	((this)->decVal) = decSrc;
	((this)->vt) = VT_DECIMAL;

	return *this;
}



inline _variant_t& _variant_t::operator=(BYTE bSrc) throw(_com_error)
{
	if (((this)->vt) != VT_UI1) {
		
		
		Clear();

		((this)->vt) = VT_UI1;
	}

	((this)->bVal) = bSrc;

	return *this;
}









inline bool _variant_t::operator==(const VARIANT& varSrc) const throw()
{
	return *this == &varSrc;
}



inline bool _variant_t::operator==(const VARIANT* pSrc) const throw()
{
	if (this == pSrc) {
		return true;
	}

	
	
	
	if (((this)->vt) != ((pSrc)->vt)) {
		return false;
	}

	
	
	
	switch (((this)->vt)) {
		case VT_EMPTY:
		case VT_NULL:
			return true;

		case VT_I2:
			return ((this)->iVal) == ((pSrc)->iVal);

		case VT_I4:
			return ((this)->lVal) == ((pSrc)->lVal);

		case VT_R4:
			return ((this)->fltVal) == ((pSrc)->fltVal);

		case VT_R8:
			return ((this)->dblVal) == ((pSrc)->dblVal);

		case VT_CY:
			return memcmp(&(((this)->cyVal)), &(((pSrc)->cyVal)), sizeof(CY)) == 0;

		case VT_DATE:
			return ((this)->date) == ((pSrc)->date);

		case VT_BSTR:
			return (::SysStringByteLen(((this)->bstrVal)) == ::SysStringByteLen(((pSrc)->bstrVal))) &&
					(memcmp(((this)->bstrVal), ((pSrc)->bstrVal), ::SysStringByteLen(((this)->bstrVal))) == 0);

		case VT_DISPATCH:
			return ((this)->pdispVal) == ((pSrc)->pdispVal);

		case VT_ERROR:
			return ((this)->scode) == ((pSrc)->scode);

		case VT_BOOL:
			return ((this)->boolVal) == ((pSrc)->boolVal);

		case VT_UNKNOWN:
			return ((this)->punkVal) == ((pSrc)->punkVal);

		case VT_DECIMAL:
			return memcmp(&(((this)->decVal)), &(((pSrc)->decVal)), sizeof(DECIMAL)) == 0;

		case VT_UI1:
			return ((this)->bVal) == ((pSrc)->bVal);

		default:
			_com_issue_error(((HRESULT)0x80070057L));
			
	}

	return false;
}



inline bool _variant_t::operator!=(const VARIANT& varSrc) const throw()
{
	return !(*this == &varSrc);
}



inline bool _variant_t::operator!=(const VARIANT* pSrc) const throw()
{
	return !(*this == pSrc);
}









inline void _variant_t::Clear() throw(_com_error)
{
	_com_util::CheckError(::VariantClear(this));
}

inline void _variant_t::Attach(VARIANT& varSrc) throw(_com_error)
{
	
	
	
	Clear();

	
	
	
	memcpy(this, &varSrc, sizeof(varSrc));
	((&varSrc)->vt) = VT_EMPTY;
}

inline VARIANT _variant_t::Detach() throw(_com_error)
{
	VARIANT varResult = *this;
	((this)->vt) = VT_EMPTY;

	return varResult;
}




inline void _variant_t::ChangeType(VARTYPE vartype, const _variant_t* pSrc) throw(_com_error)
{
	
	
	
	if (pSrc == 0) {
		pSrc = this;
	}

	if ((this != pSrc) || (vartype != ((this)->vt))) {
		_com_util::CheckError(::VariantChangeType(static_cast<VARIANT*>(this),
												  const_cast<VARIANT*>(static_cast<const VARIANT*>(pSrc)),
												  0, vartype));
	}
}

inline void _variant_t::SetString(const char* pSrc) throw(_com_error)
{
	
	
	
	Clear();

	((this)->vt) = VT_BSTR;
	((this)->bstrVal) = _com_util::ConvertStringToBSTR(pSrc);

	if (((this)->bstrVal) == 0 && pSrc != 0) {
		_com_issue_error(((HRESULT)0x8007000EL));
	}
}







inline _variant_t::~_variant_t() throw(_com_error)
{
	_com_util::CheckError(::VariantClear(this));
}









inline _bstr_t::_bstr_t(const _variant_t &var) throw(_com_error)
	: m_Data(0)
{
	if (((&var)->vt) == VT_BSTR) {
		*this = ((&var)->bstrVal);
		return;
	}

	_variant_t varDest;

	varDest.ChangeType(VT_BSTR, &var);

	*this = ((&varDest)->bstrVal);
}



inline _bstr_t& _bstr_t::operator=(const _variant_t &var) throw(_com_error)
{
	if (((&var)->vt) == VT_BSTR) {
		*this = ((&var)->bstrVal);
		return *this;
	}

	_variant_t varDest;

	varDest.ChangeType(VT_BSTR, &var);

	*this = ((&varDest)->bstrVal);

	return *this;
}

extern _variant_t vtMissing;


#pragma once


#pragma comment(lib, "comsupp.lib")


#pragma comment(lib, "user32.lib")
#pragma comment(lib, "ole32.lib")
#pragma comment(lib, "oleaut32.lib")

class _com_error;

void __stdcall
	_com_issue_error(HRESULT) throw(_com_error);
void __stdcall
	_com_issue_errorex(HRESULT, IUnknown*, const IID &) throw(_com_error);

HRESULT __stdcall
	_com_dispatch_propget(IDispatch*, DISPID, VARTYPE, void*) throw(_com_error);
HRESULT __cdecl
	_com_dispatch_propput(IDispatch*, DISPID, VARTYPE, ...) throw(_com_error);
HRESULT __cdecl
	_com_dispatch_method(IDispatch*, DISPID, WORD, VARTYPE, void*,
						 const wchar_t*, ...) throw(_com_error);

HRESULT __stdcall
	_com_dispatch_raw_propget(IDispatch*, DISPID, VARTYPE, void*) throw();
HRESULT __cdecl
	_com_dispatch_raw_propput(IDispatch*, DISPID, VARTYPE, ...) throw();
HRESULT __cdecl
	_com_dispatch_raw_method(IDispatch*, DISPID, WORD, VARTYPE, void*,
							 const wchar_t*, ...) throw();

class _com_error {
public:
	
	
	_com_error(HRESULT hr, IErrorInfo* perrinfo = 0) throw();
	_com_error(const _com_error& that) throw();

	
	
	virtual ~_com_error() throw();

	
	
	_com_error& operator=(const _com_error& that) throw();

	
	
	HRESULT Error() const throw();
	WORD WCode() const throw();
	IErrorInfo * ErrorInfo() const throw();

	
	
	_bstr_t Description() const throw(_com_error);
	DWORD HelpContext() const throw();
	_bstr_t HelpFile() const throw(_com_error);
	_bstr_t Source() const throw(_com_error);
	GUID GUID() const throw();

	
	const TCHAR * ErrorMessage() const throw();

	
	static HRESULT WCodeToHRESULT(WORD wCode) throw();
	static WORD HRESULTToWCode(HRESULT hr) throw();

private:
	enum {
		WCODE_HRESULT_FIRST = ((HRESULT) (((unsigned long)(1)<<31) | ((unsigned long)(4)<<16) | ((unsigned long)(0x200))) ),
		WCODE_HRESULT_LAST = ((HRESULT) (((unsigned long)(1)<<31) | ((unsigned long)(4+1)<<16) | ((unsigned long)(0))) ) - 1
	};
	const HRESULT			m_hresult;
	IErrorInfo *			m_perrinfo;
	mutable TCHAR *			m_pszMsg;
};

inline _com_error::_com_error(HRESULT hr, IErrorInfo* perrinfo) throw()
	: m_hresult(hr), m_perrinfo(perrinfo), m_pszMsg(0)
{
	if (m_perrinfo != 0) {
		m_perrinfo->AddRef();
	}
}

inline _com_error::_com_error(const _com_error& that) throw()
	: m_hresult(that.m_hresult), m_perrinfo(that.m_perrinfo), m_pszMsg(0)
{
	if (m_perrinfo != 0) {
		m_perrinfo->AddRef();
	}
}

inline _com_error::~_com_error() throw()
{
	if (m_perrinfo != 0) {
		m_perrinfo->Release();
	}
	if (m_pszMsg != 0) {
		LocalFree((HLOCAL)m_pszMsg);
	}
}

inline _com_error& _com_error::operator=(const _com_error& that) throw()
{
	if (this != &that) {
		this->_com_error::~_com_error();
		this->_com_error::_com_error(that);
	}
	return *this;
}

inline HRESULT _com_error::Error() const throw()
{
	return m_hresult;
}

inline WORD _com_error::WCode() const throw()
{
	return HRESULTToWCode(m_hresult);
}

inline IErrorInfo * _com_error::ErrorInfo() const throw()
{
	if (m_perrinfo != 0) {
		m_perrinfo->AddRef();
	}
	return m_perrinfo;
}

inline _bstr_t _com_error::Description() const throw(_com_error)
{
	BSTR bstr = 0;
	if (m_perrinfo != 0) {
		m_perrinfo->GetDescription(&bstr);
	}
	return _bstr_t(bstr, false);
}

inline DWORD _com_error::HelpContext() const throw()
{
	DWORD dwHelpContext = 0;
	if (m_perrinfo != 0) {
		m_perrinfo->GetHelpContext(&dwHelpContext);
	}
	return dwHelpContext;
}

inline _bstr_t _com_error::HelpFile() const throw(_com_error)
{
	BSTR bstr = 0;
	if (m_perrinfo != 0) {
		m_perrinfo->GetHelpFile(&bstr);
	}
	return _bstr_t(bstr, false);
}

inline _bstr_t _com_error::Source() const throw(_com_error)
{
	BSTR bstr = 0;
	if (m_perrinfo != 0) {
		m_perrinfo->GetSource(&bstr);
	}
	return _bstr_t(bstr, false);
}

inline _GUID _com_error::GUID() const throw()
{
	_GUID guid;
	memcpy(&guid, &__uuidof(0), sizeof(_GUID));
	if (m_perrinfo != 0) {
		m_perrinfo->GetGUID(&guid);
	}
	return guid;
}

inline const TCHAR * _com_error::ErrorMessage() const throw()
{
	if (m_pszMsg == 0) {
		FormatMessageA(0x00000100|0x00001000,
					  0,
					  m_hresult,
					  ((((WORD )(0x01)) << 10) | (WORD )(0x00)),
					  (LPTSTR)&m_pszMsg,
					  0,
					  0 );
		if (m_pszMsg != 0) {
			int nLen = lstrlenA(m_pszMsg);
			if (nLen > 1 && m_pszMsg[nLen - 1] == '\n') {
				m_pszMsg[nLen - 1] == 0;
			}
		} else {
			m_pszMsg = (LPTSTR)LocalAlloc(0, 32 * sizeof(TCHAR));
			if (m_pszMsg != 0) {
				WORD wCode = WCode();
				if (wCode != 0) {
					wsprintfA(m_pszMsg, "IDispatch error #%d", wCode);
				} else {
					wsprintfA(m_pszMsg, "Unknown error 0x%0lX", m_hresult);
				}
			}
		}
	}
	return m_pszMsg;
}

inline HRESULT _com_error::WCodeToHRESULT(WORD wCode) throw()
{
	return wCode >= 0xFE00 ? WCODE_HRESULT_LAST : WCODE_HRESULT_FIRST + wCode;
}

inline WORD _com_error::HRESULTToWCode(HRESULT hr) throw()
{
	return (hr >= WCODE_HRESULT_FIRST && hr <= WCODE_HRESULT_LAST)
		? WORD(hr - WCODE_HRESULT_FIRST)
		: 0;
}


#pragma once
class _com_error;

void __stdcall _com_issue_error(HRESULT);
struct __declspec(uuid("00000000-0000-0000-c000-000000000046")) IUnknown;



template<typename _Interface, const IID* _IID > class _com_IIID {
public:
	typedef _Interface Interface;

	static _Interface* GetInterfacePtr() throw()
	{
		return 0;
	}

	static _Interface& GetInterface() throw()
	{
		return *GetInterfacePtr();
	}

	static const IID& GetIID() throw()
	{
		return *_IID;
	}
};

template<typename _IIID> class _com_ptr_t {
public:
	
	
	
	typedef _IIID ThisIIID;
	typedef typename _IIID::Interface Interface;
	
	static const IID& GetIID() throw()
	{ 
		return ThisIIID::GetIID(); 
	}

	
	
	template<typename _InterfacePtr> _com_ptr_t(const _InterfacePtr& p) throw(_com_error)
		: m_pInterface(0)
	{
		if (p) {
			HRESULT hr = _QueryInterface(p);

			if (((HRESULT)(hr)<0) && (hr != ((HRESULT)0x80004002L))) {
				_com_issue_error(hr);
			}
		}
	}

	
	_com_ptr_t() throw()
		: m_pInterface(0)
	{
	}

	
	
	
	_com_ptr_t(int null) throw(_com_error)
		: m_pInterface(0)
	{
		if (null != 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}
	}

	
	template<> _com_ptr_t(const _com_ptr_t& cp) throw()
		: m_pInterface(cp.m_pInterface)
	{ 
		_AddRef(); 
	}

	
	
	_com_ptr_t(Interface* pInterface) throw()
		: m_pInterface(pInterface)
	{ 
		_AddRef(); 
	}

	
	
	
	_com_ptr_t(Interface* pInterface, bool fAddRef) throw()
		: m_pInterface(pInterface)
	{
		if (fAddRef) {
			_AddRef();
		}
	}

	
	
	template<> _com_ptr_t(const _variant_t& varSrc) throw(_com_error)
		: m_pInterface(0)
	{
		HRESULT hr = QueryStdInterfaces(varSrc);

		if (((HRESULT)(hr)<0) && (hr != ((HRESULT)0x80004002L))) {
			_com_issue_error(hr);
		}
	}

	
	
	explicit _com_ptr_t(const CLSID& clsid, IUnknown* pOuter = 0, DWORD dwClsContext = (CLSCTX_INPROC_SERVER| CLSCTX_INPROC_HANDLER| CLSCTX_LOCAL_SERVER )) throw(_com_error)
		: m_pInterface(0)
	{
		HRESULT hr = CreateInstance(clsid, pOuter, dwClsContext);

		if (((HRESULT)(hr)<0) && (hr != ((HRESULT)0x80004002L))) {
			_com_issue_error(hr);
		}
	}

	
	
	
	explicit _com_ptr_t(LPOLESTR str, IUnknown* pOuter = 0, DWORD dwClsContext = (CLSCTX_INPROC_SERVER| CLSCTX_INPROC_HANDLER| CLSCTX_LOCAL_SERVER )) throw(_com_error)
		: m_pInterface(0)
	{
		HRESULT hr = CreateInstance(str, pOuter, dwClsContext);

		if (((HRESULT)(hr)<0) && (hr != ((HRESULT)0x80004002L))) {
			_com_issue_error(hr);
		}
	}

	
	
	
	explicit _com_ptr_t(LPCSTR str, IUnknown* pOuter = 0, DWORD dwClsContext = (CLSCTX_INPROC_SERVER| CLSCTX_INPROC_HANDLER| CLSCTX_LOCAL_SERVER )) throw(_com_error)
		: m_pInterface(0)
	{
		HRESULT hr = CreateInstance(str, pOuter, dwClsContext);

		if (((HRESULT)(hr)<0) && (hr != ((HRESULT)0x80004002L))) {
			_com_issue_error(hr);
		}
	}

	
	
	template<typename _InterfacePtr> _com_ptr_t& operator=(const _InterfacePtr& p) throw(_com_error)
	{
		HRESULT hr = _QueryInterface(p);

		if (((HRESULT)(hr)<0) && (hr != ((HRESULT)0x80004002L))) {
			_com_issue_error(hr);
		}

		return *this;
	}

	
	
	_com_ptr_t& operator=(Interface* pInterface) throw()
	{
		if (m_pInterface != pInterface) {
			Interface* pOldInterface = m_pInterface;

			m_pInterface = pInterface;

			_AddRef();

			if (pOldInterface != 0) {
				pOldInterface->Release();
			}
		}

		return *this;
	}

	
	
	template<> _com_ptr_t& operator=(const _com_ptr_t& cp) throw()
	{ 
		return operator=(cp.m_pInterface); 
	}

	
	
	
	_com_ptr_t& operator=(int null) throw(_com_error)
	{
		if (null != 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return operator=(reinterpret_cast<Interface*>(0));
	}

	
	
	template<> _com_ptr_t& operator=(const _variant_t& varSrc) throw(_com_error)
	{
		Interface* pOldInterface = m_pInterface;
		HRESULT hr = QueryStdInterfaces(varSrc);

		if (((HRESULT)(hr)<0) && (hr != ((HRESULT)0x80004002L))) {
			_com_issue_error(hr);
		}

		_AddRef();

		if (pOldInterface != 0) {
			pOldInterface->Release();
		}

		return *this;
	}

	
	
	
	
	~_com_ptr_t() throw()
	{ 
		_Release(); 
	}

	
	
	
	void Attach(Interface* pInterface) throw()
	{
		_Release();
		m_pInterface = pInterface;
	}

	
	
	
	void Attach(Interface* pInterface, bool fAddRef) throw()
	{
		_Release();
		m_pInterface = pInterface;

		if (fAddRef) {
			if (pInterface != 0) {
				pInterface->AddRef();
			}
		}
	}

	
	
	Interface* Detach() throw()
	{
		Interface* const old=m_pInterface;
		m_pInterface = 0;
		return old;
	}

	
	
	operator Interface*() const throw()
	{ 
		return m_pInterface; 
	}

	
	
	
	operator Interface&() const throw(_com_error)
	{ 
		if (m_pInterface == 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return *m_pInterface; 
	}

	
	
	
	Interface& operator*() const throw(_com_error)
	{ 
		if (m_pInterface == 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return *m_pInterface; 
	}

	
	
	
	
	Interface** operator&() throw()
	{
		_Release();
		m_pInterface = 0;
		return &m_pInterface;
	}

	
	
	
	Interface* operator->() const throw(_com_error)
	{ 
		if (m_pInterface == 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return m_pInterface; 
	}

	
	
	
	
	operator bool() const throw()
	{ 
		return m_pInterface != 0; 
	}

	
	
	template<typename _InterfacePtr> bool operator==(_InterfacePtr p) throw(_com_error)
	{
		return _CompareUnknown(p) == 0;
	}

	
	
	template<> bool operator==(Interface* p) throw(_com_error)
	{
		return (m_pInterface == p) ? true : _CompareUnknown(p) == 0;
	}

	
	
	template<> bool operator==(_com_ptr_t& p) throw()
	{
		return operator==(p.m_pInterface);
	}

	
	
	template<> bool operator==(int null) throw(_com_error)
	{
		if (null != 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return m_pInterface == 0;
	}

	
	
	template<typename _InterfacePtr> bool operator!=(_InterfacePtr p) throw(_com_error)
	{
		return _CompareUnknown(p) != 0;
	}

	
	
	template<> bool operator!=(Interface* p) throw(_com_error)
	{
		return (m_pInterface != p) ? true : _CompareUnknown(p) != 0;
	}

	
	
	template<> bool operator!=(_com_ptr_t& p) throw(_com_error)
	{
		return operator!=(p.m_pInterface);
	}

	
	
	template<> bool operator!=(int null) throw(_com_error)
	{
		if (null != 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return m_pInterface != 0;
	}

	
	
	template<typename _InterfacePtr> bool operator<(_InterfacePtr p) throw(_com_error)
	{
		return _CompareUnknown(p) < 0;
	}

	
	
	template<> bool operator<(Interface* p) throw(_com_error)
	{
		return (m_pInterface < p) ? true : _CompareUnknown(p) < 0;
	}

	
	
	template<> bool operator<(_com_ptr_t& p) throw(_com_error)
	{
		return operator<(p.m_pInterface);
	}

	
	
	template<> bool operator<(int null) throw(_com_error)
	{
		if (null != 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return m_pInterface < 0;
	}

	
	
	template<typename _InterfacePtr> bool operator>(_InterfacePtr p) throw(_com_error)
	{
		return _CompareUnknown(p) > 0;
	}

	
	
	template<> bool operator>(Interface* p) throw()
	{
		return (m_pInterface > p) ? true : _CompareUnknown(p) > 0;
	}

	
	
	template<> bool operator>(_com_ptr_t& p) throw(_com_error)
	{
		return operator>(p.m_pInterface);
	}

	
	
	template<> bool operator>(int null) throw(_com_error)
	{
		if (null != 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return m_pInterface > 0;
	}

	
	
	template<typename _InterfacePtr> bool operator<=(_InterfacePtr p) throw(_com_error)
	{
		return _CompareUnknown(p) <= 0;
	}

	
	
	template<> bool operator<=(Interface* p) throw()
	{
		return (m_pInterface <= p) ? true : _CompareUnknown(p) <= 0;
	}

	
	
	template<> bool operator<=(_com_ptr_t& p) throw(_com_error)
	{
		return operator<=(p.m_pInterface);
	}

	
	
	template<> bool operator<=(int null) throw(_com_error)
	{
		if (null != 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return m_pInterface <= 0;
	}

	
	
	template<typename _InterfacePtr> bool operator>=(_InterfacePtr p) throw(_com_error)
	{
		return _CompareUnknown(p) >= 0;
	}

	
	
	template<> bool operator>=(Interface* p) throw(_com_error)
	{
		return (m_pInterface >= p) ? true : _CompareUnknown(p) >= 0;
	}

	
	
	template<> bool operator>=(_com_ptr_t& p) throw(_com_error)
	{
		return operator>=(p.m_pInterface);
	}

	
	
	template<> bool operator>=(int null) throw(_com_error)
	{
		if (null != 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		return m_pInterface >= 0;
	}

	
	
	void Release() throw(_com_error)
	{
		if (m_pInterface == 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		m_pInterface->Release();
		m_pInterface = 0;
	}

	
	
	void AddRef() throw(_com_error)
	{ 
		if (m_pInterface == 0) {
			_com_issue_error(((HRESULT)0x80004003L));
		}

		m_pInterface->AddRef(); 
	}

	
	
	Interface* GetInterfacePtr() const throw()
	{ 
		return m_pInterface; 
	}

	
	
	
	HRESULT CreateInstance(const CLSID& rclsid, IUnknown* pOuter = 0, DWORD dwClsContext = (CLSCTX_INPROC_SERVER| CLSCTX_INPROC_HANDLER| CLSCTX_LOCAL_SERVER )) throw()
	{
		HRESULT hr;

		_Release();

		if (dwClsContext & (CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER)) {
			IUnknown* pIUnknown;

			hr = CoCreateInstance(rclsid, pOuter, dwClsContext, __uuidof(IUnknown), reinterpret_cast<void**>(&pIUnknown));

			if (((HRESULT)(hr)<0)) {
				return hr;
			}

			hr = OleRun(pIUnknown);

			if (((HRESULT)(hr)<0)) {
				return hr;
			}

			hr = pIUnknown->QueryInterface(GetIID(), reinterpret_cast<void**>(&m_pInterface));

			if (((HRESULT)(hr)<0)) {
				return hr;
			}

			pIUnknown->Release();
		}
		else {
			hr = CoCreateInstance(rclsid, pOuter, dwClsContext, GetIID(), reinterpret_cast<void**>(&m_pInterface));
		}

		return hr;
	}

	
	
	
	HRESULT CreateInstance(LPOLESTR clsidString, IUnknown* pOuter = 0, DWORD dwClsContext = (CLSCTX_INPROC_SERVER| CLSCTX_INPROC_HANDLER| CLSCTX_LOCAL_SERVER )) throw()
	{
		if (clsidString == 0) {
			return ((HRESULT)0x80070057L);
		}

		CLSID clsid;
		HRESULT hr;

		if (clsidString[0] == '{') {
			hr = CLSIDFromString(clsidString, &clsid);
		}
		else {
			hr = CLSIDFromProgID(clsidString, &clsid);
		}

		if (((HRESULT)(hr)<0)) {
			return hr;
		}

		return CreateInstance(clsid, pOuter, dwClsContext);
	}

	
	
	
	HRESULT CreateInstance(LPCSTR clsidStringA, IUnknown* pOuter = 0, DWORD dwClsContext = (CLSCTX_INPROC_SERVER| CLSCTX_INPROC_HANDLER| CLSCTX_LOCAL_SERVER )) throw()
	{
		if (clsidStringA == 0) {
			return ((HRESULT)0x80070057L);
		}

		int size = lstrlenA(clsidStringA) + 1;
		LPOLESTR clsidStringW = static_cast<LPOLESTR>(_alloca(size * 2));

		clsidStringW[0] = '\0';

		if (MultiByteToWideChar(0, 0, clsidStringA, -1, clsidStringW, size) == 0) {
			return GetLastError();
		}

		return CreateInstance(clsidStringW, pOuter, dwClsContext);
	}

	
	
	
	HRESULT GetActiveObject(const CLSID& rclsid) throw()
	{
		_Release();

		IUnknown* pIUnknown;

		HRESULT hr = ::GetActiveObject(rclsid, 0, &pIUnknown);

		if (((HRESULT)(hr)<0)) {
			return hr;
		}

		hr = pIUnknown->QueryInterface(GetIID(), reinterpret_cast<void**>(&m_pInterface));

		if (((HRESULT)(hr)<0)) {
			return hr;
		}

		pIUnknown->Release();

		return hr;
	}

	
	
	
	HRESULT GetActiveObject(LPOLESTR clsidString) throw()
	{
		if (clsidString == 0) {
			return ((HRESULT)0x80070057L);
		}

		CLSID clsid;
		HRESULT hr;

		if (clsidString[0] == '{') {
			hr = CLSIDFromString(clsidString, &clsid);
		}
		else {
			hr = CLSIDFromProgID(clsidString, &clsid);
		}

		if (((HRESULT)(hr)<0)) {
			return hr;
		}

		return GetActiveObject(clsid);
	}

	
	
	
	HRESULT GetActiveObject(LPCSTR clsidStringA) throw()
	{
		if (clsidStringA == 0) {
			return ((HRESULT)0x80070057L);
		}

		int size = lstrlenA(clsidStringA) + 1;
		LPOLESTR clsidStringW = static_cast<LPOLESTR>(_alloca(size * 2));

		clsidStringW[0] = '\0';

		if (MultiByteToWideChar(0, 0, clsidStringA, -1, clsidStringW, size) == 0) {
			return GetLastError();
		}

		return GetActiveObject(clsidStringW);
	}

	
	
	
	template<typename _InterfaceType> HRESULT QueryInterface(const IID& iid, _InterfaceType*& p) throw ()
	{
		if (m_pInterface != 0) {
			return m_pInterface->QueryInterface(iid, reinterpret_cast<void**>(&p));
		}

		return ((HRESULT)0x80004003L);
	}

	
	
	
	template<typename _InterfaceType> HRESULT QueryInterface(const IID& iid, _InterfaceType** p) throw()
	{
		return QueryInterface(iid, *p);
	}

private:
	
	
	Interface* m_pInterface;

	
	
	
	void _Release() throw()
	{
		if (m_pInterface != 0) {
			m_pInterface->Release();
		}
	}

	
	
	void _AddRef() throw()
	{
		if (m_pInterface != 0) {
			m_pInterface->AddRef();
		}
	}

	
	
	
	
	
	template<typename _InterfacePtr> HRESULT _QueryInterface(const _InterfacePtr& p) throw()
	{
		HRESULT hr;

		
		
		if (p) {
			
			
			Interface* pInterface;
			hr = p->QueryInterface(GetIID(), reinterpret_cast<void**>(&pInterface));

			if (((HRESULT)(hr)<0)) {
				
				
				Attach(0);
				return hr;
			}

			
			
			Attach(pInterface);
		}
		else {
			operator=(static_cast<Interface*>(0));
			hr = ((HRESULT)0x80004002L);
		}

		return hr;
	}

	
	
	
	template<typename _InterfacePtr> int _CompareUnknown(_InterfacePtr p) throw(_com_error)
	{
		IUnknown* pu1, *pu2;

		if (m_pInterface != 0) {
			HRESULT hr = m_pInterface->QueryInterface(__uuidof(IUnknown), reinterpret_cast<void**>(&pu1));

			if (((HRESULT)(hr)<0)) {
				_com_issue_error(hr);
			}

			pu1->Release();
		}
		else {
			pu1 = 0;
		}

		if (p) {
			HRESULT hr = p->QueryInterface(__uuidof(IUnknown), reinterpret_cast<void**>(&pu2));

			if (((HRESULT)(hr)<0)) {
				_com_issue_error(hr);
			}

			pu2->Release();
		}
		else {
			pu2 = 0;
		}

		return pu1 - pu2;
	}

	
	
	
	HRESULT QueryStdInterfaces(const _variant_t& varSrc) throw()
	{
		if (((&varSrc)->vt) == VT_DISPATCH) {
			return _QueryInterface(((&varSrc)->pdispVal));
		}

		if (((&varSrc)->vt) == VT_UNKNOWN) {
			return _QueryInterface(((&varSrc)->punkVal));
		}

		
		
		
		
		VARIANT varDest;
		VariantInit(&varDest);

		HRESULT hr = VariantChangeType(&varDest, const_cast<VARIANT*>(static_cast<const VARIANT*>(&varSrc)), 0, VT_DISPATCH);
		if (((HRESULT)(hr) >= 0)) {
			hr = _QueryInterface(((&varSrc)->pdispVal));
		}

		if (((HRESULT)(hr)<0) && (hr == ((HRESULT)0x80004002L))) {
			
			
			VariantInit(&varDest);
			hr = VariantChangeType(&varDest, const_cast<VARIANT*>(static_cast<const VARIANT*>(&varSrc)), 0, VT_UNKNOWN);
			if (((HRESULT)(hr) >= 0)) {
				hr = _QueryInterface(((&varSrc)->punkVal));
			}
		}

		VariantClear(&varDest);
		return hr;
	}
};



template<typename _InterfaceType> bool operator==(int null, _com_ptr_t<_InterfaceType>& p) throw(_com_error)
{
	if (null != 0) {
		_com_issue_error(((HRESULT)0x80004003L));
	}

	return p == 0;
}

template<typename _Interface, typename _InterfacePtr> bool operator==(_Interface* i, _com_ptr_t<_InterfacePtr>& p) throw(_com_error)
{
	return p == i;
}

template<typename _Interface> bool operator!=(int null, _com_ptr_t<_Interface>& p) throw(_com_error)
{
	if (null != 0) {
		_com_issue_error(((HRESULT)0x80004003L));
	}

	return p != 0;
}

template<typename _Interface, typename _InterfacePtr> bool operator!=(_Interface* i, _com_ptr_t<_InterfacePtr>& p) throw(_com_error)
{
	return p != i;
}

template<typename _Interface> bool operator<(int null, _com_ptr_t<_Interface>& p) throw(_com_error)
{
	if (null != 0) {
		_com_issue_error(((HRESULT)0x80004003L));
	}

	return p < 0;
}

template<typename _Interface, typename _InterfacePtr> bool operator<(_Interface* i, _com_ptr_t<_InterfacePtr>& p) throw(_com_error)
{
	return p < i;
}

template<typename _Interface> bool operator>(int null, _com_ptr_t<_Interface>& p) throw(_com_error)
{
	if (null != 0) {
		_com_issue_error(((HRESULT)0x80004003L));
	}

	return p > 0;
}

template<typename _Interface, typename _InterfacePtr> bool operator>(_Interface* i, _com_ptr_t<_InterfacePtr>& p) throw(_com_error)
{
	return p > i;
}

template<typename _Interface> bool operator<=(int null, _com_ptr_t<_Interface>& p) throw(_com_error)
{
	if (null != 0) {
		_com_issue_error(((HRESULT)0x80004003L));
	}

	return p <= 0;
}

template<typename _Interface, typename _InterfacePtr> bool operator<=(_Interface* i, _com_ptr_t<_InterfacePtr>& p) throw(_com_error)
{
	return p <= i;
}

template<typename _Interface> bool operator>=(int null, _com_ptr_t<_Interface>& p) throw(_com_error)
{
	if (null != 0) {
		_com_issue_error(((HRESULT)0x80004003L));
	}

	return p >= 0;
}

template<typename _Interface, typename _InterfacePtr> bool operator>=(_Interface* i, _com_ptr_t<_InterfacePtr>& p) throw(_com_error)
{
	return p >= i;
}



struct __declspec(uuid("00000000-0000-0000-c000-000000000046")) IUnknown;
struct __declspec(uuid("00020400-0000-0000-c000-000000000046")) IDispatch;

struct __declspec(uuid("00000001-0000-0000-c000-000000000046")) IClassFactory;
struct __declspec(uuid("00000002-0000-0000-c000-000000000046")) IMalloc;
struct __declspec(uuid("00000003-0000-0000-c000-000000000046")) IMarshal;
struct __declspec(uuid("00000004-0000-0000-c000-000000000046")) IRpcChannel;
struct __declspec(uuid("00000005-0000-0000-c000-000000000046")) IRpcStub;
struct __declspec(uuid("00000006-0000-0000-c000-000000000046")) IStubManager;
struct __declspec(uuid("00000007-0000-0000-c000-000000000046")) IRpcProxy;
struct __declspec(uuid("00000008-0000-0000-c000-000000000046")) IProxyManager;
struct __declspec(uuid("00000009-0000-0000-c000-000000000046")) IPSFactory;
struct __declspec(uuid("0000000a-0000-0000-c000-000000000046")) ILockBytes;
struct __declspec(uuid("0000000b-0000-0000-c000-000000000046")) IStorage;
struct __declspec(uuid("0000000c-0000-0000-c000-000000000046")) IStream;
struct __declspec(uuid("0000000d-0000-0000-c000-000000000046")) IEnumSTATSTG;
struct __declspec(uuid("0000000e-0000-0000-c000-000000000046")) IBindCtx;
struct __declspec(uuid("0000000f-0000-0000-c000-000000000046")) IMoniker;
struct __declspec(uuid("00000010-0000-0000-c000-000000000046")) IRunningObjectTable;
struct __declspec(uuid("00000011-0000-0000-c000-000000000046")) IInternalMoniker;
struct __declspec(uuid("00000012-0000-0000-c000-000000000046")) IRootStorage;
struct __declspec(uuid("00000013-0000-0000-c000-000000000046")) IDfReserved1;
struct __declspec(uuid("00000014-0000-0000-c000-000000000046")) IDfReserved2;
struct __declspec(uuid("00000015-0000-0000-c000-000000000046")) IDfReserved3;
struct __declspec(uuid("00000016-0000-0000-c000-000000000046")) IMessageFilter;
struct __declspec(uuid("00000018-0000-0000-c000-000000000046")) IStdMarshalInfo;
struct __declspec(uuid("00000019-0000-0000-c000-000000000046")) IExternalConnection;
struct __declspec(uuid("0000001d-0000-0000-c000-000000000046")) IMallocSpy;
struct __declspec(uuid("00000020-0000-0000-c000-000000000046")) IMultiQI;
struct __declspec(uuid("00000026-0000-0000-c000-000000000046")) IStub;
struct __declspec(uuid("00000027-0000-0000-c000-000000000046")) IProxy;
struct __declspec(uuid("00000100-0000-0000-c000-000000000046")) IEnumUnknown;
struct __declspec(uuid("00000101-0000-0000-c000-000000000046")) IEnumString;
struct __declspec(uuid("00000102-0000-0000-c000-000000000046")) IEnumMoniker;
struct __declspec(uuid("00000103-0000-0000-c000-000000000046")) IEnumFORMATETC;
struct __declspec(uuid("00000104-0000-0000-c000-000000000046")) IEnumOLEVERB;
struct __declspec(uuid("00000105-0000-0000-c000-000000000046")) IEnumSTATDATA;
struct __declspec(uuid("00000106-0000-0000-c000-000000000046")) IEnumGeneric;
struct __declspec(uuid("00000107-0000-0000-c000-000000000046")) IEnumHolder;
struct __declspec(uuid("00000108-0000-0000-c000-000000000046")) IEnumCallback;
struct __declspec(uuid("00000109-0000-0000-c000-000000000046")) IPersistStream;
struct __declspec(uuid("0000010a-0000-0000-c000-000000000046")) IPersistStorage;
struct __declspec(uuid("0000010b-0000-0000-c000-000000000046")) IPersistFile;
struct __declspec(uuid("0000010c-0000-0000-c000-000000000046")) IPersist;
struct __declspec(uuid("0000010d-0000-0000-c000-000000000046")) IViewObject;
struct __declspec(uuid("0000010e-0000-0000-c000-000000000046")) IDataObject;
struct __declspec(uuid("0000010f-0000-0000-c000-000000000046")) IAdviseSink;
struct __declspec(uuid("00000110-0000-0000-c000-000000000046")) IDataAdviseHolder;
struct __declspec(uuid("00000111-0000-0000-c000-000000000046")) IOleAdviseHolder;
struct __declspec(uuid("00000112-0000-0000-c000-000000000046")) IOleObject;
struct __declspec(uuid("00000113-0000-0000-c000-000000000046")) IOleInPlaceObject;
struct __declspec(uuid("00000114-0000-0000-c000-000000000046")) IOleWindow;
struct __declspec(uuid("00000115-0000-0000-c000-000000000046")) IOleInPlaceUIWindow;
struct __declspec(uuid("00000116-0000-0000-c000-000000000046")) IOleInPlaceFrame;
struct __declspec(uuid("00000117-0000-0000-c000-000000000046")) IOleInPlaceActiveObject;
struct __declspec(uuid("00000118-0000-0000-c000-000000000046")) IOleClientSite;
struct __declspec(uuid("00000119-0000-0000-c000-000000000046")) IOleInPlaceSite;
struct __declspec(uuid("0000011a-0000-0000-c000-000000000046")) IParseDisplayName;
struct __declspec(uuid("0000011b-0000-0000-c000-000000000046")) IOleContainer;
struct __declspec(uuid("0000011c-0000-0000-c000-000000000046")) IOleItemContainer;
struct __declspec(uuid("0000011d-0000-0000-c000-000000000046")) IOleLink;
struct __declspec(uuid("0000011e-0000-0000-c000-000000000046")) IOleCache;
struct __declspec(uuid("0000011f-0000-0000-c000-000000000046")) IOleManager;
struct __declspec(uuid("00000120-0000-0000-c000-000000000046")) IOlePresObj;
struct __declspec(uuid("00000121-0000-0000-c000-000000000046")) IDropSource;
struct __declspec(uuid("00000122-0000-0000-c000-000000000046")) IDropTarget;
struct __declspec(uuid("00000123-0000-0000-c000-000000000046")) IDebug;
struct __declspec(uuid("00000124-0000-0000-c000-000000000046")) IDebugStream;
struct __declspec(uuid("00000125-0000-0000-c000-000000000046")) IAdviseSink2;
struct __declspec(uuid("00000126-0000-0000-c000-000000000046")) IRunnableObject;
struct __declspec(uuid("00000127-0000-0000-c000-000000000046")) IViewObject2;
struct __declspec(uuid("00000128-0000-0000-c000-000000000046")) IOleCache2;
struct __declspec(uuid("00000129-0000-0000-c000-000000000046")) IOleCacheControl;
struct __declspec(uuid("0000012a-0000-0000-c000-000000000046")) IContinue;
struct __declspec(uuid("00000138-0000-0000-c000-000000000046")) IPropertyStorage;
struct __declspec(uuid("00000139-0000-0000-c000-000000000046")) IEnumSTATPROPSTG;
struct __declspec(uuid("0000013a-0000-0000-c000-000000000046")) IPropertySetStorage;
struct __declspec(uuid("0000013b-0000-0000-c000-000000000046")) IEnumSTATPROPSETSTG;
struct __declspec(uuid("0000013d-0000-0000-c000-000000000046")) IClientSecurity;
struct __declspec(uuid("0000013e-0000-0000-c000-000000000046")) IServerSecurity;
struct __declspec(uuid("00000140-0000-0000-c000-000000000046")) IClassActivator;
struct __declspec(uuid("00020401-0000-0000-c000-000000000046")) ITypeInfo;
struct __declspec(uuid("00020402-0000-0000-c000-000000000046")) ITypeLib;
struct __declspec(uuid("00020403-0000-0000-c000-000000000046")) ITypeComp;
struct __declspec(uuid("00020404-0000-0000-c000-000000000046")) IEnumVARIANT;
struct __declspec(uuid("00020405-0000-0000-c000-000000000046")) ICreateTypeInfo;
struct __declspec(uuid("00020406-0000-0000-c000-000000000046")) ICreateTypeLib;
struct __declspec(uuid("0002040e-0000-0000-c000-000000000046")) ICreateTypeInfo2;
struct __declspec(uuid("0002040f-0000-0000-c000-000000000046")) ICreateTypeLib2;
struct __declspec(uuid("00020410-0000-0000-c000-000000000046")) ITypeChangeEvents;
struct __declspec(uuid("00020411-0000-0000-c000-000000000046")) ITypeLib2;
struct __declspec(uuid("00020412-0000-0000-c000-000000000046")) ITypeInfo2;
struct __declspec(uuid("00020430-0000-0000-c000-000000000046")) StdOle;
struct __declspec(uuid("00020d00-0000-0000-c000-000000000046")) IRichEditOle;
struct __declspec(uuid("00020d03-0000-0000-c000-000000000046")) IRichEditOleCallback;
struct __declspec(uuid("0002e000-0000-0000-c000-000000000046")) IEnumGUID;
struct __declspec(uuid("0002e011-0000-0000-c000-000000000046")) IEnumCATEGORYINFO;
struct __declspec(uuid("0002e012-0000-0000-c000-000000000046")) ICatRegister;
struct __declspec(uuid("0002e013-0000-0000-c000-000000000046")) ICatInformation;
struct __declspec(uuid("6d5140c1-7436-11ce-8034-00aa006009fa")) IServiceProvider;
struct __declspec(uuid("37d84f60-42cb-11ce-8135-00aa004bb851")) IPersistPropertyBag;
struct __declspec(uuid("55272a00-42cb-11ce-8135-00aa004bb851")) IPropertyBag;
struct __declspec(uuid("3127ca40-446e-11ce-8135-00aa004bb851")) IErrorLog;
struct __declspec(uuid("9bfbbc00-eff1-101a-84ed-00aa00341d07")) IBoundObject;
struct __declspec(uuid("9bfbbc01-eff1-101a-84ed-00aa00341d07")) IBoundObjectSite;
struct __declspec(uuid("9bfbbc02-eff1-101a-84ed-00aa00341d07")) IPropertyNotifySink;
struct __declspec(uuid("01e44665-24ac-101b-84ed-08002b2ec713")) IPropertyPage2;
struct __declspec(uuid("376bd3aa-3845-101b-84ed-08002b2ec713")) IPerPropertyBrowsing;
struct __declspec(uuid("99caf010-415e-11cf-8814-00aa00b569f5")) IFillLockBytes;
struct __declspec(uuid("bef6e002-a874-101a-8bba-00aa00300cab")) IFont;
struct __declspec(uuid("bef6e003-a874-101a-8bba-00aa00300cab")) IFontDisp;
struct __declspec(uuid("7bf80980-bf32-101a-8bbb-00aa00300cab")) IPicture;
struct __declspec(uuid("7bf80981-bf32-101a-8bbb-00aa00300cab")) IPictureDisp;
struct __declspec(uuid("1c2056cc-5ef4-101b-8bc8-00aa003e3b29")) IOleInPlaceObjectWindowless;
struct __declspec(uuid("79eac9c0-baf9-11ce-8c82-00aa004ba90b")) IBinding;
struct __declspec(uuid("79eac9c1-baf9-11ce-8c82-00aa004ba90b")) IBindStatusCallback;
struct __declspec(uuid("79eac9c2-baf9-11ce-8c82-00aa004ba90b")) IHlinkSite;
struct __declspec(uuid("79eac9c3-baf9-11ce-8c82-00aa004ba90b")) IHlink;
struct __declspec(uuid("79eac9c4-baf9-11ce-8c82-00aa004ba90b")) IHlinkTarget;
struct __declspec(uuid("79eac9c5-baf9-11ce-8c82-00aa004ba90b")) IHlinkFrame;
struct __declspec(uuid("79eac9c6-baf9-11ce-8c82-00aa004ba90b")) IEnumHLITEM;
struct __declspec(uuid("79eac9c7-baf9-11ce-8c82-00aa004ba90b")) IHlinkBrowseContext;
struct __declspec(uuid("79eac9c9-baf9-11ce-8c82-00aa004ba90b")) IPersistMoniker;
struct __declspec(uuid("79eac9cb-baf9-11ce-8c82-00aa004ba90b")) IBindStatusCallbackMsg;
struct __declspec(uuid("79eac9cd-baf9-11ce-8c82-00aa004ba90b")) IBindProtocol;
struct __declspec(uuid("79eac9d0-baf9-11ce-8c82-00aa004ba90b")) IAuthenticate;
struct __declspec(uuid("79eac9d1-baf9-11ce-8c82-00aa004ba90b")) ICodeInstall;
struct __declspec(uuid("79eac9d2-baf9-11ce-8c82-00aa004ba90b")) IHttpNegotiate;
struct __declspec(uuid("79eac9d3-baf9-11ce-8c82-00aa004ba90b")) IAsyncMoniker;
struct __declspec(uuid("79eac9d5-bafa-11ce-8c82-00aa004ba90b")) IWindowForBindingUI;
struct __declspec(uuid("79eac9d6-bafa-11ce-8c82-00aa004ba90b")) IWinInetInfo;
struct __declspec(uuid("79eac9d7-bafa-11ce-8c82-00aa004ba90b")) IHttpSecurity;
struct __declspec(uuid("79eac9d8-bafa-11ce-8c82-00aa004ba90b")) IWinInetHttpInfo;
struct __declspec(uuid("1cf2b120-547d-101b-8e65-08002b2bd119")) IErrorInfo;
struct __declspec(uuid("22f03340-547d-101b-8e65-08002b2bd119")) ICreateErrorInfo;
struct __declspec(uuid("df0b3d60-548f-101b-8e65-08002b2bd119")) ISupportErrorInfo;
struct __declspec(uuid("d10f6761-83e9-11cf-8f20-00805f2cd064")) IActiveScriptSiteWindow;
struct __declspec(uuid("cb5bdc81-93c1-11cf-8f20-00805f2cd064")) IObjectSafety;
struct __declspec(uuid("db01a1e3-a42b-11cf-8f20-00805f2cd064")) IActiveScriptSite;
struct __declspec(uuid("eae1ba61-a4ed-11cf-8f20-00805f2cd064")) IActiveScriptError;
struct __declspec(uuid("bb1a2ae1-a4f9-11cf-8f20-00805f2cd064")) IActiveScript;
struct __declspec(uuid("bb1a2ae2-a4f9-11cf-8f20-00805f2cd064")) IActiveScriptParse;
struct __declspec(uuid("d5f78c80-5252-11cf-90fa-00aa0042106e")) ITargetFrame;
struct __declspec(uuid("742b0e01-14e6-101b-914e-00aa00300cab")) ISimpleFrameSite;
struct __declspec(uuid("a9d758a0-4617-11cf-95fc-00aa00680db4")) IProgressNotify;
struct __declspec(uuid("0e6d4d90-6738-11cf-9608-00aa00680db4")) ILayoutStorage;
struct __declspec(uuid("548793c0-9e74-11cf-9655-00a0c9034923")) ITargetEmbedding;
struct __declspec(uuid("1008c4a0-7613-11cf-9af1-0020af6e72f4")) IChannelHook;
struct __declspec(uuid("894ad3b0-ef97-11ce-9bc9-00aa00608e01")) IOleUndoUnit;
struct __declspec(uuid("a1faf330-ef97-11ce-9bc9-00aa00608e01")) IOleParentUndoUnit;
struct __declspec(uuid("b3e7c340-ef97-11ce-9bc9-00aa00608e01")) IEnumOleUndoUnits;
struct __declspec(uuid("d001f200-ef97-11ce-9bc9-00aa00608e01")) IOleUndoManager;
struct __declspec(uuid("a6bc3ac0-dbaa-11ce-9de3-00aa004bb851")) IProvideClassInfo2;
struct __declspec(uuid("3af24290-0c96-11ce-a0cf-00aa00600ab8")) IAdviseSinkEx;
struct __declspec(uuid("3af24292-0c96-11ce-a0cf-00aa00600ab8")) IViewObjectEx;
struct __declspec(uuid("fc4801a1-2ba9-11cf-a229-00aa003d7352")) IBindHost;
struct __declspec(uuid("fc4801a3-2ba9-11cf-a229-00aa003d7352")) IObjectWithSite;
struct __declspec(uuid("b722bcc5-4e68-101b-a2bc-00aa00404770")) IOleDocument;
struct __declspec(uuid("b722bcc6-4e68-101b-a2bc-00aa00404770")) IOleDocumentView;
struct __declspec(uuid("b722bcc7-4e68-101b-a2bc-00aa00404770")) IOleDocumentSite;
struct __declspec(uuid("b722bcc8-4e68-101b-a2bc-00aa00404770")) IEnumOleDocumentViews;
struct __declspec(uuid("b722bcc9-4e68-101b-a2bc-00aa00404770")) IPrint;
struct __declspec(uuid("b722bcca-4e68-101b-a2bc-00aa00404770")) IContinueCallback;
struct __declspec(uuid("b722bccb-4e68-101b-a2bc-00aa00404770")) IOleCommandTarget;
struct __declspec(uuid("f29f6bc0-5021-11ce-aa15-00006901293f")) IROTData;
struct __declspec(uuid("9f6aa700-d188-11cd-ad48-00aa003c9cb6")) ICursor;
struct __declspec(uuid("acff0690-d188-11cd-ad48-00aa003c9cb6")) ICursorMove;
struct __declspec(uuid("bb87e420-d188-11cd-ad48-00aa003c9cb6")) ICursorScroll;
struct __declspec(uuid("d14216a0-d188-11cd-ad48-00aa003c9cb6")) ICursorUpdateARow;
struct __declspec(uuid("db526cc0-d188-11cd-ad48-00aa003c9cb6")) INotifyDBEvents;
struct __declspec(uuid("e01d7850-d188-11cd-ad48-00aa003c9cb6")) ICursorFind;
struct __declspec(uuid("e4d19810-d188-11cd-ad48-00aa003c9cb6")) IEntryID;
struct __declspec(uuid("0c733a30-2a1c-11ce-ade5-00aa0044773d")) ISequentialStream;
struct __declspec(uuid("7fd52380-4e07-101b-ae2d-08002b2ec713")) IPersistStreamInit;
struct __declspec(uuid("49384070-e40a-11ce-b2c9-00aa00680937")) IOverlappedStream;
struct __declspec(uuid("521a28f0-e40b-11ce-b2c9-00aa00680937")) IOverlappedCompletion;
struct __declspec(uuid("d5f569d0-593b-101a-b569-08002b2dbf7a")) IPSFactoryBuffer;
struct __declspec(uuid("d5f56a34-593b-101a-b569-08002b2dbf7a")) IRpcProxyBuffer;
struct __declspec(uuid("d5f56afc-593b-101a-b569-08002b2dbf7a")) IRpcStubBuffer;
struct __declspec(uuid("d5f56b60-593b-101a-b569-08002b2dbf7a")) IRpcChannelBuffer;
struct __declspec(uuid("f4f569d0-593b-101a-b569-08002b2dbf7a")) IServerHandler;
struct __declspec(uuid("f4f569d1-593b-101a-b569-08002b2dbf7a")) IClientSiteHandler;
struct __declspec(uuid("922eada0-3424-11cf-b670-00aa004cd6d8")) IOleInPlaceSiteWindowless;
struct __declspec(uuid("9c2cad80-3424-11cf-b670-00aa004cd6d8")) IOleInPlaceSiteEx;
struct __declspec(uuid("55980ba0-35aa-11cf-b671-00aa004cd6d8")) IPointerInactive;
struct __declspec(uuid("b196b283-bab4-101a-b69c-00aa00341d07")) IProvideClassInfo;
struct __declspec(uuid("b196b284-bab4-101a-b69c-00aa00341d07")) IConnectionPointContainer;
struct __declspec(uuid("b196b285-bab4-101a-b69c-00aa00341d07")) IEnumConnectionPoints;
struct __declspec(uuid("b196b286-bab4-101a-b69c-00aa00341d07")) IConnectionPoint;
struct __declspec(uuid("b196b287-bab4-101a-b69c-00aa00341d07")) IEnumConnections;
struct __declspec(uuid("b196b288-bab4-101a-b69c-00aa00341d07")) IOleControl;
struct __declspec(uuid("b196b289-bab4-101a-b69c-00aa00341d07")) IOleControlSite;
struct __declspec(uuid("b196b28a-bab4-101a-b69c-00aa00341d07")) IPropertyFrame;
struct __declspec(uuid("b196b28b-bab4-101a-b69c-00aa00341d07")) ISpecifyPropertyPages;
struct __declspec(uuid("b196b28c-bab4-101a-b69c-00aa00341d07")) IPropertyPageSite;
struct __declspec(uuid("b196b28d-bab4-101a-b69c-00aa00341d07")) IPropertyPage;
struct __declspec(uuid("b196b28f-bab4-101a-b69c-00aa00341d07")) IClassFactory2;
struct __declspec(uuid("f77459a0-bf9a-11cf-ba4e-00c04fd70816")) IMimeInfo;
struct __declspec(uuid("89bcb740-6119-101a-bcb7-00dd010655af")) IFilter;
struct __declspec(uuid("bd1ae5e0-a6ae-11ce-bd37-504200c10000")) IPersistMemory;
struct __declspec(uuid("3c374a41-bae4-11cf-bf7d-00aa006946ee")) IUrlHistoryStg;
struct __declspec(uuid("3c374a42-bae4-11cf-bf7d-00aa006946ee")) IEnumSTATURL;
struct __declspec(uuid("cf51ed10-62fe-11cf-bf86-00a0c9034836")) IQuickActivate;


struct __declspec(uuid("00000017-0000-0000-c000-000000000046")) StdMarshal;
struct __declspec(uuid("0000001b-0000-0000-c000-000000000046")) IdentityUnmarshal;
struct __declspec(uuid("0000001c-0000-0000-c000-000000000046")) InProcFreeMarshaler;
struct __declspec(uuid("0000030c-0000-0000-c000-000000000046")) PSGenObject;
struct __declspec(uuid("0000030d-0000-0000-c000-000000000046")) PSClientSite;
struct __declspec(uuid("0000030e-0000-0000-c000-000000000046")) PSClassObject;
struct __declspec(uuid("0000030f-0000-0000-c000-000000000046")) PSInPlaceActive;
struct __declspec(uuid("00000310-0000-0000-c000-000000000046")) PSInPlaceFrame;
struct __declspec(uuid("00000311-0000-0000-c000-000000000046")) PSDragDrop;
struct __declspec(uuid("00000312-0000-0000-c000-000000000046")) PSBindCtx;
struct __declspec(uuid("00000313-0000-0000-c000-000000000046")) PSEnumerators;
struct __declspec(uuid("00000315-0000-0000-c000-000000000046")) Picture_Metafile;
struct __declspec(uuid("00000315-0000-0000-c000-000000000046")) StaticMetafile;
struct __declspec(uuid("00000316-0000-0000-c000-000000000046")) Picture_Dib;
struct __declspec(uuid("00000316-0000-0000-c000-000000000046")) StaticDib;
struct __declspec(uuid("00000319-0000-0000-c000-000000000046")) Picture_EnhMetafile;
struct __declspec(uuid("00000330-0000-0000-c000-000000000046")) AllClasses;
struct __declspec(uuid("00000331-0000-0000-c000-000000000046")) LocalMachineClasses;
struct __declspec(uuid("00000332-0000-0000-c000-000000000046")) CurrentUserClasses;
struct __declspec(uuid("0002e005-0000-0000-c000-000000000046")) StdComponentCategoriesMgr;
struct __declspec(uuid("fb8f0821-0164-101b-84ed-08002b2ec713")) PersistPropset;
struct __declspec(uuid("fb8f0822-0164-101b-84ed-08002b2ec713")) ConvertVBX;
struct __declspec(uuid("79eac9d0-baf9-11ce-8c82-00aa004ba90b")) StdHlink;
struct __declspec(uuid("79eac9d1-baf9-11ce-8c82-00aa004ba90b")) StdHlinkBrowseContext;
struct __declspec(uuid("79eac9e0-baf9-11ce-8c82-00aa004ba90b")) StdURLMoniker;
struct __declspec(uuid("79eac9e1-baf9-11ce-8c82-00aa004ba90b")) StdURLProtocol;
struct __declspec(uuid("79eac9e2-baf9-11ce-8c82-00aa004ba90b")) HttpProtocol;
struct __declspec(uuid("79eac9e3-baf9-11ce-8c82-00aa004ba90b")) FtpProtocol;
struct __declspec(uuid("79eac9e4-baf9-11ce-8c82-00aa004ba90b")) GopherProtocol;
struct __declspec(uuid("79eac9e5-baf9-11ce-8c82-00aa004ba90b")) HttpSProtocol;
struct __declspec(uuid("79eac9e6-baf9-11ce-8c82-00aa004ba90b")) MkProtocol;
struct __declspec(uuid("79eac9e7-baf9-11ce-8c82-00aa004ba90b")) FileProtocol;
struct __declspec(uuid("79eac9f1-baf9-11ce-8c82-00aa004ba90b")) PSUrlMonProxy;
struct __declspec(uuid("0be35200-8f91-11ce-9de3-00aa004bb851")) CFontPropPage;
struct __declspec(uuid("0be35201-8f91-11ce-9de3-00aa004bb851")) CColorPropPage;
struct __declspec(uuid("0be35202-8f91-11ce-9de3-00aa004bb851")) CPicturePropPage;
struct __declspec(uuid("0be35203-8f91-11ce-9de3-00aa004bb851")) StdFont;
struct __declspec(uuid("0be35204-8f91-11ce-9de3-00aa004bb851")) StdPicture;


typedef _com_ptr_t<_com_IIID<IUnknown, &__uuidof(IUnknown)> > IUnknownPtr;
typedef _com_ptr_t<_com_IIID<IClassFactory, &__uuidof(IClassFactory)> > IClassFactoryPtr;
typedef _com_ptr_t<_com_IIID<IMalloc, &__uuidof(IMalloc)> > IMallocPtr;
typedef _com_ptr_t<_com_IIID<IMarshal, &__uuidof(IMarshal)> > IMarshalPtr;
typedef _com_ptr_t<_com_IIID<IRpcChannel, &__uuidof(IRpcChannel)> > IRpcChannelPtr;
typedef _com_ptr_t<_com_IIID<IRpcStub, &__uuidof(IRpcStub)> > IRpcStubPtr;
typedef _com_ptr_t<_com_IIID<IStubManager, &__uuidof(IStubManager)> > IStubManagerPtr;
typedef _com_ptr_t<_com_IIID<IRpcProxy, &__uuidof(IRpcProxy)> > IRpcProxyPtr;
typedef _com_ptr_t<_com_IIID<IProxyManager, &__uuidof(IProxyManager)> > IProxyManagerPtr;
typedef _com_ptr_t<_com_IIID<IPSFactory, &__uuidof(IPSFactory)> > IPSFactoryPtr;
typedef _com_ptr_t<_com_IIID<ILockBytes, &__uuidof(ILockBytes)> > ILockBytesPtr;
typedef _com_ptr_t<_com_IIID<IStorage, &__uuidof(IStorage)> > IStoragePtr;
typedef _com_ptr_t<_com_IIID<IStream, &__uuidof(IStream)> > IStreamPtr;
typedef _com_ptr_t<_com_IIID<IEnumSTATSTG, &__uuidof(IEnumSTATSTG)> > IEnumSTATSTGPtr;
typedef _com_ptr_t<_com_IIID<IBindCtx, &__uuidof(IBindCtx)> > IBindCtxPtr;
typedef _com_ptr_t<_com_IIID<IMoniker, &__uuidof(IMoniker)> > IMonikerPtr;
typedef _com_ptr_t<_com_IIID<IRunningObjectTable, &__uuidof(IRunningObjectTable)> > IRunningObjectTablePtr;
typedef _com_ptr_t<_com_IIID<IInternalMoniker, &__uuidof(IInternalMoniker)> > IInternalMonikerPtr;
typedef _com_ptr_t<_com_IIID<IRootStorage, &__uuidof(IRootStorage)> > IRootStoragePtr;
typedef _com_ptr_t<_com_IIID<IDfReserved1, &__uuidof(IDfReserved1)> > IDfReserved1Ptr;
typedef _com_ptr_t<_com_IIID<IDfReserved2, &__uuidof(IDfReserved2)> > IDfReserved2Ptr;
typedef _com_ptr_t<_com_IIID<IDfReserved3, &__uuidof(IDfReserved3)> > IDfReserved3Ptr;
typedef _com_ptr_t<_com_IIID<IMessageFilter, &__uuidof(IMessageFilter)> > IMessageFilterPtr;
typedef _com_ptr_t<_com_IIID<IStdMarshalInfo, &__uuidof(IStdMarshalInfo)> > IStdMarshalInfoPtr;
typedef _com_ptr_t<_com_IIID<IExternalConnection, &__uuidof(IExternalConnection)> > IExternalConnectionPtr;
typedef _com_ptr_t<_com_IIID<IMallocSpy, &__uuidof(IMallocSpy)> > IMallocSpyPtr;
typedef _com_ptr_t<_com_IIID<IMultiQI, &__uuidof(IMultiQI)> > IMultiQIPtr;
typedef _com_ptr_t<_com_IIID<IStub, &__uuidof(IStub)> > IStubPtr;
typedef _com_ptr_t<_com_IIID<IProxy, &__uuidof(IProxy)> > IProxyPtr;
typedef _com_ptr_t<_com_IIID<IEnumUnknown, &__uuidof(IEnumUnknown)> > IEnumUnknownPtr;
typedef _com_ptr_t<_com_IIID<IEnumString, &__uuidof(IEnumString)> > IEnumStringPtr;
typedef _com_ptr_t<_com_IIID<IEnumMoniker, &__uuidof(IEnumMoniker)> > IEnumMonikerPtr;
typedef _com_ptr_t<_com_IIID<IEnumFORMATETC, &__uuidof(IEnumFORMATETC)> > IEnumFORMATETCPtr;
typedef _com_ptr_t<_com_IIID<IEnumOLEVERB, &__uuidof(IEnumOLEVERB)> > IEnumOLEVERBPtr;
typedef _com_ptr_t<_com_IIID<IEnumSTATDATA, &__uuidof(IEnumSTATDATA)> > IEnumSTATDATAPtr;
typedef _com_ptr_t<_com_IIID<IEnumGeneric, &__uuidof(IEnumGeneric)> > IEnumGenericPtr;
typedef _com_ptr_t<_com_IIID<IEnumHolder, &__uuidof(IEnumHolder)> > IEnumHolderPtr;
typedef _com_ptr_t<_com_IIID<IEnumCallback, &__uuidof(IEnumCallback)> > IEnumCallbackPtr;
typedef _com_ptr_t<_com_IIID<IPersistStream, &__uuidof(IPersistStream)> > IPersistStreamPtr;
typedef _com_ptr_t<_com_IIID<IPersistStorage, &__uuidof(IPersistStorage)> > IPersistStoragePtr;
typedef _com_ptr_t<_com_IIID<IPersistFile, &__uuidof(IPersistFile)> > IPersistFilePtr;
typedef _com_ptr_t<_com_IIID<IPersist, &__uuidof(IPersist)> > IPersistPtr;
typedef _com_ptr_t<_com_IIID<IViewObject, &__uuidof(IViewObject)> > IViewObjectPtr;
typedef _com_ptr_t<_com_IIID<IDataObject, &__uuidof(IDataObject)> > IDataObjectPtr;
typedef _com_ptr_t<_com_IIID<IAdviseSink, &__uuidof(IAdviseSink)> > IAdviseSinkPtr;
typedef _com_ptr_t<_com_IIID<IDataAdviseHolder, &__uuidof(IDataAdviseHolder)> > IDataAdviseHolderPtr;
typedef _com_ptr_t<_com_IIID<IOleAdviseHolder, &__uuidof(IOleAdviseHolder)> > IOleAdviseHolderPtr;
typedef _com_ptr_t<_com_IIID<IOleObject, &__uuidof(IOleObject)> > IOleObjectPtr;
typedef _com_ptr_t<_com_IIID<IOleInPlaceObject, &__uuidof(IOleInPlaceObject)> > IOleInPlaceObjectPtr;
typedef _com_ptr_t<_com_IIID<IOleWindow, &__uuidof(IOleWindow)> > IOleWindowPtr;
typedef _com_ptr_t<_com_IIID<IOleInPlaceUIWindow, &__uuidof(IOleInPlaceUIWindow)> > IOleInPlaceUIWindowPtr;
typedef _com_ptr_t<_com_IIID<IOleInPlaceFrame, &__uuidof(IOleInPlaceFrame)> > IOleInPlaceFramePtr;
typedef _com_ptr_t<_com_IIID<IOleInPlaceActiveObject, &__uuidof(IOleInPlaceActiveObject)> > IOleInPlaceActiveObjectPtr;
typedef _com_ptr_t<_com_IIID<IOleClientSite, &__uuidof(IOleClientSite)> > IOleClientSitePtr;
typedef _com_ptr_t<_com_IIID<IOleInPlaceSite, &__uuidof(IOleInPlaceSite)> > IOleInPlaceSitePtr;
typedef _com_ptr_t<_com_IIID<IParseDisplayName, &__uuidof(IParseDisplayName)> > IParseDisplayNamePtr;
typedef _com_ptr_t<_com_IIID<IOleContainer, &__uuidof(IOleContainer)> > IOleContainerPtr;
typedef _com_ptr_t<_com_IIID<IOleItemContainer, &__uuidof(IOleItemContainer)> > IOleItemContainerPtr;
typedef _com_ptr_t<_com_IIID<IOleLink, &__uuidof(IOleLink)> > IOleLinkPtr;
typedef _com_ptr_t<_com_IIID<IOleCache, &__uuidof(IOleCache)> > IOleCachePtr;
typedef _com_ptr_t<_com_IIID<IOleManager, &__uuidof(IOleManager)> > IOleManagerPtr;
typedef _com_ptr_t<_com_IIID<IOlePresObj, &__uuidof(IOlePresObj)> > IOlePresObjPtr;
typedef _com_ptr_t<_com_IIID<IDropSource, &__uuidof(IDropSource)> > IDropSourcePtr;
typedef _com_ptr_t<_com_IIID<IDropTarget, &__uuidof(IDropTarget)> > IDropTargetPtr;
typedef _com_ptr_t<_com_IIID<IDebug, &__uuidof(IDebug)> > IDebugPtr;
typedef _com_ptr_t<_com_IIID<IDebugStream, &__uuidof(IDebugStream)> > IDebugStreamPtr;
typedef _com_ptr_t<_com_IIID<IAdviseSink2, &__uuidof(IAdviseSink2)> > IAdviseSink2Ptr;
typedef _com_ptr_t<_com_IIID<IRunnableObject, &__uuidof(IRunnableObject)> > IRunnableObjectPtr;
typedef _com_ptr_t<_com_IIID<IViewObject2, &__uuidof(IViewObject2)> > IViewObject2Ptr;
typedef _com_ptr_t<_com_IIID<IOleCache2, &__uuidof(IOleCache2)> > IOleCache2Ptr;
typedef _com_ptr_t<_com_IIID<IOleCacheControl, &__uuidof(IOleCacheControl)> > IOleCacheControlPtr;
typedef _com_ptr_t<_com_IIID<IContinue, &__uuidof(IContinue)> > IContinuePtr;
typedef _com_ptr_t<_com_IIID<IPropertyStorage, &__uuidof(IPropertyStorage)> > IPropertyStoragePtr;
typedef _com_ptr_t<_com_IIID<IEnumSTATPROPSTG, &__uuidof(IEnumSTATPROPSTG)> > IEnumSTATPROPSTGPtr;
typedef _com_ptr_t<_com_IIID<IPropertySetStorage, &__uuidof(IPropertySetStorage)> > IPropertySetStoragePtr;
typedef _com_ptr_t<_com_IIID<IEnumSTATPROPSETSTG, &__uuidof(IEnumSTATPROPSETSTG)> > IEnumSTATPROPSETSTGPtr;
typedef _com_ptr_t<_com_IIID<IClientSecurity, &__uuidof(IClientSecurity)> > IClientSecurityPtr;
typedef _com_ptr_t<_com_IIID<IServerSecurity, &__uuidof(IServerSecurity)> > IServerSecurityPtr;
typedef _com_ptr_t<_com_IIID<IClassActivator, &__uuidof(IClassActivator)> > IClassActivatorPtr;
typedef _com_ptr_t<_com_IIID<IDispatch, &__uuidof(IDispatch)> > IDispatchPtr;
typedef _com_ptr_t<_com_IIID<ITypeInfo, &__uuidof(ITypeInfo)> > ITypeInfoPtr;
typedef _com_ptr_t<_com_IIID<ITypeLib, &__uuidof(ITypeLib)> > ITypeLibPtr;
typedef _com_ptr_t<_com_IIID<ITypeComp, &__uuidof(ITypeComp)> > ITypeCompPtr;
typedef _com_ptr_t<_com_IIID<IEnumVARIANT, &__uuidof(IEnumVARIANT)> > IEnumVARIANTPtr;
typedef _com_ptr_t<_com_IIID<ICreateTypeInfo, &__uuidof(ICreateTypeInfo)> > ICreateTypeInfoPtr;
typedef _com_ptr_t<_com_IIID<ICreateTypeLib, &__uuidof(ICreateTypeLib)> > ICreateTypeLibPtr;
typedef _com_ptr_t<_com_IIID<ICreateTypeInfo2, &__uuidof(ICreateTypeInfo2)> > ICreateTypeInfo2Ptr;
typedef _com_ptr_t<_com_IIID<ICreateTypeLib2, &__uuidof(ICreateTypeLib2)> > ICreateTypeLib2Ptr;
typedef _com_ptr_t<_com_IIID<ITypeChangeEvents, &__uuidof(ITypeChangeEvents)> > ITypeChangeEventsPtr;
typedef _com_ptr_t<_com_IIID<ITypeLib2, &__uuidof(ITypeLib2)> > ITypeLib2Ptr;
typedef _com_ptr_t<_com_IIID<ITypeInfo2, &__uuidof(ITypeInfo2)> > ITypeInfo2Ptr;
typedef _com_ptr_t<_com_IIID<StdOle, &__uuidof(StdOle)> > StdOlePtr;
typedef _com_ptr_t<_com_IIID<IRichEditOle, &__uuidof(IRichEditOle)> > IRichEditOlePtr;
typedef _com_ptr_t<_com_IIID<IRichEditOleCallback, &__uuidof(IRichEditOleCallback)> > IRichEditOleCallbackPtr;
typedef _com_ptr_t<_com_IIID<IEnumGUID, &__uuidof(IEnumGUID)> > IEnumGUIDPtr;
typedef _com_ptr_t<_com_IIID<IEnumCATEGORYINFO, &__uuidof(IEnumCATEGORYINFO)> > IEnumCATEGORYINFOPtr;
typedef _com_ptr_t<_com_IIID<ICatRegister, &__uuidof(ICatRegister)> > ICatRegisterPtr;
typedef _com_ptr_t<_com_IIID<ICatInformation, &__uuidof(ICatInformation)> > ICatInformationPtr;
typedef _com_ptr_t<_com_IIID<IServiceProvider, &__uuidof(IServiceProvider)> > IServiceProviderPtr;
typedef _com_ptr_t<_com_IIID<IPersistPropertyBag, &__uuidof(IPersistPropertyBag)> > IPersistPropertyBagPtr;
typedef _com_ptr_t<_com_IIID<IPropertyBag, &__uuidof(IPropertyBag)> > IPropertyBagPtr;
typedef _com_ptr_t<_com_IIID<IErrorLog, &__uuidof(IErrorLog)> > IErrorLogPtr;
typedef _com_ptr_t<_com_IIID<IBoundObject, &__uuidof(IBoundObject)> > IBoundObjectPtr;
typedef _com_ptr_t<_com_IIID<IBoundObjectSite, &__uuidof(IBoundObjectSite)> > IBoundObjectSitePtr;
typedef _com_ptr_t<_com_IIID<IPropertyNotifySink, &__uuidof(IPropertyNotifySink)> > IPropertyNotifySinkPtr;
typedef _com_ptr_t<_com_IIID<IPropertyPage2, &__uuidof(IPropertyPage2)> > IPropertyPage2Ptr;
typedef _com_ptr_t<_com_IIID<IPerPropertyBrowsing, &__uuidof(IPerPropertyBrowsing)> > IPerPropertyBrowsingPtr;
typedef _com_ptr_t<_com_IIID<IFillLockBytes, &__uuidof(IFillLockBytes)> > IFillLockBytesPtr;
typedef _com_ptr_t<_com_IIID<IFont, &__uuidof(IFont)> > IFontPtr;
typedef _com_ptr_t<_com_IIID<IFontDisp, &__uuidof(IFontDisp)> > IFontDispPtr;
typedef _com_ptr_t<_com_IIID<IPicture, &__uuidof(IPicture)> > IPicturePtr;
typedef _com_ptr_t<_com_IIID<IPictureDisp, &__uuidof(IPictureDisp)> > IPictureDispPtr;
typedef _com_ptr_t<_com_IIID<IOleInPlaceObjectWindowless, &__uuidof(IOleInPlaceObjectWindowless)> > IOleInPlaceObjectWindowlessPtr;
typedef _com_ptr_t<_com_IIID<IBinding, &__uuidof(IBinding)> > IBindingPtr;
typedef _com_ptr_t<_com_IIID<IBindStatusCallback, &__uuidof(IBindStatusCallback)> > IBindStatusCallbackPtr;
typedef _com_ptr_t<_com_IIID<IHlinkSite, &__uuidof(IHlinkSite)> > IHlinkSitePtr;
typedef _com_ptr_t<_com_IIID<IHlink, &__uuidof(IHlink)> > IHlinkPtr;
typedef _com_ptr_t<_com_IIID<IHlinkTarget, &__uuidof(IHlinkTarget)> > IHlinkTargetPtr;
typedef _com_ptr_t<_com_IIID<IHlinkFrame, &__uuidof(IHlinkFrame)> > IHlinkFramePtr;
typedef _com_ptr_t<_com_IIID<IEnumHLITEM, &__uuidof(IEnumHLITEM)> > IEnumHLITEMPtr;
typedef _com_ptr_t<_com_IIID<IHlinkBrowseContext, &__uuidof(IHlinkBrowseContext)> > IHlinkBrowseContextPtr;
typedef _com_ptr_t<_com_IIID<IPersistMoniker, &__uuidof(IPersistMoniker)> > IPersistMonikerPtr;
typedef _com_ptr_t<_com_IIID<IBindStatusCallbackMsg, &__uuidof(IBindStatusCallbackMsg)> > IBindStatusCallbackMsgPtr;
typedef _com_ptr_t<_com_IIID<IBindProtocol, &__uuidof(IBindProtocol)> > IBindProtocolPtr;
typedef _com_ptr_t<_com_IIID<IAuthenticate, &__uuidof(IAuthenticate)> > IAuthenticatePtr;
typedef _com_ptr_t<_com_IIID<ICodeInstall, &__uuidof(ICodeInstall)> > ICodeInstallPtr;
typedef _com_ptr_t<_com_IIID<IHttpNegotiate, &__uuidof(IHttpNegotiate)> > IHttpNegotiatePtr;
typedef _com_ptr_t<_com_IIID<IAsyncMoniker, &__uuidof(IAsyncMoniker)> > IAsyncMonikerPtr;
typedef _com_ptr_t<_com_IIID<IWindowForBindingUI, &__uuidof(IWindowForBindingUI)> > IWindowForBindingUIPtr;
typedef _com_ptr_t<_com_IIID<IWinInetInfo, &__uuidof(IWinInetInfo)> > IWinInetInfoPtr;
typedef _com_ptr_t<_com_IIID<IHttpSecurity, &__uuidof(IHttpSecurity)> > IHttpSecurityPtr;
typedef _com_ptr_t<_com_IIID<IWinInetHttpInfo, &__uuidof(IWinInetHttpInfo)> > IWinInetHttpInfoPtr;
typedef _com_ptr_t<_com_IIID<IErrorInfo, &__uuidof(IErrorInfo)> > IErrorInfoPtr;
typedef _com_ptr_t<_com_IIID<ICreateErrorInfo, &__uuidof(ICreateErrorInfo)> > ICreateErrorInfoPtr;
typedef _com_ptr_t<_com_IIID<ISupportErrorInfo, &__uuidof(ISupportErrorInfo)> > ISupportErrorInfoPtr;
typedef _com_ptr_t<_com_IIID<IActiveScriptSiteWindow, &__uuidof(IActiveScriptSiteWindow)> > IActiveScriptSiteWindowPtr;
typedef _com_ptr_t<_com_IIID<IObjectSafety, &__uuidof(IObjectSafety)> > IObjectSafetyPtr;
typedef _com_ptr_t<_com_IIID<IActiveScriptSite, &__uuidof(IActiveScriptSite)> > IActiveScriptSitePtr;
typedef _com_ptr_t<_com_IIID<IActiveScriptError, &__uuidof(IActiveScriptError)> > IActiveScriptErrorPtr;
typedef _com_ptr_t<_com_IIID<IActiveScript, &__uuidof(IActiveScript)> > IActiveScriptPtr;
typedef _com_ptr_t<_com_IIID<IActiveScriptParse, &__uuidof(IActiveScriptParse)> > IActiveScriptParsePtr;
typedef _com_ptr_t<_com_IIID<ITargetFrame, &__uuidof(ITargetFrame)> > ITargetFramePtr;
typedef _com_ptr_t<_com_IIID<ISimpleFrameSite, &__uuidof(ISimpleFrameSite)> > ISimpleFrameSitePtr;
typedef _com_ptr_t<_com_IIID<IProgressNotify, &__uuidof(IProgressNotify)> > IProgressNotifyPtr;
typedef _com_ptr_t<_com_IIID<ILayoutStorage, &__uuidof(ILayoutStorage)> > ILayoutStoragePtr;
typedef _com_ptr_t<_com_IIID<ITargetEmbedding, &__uuidof(ITargetEmbedding)> > ITargetEmbeddingPtr;
typedef _com_ptr_t<_com_IIID<IChannelHook, &__uuidof(IChannelHook)> > IChannelHookPtr;
typedef _com_ptr_t<_com_IIID<IOleUndoUnit, &__uuidof(IOleUndoUnit)> > IOleUndoUnitPtr;
typedef _com_ptr_t<_com_IIID<IOleParentUndoUnit, &__uuidof(IOleParentUndoUnit)> > IOleParentUndoUnitPtr;
typedef _com_ptr_t<_com_IIID<IEnumOleUndoUnits, &__uuidof(IEnumOleUndoUnits)> > IEnumOleUndoUnitsPtr;
typedef _com_ptr_t<_com_IIID<IOleUndoManager, &__uuidof(IOleUndoManager)> > IOleUndoManagerPtr;
typedef _com_ptr_t<_com_IIID<IProvideClassInfo2, &__uuidof(IProvideClassInfo2)> > IProvideClassInfo2Ptr;
typedef _com_ptr_t<_com_IIID<IAdviseSinkEx, &__uuidof(IAdviseSinkEx)> > IAdviseSinkExPtr;
typedef _com_ptr_t<_com_IIID<IViewObjectEx, &__uuidof(IViewObjectEx)> > IViewObjectExPtr;
typedef _com_ptr_t<_com_IIID<IBindHost, &__uuidof(IBindHost)> > IBindHostPtr;
typedef _com_ptr_t<_com_IIID<IObjectWithSite, &__uuidof(IObjectWithSite)> > IObjectWithSitePtr;
typedef _com_ptr_t<_com_IIID<IOleDocument, &__uuidof(IOleDocument)> > IOleDocumentPtr;
typedef _com_ptr_t<_com_IIID<IOleDocumentView, &__uuidof(IOleDocumentView)> > IOleDocumentViewPtr;
typedef _com_ptr_t<_com_IIID<IOleDocumentSite, &__uuidof(IOleDocumentSite)> > IOleDocumentSitePtr;
typedef _com_ptr_t<_com_IIID<IEnumOleDocumentViews, &__uuidof(IEnumOleDocumentViews)> > IEnumOleDocumentViewsPtr;
typedef _com_ptr_t<_com_IIID<IPrint, &__uuidof(IPrint)> > IPrintPtr;
typedef _com_ptr_t<_com_IIID<IContinueCallback, &__uuidof(IContinueCallback)> > IContinueCallbackPtr;
typedef _com_ptr_t<_com_IIID<IOleCommandTarget, &__uuidof(IOleCommandTarget)> > IOleCommandTargetPtr;
typedef _com_ptr_t<_com_IIID<IROTData, &__uuidof(IROTData)> > IROTDataPtr;
typedef _com_ptr_t<_com_IIID<ICursor, &__uuidof(ICursor)> > ICursorPtr;
typedef _com_ptr_t<_com_IIID<ICursorMove, &__uuidof(ICursorMove)> > ICursorMovePtr;
typedef _com_ptr_t<_com_IIID<ICursorScroll, &__uuidof(ICursorScroll)> > ICursorScrollPtr;
typedef _com_ptr_t<_com_IIID<ICursorUpdateARow, &__uuidof(ICursorUpdateARow)> > ICursorUpdateARowPtr;
typedef _com_ptr_t<_com_IIID<INotifyDBEvents, &__uuidof(INotifyDBEvents)> > INotifyDBEventsPtr;
typedef _com_ptr_t<_com_IIID<ICursorFind, &__uuidof(ICursorFind)> > ICursorFindPtr;
typedef _com_ptr_t<_com_IIID<IEntryID, &__uuidof(IEntryID)> > IEntryIDPtr;
typedef _com_ptr_t<_com_IIID<ISequentialStream, &__uuidof(ISequentialStream)> > ISequentialStreamPtr;
typedef _com_ptr_t<_com_IIID<IPersistStreamInit, &__uuidof(IPersistStreamInit)> > IPersistStreamInitPtr;
typedef _com_ptr_t<_com_IIID<IOverlappedStream, &__uuidof(IOverlappedStream)> > IOverlappedStreamPtr;
typedef _com_ptr_t<_com_IIID<IOverlappedCompletion, &__uuidof(IOverlappedCompletion)> > IOverlappedCompletionPtr;
typedef _com_ptr_t<_com_IIID<IPSFactoryBuffer, &__uuidof(IPSFactoryBuffer)> > IPSFactoryBufferPtr;
typedef _com_ptr_t<_com_IIID<IRpcProxyBuffer, &__uuidof(IRpcProxyBuffer)> > IRpcProxyBufferPtr;
typedef _com_ptr_t<_com_IIID<IRpcStubBuffer, &__uuidof(IRpcStubBuffer)> > IRpcStubBufferPtr;
typedef _com_ptr_t<_com_IIID<IRpcChannelBuffer, &__uuidof(IRpcChannelBuffer)> > IRpcChannelBufferPtr;
typedef _com_ptr_t<_com_IIID<IServerHandler, &__uuidof(IServerHandler)> > IServerHandlerPtr;
typedef _com_ptr_t<_com_IIID<IClientSiteHandler, &__uuidof(IClientSiteHandler)> > IClientSiteHandlerPtr;
typedef _com_ptr_t<_com_IIID<IOleInPlaceSiteWindowless, &__uuidof(IOleInPlaceSiteWindowless)> > IOleInPlaceSiteWindowlessPtr;
typedef _com_ptr_t<_com_IIID<IOleInPlaceSiteEx, &__uuidof(IOleInPlaceSiteEx)> > IOleInPlaceSiteExPtr;
typedef _com_ptr_t<_com_IIID<IPointerInactive, &__uuidof(IPointerInactive)> > IPointerInactivePtr;
typedef _com_ptr_t<_com_IIID<IProvideClassInfo, &__uuidof(IProvideClassInfo)> > IProvideClassInfoPtr;
typedef _com_ptr_t<_com_IIID<IConnectionPointContainer, &__uuidof(IConnectionPointContainer)> > IConnectionPointContainerPtr;
typedef _com_ptr_t<_com_IIID<IEnumConnectionPoints, &__uuidof(IEnumConnectionPoints)> > IEnumConnectionPointsPtr;
typedef _com_ptr_t<_com_IIID<IConnectionPoint, &__uuidof(IConnectionPoint)> > IConnectionPointPtr;
typedef _com_ptr_t<_com_IIID<IEnumConnections, &__uuidof(IEnumConnections)> > IEnumConnectionsPtr;
typedef _com_ptr_t<_com_IIID<IOleControl, &__uuidof(IOleControl)> > IOleControlPtr;
typedef _com_ptr_t<_com_IIID<IOleControlSite, &__uuidof(IOleControlSite)> > IOleControlSitePtr;
typedef _com_ptr_t<_com_IIID<IPropertyFrame, &__uuidof(IPropertyFrame)> > IPropertyFramePtr;
typedef _com_ptr_t<_com_IIID<ISpecifyPropertyPages, &__uuidof(ISpecifyPropertyPages)> > ISpecifyPropertyPagesPtr;
typedef _com_ptr_t<_com_IIID<IPropertyPageSite, &__uuidof(IPropertyPageSite)> > IPropertyPageSitePtr;
typedef _com_ptr_t<_com_IIID<IPropertyPage, &__uuidof(IPropertyPage)> > IPropertyPagePtr;
typedef _com_ptr_t<_com_IIID<IClassFactory2, &__uuidof(IClassFactory2)> > IClassFactory2Ptr;
typedef _com_ptr_t<_com_IIID<IMimeInfo, &__uuidof(IMimeInfo)> > IMimeInfoPtr;
typedef _com_ptr_t<_com_IIID<IFilter, &__uuidof(IFilter)> > IFilterPtr;
typedef _com_ptr_t<_com_IIID<IPersistMemory, &__uuidof(IPersistMemory)> > IPersistMemoryPtr;
typedef _com_ptr_t<_com_IIID<IUrlHistoryStg, &__uuidof(IUrlHistoryStg)> > IUrlHistoryStgPtr;
typedef _com_ptr_t<_com_IIID<IEnumSTATURL, &__uuidof(IEnumSTATURL)> > IEnumSTATURLPtr;
typedef _com_ptr_t<_com_IIID<IQuickActivate, &__uuidof(IQuickActivate)> > IQuickActivatePtr;


