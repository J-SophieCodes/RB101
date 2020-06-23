=begin
Description:
Write a method that computes the difference between the square 
of the sum of the first n positive integers and the sum of the 
squares of the first n positive integers.

Problem Definition:
  - input: 
  - output: 
  - rules/model:
  
  
Examples / Test Cases:
  sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
  sum_square_difference(10) == 2640
  sum_square_difference(1) == 0
  sum_square_difference(100) == 25164150

Data Structure:
  - input: 
  - rules: 

Algorithm:


=end

# Code:
def sum_square_difference(num)
  numbers = (1..num).to_a
  numbers.sum ** 2 - numbers.map { |num| num ** 2 }.sum
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150