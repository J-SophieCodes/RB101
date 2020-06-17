=begin
Description:
Write a method that takes a positive integer or zero, and 
converts it to a string representation.

You may not use any of the standard conversion methods 
available in Ruby, such as Integer#to_s, String(), 
Kernel#format, etc. Your method should do this the 
old-fashioned way and construct the string by analyzing 
and manipulating the number.

Problem Definition:
  - input: integer, positive
    - empty input?
    - float? negative?
  - output: string
  - rules/model:

Examples / Test Cases:
  integer_to_string(4321) == '4321'
  integer_to_string(0) == '0'
  integer_to_string(5000) == '5000'

Data Structure:
  - input: integer
  - rules: array

Algorithm:
  - quotient, modulo = int.divmod(divisor)

=end

# Code:
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(num)
  str = ""
  loop do
    num, digit = num.divmod(10)
    str.prepend(DIGITS[digit])
    break if num == 0
  end
  str
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

# can convert integer into an array of digits with 
# Integer#digits