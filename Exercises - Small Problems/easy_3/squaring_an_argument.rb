=begin
Description:
Using the multiply method from the "Multiplying Two Numbers" 
problem, write a method that computes the square of its 
argument (the square is the result of multiplying a number by 
itself).


Examples / Test Cases:
  square(5) == 25
  square(-8) == 64

=end

# Code:
def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64

# FURTHER EXPLORATION: 
# generalize power to the n method using the multiply method
def power(num, n)
  product = 1
  n.times do
    product = multiply(product, num)
  end
  product
end

# below should all evaluate to true
puts power(2, 0) == 1  
puts power(2, 1) == 2
puts power(2, 2) == 4
puts power(2, 3) == 8
puts power(-2, 1) == -2
puts power(-2, 2) == 4
puts power(-2, 3) == -8

