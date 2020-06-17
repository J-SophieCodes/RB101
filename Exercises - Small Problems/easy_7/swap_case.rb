=begin
Description:
Write a method that takes a string as an argument and returns 
a new string in which every uppercase letter is replaced by its 
lowercase version, and every lowercase letter by its uppercase 
version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this 
method.

Problem Definition:
  - input: string
  - output: new string
  - rules/model:

Examples / Test Cases:
  swapcase('CamelCase') == 'cAMELcASE'
  swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

Data Structure:
  - input: string
  - rules: array

Algorithm:


=end

# Code:
def swapcase(str)
  str.chars.map do |char|
    if char =~ /[[:lower:]]/
      char.upcase
    elsif char =~ /[[:upper:]]/
      char.downcase
    else
      char
    end
  end.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
