=begin
Our countdown to launch isn't behaving as expected. Why? 
Change the code so that our program successfully counts down 
from 10 to 1.
=end

# Code:
def decrease(counter) # reference passed to local method param
  counter -= 1 # reassignment of local method param to value - 1
end

counter = 10

10.times do
  puts counter
  decrease(counter) 
end

puts 'LAUNCH!'


# REVISED
10.downto(1) do |counter|
  puts counter
end

puts 'LAUNCH!'
