=begin
Description:
Write a method that takes a first name, a space, and a last 
name passed as a single String argument, and returns a string 
that contains the last name, a comma, a space, and the first 
name.

Problem Definition:
  - input: string
  - output: string
  - rules/model:
    - swap first and last name
    - return first name, comma, space, last name

Examples / Test Cases:
  swap_name('Joe Roberts') == 'Roberts, Joe'

Data Structure:
  - input: string
  - rules: logic

Algorithm:
  - split string into array
  - reverse
  - join with ", "

=end

# Code:
def swap_name(fullname)
  fullname.split.reverse.join(", ")
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'