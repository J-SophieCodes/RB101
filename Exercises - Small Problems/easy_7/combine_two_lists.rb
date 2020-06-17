=begin
Description:
Write a method that combines two Arrays passed in as arguments, 
and returns a new Array that contains all elements from both 
Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that 
they have the same number of elements.

Problem Definition:
  - input: two arrays
    - assume non-empty
  - output: one array
  - rules/model:
    - first array passed in should pass its 0th ele into the 
      new array's 0th place
    - from there, pass one ele at a time from the two arrays
      in alternation

Examples / Test Cases:
  interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

Data Structure:
  - input: arrays
  - rules: array

Algorithm: 
  - for each index in array1
    - append array1[index] into new array
    - append array2[index] into new array

=end

# Code:
def interleave(ary1, ary2)
  new_ary = []
  ary1.each_index { |idx| new_ary << ary1[idx] << ary2[idx] }
  new_ary
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# ALTERNATIVELY
def interleave(ary1, ary2)
  ary1.each_index.map { |i| [ary1[i], ary2[i]] }.flatten
end

# FURTHER EXPLORATION - use #zip
def interleave(ary1, ary2)
  ary1.zip(ary2).flatten
end
