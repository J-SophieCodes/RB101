=begin
Description:
The Fibonacci series is a series of numbers 
(1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers 
are 1 by definition, and each subsequent number is the sum of 
the two previous numbers. This series appears throughout the 
natural world.

Computationally, the Fibonacci series is a very simple series, 
but the results grow at an incredibly rapid rate. For example, 
the 100th Fibonacci number is 354,224,848,179,261,915,075 -- 
that's enormous, especially considering that it takes 6 
iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the 
first Fibonacci number that has the number of digits specified 
as an argument. (The first Fibonacci number has index 1.)

Problem Definition:
  - input: integer
  - output: integer
  - rules/model:
    - 

Examples / Test Cases:
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

Data Structure:
  - input:
  - rules: compare string length of numbers for first match

Algorithm:
  - fibonacci numbers => method
  - check length => method

=end

# Code:
require 'pry'

def find_fibonacci_index_by_length(len)
  fib = []
  idx = 0
  loop do 
    idx < 2 ? fib[idx] = 1 : fib[idx] = fib.last(2).sum
    break if fib[idx].to_s.length == len
    idx += 1
  end
  idx + 1
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
# puts find_fibonacci_index_by_length(10000) == 47847


# RECURSIVE SOLUTION
def fibonacci(nth, a=1, b=1)
  nth == 1 ? a : nth == 2 ? b : fibonacci(nth -1, b, b + a)
end

# counter = 7
# nth, a, b
#   7, 1, 1
#   6, 1, 2
#   5, 2, 3
#   4, 3, 5
#   3, 5, 8
#   2, 8, (13) returned

def find_fibonacci_index_by_length(num, counter=2)
  counter += 1 until fibonacci(counter).to_s.size >= num
  counter
end