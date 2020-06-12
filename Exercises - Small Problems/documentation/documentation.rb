
# 1. Class and Instance Methods

# Locate the ruby documentation for methods File::path and 
# File#path. How are they different?

# File::path
# - A class method - called on the class 'File'
# - Returns string representation of the path.
#   e.g. puts File.path('bin') #=> "bin"

# File#path
# - An instance method - called on the object 'f' of the 'File' class
# - Returns the pathname used to create file as a string. 
#   e.g. f = File.new('my-file.txt')
#        puts f.path 


# 2. Optional Arguments Redux
# What will each of the 4 puts statements print?
# Look in Standard Library Documentation for Date::new
# new([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date
# items inside nested brackets are optional

require 'date'

puts Date.new               #=> -4712-01-01 Julian Day!
puts Date.new(2016)         #=> 2016-01-01
puts Date.new(2016, 5)      #=> 2016-05-01
puts Date.new(2016, 5, 13)  #=> 2016-05-13
# if month is omitted, so will mday and start


# 3. Default Arguments in the Middle
# default positional arguments
# look under doc/syntax/calling_methods.rdoc
# positional arguments are filled out first, then the default 
# arguments are set with any values supplied, and, finally, 
# default values are applied to anything remaining

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6) #=> [4, 5, 3, 6]
# here, a and d are filled first, then b is filled next, and
# c takes the default value.


# 4. Mandatory Blocks
# The Array#bsearch method is used to search ordered Arrays 
# more quickly than #find and #select can. 
# How would you search this Array to find the first element 
# whose value exceeds 8?

a = [1, 4, 8, 11, 15, 19]
a.bsearch {|x| x > 8} #=> 11

# #bsearch is used to find-minimum or find-any
# array must be sorted beforehand
# find-minimum mode: block to return true/false for each 
#                   element, but method returns the first true
# find-any mode: don't understand


# 5. Multiple Signatures
# What do each of these puts statements output?
#   fetch(index) → obj
#   fetch(index, default) → obj
#   fetch(index) { |index| block } → obj
# Multiple lines in signature implies argument is optional

a = %w(a b c d e)
puts a.fetch(7)                       #=> IndexError
puts a.fetch(7, 'beats me')           #=> 'beats me'
puts a.fetch(7) { |index| index**2 }  #=> 49


# 6. Keyword Arguments
# step(by: step, to: limit) {|i| block } → self
5.step(to: 10, by: 3) { |value| puts value }
#=> 5
#=> 8
# with keywords as args, order of args doesn't matter


# 7. Parent Class
# Ruby is object oriented. Meaning that every value is an object,
# and every object has an associated class and superclass (parent).

# Every class that inherits from a superclass also inherits all
# of its methods, which MAY be overriden by the subclass.

# Every method in Object (parent) is also available in String
s = 'abc'
puts s.public_methods.inspect
# prints methods in String class, as well as methods inherited
# from Object, BasicObject class, and Kernal module
puts s.public_methods(false).inspect
# #public_methods takes an argument, and when arg is set to false, 
# #public_methods limits the output to just those methods in 
# the object that called #public_methods


# 8. Included Modules
# MI = multiple inheritance => a class can inherit from 2+
# immediate superclasses.

# Ruby uses something like multiple inheritance, but without
# the worst of the pitfalls: mix-in modules.

# Classes can use #include method to use a mix-in module.
# This allows classes of different types to share behaviors (methods)

# Enumberable module is a commonly used mix-in for collection
# classes (array, hash, range). This is where you will find #min
a = [5, 9, 3, 11]
puts a.min #=> 3
puts a.min(2) #=> 3, 5
puts a.sort.take(2) # for Ruby pre-2.2.0 versions

# In general, look at both parent class and included modules
# to look up methods you can't find in a subclass


# 9. Down the Rabbit Hole
# Find the documentation for YAML::load_file
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# https://ruby-doc.org/stdlib-2.7.1/libdoc/psych/rdoc/Psych.html#method-c-load_file
# load_file(filename, fallback: false)
