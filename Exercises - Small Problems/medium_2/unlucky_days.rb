=begin
Description:
Write a method that returns the number of Friday the 13ths in 
the year given by an argument. You may assume that the year is 
greater than 1752 (when the United Kingdom adopted the modern 
Gregorian Calendar) and that it will remain in use for the 
foreseeable future.

Problem Definition:
  - input: integer (year)
  - output: integer
  - rules/model:
    - return number of Friday the 13th in the given year
  
Examples / Test Cases:
  friday_13th(2015) == 3
  friday_13th(1986) == 1
  friday_13th(2019) == 2

Data Structure:
  - input: integer
  - rules: 

Algorithm:


=end

# Code:
require 'date'

def friday_13th(year)
  start_date = Date.new(year)
  end_date = Date.new(start_date.year + 1)
  start_date.upto(end_date).count do |date|
    date.friday? && date.day == 13
  end
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

# # SOLUTION
def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

# # REFACTORED
def friday_13th(year)
  (1..12).count do |month|
    Date.new(year, month, 13).friday?
  end
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2


# FURTHER EXPLORATIOM
def five_fridays(year)
  start = Date.new(year)
  fridays = (start...start.next_year).select { |date| date.friday? }
  
  (1..12).count do |month|
    fridays.count { |date| date.mon == month } == 5
  end
end

puts five_fridays(2020) == 4