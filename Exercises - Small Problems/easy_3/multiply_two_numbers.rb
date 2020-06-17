=begin
Description:
Create a method that takes two arguments, multiplies them 
together, and returns the result.

Examples / Test Cases:
  multiply(5, 3) == 15

=end

# Code:
def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15

puts multiply("hi! ", 3) == "hi! hi! hi! "
# when str * int, returns a new string containing int copies 
# of str. int must be greater than or equal to 0.

puts multiply([1, 2], 3) == [1, 2, 1, 2, 1, 2]
# when ary * int, returns a new array built by concatenating 
# the int copies of self.

puts multiply([1, 2, 3], ",") == "1,2,3"
# when ary * str, equivalent to ary.join(str)