=begin
Description:
Write a method that takes one argument, a string containing
one or more words, and returns the given string with words
that contain five or more characters reversed. Each string will
consist of only letters and spaces. Spaces should be included
only when more than one word is present.

Problem Definition:
  - input: string (only letters and spaces)
  - output: string
  - rules/model:
    - only reverse words that contain 5+ characters
    - print words in original order in string
    - words should be separated by space

Examples / Test Cases:
  puts reverse_words('Professional')          # => lanoisseforP
  puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
  puts reverse_words('Launch School')         # => hcnuaL loohcS

Data Structure:
  - input: string
  - rules: implement rules in array

Algorithm:
  - split the string into a list of words, with ' ' as the 
    delimiter
  - check each element for word length
    - if word length >= 5, reverse the characters in the word
    - otherwise, return original word
  - join resulting list of words together, with ' ' as the
    separator

=end

# Code:
def reverse_words(str)
  words = str.split.map do |word|
            word.size >= 5 ? word.reverse : word
          end
  words.join(' ')
end