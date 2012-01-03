unit GraphVizInterface;

interface

type
  PPAnsiChar = ^PAnsiChar;

const
  GvcIntfDll = 'gvc_intf';

function LayoutGraph( const layoutType: PAnsiChar; inputGraph: PAnsiChar;
   outputGraph: PPAnsiChar): Integer; cdecl; external GvcIntfDll;

procedure DeleteOutputGraph( outputGraph: PAnsiChar); cdecl; external GvcIntfDll;

implementation

end.
