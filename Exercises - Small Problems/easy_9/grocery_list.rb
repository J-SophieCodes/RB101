=begin
Description:
Write a method which takes a grocery list (array) of fruits 
with quantities and converts it into an array of the correct 
number of each fruit.

Problem Definition:
  - input: nested arrays
    - would there be item of 0 qty on the list?
  - output: 1 array
  - rules/model:

Examples / Test Cases:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def buy_fruit(nested_arr)
  nested_arr.map do |(fruit, qty)|
   [fruit] * qty
  end.flatten
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
