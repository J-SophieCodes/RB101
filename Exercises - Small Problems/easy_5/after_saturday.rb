=begin
Description:
How would you approach this problem if you were allowed to use 
ruby's Date and Time classes? Suppose you also needed to 
consider the day of week? (Assume that delta_minutes is the 
number of minutes before or after midnight between Saturday and 
Sunday.

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
in such a method, a delta_minutes value of -4231 would 
need to produce a return value of Thursday 01:29.)

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
# METHOD 1 - Not using Date and Time classes
DAYS_PER_WEEK = 7
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
WEEKDAYS = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

def time_and_day(delta_minutes)
  days, delta_minutes =  delta_minutes.divmod(MINUTES_PER_DAY)
  wday = WEEKDAYS[days % DAYS_PER_WEEK]
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%s %02d:%02d', wday, hours, minutes)
end

puts time_and_day(-4231) == "Thursday 01:29" # => true

# METHOD 2 - Using Date and Time classes
require 'date'

REFERENCE_DAY = DateTime.parse("2020-06-14")

def day_and_time(delta_minutes)
  days, delta_minutes =  delta_minutes.divmod(MINUTES_PER_DAY)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  new_daytime = (REFERENCE_DAY + days).new_offset("+#{hours}:#{minutes}")
  new_daytime.strftime('%A %H:%M')
end

puts day_and_time(-4231) == "Thursday 01:29" # => true