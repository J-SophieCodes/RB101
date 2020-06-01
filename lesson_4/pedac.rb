# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
questions for clarification:
  - What is a palindrome?
  - What is a substring?
  - Can I assume all inputs are strings?
  - Will there be sentences with spaces between words?
    - Do I ignore the spaces when evaluating for palindromes?
  - What does it mean to treat palindrome words case-sensitively?

input: string
output: array
rules:
  Explicit requirements:
    - Return all palindromes found within a given string
    - Palindromes are case sensitive
  Implicit requirements:
    - Should not mutate original string object, but returna  new array
    - Substrings can be overlapping
=end

# Algorithm:
#  substrings method
#  =================
#  - create an empty array called `result` which will contain all
#    the required substrings
#  - initialize variable start_substring_idx and assign 0 to it.
#  - initialize variable end_substring_idx and assign value of
#    start_substring_idx + 1 to it.
#  - Enter loop which will break when start_substring_idx is equal
#      to str.size
#    - Within that loop enter another loop which will break if
#      end_substring_idx is equal to str.size
#      - append to the result array part of the string from
#        start_substring_idx to end_substring_idx
#      - increment `end_substring_idx` by 1.
#    - end the inner loop
#    - increment `start_substring_idx` by 1.
#    - reassign `end_substring_idx` to `start_substring_idx += 1`
#  - end outer loop
#  - return `result` array

#  is_palindrome? method
#  =====================
#  - check whether the string value is equal to its reversed
#    value. You can use the String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#    - if the word is a palindrome, append it to the result
#      array
#  - return the result array


# def substrings(str)
#   result = []
#   start_substring_idx = 0
#   end_substring_idx = start_substring_idx + 1
#   loop do
#     break if start_substring_idx == str.size
#     loop do
#       break if end_substring_idx == str.size
#       result << str[start_substring_idx..end_substring_idx]
#       end_substring_idx += 1
#     end
#     start_substring_idx += 1
#     end_substring_idx = start_substring_idx + 1
#   end
#   result
# end

def substrings(str)
  result = []
  0.upto(str.size - 2).each do |start_idx|
    (start_idx + 1).upto (str.size - 1) do |end_idx|
      result << str[start_idx..end_idx]
    end
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end