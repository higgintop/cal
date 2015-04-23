#!/usr/bin/env ruby

require_relative 'lib/Month'

# This is ruby file where we will use Month, Day, Year and call to_s
# month = Month.new(ARGV[0], ARGV[1])
# puts month.to_s

userInputMonth = ARGV[0]
userInputYear = ARGV[1]

month = Month.new(userInputMonth, userInputYear)
puts month.to_s
