# Question 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hsh = {}
flintstones.each_with_index do |name, indx|
  hsh[name] = indx
end
p hsh


# Question 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.sum { |_, age| age }
# ANS: ages.values.inject(:+)


# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.select! { |_, age| age < 100 }
# ANS: ages.keep_if { |_, age| age < 100 }


# Question 4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.min_by { |_, age| age }
ages.values.min

# Question 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.find_index { |name| name.start_with?("Be") }
# ANS: flintstones.index { |name| name[0, 2] == "Be" }


# Question 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0,3] }


# Question 7
statement = "The Flintstones Rock"
statement.split.join.chars.each_with_object({}) do |char, hsh|
  hsh[char] == nil ? hsh[char] = 1 : hsh[char] += 1
end

# ANS:
=begin
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
=end


# Question 8
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# => 1
# => 3
# => [3, 4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# => 1
# => 2
# => [1, 2]
 
=begin
Loop counter continues even if caller size changes with each
iteration. Iterator operates on the original array in real time.

debug with:
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "Index #{index} from #{numbers.inspect} has value #{number}"
  p "Removing #{numbers.shift(1)}"
  p "Ending with #{numbers}"
end

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "Index #{index} from #{numbers.inspect} has value #{number}"
  p "Removing #{numbers.pop(1)}"
  p "Ending with #{numbers}"
end
=end


# Question 9
def titleize(str)
  str.split.map { |word| word.capitalize } .join(" ")
end

words = "the flintstones rock"
p titleize(words)
p words


# Question 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, info|
  case info["age"]
  when 0..17 then info["age_group"] = "kid"
  when 18..64 then info["age_group"] = "adult"
  else info["age_group"] = "senior"
  end
end