=begin
Description:
Write a method named include? that takes an Array and a search 
value as arguments. This method should return true if the 
search value is in the array, false if it is not. You may not 
use the Array#include? method in your solution.

Problem Definition:
  - input: array + search value
    - validation? 
    - boolean values? empty?
  - output: boolean
  - rules/model:
    - determine if array has search value in it

Examples / Test Cases:
  include?([1,2,3,4,5], 3) == true
  include?([1,2,3,4,5], 6) == false
  include?([], 3) == false
  include?([nil], nil) == true
  include?([], nil) == false

Data Structure:
  - input: array + search value (integer, nil)
  - rules:

Algorithm:


=end

# Code:
def include?(ary, search)
  ary.any? { |ele| ele == search }
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

# SOLUTION - easy
def include?(array, value)
  !!array.find_index(value)
end

# SOLUTION
def include?(array, value)
  array.each { |element| return true if value == element }
  false
end