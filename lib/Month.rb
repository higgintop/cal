require_relative 'Day'
require_relative 'Year'

class Month

  HEIGHT = 8

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
    output = ""

    if !valid_args?
      return "Date not in acceptable format/range"
    end

    # Print headers for a month
    output << month_header
    output << days_of_week_header

    # use zeller's eqn to find start day of week for a month
    starting_day_of_week = Day.new(@month, 1, @year).day_of_week

    # put days into an array
    days = (1..day_count).to_a

    # add leading spaces to front of array
    if (starting_day_of_week == 0) # saturday start day
      (6).times {days.unshift("  ")}
    else
      (starting_day_of_week - 1).times {days.unshift("  ")}
    end

    # split days array into 7 day week arrays
    weeks = days.each_slice(7).to_a

    weeks.each do |week_array|
      week_array.map! {|day| day.to_s.rjust(2) }
      output << week_array.join(" ").concat("\n")
    end

    # chomp very last new line added
    output = output.rstrip

    #puts "The output has how many newlines? " + output.scan(/\n/).count.to_s
    (HEIGHT - (output.scan(/\n/).count)).times do
      output << "\n"
    end
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

    def month_header
      cal_width = 20
      "#{name} #{@year}".center(cal_width).rstrip!.concat("\n")
    end

    def days_of_week_header
      "Su Mo Tu We Th Fr Sa".concat("\n")
    end
end
