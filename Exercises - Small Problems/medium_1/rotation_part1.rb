=begin
Description:
Write a method that rotates an array by moving the first 
element to the end of the array. The original array should not 
be modified.

Do not use the method Array#rotate or Array#rotate! for your 
implementation.

Problem Definition:
  - input: array
  - output: array
  - rules/model:
    - move first element to end of array
    - return new array

Examples / Test Cases:
  rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  rotate_array(['a']) == ['a']

  x = [1, 2, 3, 4]
  rotate_array(x) == [2, 3, 4, 1]   # => true
  x == [1, 2, 3, 4]                 # => true

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def rotate_array(arr)
  arr[1..-1] << arr[0]
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

# FURTHER EXPLORATION
def rotate_str(str)
  rotate_array(str.chars).join
end

puts rotate_str("hello") == "elloh"
