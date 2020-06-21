=begin
Description:
In this exercise, you are going to compute a method that 
returns the last digit of the nth Fibonacci number.

Problem Definition:
  - input: 
  - output: 
  - rules/model:
  
  
Examples / Test Cases:
  fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
  fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
  fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
  fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
  fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
  fibonacci_last(123456789) # -> 4

Data Structure:
  - input: 
  - rules: 

Algorithm:
  - build on the fibonacci method

=end

# Code:
def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, (first + last) % 10]
  end

  last
end

puts fibonacci_last(15)        == 0
puts fibonacci_last(20)        == 5
puts fibonacci_last(100)       == 5 
puts fibonacci_last(100_001)   == 1
puts fibonacci_last(1_000_007) == 3
puts fibonacci_last(123456789) == 4

# # SOLUTION
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, last_2.sum % 10]
  end
 
  last_2.last
end

# FURTHER EXPLORATION
def last_digits(nth)
  fib = [1, 1]
  3.upto(nth) { fib << fib.last(2).sum % 10 }
  fib.join # produces string of last digits
end

def repeat_length # 100 and 10 are arbitrary. Increase until repeat sequence is found
  last_digits(100).index(last_digits(10), 1)
end

# Since sequence repeats at every 61st number, we can greatly
# reduce the number of iterations by focusing on the iterations
# in excess of multiples of 60
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth % repeat_length) do
    last_2 = [last_2.last, last_2.sum % 10]
  end
 
  last_2.last
end

puts fibonacci_last(123456789) == 4