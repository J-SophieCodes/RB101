=begin
Description:
Write a method that takes an Array of numbers and then returns 
the sum of the sums of each leading subsequence for that Array. 
You may assume that the Array always contains at least one 
number.


Problem Definition:
  - input: array of integers
  - output: integer
  - rules/model:
    - sum of integers up to that point

Examples / Test Cases:
  sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
  sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
  sum_of_sums([4]) == 4
  sum_of_sums([1, 2, 3, 4, 5]) == 35

Data Structure:
  - input: array
  - rules:

Algorithm:
  - iterate with index
    - sum integers up til index

=end

# Code:
def sum_of_sums(ary)
  ary.each_with_index.reduce(0) do |total, (ele, idx)|
    total + ary[0..idx].sum
  end
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35

