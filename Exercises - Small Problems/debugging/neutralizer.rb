=begin
We wrote a neutralize method that removes negative words from 
sentences. However, it fails to remove all of them. 
What exactly happens?
=end

# Code
def neutralize(sentence)
  words = sentence.split(' ')

  words.each do |word|
    words.delete(word) if negative?(word) # words ary is mutated with each iteration
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# REVISED
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# => These cards are part of a board game.

# reject! avoids skipping over elements by implementing the 
# following:
def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1 # doesn't increments if yield(array[i]) is true
    end
  end

  array
end