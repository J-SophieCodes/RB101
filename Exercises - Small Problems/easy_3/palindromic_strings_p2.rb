=begin
Description:
Write a method that returns true if the string passed as an 
argument is a palindrome, false otherwise. This time, however, 
your method should be case-insensitive, and it should ignore 
all non-alphanumeric characters. If you wish, you may simplify
things by calling the palindrome? method you wrote in the 
previous exercise.

Problem Definition:
  - input: string
  - output: boolean
  - rules/model:
    - palindrome: reads the same forward and backward
    - case-insensitive
    - ignore all non-alphanumeric characters
    - returns true if the input string is a palindrome

Examples / Test Cases:
  real_palindrome?('madam') == true
  real_palindrome?('Madam') == true           # (case does not matter)
  real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
  real_palindrome?('356653') == true
  real_palindrome?('356a653') == true
  real_palindrome?('123ab321') == false

Data Structure:
  - input: string
  - rules: string - use existing string methods

Algorithm:
  - convert string to lowercase for comparison
  - remove non-alphanumeric characters
  - check if string == reverse of string

=end

# Code:
def palindrome?(arg)
  arg == arg.reverse
end

def real_palindrome?(arg)
  palindrome?(arg.downcase.delete "^a-z0-9")
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

# ALTERNATIVELY: 
# can pass arg.scan(/[[:alnum:]]/).join into palindrome?
# String#scan returns an array of matches