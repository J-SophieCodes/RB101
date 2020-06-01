# Question 1
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# => [1, 2, 3]
=begin
#select selects elements that returns a truthy value when passed
into the block.
Only last line of block is returned. Since 'hi' will always be
truthy, every element passed into block will be selected.
=end


# Question 2
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# => 2
=begin
#count counts the number of elements in the caller that returns a
truthy value when passed into the block.
=end


# Question 3
[1, 2, 3].reject do |num|
  puts num
end
# => 1
# => 2
# => 3
# => [1, 2, 3]
=begin
#reject selects elements that returns a falsy value when passed
into the block.
Only last line of block is returned. Since 'puts' returns nil, 
which is falsy, every element passed into block will be selected.
=end


# Question 4
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
=begin
#each_with_object passes an array element and a hash into the
block with each iteration. The element's zeroth character is
assigned the key and the element itself is assigned the value 
of the hash pair. The hash is returned at the end.
=end


# Question 5
hash = { a: 'ant', b: 'bear' }
hash.shift
# => [:a, 'ant']
=begin
#shift is a mutating method that removes the first key-value pair
from the hash and returns the removed pair in a two-item array.
=end


# Question 6
['ant', 'bear', 'caterpillar'].pop.size
# => 11
=begin
#pop removes and returns the last element from the caller. In 
this case its 'caterpillar', which then #size is called on.
=end


# Question 7
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# => 1
# => true
=begin
#any? returns true if any element in the collection returns true
when passed into the block. 
Only last line of block is returned. So each element is evaluated
against #odd?, which yields true for 1 in the array. #any
immediately evaluates to true after the first iteration and returns.
=end


# Question 8
arr = [1, 2, 3, 4, 5]
arr.take(2)
# => [1, 2]
=begin
#take(n) returns the first n elements from the caller.
=end


# Question 9
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# => [nil, 'bear']
=begin
#map returns a new array with the results of running block once
for every element in the caller. 
Since 'ant'.size > 3 is false, the block returns nil.
Since 'bear'.size > 3 is true, the block returns 'bear'.
=end


# Question 10
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# => 2
# => 3
# => [1, nil, nil]
=begin
Since 1 > 1 is false, 1 is returned
Since 2 > 1 is true, 2 is printed, but puts return nil
Since 3 > 1 is true, 3 is printed, but puts return nil
=end