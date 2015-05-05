#!/usr/bin/env ruby

require_relative 'lib/Month'

# This is ruby file where we will use Month, Day, Year and call to_s


if !ARGV[0].nil? and !ARGV[1].nil?
  month = Month.new(ARGV[0], ARGV[1])
  puts month.to_s
end

if !ARGV[0].nil? and ARGV[1].nil?
  year = Year.new(ARGV[0])
  puts year.to_s
end


