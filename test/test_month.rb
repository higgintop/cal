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
    assert_equal m.name, "     March"
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


end
