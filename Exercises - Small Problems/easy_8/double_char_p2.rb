=begin
Description:
Write a method that takes a string, and returns a new string 
in which every consonant character is doubled. Vowels 
(a,e,i,o,u), digits, punctuation, and whitespace should not be 
doubled.

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
  double_consonants('String') == "SSttrrinngg"
  double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
  double_consonants("July 4th") == "JJullyy 4tthh"
  double_consonants('') == ""

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def double_consonants(str)
  str.chars.map do |char|
    char =~ /[a-z&&[^aeiou]]/i ? char*2 : char
  end.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""