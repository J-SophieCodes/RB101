=begin
Description:
The || operator returns a truthy value if either or both of its
operands are truthy, a falsey value if both operands are falsey. 
The && operator returns a truthy value if both of its operands 
are truthy, and a falsey value if either operand is falsey. 
This works great until you need only one of two conditions to 
be truthy, the so-called exclusive or.

In this exercise, you will write a method named xor that takes
two arguments, and returns true if exactly one of its arguments 
is truthy, false otherwise.

Problem Definition:
  - input: 2 boolean arguments
    - what if arguments are not boolean? numeric? string?
  - output: boolean
  - rules/model:
    - true if exactly one argument is true
    - must check both arguments

Examples / Test Cases:
  xor?(5.even?, 4.even?) == true
  xor?(5.odd?, 4.odd?) == true
  xor?(5.odd?, 4.even?) == false
  xor?(5.even?, 4.odd?) == false

Data Structure:
  - input: booleans
  - rules: 

Algorithm:
  

=end

# Code:
def xor?(arg1, arg2)
  [arg1, arg2].count(true) == 1
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# Further Exploration
# XOR applications: light switch, user online/offline, sound 
# on/off
# XOR cannot perform short-circuit evaluation because both 
# operands must be checked to make sure only one of them is
# truthy