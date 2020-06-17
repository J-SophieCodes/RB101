=begin
Description:
Write a method that takes a signed integer, and converts it to 
a string representation.

You may not use any of the standard conversion methods 
available in Ruby, such as Integer#to_s, String(), 
\Kernel#format, etc. You may, however, use integer_to_string 
from the previous exercise.

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
  signed_integer_to_string(4321) == '+4321'
  signed_integer_to_string(-123) == '-123'
  signed_integer_to_string(0) == '0'

Data Structure:
  - input:
  - rules:

Algorithm:


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

def signed_integer_to_string(num)
  str = integer_to_string(num.abs)
  case num <=> 0
  when +1 then str.prepend("+")
  when -1 then str.prepend("-")
  else str
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
