=begin
Description:
Write a method that takes an integer argument, and returns an 
Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer 
that is greater than 0.

Problem Definition:
  - input: integer greater than 0
  - output: array
  - rules/model:
    - produce array of int from 1 until input int

Examples / Test Cases:
  sequence(5) == [1, 2, 3, 4, 5]
  sequence(3) == [1, 2, 3]
  sequence(1) == [1]

Data Structure:
  - input: integer
  - rules: array

Algorithm:

=end

# Code:
def sequence(num)
  num > 1 ? (a, b = 1, num) : (a, b = num, 1)
  (a..b).to_a
end

p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(3) #== [1, 2, 3]
p sequence(1) #== [1]
p sequence(0)
p sequence(-5)