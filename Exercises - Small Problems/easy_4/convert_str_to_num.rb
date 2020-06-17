=begin
Description:
The String#to_i method converts a string of numeric characters 
(including an optional plus or minus sign) to an Integer. 
String#to_i and the Integer constructor (Integer()) behave 
similarly. In this exercise, you will create a method that does
the same thing.

Write a method that takes a String of digits, and returns the
appropriate number as an integer. You may not use any of the 
methods mentioned above.

For now, do not worry about leading + or - signs, nor should 
you worry about invalid characters; assume all characters 
will be numeric.

You may not use any of the standard conversion methods 
available in Ruby, such as String#to_i, Integer(), etc. Your 
method should do this the old-fashioned way and calculate the 
result by analyzing the characters in the string.

Problem Definition:
  - input: string
    - what about floats?
  - output: numeric
  - rules/model:
    - convert string to number without using any prebuilt
      methods

Examples / Test Cases:
  string_to_integer('4321') == 4321
  string_to_integer('570') == 570

Data Structure:
  - input: string
  - rules: array and logic

Algorithm:
  - split string into chars
  - convert each char into integer
  - multiply each integer by their place value
  - reduce the list of integer into a sum

=end

# Code:
def char_to_numeric(char)
  char.ord - '0'.ord
end

def expanded_notation(str)
  str.chars.reverse.map.with_index do |char, idx|
    char_to_numeric(char) * 10**idx
  end
end

def string_to_integer(str)
  expanded_notation(str).reduce(:+)
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570


# SOLUTION
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