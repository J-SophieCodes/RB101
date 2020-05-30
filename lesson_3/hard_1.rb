# Question 1
=begin
ANS: returns nil and no error. When you initialize a local 
variable within an if block, even if that if block doesn’t get 
executed, the local variable is initialized to nil.
=end
if false
  greeting = “hello world”
end

greeting 


# Question 2
=begin
could initialize informal_greeting to reference a clone to avoid 
mutating the original object
informal_greeting = greetings[:a].clone
=end
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there' # #<< is mutating

puts informal_greeting  #  => "hi there"
puts greetings # { a: 'hi there' }


# Question 3
# Group A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one is: one
puts "two is: #{two}" # two is: two
puts "three is: #{three}" # three is: three

# Group B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one is: one
puts "two is: #{two}" # two is: two
puts "three is: #{three}" # three is: three

# Group C
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one is: two
puts "two is: #{two}" # two is: three
puts "three is: #{three}" # three is: one


# Question 4
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  
  if dot_separated_words.size == 4
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
    return true
  end

  false
end

def is_an_ip_number?(word)
  (0..255).cover?(word.to_i)
end

=begin
ANS:

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

=end