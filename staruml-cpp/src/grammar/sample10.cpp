#include "Chooser.h"

enum Tokens { INLINE = 128, VIRTUAL = 129 };

#define OPR(name, type) type name 
#define DEF_EX class CParent: CDialogChooser { }

#ifndef DEF_EX
class CChild: CDialogChooser
{
	inline OPR(is_condition, bool)(int tok)
	{ return (tok >= 3 && tok <= 5); };
};
#endif