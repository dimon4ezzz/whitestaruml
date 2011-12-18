
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

/*! \file johannesburg.cpp
    \brief Johannesburg calendar
*/

#include <ql/Calendars/johannesburg.hpp>

namespace QuantLib {

    namespace Calendars {

        bool Johannesburg::Impl::isBusinessDay(const Date& date) const {
            Weekday w = date.weekday();
            Day d = date.dayOfMonth(), dd = date.dayOfYear();
            Month m = date.month();
            Year y = date.year();
            Day em = easterMonday(y);
            if ((w == Saturday || w == Sunday)
                // New Year's Day (possibly moved to Monday)
                || ((d == 1 || (d == 2 && w == Monday)) && m == January)
                // Good Friday
                || (dd == em-3)
                // Family Day 
                || (dd == em)
                // Human Rights Day, March 21st (possibly moved to Monday)
                || ((d == 21 || (d == 22 && w == Monday)) 
                    && m == March)
                // Freedom Day, April 27th (possibly moved to Monday)
                || ((d == 27 || (d == 28 && w == Monday)) 
                    && m == April)
                // Workers Day, May 1st (possibly moved to Monday)
                || ((d == 1 || (d == 2 && w == Monday)) 
                    && m == May)
                // Youth Day, June 16th (possibly moved to Monday)
                || ((d == 16 || (d == 17 && w == Monday)) 
                    && m == June)
                // National Women's Day, August 9th (possibly moved to Monday)
                || ((d == 9 || (d == 10 && w == Monday)) 
                    && m == August)
                // Heritage Day, September 24th (possibly moved to Monday)
                || ((d == 24 || (d == 25 && w == Monday)) 
                    && m == September)
                // Day of Reconciliation, December 16th 
                // (possibly moved to Monday)
                || ((d == 16 || (d == 17 && w == Monday)) 
                    && m == December)
                // Christmas 
                || (d == 25 && m == December)
                // Day of Goodwill (possibly moved to Monday)
                || ((d == 26 || (d == 27 && w == Monday)) 
                    && m == December)
                )
                return false;
            return true;
        }

    }

}

