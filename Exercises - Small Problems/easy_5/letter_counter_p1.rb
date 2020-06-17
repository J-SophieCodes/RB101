=begin
Description:
Write a method that takes a string with one or more space 
separated words and returns a hash that shows the number of 
words of different sizes.

Words consist of any string of characters that do not include a
space.

Problem Definition:
  - input: string
    - punctuation?
    - spaces?
  - output: hash
  - rules/model:
    0 

Examples / Test Cases:
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
  word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
  word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
  word_sizes('') == {}

Data Structure:
  - input: string
  - rules: hash

Algorithm:
  - split string into array of words
  - iterate through each element of words array
    - key = length of word; value = number of words of size 'key'
    - initialize key with value = 1
    - if existing key, increment value
  - return hash


=end

# Code:
def word_sizes(str)
  str.split.each_with_object({}) do |word, hsh|
    !!hsh[word.size] ? hsh[word.size] += 1 : hsh[word.size] = 1
  end
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

# NOTE: hsh = Hash.new(default value if key not initialized)
# e.g. hsh = Hash.new(0)
#      invoking hsh["a"] will return 0
