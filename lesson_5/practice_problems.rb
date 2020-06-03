# Question 1
arr = ['10', '11', '9', '7', '8']
arr.sort do |item1, item2|
  item2.to_i <=> item1.to_i
end


# Question 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published].to_i
end
# can do without #to_i since years are 4 digits long


# Question 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][-1]

arr2 = [{ first: ['a', 'b', 'c'], second: ['d', 'e', 'f'] }, 
        { third: ['g', 'h', 'i'] }]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {  first: {'d' => 3}, 
          second: {'e' => 2, 'f' => 1}, 
          third: {'g' => 0}
        }
hsh2[:third].keys[0] # or hsh2[:third].key(0)


# Question 4
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4


# Question 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
munsters.each_value do |info|
  total_age += info["age"] if info["gender"] == "male"
end
total_age

# OR use Enumerator#sum
munsters.values.sum do |info|
  info["gender"] == "male" ? info["age"] : 0
end


# Question 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, detail|
  puts "#{name} is a #{detail["age"]}-year-old #{detail["gender"]}."
end


# Question 7
a = 2
b = [5, 8]
arr = [a, b] # arr = [2, [5, 8]]

arr[0] += 2 # arr = [4, [5, 8]] and a = 2 because constants are immutable
arr[1][0] -= a # arr = [4, [1, 8]] and b = [3, 8] because arrays are mutable


# Question 8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |arr|
  arr.each do |word|
    puts word.chars.keep_if { |char| char =~ /[aeiou]/ }
  end
end

# ANSWER
=begin
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
=end


# Question 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end


# Question 10
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hsh|
  hsh.each_with_object({}) do |(key, value), hsh2|
    hsh2[key] = value + 1
  end
end


# Question 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end


# Question 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr.each_with_object({}) do |sub_arr, hsh|
  hsh[sub_arr[0]] = sub_arr[1]
end


# Question 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end


# Question 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.values.map do |food|
  if food[:type] == 'fruit'
    food[:colors].map { |color| color.capitalize }
  else
    food[:size].upcase
  end
end


# Question 15
arr = [ {a: [1, 2, 3]}, 
        {b: [2, 4, 6], c: [3, 6], d: [4]}, 
        {e: [8], f: [6, 10]}  ]

arr.select do |hash|
  hash.values.all? do |sub_arr|
    sub_arr.all? do |num|
      num.even?
    end
  end
end
