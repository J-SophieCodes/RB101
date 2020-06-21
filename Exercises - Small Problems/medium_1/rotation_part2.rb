=begin
Description:
Write a method that can rotate the last n digits of a number. 

Note that rotating just 1 digit results in the original number 
being returned.

You may use the rotate_array method from the previous exercise 
if you want. (Recommended!)

You may assume that n is always a positive integer.

Problem Definition:
  - input: number, n
  - output: integer
  - rules/model:
    - rotate last n digits of a number

Examples / Test Cases:
  rotate_rightmost_digits(735291, 1) == 735291
  rotate_rightmost_digits(735291, 2) == 735219
  rotate_rightmost_digits(735291, 3) == 735912
  rotate_rightmost_digits(735291, 4) == 732915
  rotate_rightmost_digits(735291, 5) == 752913
  rotate_rightmost_digits(735291, 6) == 352917

Data Structure:
  - input: integer
  - rules: 

Algorithm:
  - convert to digits array
    - pass last n digits into rotate_array method
  - combine the arrays
  - join and convert back to int

=end

# Code:
def rotate_array(arr)
  arr[1..-1] << arr[0]
end

def rotate_rightmost_digits(num,n)
  num_arr = num.digits.reverse
  num_arr[-n..-1] = rotate_array(num_arr.last(n))
  num_arr.join.to_i
end

# num_arr[-n..-1] = rotate_array(num_arr.last(n))
# When an expression like the above appears on the left side of 
# an assignment, it means, "replace the last n elements with the 
# values to the right of the equal sign". And that's exactly what 
# happens here: we replace the last n digits with the rotated 
# digits.

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
