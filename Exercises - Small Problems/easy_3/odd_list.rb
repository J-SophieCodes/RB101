=begin
Description:
Write a method that returns an Array that contains every other
element of an Array that is passed in as an argument. The 
values in the returned list should be those values that are in 
the 1st, 3rd, 5th, and so on elements of the argument Array.

Problem Definition:
  - input: array
    - nil elements?
  - output: array
  - rules/model:
    - select even index elements

Examples / Test Cases:
  oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
  oddities(['abc', 'def']) == ['abc']
  oddities([123]) == [123]
  oddities([]) == []

Data Structure:
  - input: array
  - rules: array

Algorithm:


=end

# Code:
def oddities(arr)
  odd_elements = []
  arr.each_with_index do |ele, idx|
    odd_elements << ele if idx.even?
  end
  odd_elements
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# FURTHER EXPLORATION - use different methods
# evenities method to pick out even indexed elements
def evenities(arr)
  arr.select.with_index { |_, idx| idx.odd? }
end

# odd_vs_even method to split up odd_ones and even_ones
def odd_vs_even(arr)
  arr.partition { |ele| arr.index(ele).even? }
end

arr = [2, 3, 4, 5, 6]
odd_ones, even_ones = odd_vs_even(arr)
puts odd_ones == [2, 4, 6]
puts even_ones == [3, 5]

