=begin
Description:
Given a string of words separated by spaces, write a method 
that takes this string of words and returns a string in which 
the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, 
and that the string will always contain at least one word. You 
may also assume that each string contains nothing but words and 
spaces

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
  swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  swap('Abcde') == 'ebcdA'
  swap('a') == 'a'

Data Structure:
  - input: string
  - rules: array

Algorithm:
  - split string into array of words
  - for each sword
    - create a new string composed of:
      - last letter + middle letters + first letter
  - join words together, delimited by " "

=end

# Code:
# def swap(str)
#   words = str.split.map do |word|
#             word.size == 1 ? word : word[-1] + word[1..-2] + word[0]
#           end
#   words.join(" ")
# end
    
# puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# puts swap('Abcde') == 'ebcdA'
# puts swap('a') == 'a'

# SOLUTION
# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]  ************
#   word
# end

# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word)
#   end
#   result.join(' ')
# end

# FURTHER EXPLORATION
def swap_first_last_characters(a, b) # only references passed
  a, b = b, a # reassignment doesn't mutate
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0], word[-1]) # [b, a] returned
  end # an array of swapped first and last returned
  result.join(' ')
end

puts swap('Oh what a wonderful day it is') # => h O t w a a l w y d t i s i
puts swap('Abcde') # => e A
puts swap('a') # => a a