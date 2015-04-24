require_relative 'helper'

require_relative '../lib/year'


#############################################
#  Unit tests for Year class
#############################################

class TestYear < Minitest::Test
    def test_intitialize
      y = Year.new(2015)
      assert_equal y.year, 2015
    end

    def test_leap_year_method_a
      y = Year.new(2015)
      assert_equal y.leap_year?, false
    end

     def test_leap_year_method_b
      y = Year.new(2000)
      assert_equal y.leap_year?, true
    end

end
