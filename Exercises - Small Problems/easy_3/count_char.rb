=begin
Description:
Write a program that will ask a user for an input of a word or
multiple words and give back the number of characters. Spaces
should not be counted as a character.

Problem Definition:
  - input: string
  - output: string
  - rules/model:
    - count number of characters in input string
    - 

Examples / Test Cases:
  Please write word or multiple words: walk
  There are 4 characters in "walk".

  Please write word or multiple words: walk, don't run
  There are 13 characters in "walk, don't run".

Data Structure:
  - input: string
  - rules: string

Algorithm:
  - many ways:
    - string length minus counts of spaces in string
    - remove spaces, then find string length
    - count char, excluding spaces

=end

# Code:
puts "Please write word or multiple words: "
str = gets.chomp
number_of_char = str.count "^ " #could use str.delete(' ').size
puts "There are #{number_of_char} characters in \"#{str}\"."