=begin
Description:
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

Problem Definition:
  - input: string
  - output: hash
  - rules/model:
    - count lowercase char
    - count uppercase char
    - count neither (anything else, includes numeric, whitespace, etc)

Examples / Test Cases:
  letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
  letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
  letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
  letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

Data Structure:
  - input:
  - rules:

Algorithm:
  - count matches to a-z
  - count matches to A-Z
  - count matches to non-(a-zA-Z)

=end

# Code:
def letter_case_count(str)
  hsh = {
    lowercase: str.count("a-z"),
    uppercase: str.count("A-Z"),
    neither: str.count("^a-zA-Z")
  }
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
