=begin
Description:
In the modern era under the Gregorian Calendar, leap years 
occur in every year that is evenly divisible by 4, unless the 
year is also divisible by 100. If the year is evenly divisible
by 100, then it is not a leap year unless the year is evenly 
divisible by 400.

Assume this rule is good for any year greater than year 0. 
Write a method that takes any year greater than 0 as input, 
and returns true if the year is a leap year, or false if it is 
not a leap year.

Problem Definition:
  - input:
    - integer, > 0
    - do we need to validate?
  - output: boolean
  - rules/model:
    - leap year when
      - year % 4 == 0 AND year % 100 != 0, OR
      - year % 400 == 0

Examples / Test Cases:
  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  leap_year?(240001) == false
  leap_year?(2000) == true
  leap_year?(1900) == false
  leap_year?(1752) == true
  leap_year?(1700) == false
  leap_year?(1) == false
  leap_year?(100) == false
  leap_year?(400) == true

Data Structure:
  - input: integer
  - rules: user logic

Algorithm:
  - one method to determine if one of the statements is truthy

=end

# Code:
def leap_year?(year)
  year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

# FURTHER EXPLORATION - order matters
def leap_year?(year)
  if year % 100 == 
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

# If leap year 400 was passed into the method, the first if 
# statement on line 70 would evaluate true, thus returning false
# from the method, without evaluating elsif statement on line 72.
# All leap years divisible by 400 will fail 

# If order of assessment is reversed:
def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        true
      else
        false
      end
    else
      true
    end
  else
    false
  end
end