=begin
Description:
Build a program that randomly generates and prints Teddy's age. 
To get the age, you should generate a random number between 20 
and 200.

Problem Definition:
  - input: none
  - output: string
  - rules/model:
    - generate a random number between 20 - 200
    - print result by string interpolation

Examples / Test Cases:
  Teddy is 69 years old!

Data Structure:
  - input: none
  - rules: logic

Algorithm:
  - generate random number
  - string interpolation

=end

# Code:
def age
  rand(20..200)
end

puts "What's your name?"
name = gets.chomp.capitalize
name = "Teddy" if input.empty?

puts "#{name} is #{age} years old!"