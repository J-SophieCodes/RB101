=begin
Description:
A collection of spelling blocks has two letters per block, as 
shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just 
those words that do not use both letters from any given block. 
Each block can only be used once.

Write a method that returns true if the word passed in as an 
argument can be spelled from this set of blocks, false 
otherwise.

Problem Definition:
  - input: one-word string
  - output: boolean
  - rules/model:
    - only one of the block letters may be used
    - each block can only be used once
    
Examples / Test Cases:
  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true

Data Structure:
  - input: 
  - rules: 
    - blocks stored in nested arra

Algorithm:

=end

# Code:
BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], 
          ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], 
          ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'],
          ['Z', 'M']]

def block_word?(word)
  word.upcase.chars.map do |char|
    BLOCKS.select { |block| block.include?(char) }
  end.tally.values.all?(1)
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# SOLUTION
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end
