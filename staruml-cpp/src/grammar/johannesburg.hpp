
/*
 Copyright (C) 2000, 2001, 2002, 2003 RiskMap srl

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it under the
 terms of the QuantLib license.  You should have received a copy of the
 license along with this program; if not, please email quantlib-dev@lists.sf.net
 The license is also available online at http://quantlib.org/html/license.html

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

/*! \file johannesburg.hpp
    \brief Johannesburg calendar
*/

#ifndef quantlib_johannesburg_calendar_h
#define quantlib_johannesburg_calendar_h

#include <ql/calendar.hpp>

namespace QuantLib {

    namespace Calendars {

        //! %Johannesburg calendar
        /*! Holidays:
            <ul>
            <li>Saturdays</li>
            <li>Sundays</li>
            <li>New Year's Day, January 1st (possibly moved to Monday)</li>
            <li>Good Friday</li>
            <li>Family Day, Easter Monday</li>
            <li>Human Rights Day, March 21st (possibly moved to Monday)</li>
            <li>Freedom Day, April 27th (possibly moved to Monday)</li>
            <li>Workers Day, May 1st (possibly moved to Monday)</li>
            <li>Youth Day, June 16th (possibly moved to Monday)</li>
            <li>National Women's Day, August 9th
                (possibly moved to Monday)</li>
            <li>Heritage Day, September 24th (possibly moved to Monday)</li>
            <li>Day of Reconciliation, December 16th
                (possibly moved to Monday)</li>
            <li>Christmas December 25th </li>
            <li>Day of Goodwill December 26th (possibly moved to Monday)</li>
            </ul>
        */
        class Johannesburg : public Calendar {
          private:
            class Impl : public Calendar::WesternImpl {
              public:
                std::string name() const { return "Johannesburg"; }
                bool isBusinessDay(const Date&) const;
            };
          public:
            Johannesburg()
            : Calendar(Handle<Calendar::Impl>(new Johannesburg::Impl)) {}
        };

    }

}


#endif
