=begin
Description:
Write a method that takes a string argument, and returns true 
if all of the alphabetic characters inside the string are 
uppercase, false otherwise. Characters that are not alphabetic 
should be ignored.

Problem Definition:
  - input: string
  - output: boolean
  - rules/model:
    - returns true if all char are uppercase
    - returns false if any char are lowercase

Examples / Test Cases:
  uppercase?('t') == false
  uppercase?('T') == true
  uppercase?('Four Score') == false
  uppercase?('FOUR SCORE') == true
  uppercase?('4SCORE!') == true
  uppercase?('') == true

Data Structure:
  - input: string
  - rules: array

Algorithm:
  - check if any char is lowercase

=end

# Code:
def uppercase?(str)
  !str.chars.any?(/[a-z]/)  
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

# alternatively
# string == string.upcase
# !str.upcase!    #upcase! returns nil if no changes made