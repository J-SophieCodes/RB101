require 'pry'

VALUES = {  "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
            "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 10,
            "Q" => 10, "K" => 10, "A" => [1, 11] }

SUITS = ["Hearts", "Diamond", "Clubs", "Spades"]

UNICODE = { "Hearts" => "\u2665",
            "Diamond" => "\u2666",
            "Clubs" => "\u2663",
            "Spades" => "\u2660",
            " " => "\u0020" }

MAX = 21
DEALER_THRESHOLD = 17

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def initialize_deck
  deck = []
  SUITS.product(VALUES.keys) do |suit, value|
    deck << { suit: suit, value: value }
  end
  deck.shuffle
end

def display_ui(title, totals, hands)
  clear_screen
  puts "<< #{title} >>\n\n"

  prompt "Dealer has: #{totals[:dealer]}"
  display_hand(hands[:dealer])

  prompt "Player has: #{totals[:player]}"
  display_hand(hands[:player])
end

def display_hand(hand)
  lines = format_cards(hand)
  print_cards(lines, 0)
  puts ""
end

def format_cards(hand)
  hand.each_with_object([[], [], [], []]) do |card, lines|
    lines[0] << "+-------+"
    lines[1] << "|" + "#{card[:value]}   #{card[:value]}".center(7) + "|"
    lines[2] << "|       |"
    lines[3] << "|   #{UNICODE[card[:suit]]}   |"
  end
end

def print_cards(lines, counter)
  puts lines[counter].join("  ")
  unless counter == lines.size - 1
    print_cards(lines, counter + 1)
    puts lines[counter].join("  ")
  end
end

def deal(deck, hand, num = 1)
  num.times do
    hand << deck.shuffle!.pop
  end
end

def update_total(contender, totals, hands)
  totals[contender] = calculate_max_total(hands[contender])
end

def blank
  { suit: " ", value: " " }
end

def hide_dealer_card(hands)
  hands[:dealer].unshift(blank)
  hands[:dealer].pop
end

def reveal_dealer_card(hidden_card, hands)
  hands[:dealer].shift
  hands[:dealer].unshift(hidden_card)
end

def player_play(deck, totals, hands)
  loop do
    display_ui("Player's Turn", totals, hands)

    input = ""
    loop do
      prompt "Hit (h) or stay (s)?"
      input = gets.downcase
      break if input.start_with?("h", "s")
      prompt "Invalid input. Please enter 'h' or 's':"
    end

    if input.start_with?("h")
      deal(deck, hands[:player], 1)
      update_total(:player, totals, hands)
    end

    break if input.start_with?("s") || busted?(totals[:player])
  end
end

def dealer_play(deck, totals, hands)
  loop do
    display_ui("Dealer's Turn", totals, hands)
    sleep(1)

    break if  totals[:dealer] > totals[:player] ||
              busted?(totals[:dealer]) ||
              totals[:dealer] >= DEALER_THRESHOLD

    deal(deck, hands[:dealer], 1)
    update_total(:dealer, totals, hands)
  end
end

def busted?(total)
  total > MAX
end

def calculate_sum(hand, value_of_ace)
  hand.reduce(0) do |sum, card|
    if card[:value] == "A"
      sum + value_of_ace
    elsif card[:value] == " "
      sum
    else
      sum + VALUES[card[:value]]
    end
  end
end

def calculate_max_total(hand)
  total = calculate_sum(hand, VALUES["A"].max)

  hand.count { |card| card[:value] == "A" }.times do
    total -= (VALUES["A"].max - VALUES["A"].min) if total > MAX
  end

  total
end

def detect_result(totals)
  if totals[:player] > MAX
    :player_busted
  elsif totals[:dealer] > MAX
    :dealer_busted
  elsif totals[:dealer] < totals[:player]
    :player
  elsif totals[:dealer] > totals[:player]
    :dealer
  else
    :tie
  end
end

def display_result(totals, hands)
  display_ui("Result", totals, hands)

  result = detect_result(totals)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  gets.chomp.downcase.start_with?("y")
end

loop do
  deck = initialize_deck
  hands = { player: [],
            dealer: [] }
  totals = { player: 0,
             dealer: 0 }

  deal(deck, hands[:player], 2)
  deal(deck, hands[:dealer], 2)

  hidden_dealer_card = hide_dealer_card(hands)
  update_total(:player, totals, hands)
  update_total(:dealer, totals, hands)

  player_play(deck, totals, hands)

  reveal_dealer_card(hidden_dealer_card, hands)
  update_total(:dealer, totals, hands)

  dealer_play(deck, totals, hands) unless busted?(totals[:player])

  display_result(totals, hands)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One! Goodbye!"

#yml
#keep scores