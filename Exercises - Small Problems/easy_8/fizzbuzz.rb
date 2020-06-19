=begin
Description:
Write a method that takes two arguments: the first is the 
starting number, and the second is the ending number. Print out 
all numbers between the two numbers, except if a number is 
divisible by 3, print "Fizz", if a number is divisible by 5, 
print "Buzz", and finally if a number is divisible by 3 and 5, 
print "FizzBuzz".

Problem Definition:
  - input: 2 integers
    - order of inputs? What if first number is greater than second?
  - output: print to screen?
  - rules/model:
    - for numbers between the two input numbers  
      - if divisible by 3, print "Fizz"
      - if divisible by 5, print "Buzz"
      - if divisible by 3 and 5, print "Fizzbuzz"
      - else, print the number

Examples / Test Cases:
  fizzbuzz(1, 15) == "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz"

Data Structure:
  - input: integers
  - rules: logic

Algorithm:
  - for range (int1..int2)
    - if num % 3 == 0 then print 
    - if num % 5 == 0 then print
    - if num % 15 == 0 then print
    - else print num

=end

# Code:
def fizzbuzz(a, b)
  (a..b).map do |num|
    if num % 15 == 0 then "FizzBuzz"
    elsif num % 5 == 0 then "Buzz"
    elsif num % 3 == 0 then "Fizz"
    else num
    end
  end.join(", ")
end

puts fizzbuzz(1, 15) == "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz"
