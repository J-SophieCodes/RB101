=begin
Description:
Write a method that searches for all multiples of 3 or 5 that
lie between 1 and some other number, and then computes the sum
of those multiples. For instance, if the supplied number is 20,
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater 
than 1.

Problem Definition:
  - input: integer (int), greater than 1
    - validate input?
  - output: integer
  - rules/model:
    - sum the list of integers that are:
      - multiples of 3 or 5
      - between 1 and int, inclusive

Examples / Test Cases:
  multisum(3) == 3
  multisum(5) == 8
  multisum(10) == 33
  multisum(1000) == 234168

Data Structure:
  - input: integer
  - rules: array

Algorithm:
  - select numbers within range 1..int that are
    - divisible by 3, OR
    - divisible by 5
  - reduce the list of selected integers into a sum
  - return the sum

=end

# Code:
def multiples_of_3_or_5(int)
  (1..int).select { |num| num % 3 == 0 || num % 5 == 0 }
end

def multisum(int)
  multiples_of_3_or_5(int).reduce(:+) # or just use .sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168