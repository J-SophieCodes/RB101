# Description:
# You are given a method named spin_me that takes a string as an 
# argument and returns a string that contains the same words, but 
# with each word's characters reversed. Given the method's 
# implementation, will the returned string be the same object as 
# the one passed in as an argument or a different object?

# Code:
def spin_me(str) # str references string object passed
  str.split.each do |word| # split returns a new array
    word.reverse! # word references element in array
  end.join(" ") # only elements of array mutated and returned
end

str = "hello world"
p spin_me(str) # "olleh dlrow"
p str # "hello world" - original string object not mutated