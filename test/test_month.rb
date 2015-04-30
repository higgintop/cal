require_relative 'helper'

require_relative '../lib/month'


#############################################
#  Unit tests for Month class
#############################################

class TestMonth < Minitest::Test

  def test_initializing_a_month_saves_values
    m = Month.new(05, 2015)
    assert_equal 05, m.month
    assert_equal 2015, m.year
  end

  def test_name_for_march
    m = Month.new(03, 2015)
    assert_equal m.name, "March"
  end

  def test_day_count_for_march
    m = Month.new(03, 2015)
    assert_equal m.day_count, 31
  end

  def test_day_count_for_feb_non_leap
    m = Month.new(02, 2015)
    assert_equal m.day_count, 28
  end

  def test_day_count_for_feb_leap
    m = Month.new(02, 2016)
    assert_equal m.day_count, 29
  end

  def test_to_s_method_starting_on_sunday
    m = Month.new(03, 2015)
    expected = <<EOS
     March 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_method_starting_on_saturday
    m = Month.new(03, 3000)
    expected = <<EOS
     March 3000
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_method_feb_2009
    m = Month.new(02, 2009)
    expected = <<EOS
   February 2009
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28



EOS
    assert_equal expected, m.to_s
  end

end
