=begin
Description:
Write a method that takes two Arrays as arguments, and returns 
an Array that contains all of the values from the argument 
Arrays. There should be no duplication of values in the returned 
Array, even if there are duplicates in the original Arrays.

Problem Definition:
  - input: 2 arrays
  - output: 1 array
    - new array? or mutate original?
  - rules/model:
    - combines values from both array
    - no duplicates of values

Examples / Test Cases:
  merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Data Structure:
  - input: 2 arrays
  - rules:

Algorithm:
  - 

=end

# Code:
def merge(ary1, ary2)
  ary1.union(ary2)   # Same as Array#| 
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# FURTHER EXPLORATION 
def merge(ary1, ary2)
  (ary1 + ary2).uniq
end