        ��  ��                        �� ��     0 	        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
  <assemblyIdentity
	type="win32"
	name="WhiteStarUML"
	version="5.1.2.1"
	processorArchitecture="*"/>
  <dependency>
	<dependentAssembly>
	  <assemblyIdentity
		type="win32"
		name="Microsoft.Windows.Common-Controls"
		version="6.0.0.0"
		publicKeyToken="6595b64144ccf1df"
		language="*"
		processorArchitecture="*"/>
	</dependentAssembly>
  </dependency>
  <file name="OptMgr.dll" hashalg="SHA1">
	<comClass clsid="{E109632F-9B41-4FB9-89FE-DE416C0256AA}" tlbid="{C5EF8E94-B2FE-4709-A92A-D9A50940AE9C}"></comClass>
	<typelib tlbid="{C5EF8E94-B2FE-4709-A92A-D9A50940AE9C}" resourceid="1" version="1.0" helpdir="" flags="HASDISKIMAGE"></typelib>
  </file>
  <file name="WinGraphviz.dll" hashalg="SHA1">
	<comClass clsid="{55811839-47B0-4854-81B5-0A0031B8ACEC}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" description="DOT Class"></comClass>
	<comClass clsid="{1F25D86C-95BC-4E33-A177-EE8DABEF8B04}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" description="NEATO Class"></comClass>
	<comClass clsid="{6B3F62C8-80CE-470D-B2E4-0BA42A035228}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" description="BinaryImage Class"></comClass>
	<comClass clsid="{684811FB-0523-420F-9E8F-A5452C65A19C}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" description="TWOPI Class"></comClass>
	<typelib tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" resourceid="1" version="1.0" helpdir="" flags="HASDISKIMAGE"></typelib>

  </file>
    <file name="modules\staruml-cpp\CppAddIn.dll" hashalg="SHA1">
	<typelib tlbid="{F536C296-897D-4FC0-9C94-B263A0B350F8}" resourceid="1" version="1.0" helpdir="" flags="HASDISKIMAGE"></typelib>
  </file>
  <trustInfo xmlns="urn:schemas-microsoft-com:asm.v3">
	<security>
	  <requestedPrivileges>
		<requestedExecutionLevel
		  level="highestAvailable"
		  uiAccess="false"/>
	  </requestedPrivileges>
	</security>
  </trustInfo>
  <comInterfaceExternalProxyStub name="IOptionItem" iid="{C8E6BA96-EE0F-463E-B9BC-776C15167809}" tlbid="{C5EF8E94-B2FE-4709-A92A-D9A50940AE9C}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="IOptionClassification" iid="{A2FB7B59-01A9-4929-BC56-79A699A35E90}" tlbid="{C5EF8E94-B2FE-4709-A92A-D9A50940AE9C}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="IOptionCategory" iid="{C6C2AE66-AEE8-43C0-AA77-081646262CF2}" tlbid="{C5EF8E94-B2FE-4709-A92A-D9A50940AE9C}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="IOptionSchema" iid="{DA4FB79C-B8B5-4573-98E8-8CB2ECFA0406}" tlbid="{C5EF8E94-B2FE-4709-A92A-D9A50940AE9C}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="IOptionManager" iid="{D041BEEF-82ED-4A66-843A-4D08339C228D}" tlbid="{C5EF8E94-B2FE-4709-A92A-D9A50940AE9C}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>

  <comInterfaceExternalProxyStub name="IDOT" iid="{A1080582-D33F-486E-BD5F-581989A3C7E9}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="IBinaryImage" iid="{FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="IStream" iid="{0000000C-0000-0000-C000-000000000046}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" proxyStubClsid32="{0000000C-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="ISequentialStream" iid="{0C733A30-2A1C-11CE-ADE5-00AA0044773D}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" proxyStubClsid32="{0C733A30-2A1C-11CE-ADE5-00AA0044773D}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="INEATO" iid="{B41D4C33-882C-4534-8352-EE981323CD96}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
  <comInterfaceExternalProxyStub name="ITWOPI" iid="{B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}" tlbid="{052DB09C-95F7-43BD-B7F8-492373D1151E}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
</assembly>
