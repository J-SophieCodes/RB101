=begin
Description:
Write a method that takes one argument, a positive integer, 
and returns a list of the digits in the number.

Problem Definition:
  - input: integer
    - do we need to validate?
    - what about inputs preceded by 0?
  - output: list of integers
  - rules/model:
    - digits should be in the same order as the input
    - digits should be stored as integer, not string

Examples / Test Cases:
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

Data Structure:
  - input: integer
  - rules: use logic

Algorithm:
  - convert to string
  - split string into list of integer strings
  - convert back to numbers

=end

# Code:
def digit_list(num)
  num.to_s.chars.map do |char|
    char.to_i
  end
end

# This would be more concise:
#   def digit_list(number)
#     number.to_s.chars.map(&:to_i)
#   end
# (&:to_i) is the shorthand for { |char| char.to_i }