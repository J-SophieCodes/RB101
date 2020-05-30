# Question 1
=begin
#uniq doesn't modify the caller, but returns a new array with 
unique values => [1,2,3]

#puts calls to_s on its argument and therefore prints
  1
  2
  2
  3
=end
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers


# Question 2
=begin
When attached at the end of a method, ! signifies that the method
modifies the caller. When attached in front of an object or 
an equality operator (=, ~), ! acts as a "not" operator.

When attached at the end of a method, ? signifies evaluation of
the truthiness of the method call on the object.

ANS: "! or ? at the end of the method is part of the method.
What it means depends on the method implementation."

!= is used in comparative statements to evaluate whether two objects
are NOT equal.

!user_name returns the negated boolean value of user_name.

words.uniq! calls the method #uniq on the 'words' object to
mutate'words' permanently.

? :  is the ternary operator for if...else

!!user_name returns the boolean value of user_name. Double
negation effectively converts user_name to its boolean value.
=end


# Question 3
advice = "Few things in life are as important as house training 
          your pet dinosaur."

advice.gsub!('important', 'urgent')

puts advice


# Question 4
=begin
#delete_at(1) mutates the original array, and returns the deleted
value at index 1 of the array.

#delete(1) mutates the original array, and returns the deleted
value that equals 1 from the array.
=end
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # rturns 2, numbers = [1, 3, 4, 5]
p numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # returns 1, numbers = [2, 3, 4, 5]
p numbers


# Question 5
(10..100).include?(42)
# ANS: (10..100).cover?(42)


# Question 6
famous_words = "seven years ago..."
famous_words = "Four scores and " + famous_words
famous_words.prepend("Four scores and ") 
famous_words.insert(0, "Four scores and ")


# Question 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!


# Question 8
flintstones = { 
  "Fred" => 0,
  "Wilma" => 1,
  "Barney" => 2,
  "Betty" => 3,
  "BamBam" => 4,
  "Pebbles" => 5
}

flintstones.to_a[2]
# ANS: flintstones.assoc("Barney")
