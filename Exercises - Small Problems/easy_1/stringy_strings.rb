=begin
Description:
Write a method that takes one argument, a positive integer, 
and returns a string of alternating 1s and 0s, always starting
with 1. The length of the string should match the given integer.

Problem Definition:
  - input: integer (n), positive
    - need to validate?
  - output: string
  - rules/model:
    - print a string of alternating 1's and 0's of string 
      length n
    - string should always start with 1

Examples / Test Cases:
  

Data Structure:
  - input: integer
  - rules: string

Algorithm:
  - from input integer n:
    - loop n times
      - each time, append either 1 or 0 to the string
      - start with 1

=end

# Code:
def stringy(num)
  str = ""
  num.times do |i|
    i.even? ? str << '1' : str << '0'
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


# Further Exploration: Modify stringy so it takes an additional
# optional argument that defaults to 1. If the method is called 
# with this argument set to 0, the method should return a 
# String of alternating 0s and 1s, but starting with 0 instead 
# of 1.

def stringy(size, start_with = 1)
  numbers = []

  value_if_even = start_with
  value_if_odd = start_with == 1 ? 0 : 1

  size.times do |index|
    number = index.even? ? value_if_even : value_if_odd
    numbers << number
  end

  numbers.join
end