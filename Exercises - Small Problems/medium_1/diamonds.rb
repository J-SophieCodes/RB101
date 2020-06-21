=begin
Description:
Write a method that displays a 4-pointed diamond in an n x n 
grid, where n is an odd integer that is supplied as an argument 
to the method. You may assume that the argument will always be 
an odd integer.

Problem Definition:
  - input: number
    - what happens when the number is 0? a negative? an even number?
  - output:
    - should I return a string with new line char "\n" delimiters?
    - or should i print on the screen?
  - model the problem
    - since the requirements are not explicitly described in words,
      need to be modeled
    - given an odd number n, for example, 9
    - output n strings
      - 1, 3, 5, 7, 9, 7, 5, 3, 1
      - prepend number of spaces: 4, 3, 2, 1, 0, 1, 2, 3, 4
    - join together with \n, or loop and print

Examples / Test Cases:
  diamond(1)
  *

  diamond(3)
   *
  ***
   *

  diamond(9)
      *
     ***
    *****
   *******
  *********
   *******
    *****
     ***
      *
      
Data Structure:
  - input:
  - rules:

Algorithm:
  - From an odd number, 2a+1
    - generate an array of x's, [1, 3, ..2a+1, ... 3, 1]
    - generate an array of y's, [a, a-1, .., 1, 0, 1, ..a]
  - loop through the two arrays at the same time
    - for each iteration, print out x number of *, prepended by y number of spaces
      - x is element from first array, y is element from second array
      - y * " " + x * "*"

=end

# Code:

def diamond_width(n)
  (1...n).select(&:odd?) + n.downto(1).select(&:odd?)
end

def stars(width, style)
  case style
  when :solid
    '*' * width
  when :hollow
    width == 1 ? '*' : "*" + ' ' * (width-2) + "*"
  end
end

def diamond(grid_size, style = :solid)
  diamond_width(grid_size).each do |width|
    puts (stars(width, style)).center(grid_size)
  end
end

diamond(1)
diamond(3)
diamond(9)

# FURTHER EXPLORATION
diamond(1, :hollow)
diamond(3, :hollow)
diamond(9, :hollow)
