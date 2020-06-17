=begin
Description:
Write a method that returns true if the string passed as an 
argument is a palindrome, false otherwise. A palindrome reads
the same forward and backward. For this exercise, case matters
as does punctuation and spaces.

Problem Definition:
  - input: string
  - output: boolean
  - rules/model:
    - palindrome: reads the same forward and backward
    - case-sensitive
    - punctuation and spaces also matter
    - returns true if the input string is a palindrome

Examples / Test Cases:
  palindrome?('madam') == true
  palindrome?('Madam') == false          # (case matters)
  palindrome?("madam i'm adam") == false # (all characters matter)
  palindrome?('356653') == true

Data Structure:
  - input: string
  - rules: string - use existing string methods

Algorithm:
  - check if string == reverse of string

=end

# Code:
def palindrome?(arg)
  arg == arg.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?(%w(3 5 6 6 5 3)) == true
puts palindrome?(%w(m a d a m)) == true
puts palindrome?(%w(M a d a m)) == false
puts palindrome?(%w(hello you you hello)) == true