=begin
Description:
A triangle is classified as follows:
  - right: One angle of the triangle is a right angle 
    (90 degrees)
  - acute: All 3 angles of the triangle are less than 90 degrees
  - obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 
180 degrees, and all angles must be greater than 0: if either 
of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as 
arguments, and returns a symbol :right, :acute, :obtuse, or 
:invalid depending on whether the triangle is a right, acute, 
obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry 
about floating point errors. You may also assume that the 
arguments are specified in degrees.

Problem Definition:
  - input: 3 numbers (degrees)
  - output: 
  - rules/model:
    - valid triangle:
      - sum of angles = 180
      - every angle must be greater than 0
    - right: 1 angle = 90 (max == 90)
    - acute: all < 90 (max < 90)
    - obtuse: 1 angle > 90 (max > 90)
  
Examples / Test Cases:
  triangle(60, 70, 50) == :acute
  triangle(30, 90, 60) == :right
  triangle(120, 50, 10) == :obtuse
  triangle(0, 90, 90) == :invalid
  triangle(50, 50, 50) == :invalid

Data Structure:
  - input: 
  - rules: 

Algorithm:


=end

# Code:
SUM_OF_ANGLES = 180

def valid?(angles)
  angles.min > 0 && angles.sum == SUM_OF_ANGLES
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3].sort
  return :invalid unless valid?(angles)
  case angles.max
  when (...90) then :acute
  when 90 then :right
  else :obtuse
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid