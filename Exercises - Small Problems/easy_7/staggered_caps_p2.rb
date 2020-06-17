=begin
Description:
Modify the method from the previous exercise so it ignores 
non-alphabetic characters when determining whether it should 
uppercase or lowercase each letter. The non-alphabetic 
characters should still be included in the return value; they 
just don't count when toggling the desired case.

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
  staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
  staggered_case('ALL CAPS') == 'AlL cApS'
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:
def staggered_case(str)
  capital = false
  str.chars.map do |char|
    if char =~ /[a-z]/i
      capital = !capital
      capital ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


# FURTHER EXPLORATION
# Modify this method so the caller can determine whether 
# non-alphabetic characters should be counted when determining 
# the upper/lowercase state. That is, you want a method that can 
# perform the same actions that this method does, or operates 
# like the previous version.

# Hint: Use a keyword argument.

def staggered_case(str, startcap: true, count_nonalpha: true)
  capital = !startcap
  str.chars.map do |char|
    capital = !capital if char =~ /[a-z]/i || count_nonalpha
    capital ? char.upcase : char.downcase
  end.join
end

puts staggered_case('I Love Launch School!') 
puts staggered_case('I Love Launch School!', startcap: false) 
puts staggered_case('I Love Launch School!', count_nonalpha: false) 
