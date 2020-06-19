=begin
Description:
Write a method that returns a list of all substrings of a 
string that are palindromic. That is, each substring must 
consist of the same sequence of characters forwards as it does 
backwards. The return value should be arranged in the same 
sequence as the substrings appear in the string. Duplicate 
palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the 
previous exercise.

For the purposes of this exercise, you should consider all 
characters and pay attention to case; that is, "AbcbA" is a 
palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, 
assume that single characters are not palindromes.

Problem Definition:
  - input: string
  - output: array of substrings
  - rules/model:
    - in same order as the substrings array
    - non-case-sensitive
    - doesn't include one-worded substrings
    - palindromes

Examples / Test Cases:
  palindromes('abcd') == []
  palindromes('madam') == ['madam', 'ada']
  palindromes('hello-madam-did-madam-goodbye') == [
    'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
    'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
    '-madam-', 'madam', 'ada', 'oo'
  ]
  palindromes('knitting cassettes') == [
    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
  ]

Data Structure:
  - input:
  - rules:

Algorithm:
  - use substrings method to get list of substrings
  - select palindromes 
    - greater than 1 char in length
    - forward == reverse

=end

# Code:
def substrings_at_start(str)
  (0..str.size-1).map do |idx|
    str[0..idx]
  end
end

def substrings(str)
  (0..str.size-1).map do |idx|
    substrings_at_start(str[idx..-1])
  end.flatten
end

def palindrome?(substr)
  substr.size > 1 && substr == substr.reverse
end

def palindromes(str)
  substrs = substrings(str)
  substrs.select do |substr|
    palindrome?(substr.downcase.delete "^a-z0-9")
  end
end

p palindromes('abcd') 
p palindromes('madam') 
p palindromes('hello-M-adam-did-madam-goodbye')
p palindromes('knitting cassettes') 