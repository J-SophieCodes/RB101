=begin
Description:
Write a method that takes a number as an argument. If the 
argument is a positive number, return the negative of that 
number. If the number is 0 or negative, return the original 
number.

Problem Definition:
  - input: integer
  - output: negative or 0
  - rules/model:
    - return the negative of positive int
    - return original if negative or 0 int

Examples / Test Cases:
  negative(5) == -5
  negative(-3) == -3
  negative(0) == 0      # There's no such thing as -0 in ruby

Data Structure:
  - input: integer
  - rules: logic

Algorithm:
  - negate int if int > 0
  - else return int

=end

# Code:
def negative(num)
  num > 0 ? -num : num  # -number.abs
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0