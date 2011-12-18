
namespace yahoo {

namespace yahoo2 = yahoo;

class CChild: CDialogChooser
{
  private:
	CChild a : 1;
	CChild *b : 1;
//	CChild* c : 1;
	unsigned char *d, e;
	int (*pfi)();
	inline bool is_condition(int tok : 3)
	{ return (tok >= 3 && tok <= 5); };
};

class StackScreen {
	void (*handler)() : ci(li) { };
	void (*handler)() =0;
	StackScreen stack [StackSize] ;
};
}

////////////////////////////////////////////////////////////////////////////////////////
//
// Nestopia - NES / Famicom emulator written in C++
//
// Copyright (C) 2003 Martin Freij
//
// This file is part of Nestopia.
// 
// Nestopia is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
// 
// Nestopia is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with Nestopia; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
////////////////////////////////////////////////////////////////////////////////////////

#pragma once

#ifndef NST_MAPPER_0_H
#define NST_MAPPER_0_H

////////////////////////////////////////////////////////////////////////////////////////
// NROM
////////////////////////////////////////////////////////////////////////////////////////

NES_NAMESPACE_BEGIN

class MAPPER0 : public MAPPER
{
public:

	MAPPER0(CONTEXT& c)
	: MAPPER(c) {}
};

NES_NAMESPACE_END

#endif
