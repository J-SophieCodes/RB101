=begin
Description:
Write a program that asks the user to enter an integer greater 
than 0, then asks if the user wants to determine the sum or 
product of all numbers between 1 and the entered integer.

Problem Definition:
  - input:
    - upper limit = integer greater than 0
      - integer validation?
    - operation = string
      - string validation?
  - output: integer
  - rules/model:
    - if user selected the operation: sum
      - sum all the numbers between 1 and upper limit
    - if user selected the operation: product
      - multiply all the numbers between 1 and upper limit

Examples / Test Cases:
  >> Please enter an integer greater than 0:
  5
  >> Enter 's' to compute the sum, 'p' to compute the product.
  s
  The sum of the integers between 1 and 5 is 15.


  >> Please enter an integer greater than 0:
  6
  >> Enter 's' to compute the sum, 'p' to compute the product.
  p
  The product of the integers between 1 and 6 is 720.

Data Structure:
  - input: integer, string
  - rules: range

Algorithm:
  - prompt for integer greater than 0
  - prompt for mode of operation
  - compute the result
    - if operation equals sum
      - reduce the range of numbers into their sum
    - if operation equals product
      - reduce the range of numbers into their product
  - return the results as string

=end

# Code:
def valid_integer?(num)
  num.to_i > 0 && num.to_i.to_s == num
end

def valid_operation?(op)
  op == 's' || op == 'p'
end

def prompt(msg)
  puts ">> #{msg}"
end

def calculate(upper_limit, operation)
  (1..upper_limit).reduce(operation)
end

operations = { 's' => { name: "sum", symbol: :+},
               'p' => { name: "product", symbol: :*}}

upper_limit = 0
loop do
  prompt "Please enter an integer greater than 0:"
  upper_limit = gets.chomp
  break if valid_integer?(upper_limit)
  prompt "Oops! Invalid input. Try again."
end

op = ""
loop do
  prompt "Enter 's' to compute the sum, 'p' to compute the product."
  op= gets.chomp
  break if valid_operation?(op)
  prompt "Oops! Invalid input. Try again."
end

result = calculate(upper_limit.to_i, operations[op][:symbol])

puts "The #{operations[op][:name]} of the integers between" +
     " 1 and #{upper_limit} is #{result}."

# inject and reduce are aliases with no performance difference