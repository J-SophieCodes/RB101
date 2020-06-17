=begin
Description:
Given a string that consists of some words (all lowercased) and 
an assortment of non-alphabetic characters, write a method that 
returns that string with all of the non-alphabetic characters 
replaced by spaces. If one or more non-alphabetic characters 
occur in a row, you should only have one space in the result 
(the result should never have consecutive spaces).

Problem Definition:
  - input: string
  - output: string 
    - return same string or new one?
  - rules/model:

Examples / Test Cases:
  cleanup("---what's my +*& line?") == ' what s my line ' 

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def cleanup(str)
  str.gsub(/[^a-z]/i, " ").squeeze(" ")
end

puts cleanup("---what's my +*& line?") == ' what s my line '


# FURTHER EXPLORATION
ALPHABETS = ("a".."z").to_a

def cleanup(str)
  str.chars.each_with_object("") do |char, clean_str|
    if ALPHABETS.include?(char)
      clean_str << char
    else
      clean_str << " " unless clean_str[-1] == " "
    end
  end
end

puts cleanup("---what's my +*& line?") == ' what s my line '
