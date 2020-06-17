=begin
Description:
Write a method that takes a floating point number that 
represents an angle between 0 and 360 degrees and returns a 
String that represents that angle in degrees, minutes and 
seconds. You should use a degree symbol (°) to represent 
degrees, a single quote (') to represent minutes, and a double 
quote (") to represent seconds. A degree has 60 minutes, while 
a minute has 60 seconds.

Note: your results may differ slightly depending on how you 
round values, but should be within a second or two of the 
results shown.

You should use two digit numbers with leading zeros when 
formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"

Problem Definition:
  - input: floating point number
  - output: string
  - rules/model:
    - an angle ranges between 0 - 360 degrees
    - 60 minutes in a degree
    - 60 seconds in a minute
    - round the results
    - minutes and seconds should have two digits with leading 0
    - what is the conversion from decimal degrees to dms?
      - whole number part = degrees
      - whole number part of decimal * 60 = minutes
      - decimal part of (decimal * 60), * 60 = seconds
    
Examples / Test Cases:
  dms(30) == %(30°00'00")
  dms(76.73) == %(76°43'48")
  dms(254.6) == %(254°36'00")
  dms(93.034773) == %(93°02'05")
  dms(0) == %(0°00'00")
  dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Data Structure:
  - input: floating point number
  - rules: logic

Algorithm:
  - truncate the number to get the degrees (use #to_i)
  - minutes, seconds = (number - degrees) * 3600 divmod 60

=end

# Code:
DEGREE_SYM = "\xC2\xB0"

MIN_PER_DEG = 60
SEC_PER_MIN = 60
SEC_PER_DEG = MIN_PER_DEG * SEC_PER_MIN

def dms(num)
  deg = num.to_i
  min, sec = ((num * 1000 - deg * 1000) * SEC_PER_DEG / 1000).divmod(SEC_PER_MIN)
  format(%(%d%s%02d'%02d"), deg, DEGREE_SYM, min, sec)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# SOLUTION
# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# FURTHER EXPLIRATION

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def ultimate_dms(degrees_float)
  degrees_float %= 360 
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts ultimate_dms(400) == %(40°00'00")
puts ultimate_dms(-40) == %(320°00'00")
puts ultimate_dms(-420) == %(300°00'00")