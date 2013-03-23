
namespace QuantLib {

    namespace Calendars {

        bool Budapest::Impl::isBusinessDay(const Date& date) const {
            Weekday w = date.weekday();
            Day d = date.dayOfMonth(), dd = date.dayOfYear();
            Month m = date.month();
            Year y = date.year();
            Day em = easterMonday(y);
            if ((w == Saturday || w == Sunday)
                // Easter Monday
                || (dd == em)
                // Whit Monday
                || (dd == em+49)
                // New Year's Day
                || (d == 1  && m == January)
                // National Day
                || (d == 15  && m == March)
                // Labour Day
                || (d == 1  && m == May)
                // Constitution Day
                || (d == 20  && m == August)
                // Republic Day
                || (d == 23  && m == October)
                // All Saints Day
                || (d == 1  && m == November)
                // Christmas
                || (d == 25 && m == December)
                // 2nd Day of Christmas
                || (d == 26 && m == December))
                    return false;
            return true;
        }

    }

}

