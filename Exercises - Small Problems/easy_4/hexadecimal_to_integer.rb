=begin
Description:
Write a hexadecimal_to_integer method that converts a string 
representing a hexadecimal number to its integer value.

Problem Definition:
  - input: hexadecimal string
  - output: integer
  - rules/model:

Examples / Test Cases:
  hexadecimal_to_integer('4D9f') == 19871

Data Structure:
  - input: hexadecimal string
  - rules: hash for integer look up

Algorithm:


=end

# Code:
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
  'F' => 15
} 

def hexadecimal_to_integer(string)
  digits = string.upcase.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 16 * value + digit }
  value
end

puts hexadecimal_to_integer('4D9f')