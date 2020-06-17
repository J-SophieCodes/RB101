=begin
Description:
Print the even numbers from 1 to 99, inclusive. All numbers should be printed
on separate lines.

Problem Definition:
  - input: none
  - output: print string to screen
    - only integers between 1-99?
  - rules/model:
    - select even integers between 1-99
    - print on separate lines

Examples / Test Cases:


Data Structure:
  - input: none
  - rules: logic; no need to store odd numbers

Algorithm:
  - for each even number within the range of 1 - 99
    - print to the screen

=end

# Code:
(1..99).each { |num| puts num if num.even? }

1.upto(99) { |num| puts num if num.even? }

(1..99).select { |num| num.even? }.each { |even| puts even }