=begin
Description:
Write a method that takes two arguments, a positive integer 
and a boolean, and calculates the bonus for a given salary. 
If the boolean is true, the bonus should be half of the salary. 
If the boolean is false, the bonus should be 0.

Problem Definition:
  - input:
    - salary = integer, +ve
      - what if this is 0
    - bonus = boolean
      - what if this isn't supplied?
  - output: integer
  - rules/model:
    - if bonus is true
      - bonus = 50% of salary 
    - if bonus is false
      - bonus = 0% of salary

Examples / Test Cases:
  puts calculate_bonus(2800, true) == 1400
  puts calculate_bonus(1000, false) == 0
  puts calculate_bonus(50000, true) == 25000

Data Structure:
  - input: integer + boolean
  - rules: use logic to implement

Algorithm:
  - 

=end

# Code:
def calculate_bonus(salary, bonus)
  bonus ? salary * 0.5 : 0
end