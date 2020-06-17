=begin
Description:
Write a method that determines and returns the ASCII string 
value of a string that is passed in as an argument. The ASCII 
string value is the sum of the ASCII values of every character 
in the string. (You may use String#ord to determine the ASCII 
value of a character.)

Problem Definition:
  - input: string
  - output: integer
  - rules/model:

Examples / Test Cases:
  ascii_value('Four score') == 984
  ascii_value('Launch School') == 1251
  ascii_value('a') == 97
  ascii_value('') == 0

Data Structure:
  - input: string
  - rules: array

Algorithm:
  - split string into array of chars
  - reduce the array into a sum of the ascii values
    - use #ord to determine each char's ascii value

=end

# Code:
def ascii_value(str)
  str.chars.sum { |char| char.ord }
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0


# FURTHER EXPLORATION
char.ord.chr == char
# Integer#chr 
# if you invoke #ord.chr on a longer string, ord will only 
# return the ASCII value of the first char of the string