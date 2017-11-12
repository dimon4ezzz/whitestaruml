// gvc_intf.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
//#include <locale.h>
//#include "../lib/gvc/gvc.h"
#include "gvc_intf.h"
#include "graphviz/gvc.h"

IMPORTED_SYMBOL gvplugin_library_t gvplugin_dot_layout_LTX_library;
IMPORTED_SYMBOL gvplugin_library_t gvplugin_neato_layout_LTX_library;
IMPORTED_SYMBOL gvplugin_library_t gvplugin_core_LTX_library;

lt_symlist_t lt_preloaded_symbols[] = 
{
	{ "gvplugin_dot_layout_LTX_library", (void*)(&gvplugin_dot_layout_LTX_library) },
	{ "gvplugin_neato_layout_LTX_library", (void*)(&gvplugin_neato_layout_LTX_library) },
	{ "gvplugin_core_LTX_library", (void*)(&gvplugin_core_LTX_library) },
	{ 0, 0 }
};



GVC_INTF_API int LayoutGraph( const char* layoutType, char* inputGraph, char** outputGraph)
{
	//setlocale(LC_NUMERIC, "C");
	//setlocale(LC_ALL, "");
	GVC_t* gvc = gvContextPlugins(lt_preloaded_symbols, 0);
	graph_t* g = agmemread(inputGraph);
	int res = gvLayout(gvc,g, layoutType);
	unsigned int len;
	res = gvRenderData(gvc, g, "plain", outputGraph, &len);

	gvFreeLayout(gvc, g);
	agclose(g);

	return (gvFreeContext(gvc));

}

GVC_INTF_API void DeleteOutputGraph(char* outputGraph)
{
	free(outputGraph);
	//gvFreeOutputGraph(outputGraph);
}



