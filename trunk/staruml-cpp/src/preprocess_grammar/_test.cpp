//

#if !defined(_CONSTRAINT_H)
#define _CONSTRAINT_H

//
#include "Element.h"

#using <mscorlib.dll>

namespace Modeling Elements
{
	namespace ExtCore Elements
	{
		class Constraint : public Element
		{
		public:
			String Name;
			String Body;
			ExtensibleModel *ConstrainedModel;
		};
	}
}

#endif
