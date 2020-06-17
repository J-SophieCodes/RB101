=begin
Description:
Write a method that takes an Array as an argument, and reverses 
its elements in place; that is, mutate the Array passed into 
this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Problem Definition:
  - input: array
  - output: array (original array mutated)
  - rules/model:
    - mutate original array

Examples / Test Cases:
  list = [1,2,3,4]
  result = reverse!(list)
  p result == [4, 3, 2, 1]
  p list == [4, 3, 2, 1]
  p list.object_id == result.object_id

  list = %w(a b e d c)
  p reverse!(list) == ["c", "d", "e", "b", "a"]
  p list == ["c", "d", "e", "b", "a"]

  list = ['abc']
  p reverse!(list) == ["abc"]
  p list == ["abc"]

  list = []
  p reverse!(list) == []
  p list == []

Data Structure:
  - input: array
  - rules: array

Algorithm:
  - 

=end

# Code:
def reverse!(list)
  (list.size / 2).times do |idx|
    list[idx], list[-1-idx] = list[-1-idx], list[idx]
  end
  list
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []