=begin
Description:
In the easy exercises, we worked on a problem where we had to 
count the number of uppercase and lowercase characters, as well 
as characters that were neither of those two. Now we want to go 
one step further.

Write a method that takes a string, and then returns a hash that 
contains 3 entries: one represents the percentage of characters 
in the string that are lowercase letters, one the percentage of 
characters that are uppercase letters, and one the percentage of 
characters that are neither.

You may assume that the string will always contain at least one 
character.

Problem Definition:
  - input: 
  - output: 
  - rules/model:
  
  
Examples / Test Cases:
  letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
  letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
  letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

Data Structure:
  - input: 
  - rules: 

Algorithm:


=end

# Code:
def percentage(count, total)
  (count * 100.0 / total).round(1)
end

def letter_percentages(str)
  length = str.length
  hsh = {
    lowercase: percentage((str.count "a-z"), length),
    uppercase: percentage((str.count "A-Z"), length),
    neither: percentage((str.count "^a-zA-Z"), length)
  }
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
puts letter_percentages('abcdefGHI')