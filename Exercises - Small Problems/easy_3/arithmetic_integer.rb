=begin
Description:
Write a program that prompts the user for two positive integers,
and then prints the results of the following operations on 
those two numbers: addition, subtraction, product, quotient, 
remainder, and power. Do not worry about validating the input.

Problem Definition:
  - input: 2 +ve integers
    - validate? what if 0?
  - output: print to screen
  - rules/model:
    - take the two input integers and perform 6 operations on them

Examples / Test Cases:
  ==> Enter the first number:
  23
  ==> Enter the second number:
  17
  ==> 23 + 17 = 40
  ==> 23 - 17 = 6
  ==> 23 * 17 = 391
  ==> 23 / 17 = 1
  ==> 23 % 17 = 6
  ==> 23 ** 17 = 141050039560662968926103

Data Structure:
  - input: integers, store in array
  - rules:
    - store the operation symbols in an array

Algorithm:


=end

# Code:
def prompt(msg)
  puts "==> #{msg}"
end

operations = %i(+ - * / % **)
numbers = []

prompt "Enter the first number:"
numbers << gets.to_i

prompt "Enter the second number:"
numbers << gets.to_i

operations.each do |sym|
  prompt numbers.join(" #{sym} ") + " = #{numbers.reduce(sym)}"
end
