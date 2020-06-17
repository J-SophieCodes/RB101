=begin
Description:
Write a method that takes an Array of integers as input, 
multiplies all the numbers together, divides the result by 
the number of entries in the Array, and then prints the result 
rounded to 3 decimal places. Assume the array is non-empty.

Problem Definition:
  - input: array of integers (non-empty)
  - output: string
  - rules/model:
    - be sure to carry out division with at least one
      floating point number to avoid rounding errors
    - round quotient to 3 decimal places
    - format with trailing 0's

Examples / Test Cases:
  show_multiplicative_average([3, 5])
  The result is 7.500

  show_multiplicative_average([6])
  The result is 6.000

  show_multiplicative_average([2, 5, 7, 11, 13, 17])
  The result is 28361.667

Data Structure:
  - input: array
  - rules: logic, floats

Algorithm:
  - reduce array into a product of the integers
  - find size of array, convert to float
  - find quotient of product and array size
  - round result to 3 decimal places
  - format result in a string, with trailing 0s

=end

# Code:
def show_multiplicative_average(ary)
  avg = (ary.reduce(:*) / ary.size.to_f).round(3)
  puts format("The result is %.3f", avg)
end

show_multiplicative_average([3, 5])

show_multiplicative_average([6])

show_multiplicative_average([2, 5, 7, 11, 13, 17])
