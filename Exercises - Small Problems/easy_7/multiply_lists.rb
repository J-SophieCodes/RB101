=begin
Description:
Write a method that takes two Array arguments in which each 
Array contains a list of numbers, and returns a new Array that 
contains the product of each pair of numbers from the arguments 
that have the same index. You may assume that the arguments 
contain the same number of elements.

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
  multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77] 

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def multiply_list(ary1, ary2)
  ary1.zip(ary2).map { |arr| arr.reduce(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77] 
