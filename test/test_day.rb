require_relative 'helper'

require_relative '../lib/month'


#############################################
#  Unit tests for Day class
#############################################

class TestDay < Minitest::Test

  def test_zellers_equation
    d = Day.new(02,02,1987)
    assert_equal 2, d.day_of_week
  end

end
