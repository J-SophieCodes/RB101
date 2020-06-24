=begin
We started working on a card game but got stuck. Check out why 
the code below raises a TypeError.

Once you get the program to run and produce a sum, you might 
notice that the sum is off: It's lower than it should be. Why 
is that?
=end

# Code
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end
p player_cards
p deck.values

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_score = remaining_cards.map do |card|
                      score(card)
                    end.sum

  sum += remaining_score
end

puts sum

# Test case
total_sum  = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
player_sum = player_cards.map { |card| score(card) }.sum

puts(sum == total_sum - player_sum) #=> false