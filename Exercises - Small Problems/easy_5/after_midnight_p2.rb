=begin
Description:
As seen in the previous exercise, the time of day can be 
represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after 
midnight. If the number of minutes is negative, the time is 
before midnight.

Write two methods that each take a time of day in 24 hour 
format, and return the number of minutes before and after 
midnight, respectively. Both methods should return a value in 
the range 0..1439.

You may not use ruby's Date and Time methods.

Disregard Daylight Savings and Standard Time and other 
irregularities.

Problem Definition:
  - input: string in hh:mm format
  - output: integer (minutes)
  - rules/model:

Examples / Test Cases:
  after_midnight('00:00') == 0
  before_midnight('00:00') == 0
  after_midnight('12:34') == 754
  before_midnight('12:34') == 686
  after_midnight('24:00') == 0
  before_midnight('24:00') == 0
  
  *** Yes, we know that 24:00 isn't a valid time in 24-hour 
      format. Humor us, though; it makes the problem more 
      interesting.

Data Structure:
  - input: string
  - rules: split string into array

Algorithm:
  - split string by ":" separator into array
  - convert strings 'hh' and 'mm' into integers
  - convert hh into mm, and sum all mm
    - after_midnight = sum
    - before_midnight = 1440 - sum
  - return the modulus from dividing by 1440

=end

# Code:
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def delta_minutes(time_str)
  hh, mm = time_str.split(":").map(&:to_i)
  hh * MINUTES_PER_HOUR + mm
end

def after_midnight(time_str)
  delta_minutes(time_str) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  (1440 - delta_minutes(time_str)) % MINUTES_PER_DAY
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
