require_relative 'Year'

class Month

  attr_reader :month, :year

  def initialize (month, year)
    @month = month.to_i
    @year = year.to_i
  end






  def name
    month_names = {1 => '    January', 2 => '   February', 3 => '     March', 4 => '     April', 5 => '      May', 6 => '     June', 7 => '     July', 8 => '    August', 9 => '   September', 10 => '    October', 11 => '   November', 12 => '   December'}
    return month_names[@month]
  end






  def day_count
    # special case for Feb in leap years
    if @month == 2
      # is a leap year?
      if leap_year?
        return 29
      else
        return 28
      end
    end
    month_day_counts = {1 => 31, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
    return month_day_counts[@month]
  end






  def start_day_of_week
    puts "CALLED START DAY OF WEEK METHOD"
  end

  def to_s
    output = ""
    if !valid_args?
      return "Date not in acceptable format/range"
    end

    # print month name and year
    output << "#{name} #{@year}\n"

    # print days of week
    output << "Su Mo Tu We Th Fr Sa\n"

    # print the numbers in calendar
    day_count.times do |i|
      if (i == 0)
        start_day_of_month = zellers(i+1)
        # figure out how many leading spaces we need
        if (start_day_of_month == 1) # sunday
          output << " " #one
        elsif (start_day_of_month == 2) # monday
          output << "    "
        elsif (start_day_of_month == 3) # tuesday
          output << "       "
        elsif (start_day_of_month == 4) # wednesday
          output << "          "
        elsif (start_day_of_month == 5) # thursday
          output << "             "
        elsif (start_day_of_month == 6) # friday
          output << "                "
        elsif (start_day_of_month == 0) # saturday
          output << "                   "
        end
        output << "#{i+1} "
        if day_of_week_conversion(zellers(i+1)) == 'Sa'
            output.rstrip!
            output << "\n"
        end
      else
        unless (i+1) >= 10
          output << " #{i+1} "
          if day_of_week_conversion(zellers(i+1)) == 'Sa'
            output.rstrip!
            output << "\n"
          end
        else
          output << "#{i+1} "
          if day_of_week_conversion(zellers(i+1)) == 'Sa'
            output.rstrip!
            output << "\n"
          end
        end
      end
    end
    output = output.rstrip
    output << "\n"
    output << "\n"
    return output
  end

  ############################################
  # Private helper methods
  ############################################
  private
    def valid_args?
      if (@month < 1 or @month > 12)
        return false
      end

      if (@year < 1800 or @year > 3000)
        return false
      end

      return true
    end

    def zellers(day_of_month)
      # day of month
      if (@month == 1)
        month_converted = 13
        year_converted = @year-1
      elsif (@month == 2)
        month_converted = 14
        year_converted = @year-1
      else
        month_converted = @month
        year_converted = @year
      end

      q = day_of_month
      floor_1 = ((13 * (month_converted + 1))/5)
      k = (year_converted) % 100
      j = year_converted.to_s[0,2].to_i
      floor_2 = (k/4)
      floor_3 =(j/4)

      return (q + floor_1 + k + floor_2 + floor_3 + (5*j)) % 7
    end

    def day_of_week_conversion(index)
      days = {0 => 'Sa', 1 => 'Su', 2 => 'Mo', 3 => 'Tu', 4 => 'We', 5 => 'Th', 6 => 'Fr'}
      return days[index]
    end

    def leap_year?
      leap = false
      if (@year % 4 == 0)
        leap = true
      end

      if (@year % 100 == 0)
        leap = false
      end

      if (@year % 400 == 0)
        leap = true
      end
      return leap
    end

end
