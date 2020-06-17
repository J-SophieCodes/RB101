=begin
Description:
Write a method that takes two Array arguments in which each 
Array contains a list of numbers, and returns a new Array that 
contains the product of every pair of numbers that can be 
formed between the elements of the two Arrays. The results 
should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Problem Definition:
  - input: 2 arrays of integers
    - validate?
  - output: 1 array
  - rules/model:

Examples / Test Cases:
  multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

Data Structure:
  - input: 2 arrays of integers
  - rules: array

Algorithm:


=end

# Code:
def multiply_all_pairs(ary1, ary2)
  ary1.product(ary2).map { |arr| arr.reduce(:*) }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
