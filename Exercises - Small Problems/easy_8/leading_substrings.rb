=begin
Description:
Write a method that returns a list of all substrings of a 
string that start at the beginning of the original string. 
The return value should be arranged in order from shortest to 
longest substring.

Problem Definition:
  - input: string
  - output: array of substrings
  - rules/model:

Examples / Test Cases:
  substrings_at_start('abc') == ['a', 'ab', 'abc']
  substrings_at_start('a') == ['a']
  substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def substrings_at_start(str)
  str.chars.map.with_index do |_, idx|
    str[0..idx]
  end
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
