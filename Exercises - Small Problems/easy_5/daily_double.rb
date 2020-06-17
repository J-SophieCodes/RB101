=begin
Description:
Write a method that takes a string argument and returns a new 
string that contains the value of the original string with all 
consecutive duplicate characters collapsed into a single 
character. You may not use String#squeeze or String#squeeze!.

Problem Definition:
  - input: string
    - space? punctuation?
  - output: string
  - rules/model:
    - remove resecutive, recurring chars

Examples / Test Cases:
  crunch('ddaaiillyy ddoouubbllee') == 'daily double'
  crunch('4444abcabccba') == '4abcabcba'
  crunch('ggggggggggggggg') == 'g'
  crunch('a') == 'a'
  crunch('') == ''

Data Structure:
  - input: string
  - rules: can be carried out with string

Algorithm:
  - iterate through each char
  - add char to new string unless prior char == current char
  - return new string

=end

# Code:
def crunch(str)
  str.chars.each_with_object("") do |char, new_str|
    new_str << char unless new_str[-1] == char
  end
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

# FURTHER EXLORATION:
def crunch(string)
  string.gsub(/(.)\1+/, '\1') # replaced by capture group 1
end

def crunch(str)
  arr = str.split("")
  remove_dupes = arr.chunk(&:itself).map(&:first).join('')
  p remove_dupes
end

def crunch(str)
  str.gsub(/(\w)\1+/) { |match| match[0] } 
  # passed matched substr into block e.g. "gg" and returned char
  # at 0th index i.e. "g"
 end