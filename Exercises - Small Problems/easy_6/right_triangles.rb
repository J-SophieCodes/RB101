=begin
Description:
Write a method that takes a positive integer, n, as an argument, 
and displays a right triangle whose sides each have n stars. 
The hypotenuse of the triangle (the diagonal side in the images 
below) should have one end at the lower-left of the triangle, 
and the other end at the upper-right.

Problem Definition:
  - input: postive integer (n)
    - validate?
  - output: right triangle formed with *
  - rules/model:
    - total width of n chars
      - 1st row has n - 1 spaces and 1 star
      - 2nd row has n - 2 spaces and 2 stars
        etc
    - total height of n chars

Examples / Test Cases:
  triangle(5)

      *
     **
    ***
   ****
  *****

  triangle(9)

          *
         **
        ***
       ****
      *****
     ******
    *******
   ********
  *********

Data Structure:
  - input: integer
  - rules: logic

Algorithm:
  - for n times:
    - concat n - iteration# of spaces with iteration# star(s)


=end

# Code:
def botR_triangle(n)
  n.times do |i|
    puts ("*" * (i+1)).rjust(n)
  end
end

botR_triangle(5)
botR_triangle(9)

# FURTHER EXPLORATION
def topR_triangle(n)
  n.times do |i|
    puts ("*" * (n-i)).rjust(n)
  end
end

topR_triangle(5)
topR_triangle(9)

def topL_triangle(n)
  n.times do |i|
    puts ("*" * (n-i)).ljust(n)
  end
end

topL_triangle(5)
topL_triangle(9)

def botL_triangle(n)
  n.times do |i|
    puts ("*" * (i+1)).ljust(n)
  end
end

botL_triangle(5)
botL_triangle(9)