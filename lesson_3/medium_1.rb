# Question 1
10.times {|i| puts " "*i + "The Flintstone Rock!" }


# Question 2
=begin
Error is due to the fact that we are trying to concatenate
a number to a string.
=end
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is " + "#{(40 + 2)}"


# Question 3
=begin
We can use a while loop instead so that numbers <= 0 never
enters the loop, thus avoiding evaluation errors.

'number % divisor == 0' returns true if the modulus operation 
(division remainder) equals 0, ie the divisor is a factor. The
quotient of 'number / divisor' is therefore also a factor, which
is subsequently pushed into the factors array.

'factors' in the second-to-last line returns the factors array
from the method to be used elsewhere in the program. Ruby methods
return the last statement in the method definition by default.
Without this line, method returns nil.
=end
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end


# Question 4
=begin
rolling_buffer1 would correctly achieve the intended function
as long as the buffer array is initialized outside the method.

rolling_buffer2 initializes the buffer array within the method 
definition. Although the buffer is returned from the method, the
buffer object is not accessible in the outer scope. One way to 
resolve this is to save the result of the method to anther 
buffer object initialized in the outer scope.
=end
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer1 = []
rolling_buffer1(buffer1, 5, "a")
# -----------------------------------
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer2 = []
buffer2 = rolling_buffer2(buffer2, 5, "a")


# Question 5
=begin
the local variable 'limit' was not passed into the method as a
parameter, so it was not accessible to the method. By initializing
it as a constant 'LIMIT', it will then become globally available.
=end
LIMIT = 15

def fib(first_num, second_num)
  while first_num + second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"


# Question 6
=begin
Outputs 42 - 8 = 34 
Ruby passes in a copy of the referenced value into the method.
The method then performs a reassignment, which doesn't mutate
the original referenced value. Therefore, the value of answer 
remains unchanged.
=end
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8


# Question 7
=begin
The code below will affect the original munsters hash because
the hash reference is passed into the method and #[] assignment
on the hash elements is mutating.
=end
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)


# Question 8
# rps() effectively returns the winner of the round.
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts  rps(
          rps(
              rps("rock", "paper"), # returns paper
              rps("rock", "scissors") # returns rock
          ), # returns paper
          "rock" # returns paper
      )


# Question 9
=begin
foo() is evaluated first: since no param passed, it takes the
default param = "no". The method returns "yes".

bar() is evaluated next: the return value of foo() is passed as
param into bar(), so param = "yes". The ternary statement then
evaluates to "no", and is returned.
=end
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)