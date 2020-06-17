=begin
Description:
Build a program that asks a user for the length and width of a
room in meters and then displays the area of the room in both
square meters and square feet.

Note: 1 square meter == 10.7639 square feet.
Do not worry about validating the input at this time.

Problem Definition:
  - input: integers; no need to validate
  - output: string
  - rules/model:
    - 1 square meter == 10.7639 square feet
    - 70.0 sqm = 753.474 sqft
      - from example, answers are to be rounded to the nearest

Examples / Test Cases:
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

Data Structure:
  - input: integers
  - rules:

Algorithm:
  - get inputs from user
  - convert string inputs to floats to capture any decimals
  - calculate area using area method
  - apply conversion factor to area using conversion method
  - round sqm to 1 decimal place
  - round sgft to 2 decimal places
  - print results to screen in a string via string interpolation

=end

# Code:
SQMETERS_TO_SQFEET = 10.7639

def area(length, width)
  length * width
end

def convert_to_sqft(area)
  area * SQMETERS_TO_SQFEET
end

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_in_sqm = area(length, width)
area_in_sqft = convert_to_sqft(area_in_sqm)

puts "The area of the room is #{area_in_sqm.round(1)} " + 
     "square meters (#{area_in_sqft.round(2)} square feet)."
