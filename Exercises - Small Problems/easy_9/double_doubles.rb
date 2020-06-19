=begin
Description:
A double number is a number with an even number of digits 
whose left-side digits are exactly the same as its right-side 
digits. For example, 44, 3333, 103103, 7676 are all double 
numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an 
argument, unless the argument is a double number; double 
numbers should be returned as-is.

Note: underscores are used for clarity above. Ruby lets you 
use underscores when writing long numbers; however, it does 
not print the underscores when printing long numbers. Don't be 
alarmed if you don't see the underscores when running your 
tests.

Problem Definition:
  - input: integer
  - output:integer
  - rules/model:
    - if double number => return as is
      - double numbers: even digits, LS == RS
    - else return number * 2
\

Examples / Test Cases:
  twice(37) == 74
  twice(44) == 44
  twice(334433) == 668866
  twice(444) == 888
  twice(107) == 214
  twice(103103) == 103103
  twice(3333) == 3333
  twice(7676) == 7676
  twice(123_456_789_123_456_789) == 123_456_789_123_456_789
  twice(5) == 10

Data Structure:
  - input: integers
  - rules: logic & string

Algorithm:
  - if num size is odd => return num * 2
  - if num size is even 
    - test if double number (new method)
      - convert to string
      - remove non-numeric char
      - test if first half of string == second half
    - if double number => return num
    - else => return num * 2


=end

# Code:
def twice(num)
  numlen = num.to_s.size
  return num * 2 if numlen.odd?
  return num if  num.to_s[0, numlen/2] == num.to_s[numlen/2, numlen/2]
  num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10