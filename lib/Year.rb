
require_relative 'Month'

class Year

  attr_reader :year

  def initialize(year)
    @year = year.to_i
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

  def to_s
    output = ""
    cal_width = 63
    gutter = "  "
    nil_row = "                    "

    # center the year
    output << @year.to_s.center(cal_width).rstrip!
    output << "\n\n"

    # Create 12 months
    monthArray = []
    12.times do |i|
      monthArray << Month.new((i+1), @year)
    end

    # loop 4 times and each iterartion print
    # 3 months horizontally
    month_count = 0
    4.times do |i|
      # 4 times make 3 months and print them
      # Pull out 3 months from the month array
      month_1 = monthArray[month_count].to_s.split("\n")
      month_2 = monthArray[month_count+1].to_s.split("\n")
      month_3 = monthArray[month_count+2].to_s.split("\n")


      # take out year that Month's to_s method produces and center the text
      month_1[0] = month_1[0].gsub(/[\d]/, "").strip.center(20)
      month_2[0] = month_2[0].gsub(/[\d]/, "").strip.center(20)
      month_3[0] = month_3[0].gsub(/[\d]/, "").strip.center(20)

      # a month is how tall? at most 8 lines tall
      # add padding lines to short months
      if month_1.size < 8 and month_2.size < 8 and month_3.size < 8
        need_new_line = true
      else
        need_new_line = false
      end
      
      until month_1.size == 8
        month_1 << ""
      end

      until month_2.size == 8
        month_2 << ""
      end

      until month_3.size == 8
        month_3 << ""
      end



      # Try zipping
      three_months = month_1.zip(month_2, month_3)

      three_months.each do |line|
        if line[0].nil?
          line[0] = nil_row
        end
        if line[1].nil?
          line[1] = nil_row
        end
        if line[2].nil?
          line[2] = nil_row
        end
        if line[3].nil?
          line[3] = nil_row
        end

        # first rstrip everything
        line[0] = line[0].rstrip
        line[1] = line[1].rstrip
        line[2] = line[2].rstrip
        line[3] = line[3].rstrip

        output << line[0].ljust(20) << gutter << line[1].ljust(20) << gutter << line[2].ljust(20) << gutter << line[3].ljust(20)
        output = output.rstrip
        output << "\n"
      end
      
      # output newline if we went 8
      if need_new_line
        output << "\n"
      end

      # increment month_count
      month_count += 3

    end

    return output

  end
end
