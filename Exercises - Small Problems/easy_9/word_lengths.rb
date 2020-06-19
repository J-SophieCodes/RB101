=begin
Description:
Write a method that takes a string as an argument, and returns
an Array that contains every word from the string, to which 
you have appended a space and the word length.

You may assume that words in the string are separated by 
exactly one space, and that any substring of non-space 
characters is a word.

Problem Definition:
  - input: string
    - punctuation?
  - output: array
  - rules/model:
    - split string into array of words
      - what are words? separated by space, cluster of non-space
        chars
        - punctuation is part of word to which its adjacent to
        - counts towards word length
    - append a space and word length to each word element

Examples / Test Cases:
  word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

  word_lengths("baseball hot dogs and apple pie") ==
    ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

  word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

  word_lengths("Supercalifragilisticexpialidocious") ==
    ["Supercalifragilisticexpialidocious 34"]

  word_lengths("") == []

Data Structure:
  - input: string
  - rules: array

Algorithm:
  - split string into array of words
  - iterate through each word
    - map word + " " + word length into new array element

=end

# Code:
def word_lengths(str)
  str.split.map do |word|
    [word, word.size].join(" ")
  end
end

puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

puts word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

puts word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

puts word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]

puts word_lengths("") == []