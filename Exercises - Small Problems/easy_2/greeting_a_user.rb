=begin
Description:
Write a program that will ask for user's name. The program will
then greet the user. If the user writes "name!" then the 
computer yells back to the user.

Problem Definition:
  - input: string
    - validate?
    - what if "!" in the middle of the name?
    - what if "!" precedes the name?
  - output: string
  - rules/model:
    - parse input for "!"
      - if input includes "!"
        - remove "!" from name
        - return capitalized greeting.
      - otherwise, return greeting in regular case

Examples / Test Cases:
  What is your name? Bob
  Hello Bob.

  What is your name? Bob!
  HELLO BOB. WHY ARE WE SCREAMING?

Data Structure:
  - input: string
  - rules: string

Algorithm:
  - parse input to see if it includes "!"
    - if yes, return capitalized greeting
    - if no, return regular case greeting

=end

# Code:
puts "What is your name?"
name = gets.chomp.capitalize

if name.include?("!") # see SOLUTION
  puts "HELLO #{name[0..-2]}. WHY ARE WE SCREAMING?".upcase
else
  puts "Hello #{name}."
end

# SOLUTION
# print 'What is your name? '
# name = gets.chomp

# if name[-1] == '!'
#   name = name.chop
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# chomp only removes record separator
# chop removes last char unconditionally


# FURTHER EXPLORATION: use String#chomp! and String#chop!
print 'What is your name? '
name = gets.capitalize
name.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
