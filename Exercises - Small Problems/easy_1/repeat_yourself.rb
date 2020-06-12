=begin
Write a method that takes two arguments, a string and a 
positive integer, and prints the string as many times as the
integer indicates. 

Example:
repeat('Hello', 3)

Output: Hello
        Hello
        Hello

Problem Definition:
  - input: a string (str) and an integer (n)
    - what happens if inputs are of the wrong object types?
    - what happens when str its an empty string? or nil?
    - what happens when str is an integer instead of string?
    - what happens when integer is 0? negative integer?
    - are both arguments mandatory?
  - output: print string(s) to screen
  - rules: (implicit)
    - the str is printed n number of times on separate lines

Examples/Test Cases:
  repeat('') => ''
  repeat('Hello') => 'Hello' 
  repeat('', 1) => ''
  repeat('', 0) => 
  repeat(nil, 1) => ''
  repeat('Hello', 0) => ''
  repeat('Hello', 1) => 'Hello'
  repeat('Hello', 2) => 'Hello'
                        'Hello'
  repeat(1, 1) => 1
  repeat(1, 'Hello') => error or exception?


Data Structure:
  - input: string
  - output: string

Algorithm:
  - From input integer, n
    - loop through n number of times
    - each time printing the input string, str

=end

# Code:
def repeat(str, n = 1)
  n.times { puts str }
end