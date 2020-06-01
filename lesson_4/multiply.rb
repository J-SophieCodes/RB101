def multiply(numbers, multiplier)
  result = []
  counter = 0

  loop do
    break if counter == numbers.size

    result << numbers[counter] * multiplier

    counter += 1
  end

  result
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers,3)

p my_numbers # => [2, 8, 6, 14, 4, 12]