=begin
Description:
Write a method that takes an array of strings, and returns an 
array of the same string values, except with the vowels 
(a, e, i, o, u) removed.

Problem Definition:
  - input: array of strings
  - output: array of strings
    - modify original array or new array?
  - rules/model:
    - case insensitive match to vowels

Examples / Test Cases:
  remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
  remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
  remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Data Structure:
  - input: array of strings
  - rules: regexp

Algorithm:
  - for each element in array
    - delete match
  - return new array

=end

# Code:
VOWELS = "aeiouAEIOU"

def remove_vowels(ary)
  ary.map do |str|
    str.delete VOWELS
  end
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']