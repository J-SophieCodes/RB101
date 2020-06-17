=begin
Description:
Build a program that displays when the user will retire and how
many years she has to work till retirement.

Problem Definition:
  - input: integer
    - validate?
  - output: print to screen
  - rules/model:
    - calculate year to retirement 

Examples / Test Cases:
  What is your age? 30
  At what age would you like to retire? 70

  It's 2016. You will retire in 2056.
  You have only 40 years of work to go!

Data Structure:
  - input: integer
  - rules: logic

Algorithm:
  - prompt for current age
  - prompt for retirement age
  - calculate number of years until retirement
  - calculate retirement year
  - display results

=end

# Code:
puts "What is your age?"
current_age = gets.to_i

puts "At what age would you like to retire?"
retirement_age = gets.to_i

years_left = retirement_age - current_age

current_year = Time.now.year
retirment_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retirment_year}."
puts "You have only #{years_left} years of work to go!"