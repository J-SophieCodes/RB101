=begin
Description:
Write a method that returns the next to last word in the String 
passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at 
least two words.

Problem Definition:
  - input: string
    - edge cases:
      - one word string?
      - empty string?
  - output: string
  - rules/model:

Examples / Test Cases:
  penultimate('last word') == 'last'
  penultimate('Launch School is great!') == 'is'

Data Structure:
  - input: string
  - rules: array

Algorithm:


=end

# Code:
def penultimate(str)
  return "Oops, there isn't a penultimate word here..." if str.split.size < 2
  str.split[-2]
end

puts penultimate('hello')
puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'


# FURTHER EXPLORATION
# Suppose we need a method that retrieves the middle word of a 
# phrase/sentence. What edge cases need to be considered? How 
# would you handle those edge cases without ignoring them? Write 
# a method that returns the middle word of a phrase or sentence. 
# It should handle all of the edge cases you thought of.

# Edge cases: 
#   - empty string 
#   - assuming middle word of one-word string is the word itself
#   - strings with even number of words (including 0 length)

def middle_word(str)
  words = str.split
  mid_idx = words.size / 2
  return str if words.size == 0
  return words[mid_idx-1..mid_idx].join(" ") if words.size.even?
  words[mid_idx]
end

puts middle_word('')
puts middle_word('hello')
puts middle_word('hello there')
puts middle_word('hello there my')
puts middle_word('hello there my name')