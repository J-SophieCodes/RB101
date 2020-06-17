=begin
Description:
Modify the word_sizes method from the previous exercise to 
exclude non-letters when determining word size. For instance, 
the length of "it's" is 3, not 4.

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
  word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
  word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
  word_sizes('') == {}

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def size(word)
  word.delete("^a-zA-Z").size
end

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, hsh|
    hsh[size(word)] += 1
  end
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}