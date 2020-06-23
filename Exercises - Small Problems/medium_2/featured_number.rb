=begin
Description:
A featured number (something unique to this exercise) is an odd 
number that is a multiple of 7, and whose digits occur exactly 
once each. So, for example, 49 is a featured number, but 98 is 
not (it is not odd), 97 is not (it is not a multiple of 7), and 
133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and 
returns the next featured number that is greater than the 
argument. Issue an error message if there is no next featured 
number.

Problem Definition:
  - input: integer
  - output: integer
  - rules/model:
    - featured number
      - odd
      - multiple of 7
      - digits occur exactly once each
    - error message if none found
  
Examples / Test Cases:
  featured(12) == 21
  featured(20) == 21
  featured(21) == 35
  featured(997) == 1029
  featured(1029) == 1043
  featured(999_999) == 1_023_547
  featured(999_999_987) == 1_023_456_987

  featured(9_999_999_999) # -> There is no possible number that 
                               fulfills those requirements

Data Structure:
  - input: 
  - rules: 

Algorithm:


=end

# Code:
# def unique_digits?(num)
#   num.digits.length == num.digits.uniq.size
# end

# def featured(num)
#   num += 1 until num % 7 == 0
#   num.step(by: 7).each do |i|
#     return i if i.odd? && unique_digits?(i)
#   end

#   "There is no possible number that fulfills those requirements."
# end

# puts featured(12) #== 21
# puts featured(20) #== 21
# puts featured(21) #== 35
# puts featured(997) #== 1029
# puts featured(1029) #== 1043
# puts featured(999_999) #== 1_023_547
# puts featured(999_999_987) #== 1_023_456_987
# puts featured(9_999_999_999)

# REFACTORED
def error
  "There is no possible number that fulfills those requirements."
end

def featured(num)
  return error if num >= 9_876_543_210
  num += 1 until num % 7 == 0 && num.odd?

  num.step(by: 14).each do |i|  # odd + even = odd
    break if i >= 9_876_543_210
    return i if i.digits == i.digits.uniq
  end

  error
end

puts featured(12) #== 21
puts featured(20) #== 21
puts featured(21) #== 35
puts featured(997) #== 1029
puts featured(1029) #== 1043
puts featured(999_999) #== 1_023_547
puts featured(999_999_987) #== 1_023_456_987
puts featured(9_999_999_999)
