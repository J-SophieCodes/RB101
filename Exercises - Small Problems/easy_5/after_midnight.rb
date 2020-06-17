=begin
Description:
The time of day can be represented as the number of minutes 
before or after midnight. If the number of minutes is positive,
the time is after midnight. If the number of minutes is 
negative, the time is before midnight.

Write a method that takes a time using this minute-based format
and returns the time of day in 24 hour format (hh:mm). Your 
method should work with any integer input.

You may not use ruby's Date and Time classes.

Disregard Daylight Savings and Standard Time and other 
complications.

Problem Definition:
  - input: integer, positive or negative, or zero
    - unit in minutes
    - validation?
    - floats?
  - output: string in hh:mm 24-hr format
  - rules/model:
    - if input is positive, time is after 00:00
    - if input is negative, time is before 00:00
    - every hour has 60 minutes

Examples / Test Cases:
  time_of_day(0) == "00:00"
  time_of_day(-3) == "23:57"
  time_of_day(35) == "00:35"
  time_of_day(-1437) == "00:03"
  time_of_day(3000) == "02:00"
  time_of_day(800) == "13:20"
  time_of_day(-4231) == "01:29"

Data Structure:
  - input: integer
  - rules: work with integers; convert to string for output

Algorithm:
  - with minute-based integer
    - calc number of hours (or counts of 60 minutes) 
      - a day cycles over every 24 hrs 
      - only remainder matters in determining hh
    - calc remaining minutes
  - for positive input
    - add hours and minutes to midnight (0 hr, 0 min)
  - for negative input
    - minus hours from 23 hr
    - minus minutes from 60 min
  - convert to "hh:mm" format

=end

# Code:
# Numeric#divmod 
# If divisor is always positive, then remainder will always be
# positive as well since quotient is rounded toward negative 
# infinity.
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(minutes)
  days, total_min_on_last_day = minutes.divmod(MINUTES_PER_DAY)

  hh_after_00, mm_after_00 = total_min_on_last_day.divmod(MINUTES_PER_HOUR)

  sprintf("%02d:%02d", hh_after_00, mm_after_00)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
