=begin
Description:
Write a method that returns true if its integer argument is
palindromic, false otherwise. A palindromic number reads the 
same forwards and backwards.

Problem Definition:
  - input: integer
  - output:
  - rules/model:

Examples / Test Cases:
  palindromic_number?(34543) == true
  palindromic_number?(123210) == false
  palindromic_number?(22) == true
  palindromic_number?(5) == true

Data Structure:
  - input: integer
  - rules: convert to string

Algorithm:
  - convert number into string
  - pass string into palindrome? method

=end

# Code:
def palindrome?(arg)
  arg == arg.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true

# if the argument passed into palindromic_number? is numeric,
# Ruby assumes numbers with leading zero's are octals, and tries
# to convert it to decimals.

# when passing in an argument to palindromic_number?, can use
# the String#% method to format the octal into a string, but
# you must specify the number of leading zeros.
# e.g. '0%o' % 0112 => '0112'
# e.g. '0%o' % 00112 => '0112'
# e.g. '00%o' % 001121100 => '0011221100'