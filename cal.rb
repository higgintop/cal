#!/usr/bin/env ruby

require_relative 'lib/Month'

# This is ruby file where we will use Month, Day, Year and call to_s

userInputMonth = ARGV[0]
userInputYear = ARGV[1]

month = Month.new(userInputMonth, userInputYear)
puts month.to_s
