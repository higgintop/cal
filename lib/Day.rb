class Day

  def initialize(month, day, year)
    @day = day.to_i
    @month = month.to_i
    @year = year.to_i
  end

  def  day_of_week
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

    q = @day
    floor_1 = ((13 * (month_converted + 1))/5)
    k = (year_converted) % 100
    j = year_converted.to_s[0,2].to_i
    floor_2 = (k/4)
    floor_3 =(j/4)

    return (q + floor_1 + k + floor_2 + floor_3 + (5*j)) % 7
  end

  def self.day_of_week_conversion(index)
    days = {0 => 'Sa', 1 => 'Su', 2 => 'Mo', 3 => 'Tu', 4 => 'We', 5 => 'Th', 6 => 'Fr'}
    return days[index]
  end
end
