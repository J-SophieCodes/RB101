=begin
Description:
Write a method that takes a non-empty string argument, and 
returns the middle character or characters of the argument. 
If the argument has an odd length, you should return exactly 
one character. If the argument has an even length, you should 
return exactly two characters.

Problem Definition:
  - input: non-empty string
  - output: middle character in string
  - rules/model:
    - return one char if string size is odd 
    - return two chars if string size is even

Examples / Test Cases:
  center_of('I love ruby') == 'e'
  center_of('Launch School') == ' '
  center_of('Launch') == 'un'
  center_of('Launchschool') == 'hs'
  center_of('x') == 'x'

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def center_of(str)
  mid_idx = str.size/2
  str.size.odd? ? str[mid_idx] : str[mid_idx-1, 2]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'