=begin
Description:
Print all odd numbers from 1 to 99, inclusive. All numbers 
should be printed on separate lines.

Problem Definition:
  - input: none
  - output: print string to screen
    - only integers between 1-99?
  - rules/model:
    - select odd integers between 1-99
    - print on separate lines

Examples / Test Cases:


Data Structure:
  - input: none
  - rules: logic; no need to store odd numbers

Algorithm:
  - for each odd number within the range of 1 - 99
    - print to the screen

=end

# Code:
(1..99).each { |num| puts num if num.odd? }

1.upto(99) { |num| puts num if num.odd? }

(1..99).select { |num| num.odd? }.each { |odd| puts odd }