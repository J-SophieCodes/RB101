=begin
Description:
Write a method that takes a String of digits, and returns the 
appropriate number as an integer. The String may have a leading 
+ or - sign; if the first character is a +, your method should 
return a positive number; if it is a -, your method should 
return a negative number. If no sign is given, you should 
return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods 
available in Ruby, such as String#to_i, Integer(), etc. You 
may, however, use the string_to_integer method from the 
previous lesson.

Problem Definition:
  - input: numeric string with +/- sign
  - output: signed number
  - rules/model:
    - check input for +/- sign
      - if it starts with a sign
        - remove sign from numeric part of string
          - if its a negative sign, multiple output by -1
    - use the same string_to_integer method for numeric portion
      of string

Examples / Test Cases:
  string_to_signed_integer('4321') == 4321
  string_to_signed_integer('-570') == -570
  string_to_signed_integer('+100') == 100

Data Structure:
  - input: string
  - rules: logic

Algorithm:


=end

# Code:
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
} # Use hash for conversions

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  integer = string_to_integer(string.delete("-+"))
  string.start_with?("-") ? -integer : integer
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

# SOLUTION
# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end