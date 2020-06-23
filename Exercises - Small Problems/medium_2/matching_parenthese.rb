=begin
Description:
Write a method that takes a string as argument, and returns 
true if all parentheses in the string are properly balanced, 
false otherwise. To be properly balanced, parentheses must 
occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

Problem Definition:
  - input: string
  - output: boolean
  - rules/model:
    - balanced pair must start with ( and end with )
  
Examples / Test Cases:
  balanced?('What (is) this?') == true
  balanced?('What is) this?') == false
  balanced?('What (is this?') == false
  balanced?('((What) (is this))?') == true
  balanced?('((What)) (is this))?') == false
  balanced?('Hey!') == true
  balanced?(')Hey!(') == false
  balanced?('What ((is))) up(') == false

Data Structure:
  - input: string
  - rules: integer

Algorithm:
  - keep count with +1 and -1
  - e.g. (, (, ), (, )
        +1, +1, -1, +1, -1 = -1 not balanced
  - if its ever less than 0 => unbalanced
  - e.g. (, ), ), (
        +1, -1, -1 totals up to -1 now => unbalanced

=end

# Code:
OPEN = /[\(\{\[]/
CLOSE = /[\)\}\]]/

def sums(brackets)
  brackets[:open].values.zip(brackets[:close].values).map(&:sum)
end

def balanced?(str)
  brackets = { 
    open: {"(" => 0, "{" => 0, "[" => 0},
    close: {")" => 0, "}" => 0, "]" => 0}
  }

  str.each_char do |char|       
    brackets[:open][char] += 1 if char.match?(OPEN)
    brackets[:close][char] -= 1 if char.match?(CLOSE)
    break if sums(brackets).any? { |sum| sum < 0 }
  end

  sums(brackets).all?(0) && str.count('"').even? && str.count("'").even?
end

puts balanced?('What "[is]\'\'" this?') 
puts balanced?('What [[is] this?') 
puts balanced?('What [is]}{}{ this?') 
# puts balanced?('What (is) this?') == true
# puts balanced?('What is) this?') == false
# puts balanced?('What (is this?') == false
# puts balanced?('((What) (is this))?') == true
# puts balanced?('((What)) (is this))?') == false
# puts balanced?('Hey!') == true
# puts balanced?(')Hey!(') == false
# puts balanced?('What ((is))) up(') == false


# # SOLUTION
# def balanced?(string)
#   parens = 0
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end