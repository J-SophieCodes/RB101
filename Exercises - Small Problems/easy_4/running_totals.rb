=begin
Description:
Write a method that takes an Array of numbers, and returns an 
Array with the same number of elements, and each element has 
the running total from the original Array.

Problem Definition:
  - input: array of integers
  - output: array of integers
  - rules/model:
    - output array should have the same number of elements
    - each element should be the running total of all the 
      elements up to that point

Examples / Test Cases:
  running_total([2, 5, 13]) == [2, 7, 20]
  running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
  running_total([3]) == [3]
  running_total([]) == []

Data Structure:
  - input: array
  - rules: array

Algorithm:
  - for each element
  

=end

# Code:
def running_total(arr)
  accumulator = 0
  arr.map do |ele|
    accumulator += ele
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# FURTHER EXPLORATION: use #each_with_object or #inject
def running_total_2(arr)
  sum = 0
  arr.each_with_object([]) do |ele, ary|
    sum += ele
    ary << sum
  end
end

p running_total_2([2, 5, 13]) == [2, 7, 20]
p running_total_2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_2([3]) == [3]
p running_total_2([]) == []


def running_total_3(arr)
  (1..arr.size).each_with_object([]) do |i, ary|
    ary << arr[0, i].reduce(:+)
  end
end

p running_total_3([2, 5, 13]) == [2, 7, 20]
p running_total_3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_3([3]) == [3]
p running_total_3([]) == []

def running_total_4(arr)
  arr.map.with_index do |_, idx|
    arr[0..idx].reduce(:+)
  end
end

p running_total_4([2, 5, 13]) == [2, 7, 20]
p running_total_4([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_4([3]) == [3]
p running_total_4([]) == []
