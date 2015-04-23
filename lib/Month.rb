require_relative 'Year'

class Month

  attr_reader :month, :year

  def initialize (month, year)
      @month = month
      @year = year
  end

  def to_s
    output = ""
    if !valid_args?(@month, @year)
      return "Date not in acceptable format/range"
    end

  end

  private
    def valid_args?(month,year)
      if (month.to_i < 1 or month.to_i > 12)
        return false
      end

      if (year.to_i < 1800 or year.to_i > 3000)
        return false
      end

      return true
    end
end
