require_relative 'Day'
require_relative 'Year'

class Month

  attr_reader :month, :year

  def initialize (month, year)
    @month = month.to_i
    @year = year.to_i
  end


  def name
    month_names = {1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'}
    return month_names[@month]
  end


  def day_count
    # special case for Feb in leap years
    if @month == 2
      # is a leap year?
      if Year.new(@year).leap_year?
        return 29
      else
        return 28
      end
    end
    month_day_counts = {1 => 31, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
    return month_day_counts[@month]
  end


  def to_s
    day = Day.new(2,2,1987)
    cal_width = 20
    output = ""
    if !valid_args?
      return "Date not in acceptable format/range"
    end

    # print month name and year
    output << "#{name} #{@year}".center(cal_width).rstrip!
    output << "\n"

    # print days of week
    output << "Su Mo Tu We Th Fr Sa\n"

    # print the numbers in calendar
    day_count.times do |i|
      if (i == 0)
        start_day_of_month = Day.new(@month, (i+1), @year).day_of_week

        # calculate number of leading spaces we need
        if (start_day_of_month == 0) # saturday special case
          extra_spaces = cal_width - 1
        else
          extra_spaces = ((start_day_of_month-1) * 2) + start_day_of_month
        end

        leading_spaces = " " * extra_spaces
        output << leading_spaces
        output << "#{i+1} "
        if day.day_of_week_conversion(Day.new(@month, (i+1), @year).day_of_week) == 'Sa'
            output.rstrip!
            output << "\n"
        end
      else
        unless (i+1) >= 10
          output << " #{i+1} "
          if day.day_of_week_conversion(Day.new(@month, (i+1), @year).day_of_week) == 'Sa'
            output.rstrip!
            output << "\n"
          end
        else
          output << "#{i+1} "
          if day.day_of_week_conversion(Day.new(@month, (i+1), @year).day_of_week) == 'Sa'
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
end
