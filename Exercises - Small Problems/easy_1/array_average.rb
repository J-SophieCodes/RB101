=begin
Description:
Write a method that takes one argument, an array containing
integers, and returns the average of all numbers in the array.
The array will never be empty and the numbers will always be 
positive integers.

Problem Definition:
  - input: array of integers; never empty, always +ve
  - output:integer
  - rules/model:
    - return the average of all the integers in the array

Examples / Test Cases:
  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40

Data Structure:
  - input: array of integers
  - rules: use logic to implement rules

Algorithm:
  - sum the integers
  - divide the sum by the number of integers

=end

# Code:
# def average(arr)
#   arr.sum / arr.count
# end

def average(numbers)
  numbers.reduce(:+) / numbers.count
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

def average(numbers)
  numbers.reduce(0.0, :+) / numbers.count
end

puts average([1, 5, 87, 45, 8, 8]) # => 25.666666666666668
puts average([9, 47, 23, 95, 16, 52]) # => 40.333333333333336
