=begin
Description:
Write a method that takes one integer argument, which may be
positive, negative, or zero. This method returns true if the
number's absolute value is odd. You may assume that the 
argument is a valid integer value.

Problem Definition:
  - input: integer (+ve, -ve, or 0)
    - assume argument is a valid integer
  - output: boolean
  - rules/model:
    - true if absolute value of input is odd
    - cannot use #odd? or #even?

Examples / Test Cases:
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

Data Structure:
  - input: integer
  - rules: use logic

Algorithm:
  - divide the input integer by 2
    - if the remainder is 0, then the integer is even
    - if the remainder is 1, then the integer is odd

=end

# Code:
# Modulus always returns a non-negative result if the 
# number on the right is positive.
# The quotient is rounded toward negative infinity****
def is_odd?(num)
  num % 2 == 1 
end
# to be certain, could do num.abs % 2 == 1
# num.abs % 2 will always return 0 or +1

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Using Numeric#remainder
def num_is_odd?(num)
  num.remainder(2) != 0
end
# could also do num.remainder(2).abs == 1

puts num_is_odd?(2)    # => false
puts num_is_odd?(5)    # => true
puts num_is_odd?(-17)  # => true
puts num_is_odd?(-8)   # => false
puts num_is_odd?(0)    # => false
puts num_is_odd?(7)    # => true