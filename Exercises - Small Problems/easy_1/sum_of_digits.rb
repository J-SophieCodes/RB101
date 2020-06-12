=begin
Description:
Write a method that takes one argument, a positive integer, and 
returns the sum of its digits.

Problem Definition:
  - input: integer, positive
  - output: integer
  - rules/model:
    - sum the individual digits of a number

Examples / Test Cases:
  puts sum(23) == 5
  puts sum(496) == 19
  puts sum(123_456_789) == 45

Data Structure:
  - input: integer
  - rules:
    - store digits in array
    - sum the digits, and return an integer

Algorithm:
  - turn integer into string
  - split string into chars
  - convert chars to integers 
  - return sum of integers

=end

# Code:
def sum(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end