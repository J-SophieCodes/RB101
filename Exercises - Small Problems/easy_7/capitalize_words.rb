=begin
Description:
Write a method that takes a single String argument and returns a 
new string that contains the original value of the argument 
with the first character of every word capitalized and all 
other letters lowercase.

You may assume that words are any sequence of non-blank 
characters.

Problem Definition:
  - input: string
  - output: a new string
  - rules/model:
    - capitalize first letter of every word
    - all other letters should be lowercase
    - words within quotes appear to remain unmodified

Examples / Test Cases:
  word_cap('four score and seven') == 'Four Score And Seven'
  word_cap('the javaScript language') == 'The Javascript Language'
  word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

Data Structure:
  - input: string 
  - rules: array

Algorithm:


=end

# Code:
# def word_cap(str)
#   str.split.map(&:capitalize).join(" ")
# end

# puts word_cap('four score and seven') == 'Four Score And Seven'
# puts word_cap('the javaScript language') == 'The Javascript Language'
# puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


# FURTHER EXPLORATION - don't use capitalize
def word_cap(str)
  str.split.map(&:downcase).each do |word|
    word[0]= word[0].upcase
  end.join(" ")
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
