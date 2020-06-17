=begin
Description:
Write a method that takes an Array as an argument, and returns 
two Arrays (as a pair of nested Arrays) that contain the first 
half and second half of the original Array, respectively. If 
the original array contains an odd number of elements, the 
middle element should be placed in the first half Array.

Problem Definition:
  - input: array
  - output: 2 arrays (nested arrays)
  - rules/model:

Examples / Test Cases:
  halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
  halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
  halvsies([5]) == [[5], []]
  halvsies([]) == [[], []]

Data Structure:
  - input:
  - rules:

Algorithm:
  - use partition
    - ary size is odd - select ele with idx < ary size/2 + 1
    - ary size is even - select ele with idx < ary size/2 

=end

# Code:
def halvsies(ary)
  ary.partition.with_index do |_, idx|
    idx < (ary.size / 2.0).ceil
  end
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]