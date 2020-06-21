=begin
Description:
You have a bank of switches before you, numbered from 1 to n. 
Each switch is connected to exactly one light that is initially 
off. You walk down the row of switches and toggle every one of 
them. You go back to the beginning, and on this second pass, 
you toggle switches 2, 4, 6, and so on. On the third pass, 
you go back again to the beginning and toggle switches 3, 6, 9, 
and so on. You repeat this process and keep going until you 
have been through n repetitions.

Write a method that takes one argument, the total number of 
switches, and returns an Array that identifies which lights are 
on after n repetitions.

Problem Definition:
  - input: integer 
  - output: array 
  - rules/model:
    - 1 to n switches, initially off
    - iterate n rounds,
      - for the 1st round, every 1st switch is toggled
      - for the 2nd round, every 2nd switch is toggled
      - for the 3rd round, every 3rd switch is toggled
      - for the nth round, every nth switch is toggled
    - result should be ordered

Examples / Test Cases:
  Example with n = 5 lights:
  round 1: every light is turned on
  round 2: lights 2 and 4 are now off; 1, 3, 5 are on
  round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
  round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
  round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
  The result is that 2 lights are left on, lights 1 and 4. 
  The return value is [1, 4].

  With 10 lights, 3 lights are left on: lights 1, 4, and 9. 
  The return value is [1, 4, 9].

Data Structure:
  - input: integer
  - rules: array

Algorithm:
  - initialize results array
  - from 1 until n (i)
    - from 1 (j)
      - add j*i into array if array doesn't have j*i
      - remove j*i from array if array already has j*i
      - until j*i > n
  - sort array

=end

# Code:
def lights_left_on(num)
  on = []

  (1..num).each do |i|
    (1..num).each do |j|
      break if i * j > num
      on.include?(i * j) ? on.delete(i * j) : on << i * j
    end
  end

  on.sort
end

p lights_left_on(5) == [1, 4]
p lights_left_on(10) == [1, 4, 9]

# SOLUTION - with edits for further exploration
# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def select_lights(lights, position)
  lights.select { |_position, state| state == position }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
  puts display_message(lights, nth)
end

def display_message(lights, nth)
  return "round #{nth}: every light is turned on" if nth == 1
  "round #{nth}: #{message(lights, "off")}; #{message(lights, "on")}"
end

def message(lights, position)
  arr = select_lights(lights, position)
  position == "on" ? "#{stringify(arr)} on" : "lights #{stringify(arr)} now off"
end

def stringify(arr)
  case arr.size
  when 1 then "#{arr[0]} is"
  when 2 then "#{arr.join(" and ")} are"
  else "#{arr.join(", ").split.insert(-2, "and").join(" ")} are"
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  select_lights(lights, "on")
end

p toggle_lights(5)


# FURTHER EXPLORATION

=begin
Do you notice the pattern in our answer? Every light that is 
on is a perfect square. Why is that?
  First pass turns everything on. Let's take 4 as an example.
  When its the 2nd pass (squareroot of 4), 4th light would have
  been turned off. When its the 4th pass, the 4th light would 
  have been turned on and left on for the remainder of the time.

We could have a method that replicates the output from the 
description of this problem (i.e. "lights 2, 3, and 5 are now 
off; 1 and 4 are on.") How would we go about writing that code?
  See display_message method
=end
