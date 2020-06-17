=begin
Description:
Write a method that takes an Array, and returns a new Array 
with the elements of the original list in reverse order. Do not 
modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you 
use the method you wrote in the previous exercise.

Problem Definition:
  - input: array
  - output: array (new array)
  - rules/model:
    - do not mutate original array

Examples / Test Cases:
  reverse([1,2,3,4]) == [4,3,2,1]          # => true
  reverse(%w(a b e d c)) == %w(c d e b a)  # => true
  reverse(['abc']) == ['abc']              # => true
  reverse([]) == []                        # => true

  list = [1, 3, 2]                      # => [1, 3, 2]
  new_list = reverse(list)              # => [2, 3, 1]
  list.object_id != new_list.object_id  # => true
  list == [1, 3, 2]                     # => true
  new_list == [2, 3, 1]                 # => true


Data Structure:
  - input: array
  - rules: array

Algorithm:
  - 

=end

# Code:
def reverse(list)
  list.each_with_object([]) do |ele, new_list|
    new_list.unshift(ele)
  end
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true


# SOLUTION
# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end

# FURTHER EXPLORATION - using inject
def reverse(list)
  list.inject([]) { |new_list, ele| new_list.unshift(ele) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true