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

# FURTHER EXPLRATION:
# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches, and
# square centimeters.

SQFT_TO_SQIN = 144
SQFT_TO_SQCM = 929.03

def area(length, width)
  (length * width).round(2)
end

def convert(area, conversion_factor)
  (area * conversion_factor).round(2)
end

puts "Enter the length of the room in feet:"
length_in_ft = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width_in_ft = gets.chomp.to_f

area_in_sqft = area(length_in_ft, width_in_ft)
area_in_sqin = convert(area_in_sqft, SQFT_TO_SQIN)
area_in_sqcm = convert(area_in_sqft, SQFT_TO_SQCM)

puts "The area of the room is:\n"+
     "- #{area_in_sqft} square feet\n" +
     "- #{area_in_sqin} square inches\n" +
     "- #{area_in_sqcm} square centimeters"
