=begin
Description:
Rewrite your recursive fibonacci method so that it computes 
its results without recursion.

Problem Definition:
  - input: integer
  - output: integer
  - rules/model:
    - F(1) = 1
    - F(2) = 1
    - F(n) = F(n - 1) + F(n - 2) where n > 2
      
  
Examples / Test Cases:
  fibonacci(20) == 6765
  fibonacci(100) == 354224848179261915075
  fibonacci(100_001) # => 4202692702.....8285979669707537501

Data Structure:
  - input: 
  - rules: 

Algorithm:


=end

# Code:
def fibonacci(nth)
  last_one, last_two = 0, 0
  (1..nth).reduce do |sum, n|
    last_two = n <= 2 ? 0 : last_one
    last_one = n <= 2 ? 1 : sum
    sum = last_one + last_two
  end
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501

# SOLUTIONS
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end