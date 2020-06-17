=begin
Description:
Write a program that solicits 6 numbers from the user, then 
prints a message that describes whether or not the 6th number 
appears amongst the first 5 numbers.

Problem Definition:
  - input: integers
    - validate
  - output: string
  - rules/model:
    - compare the last integer with the first five integers to 
      find match
    - store the first five integers in an array
    - print result and array as part of a string output

Examples / Test Cases:
  ==> Enter the 1st number:
  25
  ==> Enter the 2nd number:
  15
  ==> Enter the 3rd number:
  20
  ==> Enter the 4th number:
  17
  ==> Enter the 5th number:
  23
  ==> Enter the last number:
  17
  The number 17 appears in [25, 15, 20, 17, 23].


  ==> Enter the 1st number:
  25
  ==> Enter the 2nd number:
  15
  ==> Enter the 3rd number:
  20
  ==> Enter the 4th number:
  17
  ==> Enter the 5th number:
  23
  ==> Enter the last number:
  18
  The number 18 does not appear in [25, 15, 20, 17, 23].

Data Structure:
  - input: integers
  - rules:
    - store '1st', '2nd', ...etc in an array
      - iterate through array in each prompt
    - store inputs in an array

Algorithm:
  - prompt user for first 5 numbers
    - iterate through ['1st', '2nd', '3rd', ..., 'last'] array
  - append first 5 inputs into a numbers array
  - evaluate if numbers array include the last number
  - display result and numbers array 
    - conditional string output
      - 'appears' vs 'does not appear'

=end

# Code:
def valid_integer?(num)
  num.to_i.to_s == num
end

ordinals = %w(1st 2nd 3rd 4th 5th last)
numbers = []

6.times do |counter|
  loop do
    puts "==> Enter the #{prdinals[counter]} number:"
    num = gets.chomp
    break if valid_integer?(num)
    puts "==> Oops. Invalid input. Try again."
  end

  numbers << num.to_i 
end

last_number = numbers.pop

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end