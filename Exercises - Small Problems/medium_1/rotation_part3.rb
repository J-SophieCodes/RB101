=begin
Description:
If you take a number like 735291, and rotate it to the left, 
you get 352917. If you now keep the first digit fixed in place, 
and rotate the remaining digits, you get 329175. Keep the first 
2 digits fixed in place and rotate again to 321759. Keep the 
first 3 digits fixed in place and rotate again to get 321597. 
Finally, keep the first 4 digits fixed in place and rotate the 
final 2 digits to get 321579. The resulting number is called 
the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns 
the maximum rotation of that argument. You can (and probably 
should) use the rotate_rightmost_digits method from the 
previous exercise.

Note that you do not have to handle multiple 0s.

Problem Definition:
  - input: integer
  - output: integer
  - rules/model: 
    - rotate the right-most digits, 
      - starting from left-most digit until the end
      - then the sec
      

Examples / Test Cases:
  max_rotation(735291) == 321579
  max_rotation(3) == 3
  max_rotation(35) == 53
  max_rotation(105) == 15 # the leading zero gets dropped
  max_rotation(8_703_529_146) == 7_321_609_845

Data Structure:
  - input:
  - rules:

Algorithm:

=end

# Code:
# def rotate_array(arr)
#   arr[1..-1] << arr[0]
# end

# def rotate_rightmost_digits(num,n)
#   num_arr = num.digits.reverse
#   num_arr[-n..-1] = rotate_array(num_arr.last(n))
#   num_arr.join.to_i
# end

# def max_rotation(num)
#   start = num.to_s.size
#   start.downto(2).reduce(num) do |result, n|
#     result = rotate_rightmost_digits(result, n)
#   end
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845


# FURTHER EXPLORATION
def recursive_rotation(arr)
  return arr if arr.size == 1
  new_ary = arr[1..-1] << arr[0]
  [new_ary[0]] + recursive_rotation(new_ary[1..-1])
end

def max_rotation(num)
  recursive_rotation(num.to_s.chars).join
end

p max_rotation(735291) == "321579"
p max_rotation(3) == "3"
p max_rotation(35) == "53"
p max_rotation(105) == "015" # leading zero preserved as string
p max_rotation(8_703_529_146) == "7321609845"


# ALTERNATIVE
def max_rotation(num)
  num_ary = num.to_s.chars
  
  num_ary.each_index do |i|
    num_ary << num_ary.slice!(i, 1)
  end

  num_ary.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
