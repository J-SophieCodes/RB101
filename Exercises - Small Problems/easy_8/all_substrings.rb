=begin
Description:
Write a method that returns a list of all substrings of a 
string. The returned list should be ordered by where in the 
string the substring begins. This means that all substrings 
that start at position 0 should come first, then all substrings 
that start at position 1, and so on. Since multiple substrings 
will occur at each position, the substrings at a given position
 should be returned in order from shortest to longest.

You may (and should) use the substrings_at_start method you 
wrote in the previous exercise:

Problem Definition:
  - input: string
  - output: array of substrings
  - rules/model:
    - ordered by starting char
    - 

Examples / Test Cases:
  substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde', 
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]

Data Structure:
  - input:
  - rules:

Algorithm:
  - for each index
    - iterate from index until last index
      - in each iteration, create substr from iteration # until last index

=end

# Code:
def substrings_at_start(str)
  (0..str.size-1).map do |idx|
    str[0..idx]
  end
end

def substrings(str)
  (0..str.size-1).map do |idx|
    substrings_at_start(str[idx..-1])
  end.flatten
end

p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde', 
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]