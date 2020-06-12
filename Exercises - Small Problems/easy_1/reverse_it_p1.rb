=begin
Description:
Write a method that takes one argument, a string, and returns
a new string with the words in reverse order.

Problem Definition:
  - input: string
    - what if the string begins/ends with:
      - a space?
      - punctuation?
  - output: string
  - rules/model:
    - explicit: reverse the order of the words
    - implicit: do not modify the words themselves, only the
      order of the words in the string.
    - implicit: cases are preserved

Examples / Test Cases:
  The tests below should print true
    puts reverse_sentence('') == ''
    puts reverse_sentence('Hello World') == 'World Hello'
    puts reverse_sentence('Reverse these words') == 'words these Reverse'

Data Structure:
  - input: string
  - rules: use array to implement the rules

Algorithm:
  - split the string into a list of words, with ' ' as the 
    delimiter
  - reverse the elements in the array
  - join the elements of the array with ' ' as separator
  - return the reversed string

=end

# Code:
def reverse_sentence(str)
  str.split.reverse.join(' ')
end
