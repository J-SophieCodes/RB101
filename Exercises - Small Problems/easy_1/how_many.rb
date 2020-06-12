=begin
Description:
Write a method that counts the number of occurrences of each
element in a given array.

The words in the array are case-sensitive: 'suv' != 'SUV'.
Once counted, print each element alongside the number of 
occurrences.

Problem Definition:
  - input: array, case-sensitive
  - output: print strings to screen
  - rules/model:
    - count the occurrences of each unique string in the array
    - print the number of occurences for each unique string

Examples / Test Cases:
  vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
  ]

  count_occurrences(vehicles)
  ------------------------------------
  OUTPUT:
    car => 4
    truck => 3
    SUV => 1
    motorcycle => 2

Data Structure:
  - input: array
  - rules: 
    - store as key-value pairs in hash, then print
    - or don't save results, just print results

Algorithm:
  - loop through each element of the array
    - if a key exists for the element:
      - increment value by 1
    - otherwise, initialize key-value pair

=end

# Code:
# Method 1: Save results in hash, then print
def count_occurrences(arr)
  hsh = arr.each_with_object({}) do |ele, hsh|
          hsh.key?(ele) ? hsh[ele] += 1 : hsh[ele] = 1
        end

  hsh.each do |key, value|
    puts "#{key} => #{value}"
  end
end

# Method 2: Evaluate and print results directly
def count_occurrences(arr)
  unique_elements = arr.uniq

  unique_elements.each_with_index do |ele, idx|
    puts "#{unique_elements[idx]} => #{arr.count(ele)}"
  end
end

# SOLUTION
def count_occurrences(arr)
  hsh = {}

  arr.uniq.each do |ele|
    hsh[ele] = arr.count(ele) # easier to understand
  end

  hsh.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# Further Exploration: if words are case-insenitive
def count_occurrences(arr)
  hsh = {}

  uniq_arr = arr.uniq { |ele| ele.downcase }

  uniq_arr.each do |element|
    hsh[element] = arr.count { |x| /#{x}/i.match(element) }
  end

  hsh.each do |key, value|
    puts "#{key} => #{value}"
  end
end