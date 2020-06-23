=begin
Description:
A triangle is classified as follows:
  - equilateral All 3 sides are of equal length
  - isosceles 2 sides are of equal length, while the 3rd is 
    different
  - scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two 
shortest sides must be greater than the length of the longest 
side, and all sides must have lengths greater than 0: if either 
of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a 
triangle as arguments, and returns a symbol :equilateral, 
:isosceles, :scalene, or :invalid depending on whether the 
triangle is equilateral, isosceles, scalene, or invalid.

Problem Definition:
  - input: 3 numbers (a, b, c)
  - output: symbol
  - rules/model:
    - conditions for triangles:
      - sum of 2 shorter sides > third side, AND
      - all sides must be greater than 0
    - ELSE invalid
    - equilateral: a == b == c
    - isosceles: a == b, or b == c, or a == c ONLY
    - scalene: a != b, b != c, a!= c
  
  
Examples / Test Cases:
  triangle(3, 3, 3) == :equilateral
  triangle(3, 3, 1.5) == :isosceles
  triangle(3, 4, 5) == :scalene
  triangle(0, 3, 3) == :invalid
  triangle(3, 1, 1) == :invalid

Data Structure:
  - input: 
  - rules: 
    - sort with array

Algorithm:


=end

# Code:
def valid?(sides)
  sides.none?(&:zero?) && sides[0..1].sum > sides[2]
end

def triangle(a, b, c)
  sides = [a, b, c].sort
  return :invalid unless valid?(sides)
  return :equilateral if sides[0] == sides[2]
  return :isosceles if sides.uniq.size == 2
  :scalene
end

puts triangle(3, 3, 3) #== :equilateral
puts triangle(3, 3, 1.5) #== :isosceles
puts triangle(3, 4, 5) #== :scalene
puts triangle(0, 3, 3) #== :invalid
puts triangle(3, 1, 1) #== :invalid

# REFACTORED

def triangle(a, b, c)
  sides = [a, b, c].sort
  return :invalid unless valid?(sides)
  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end