=begin
Description:
Write a method that takes a sentence string as input, and 
returns the same string with any sequence of the words 'zero', 
'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 
'nine' converted to a string of digits.

Problem Definition:
  - input: string
  - output: string
  - rules/model:
    - any numeric strings to be converted to digit strings

Examples / Test Cases:
  word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Data Structure:
  - input: string
  - rules: string

Algorithm:


=end

# Code:
def initialize_digits_hash
  numbers = %w(zero one two three four five six seven eight nine)
  digits = %w(0 1 2 3 4 5 6 7 8 9)
  numbers.zip(digits).to_h
end

DIGITS = initialize_digits_hash

def word_to_digit(str)
  str.gsub!(/\w+\s*/) do |word|
    DIGITS.key?(word.strip) ? DIGITS[word.strip] : word
  end
  str.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  str.gsub(/(\d)([a-zA-Z])/, '\1 \2')
end

puts word_to_digit('Please call me at four one six five five five one two three four. Thanks.') == 'Please call me at (416) 555-1234. Thanks.'
puts word_to_digit('Please call me at four one six five five five one two three four between eight AM and six PM. Thanks.') == 'Please call me at (416) 555-1234 between 8 AM and 6 PM. Thanks.'


# SOLUTION 
# DIGIT_HASH = {
#   'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
#   'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
# }.freeze

# def word_to_digit(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
#   end
#   words
# end

# puts word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
