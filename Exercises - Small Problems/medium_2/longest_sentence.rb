=begin
Description:
Write a program that reads the content of a text file and then 
prints the longest sentence in the file based on number of 
words. Sentences may end with periods (.), exclamation 
points (!), or question marks (?). Any sequence of characters 
that are not spaces or sentence-ending characters should be 
treated as a word. You should also print the number of words in 
the longest sentence.

Problem Definition:
  - input: text file
  - output: string (longest sentence)
  - rules/model:
    - find sentence with most words
      - sentences end with: (.) or (!) or (?)
    - spaces or sentence-ending chars are not considered words
    - prints longest sentence along with number of words
    - '--' is a word
  
Examples / Test Cases:
  

Data Structure:
  - input: 
  - rules: 

Algorithm:


=end

# Code:
END_CHARS = /[.!?]/
PARA_END = /\R/

text1 = File.read("example.txt")
# puts text1

require 'open-uri'
file2 = URI.open('http://www.gutenberg.org/cache/epub/84/pg84.txt')
text2 = file2.read
# puts text2

def longest_sentence(text)
  sentences = text.gsub(/([.!?])/, '\1$').split('$')
  longest = sentences.max_by { |sentence| sentence.split.length }.strip
  longest_length = longest.split.length
  puts "The longest sentence has #{longest_length} words: '#{longest}'"
end

longest_sentence(text1)
longest_sentence(text2)

def longest_word(text)
  words = text.gsub(END_CHARS, '').split
  longest = words.max_by { |word| word.length }
  longest_length = longest.length
  puts "The longest word has #{longest_length} characters: '#{longest}'"
end

longest_word(text1)
longest_word(text2)

def longest_paragraph(text)
  paragraphs = text.split(/\n{2,}/)
  longest = paragraphs.max_by { |para| para.split(/\n/).length }
  longest_length = longest.split(/\n/).length
  puts "The longest para has #{longest_length} lines: '#{longest}'"
end

longest_paragraph(text1)
