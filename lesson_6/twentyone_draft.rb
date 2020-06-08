=begin
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

VALUES = {  "2" => 2, "3" => 3, "4" => 4, "5" => 5,
            "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10,
            "J" => 10, "Q" => 10, "K" => 10, "A" => [1, 11] }

SUITS = ["Hearts", "Diamond", "Clubs", "Spades"]

UNICODE = { "Hearts" => "\u2665",
            "Diamond" => "\u2666",
            "Clubs" => "\u2663",
            "Spades" => "\u2660",
            " " => "\u0020" }

MAX = 21

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.each_with_object([]) do |suit, deck|
    VALUES.each_key do |value|
      deck << [suit, value]
    end
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_hand(hand)
  border = []
  top_bot = []
  blank = []
  middle = []

  hand.each do |suit, value|
    border << "+-------+"
    top_bot << "|" + "#{value}   #{value}".center(7) + "|"
    blank << "|       |"
    middle << "|   #{UNICODE[suit]}   |"
  end

  puts border.join("  ")
  puts top_bot.join("  ")
  puts blank.join("  ")
  puts middle.join("  ")
  puts blank.join("  ")
  puts top_bot.join("  ")
  puts border.join("  ")
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def deal(deck, hand, num = 1)
  num.times do
    hand << deck.shuffle!.pop
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def player_play(deck, player_hand, dealer_card)
  loop do
    system 'clear'
    prompt "<< Player's turn >>"

    prompt "Dealer has:"
    display_hand([[" ", " "], dealer_card])

    prompt "Player has:"
    display_hand(player_hand)

    max_value = calculate_max_total(player_hand)
    min_value = calculate_min_total(player_hand)

    if max_value == min_value
      prompt "The value of your hand is #{max_value}."
    else
      prompt "The maximum value of your hand is #{max_value}."
      prompt "The minimum value of your hand is #{min_value}."
    end

    break if busted?(player_hand)

    input = ""
    loop do
      prompt "Hit (h) or stay (s)?"
      input = gets.downcase
      break if input.start_with?("h", "s")
      prompt "Invalid input."
    end

    break if input.start_with?("s")

    deal(deck, player_hand, 1)
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def dealer_play(deck, dealer_hand, player_hand)
  player_points = calculate_max_total(player_hand)

  loop do
    system 'clear'
    prompt "<< Dealer's turn >>"

    prompt "Player has:"
    display_hand(player_hand)

    prompt "Dealer has:"
    display_hand(dealer_hand)

    max_value = calculate_max_total(dealer_hand)

    break if  max_value > player_points ||
              busted?(dealer_hand) ||
              max_value >= 17

    deal(deck, dealer_hand, 1)
    sleep(1)
  end
end

def busted?(hand)
  calculate_min_total(hand) > MAX
end

def calculate_total(hand, value_of_ace)
  hand.reduce(0) do |sum, (_, value)|
    if value == "A"
      sum + value_of_ace
    else
      sum + VALUES[value]
    end
  end
end

def calculate_min_total(hand)
  calculate_total(hand, VALUES["A"].min)
end

def calculate_max_total(hand)
  total = calculate_total(hand, VALUES["A"].max)
  num_of_aces = hand.flatten.count("A")

  if total > MAX && num_of_aces > 0
    num_of_aces.times do
      total = total - VALUES["A"].max + VALUES["A"].min
      break if total <= MAX
    end
  end

  total
end

def calculate_results(player_hand, dealer_hand)
  player_points = calculate_max_total(player_hand)
  dealer_points = calculate_max_total(dealer_hand)
  prompt "Player's hand is #{player_points}."
  prompt "Dealer's hand is #{dealer_points}."
  player_points > dealer_points ? "Player" : "Dealer"
end

def display_results(winner, busted = nil)
  prompt "Busted!" if busted == true
  prompt "#{winner} is the winner!"
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  gets.chomp.downcase.start_with?("y")
end

loop do
  player_hand = []
  dealer_hand = []

  deck = initialize_deck

  # assume human is player

  deal(deck, dealer_hand, 2)
  deal(deck, player_hand, 2)

  player_play(deck, player_hand, dealer_hand.sample)
  if busted?(player_hand)
    display_results("Dealer", true)
  else
    dealer_play(deck, dealer_hand, player_hand)
    if busted?(dealer_hand)
      display_results("Player", true)
    else
      results = calculate_results(player_hand, dealer_hand)
      display_results(results)
    end
  end

  break unless play_again?
end

prompt "Thanks for playing Twenty-One! Goodbye!"
