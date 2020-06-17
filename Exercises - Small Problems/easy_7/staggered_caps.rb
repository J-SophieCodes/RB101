=begin
Description:
Write a method that takes a String as an argument, and returns a 
new String that contains the original value using a staggered 
capitalization scheme in which every other character is 
capitalized, and the remaining characters are lowercase. 
Characters that are not letters should not be changed, but 
count as characters when switching between upper and lowercase.

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
  staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
  staggered_case('ALL_CAPS') == 'AlL_CaPs'
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

Data Structure:
  - input: string
  - rules: array of individual char

Algorithm:
  -

=end

# Code:
def staggered_case(str)
  capital = false
  str.chars.map do |char|
    capital = !capital
    capital ? char.upcase : char.downcase
  end.join
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


# FURTHER EXPLORATION
# Can you modify this method so the caller can request that the 
# first character be downcased rather than upcased? If the first 
# character is downcased, then the second character should be 
# upcased, and so on.

# Hint: Use a keyword argument.

def staggered_case(str, startcap: true)
  capital = !startcap
  str.chars.map do |char|
    capital = !capital
    capital ? char.upcase : char.downcase
  end.join
end

puts staggered_case('I Love Launch School!', startcap: false) 
puts staggered_case('ALL_CAPS')
puts staggered_case('ignore 77 the 444 numbers', startcap: false) 