=begin
Description:
Write a method that takes an Array of Integers between 0 and 19,
and returns an Array of those Integers sorted based on the 
English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, 
eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, 
eighteen, nineteen

Problem Definition:
  - input: array of integers between 0 - 19
    - validate?
  - output: array of integers sorted based on their alphabetical
    names
  - rules/model:

Examples / Test Cases:
  alphabetic_number_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
  ]

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
ALPHA_NAMES = %w(zero, one, two, three, four, five, six, 
  seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, 
  fifteen, sixteen, seventeen, eighteen, nineteen)

def alphabetic_number_sort(ary)
  ary.sort { |a,b| ALPHA_NAMES[a] <=> ALPHA_NAMES[b] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# SOLUTION
# def alphabetic_number_sort(numbers)
#   numbers.sort_by { |number| NUMBER_WORDS[number] }
# end

# NOTE: if #sort_by! was used instead, the original array would
# be mutated as we iterate through it, producing unexpected
# results.