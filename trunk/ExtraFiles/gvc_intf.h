#pragma once

#ifdef WIN32
#define IMPORTED_SYMBOL extern "C" __declspec(dllimport)
#define EXPORTED_SYMBOL extern "C" __declspec(dllexport)
#else
#define IMPORTED_SYMBOL extern "C"
#define EXPORTED_SYMBOL extern "C"
#endif

#ifdef GVC_INTF_EXPORTS
#define  GVC_INTF_API EXPORTED_SYMBOL
#else
#define  GVC_INTF_API IMPORTED_SYMBOL
#endif

GVC_INTF_API int LayoutGraph( const char* layoutType, char* inputGraph, char** outputGraph);
GVC_INTF_API void DeleteOutputGraph(char* outputGraph);