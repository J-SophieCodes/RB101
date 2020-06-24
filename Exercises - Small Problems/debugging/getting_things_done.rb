=begin
We wrote a method for moving a given number of elements from 
ne array to another. We decide to test it on our todo list, 
but invoking move on line 11 results in a SystemStackError. 
What does this error mean and why does it happen?
=end

# Code

def move(n, from_array, to_array)
  return if n == 0 # requires a conditional statement to stop the recursion
  return p "All done! Nothing left to move!" if from_array.size == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)


p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

move(2, todo, done)
p todo
p done