=begin
Which century is that?
  Write a function that takes an integer year as input and returns 
  the century. The return value should be a string that begins with 
  the century number, and ends with st, nd, rd, or th as appropriate 
  for that number.

  New centuries begin in years that end with 01. So, the years 1901 - 
  2000 comprise the 20th century.


Understanding the Problem: (implicit knowledge needs to be captured)
  - input:
    - integer number
      - do we need to validate?
  - output:
    - a string
    - begins with the century number
    - ends with st, nd, rd, or th
  - rules:
    - new centuries begin in years that end with 01
    - century string number into a string:
      - 1: st
      - 2: nd
      - 3: rd
      - 4-20: th
      - 21: st
      - 22: nd
      - 23: rd
      - 24-30: th
        ...
      - generalize:
        - century_number % 10
          - 1, 2, 3: st, nd, rd
          - 0, 4-9: th
        - except for 11, 12, 13

Examples / Test Cases:
  century(1)        =>  '1st'
  century(100)      =>  '1st'
  century(101)      =>  '2nd'
  century(133)      =>  '2nd'
  century(245)      =>  '3rd'
  century(1052)     =>  '11th'
  century(1152)     =>  '12th'
  century(1252)     =>  '13th'
  century(2012)     =>  '21st'
  century(2112)     =>  '22nd'
  century(22222)    =>  '223rd'
  century(22512)    =>  '226th'

Data Structure:
  - input
    - number
  - rules
    - as data or as logic/code?
    - look-up table isn't best due to exceptions and range of possible numbers
    - use logic/code

Algorithm:
  - divide problem into two smaller problems
    - century number = (year - 1) / 100
    - century string = century number to string, then "apply
      suffix rules"

Abstraction:
  - century_number method
  - suffix method

=end

# Code:
def century_number(year)
  (year/100.0).ceil
end

def suffix(num)
  if [11, 12, 13].include?(num % 100)
    "th"
  else 
    case num % 10
    when 1 then "st"
    when 2 then "nd"
    when 3 then "rd"
    else "th"
    end
  end
end

def century(year)
  num = century_number(year)
  num.to_s + suffix(num)
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'