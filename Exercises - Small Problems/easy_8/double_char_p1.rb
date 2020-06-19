=begin
Description:
Write a method that takes a string, and returns a new string 
in which every character is doubled.

Problem Definition:
  - input: string
  - output: new string
  - rules/model:
    - double every character in the string

Examples / Test Cases:
  repeater('Hello') == "HHeelllloo"
  repeater("Good job!") == "GGoooodd  jjoobb!!"
  repeater('') == ''

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def repeater(str)
  str.chars.each_with_object("") do |char, new_str|
    new_str << char*2
  end
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
