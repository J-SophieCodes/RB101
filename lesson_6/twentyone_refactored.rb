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

def clear_screen
  system 'clear'
end

def initialize_deck
  SUITS.product(VALUES.keys).shuffle
end

def display_ui(title, player_hand, dealer_hand)
  player_total = calculate_max_total(player_hand)
  dealer_total = calculate_max_total(dealer_hand)

  clear_screen
  puts "<< #{title} >>\n\n"

  prompt "Dealer has: #{dealer_total}"
  display_hand(dealer_hand)

  prompt "Player has: #{player_total}"
  display_hand(player_hand)
end

def display_hand(hand)
  lines = format_cards(hand)
  print_cards(lines, 0)
  puts ""
end

def format_cards(cards)
  cards.each_with_object([[], [], [], []]) do |(suit, value), lines|
    lines[0] << "+-------+"
    lines[1] << "|" + "#{value}   #{value}".center(7) + "|"
    lines[2] << "|       |"
    lines[3] << "|   #{UNICODE[suit]}   |"
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

def player_play(deck, player_hand, dealer_card)
  input = ""
  loop do
    display_ui("Player's Turn", player_hand, [[" ", " "], dealer_card])

    loop do
      prompt "Hit (h) or stay (s)?"
      input = gets.downcase
      break if input.start_with?("h", "s")
      prompt "Invalid input. Please enter 'h' or 's':"
    end

    deal(deck, player_hand, 1) if input.start_with?("h")

    break if input.start_with?("s") || busted?(player_hand)
  end
end

def dealer_play(deck, dealer_hand, player_hand)
  player_total = calculate_max_total(player_hand)

  loop do
    display_ui("Dealer's Turn", player_hand, dealer_hand)
    sleep(1)

    max_value = calculate_max_total(dealer_hand)

    break if  max_value > player_total ||
              busted?(dealer_hand) ||
              max_value >= 17

    deal(deck, dealer_hand, 1)
  end
end

def busted?(hand)
  calculate_max_total(hand) > MAX
end

def calculate_sum(hand, value_of_ace)
  hand.reduce(0) do |sum, (_, value)|
    if value == "A"
      sum + value_of_ace
    elsif value == " "
      sum
    else
      sum + VALUES[value]
    end
  end
end

def calculate_max_total(hand)
  total = calculate_sum(hand, VALUES["A"].max)
  num_of_aces = hand.flatten.count("A")

  if total > MAX && num_of_aces > 0
    num_of_aces.times do
      total = total - VALUES["A"].max + VALUES["A"].min
      break if total <= MAX
    end
  end

  total
end

def detect_result(player_hand, dealer_hand)
  player_total = calculate_max_total(player_hand)
  dealer_total = calculate_max_total(dealer_hand)

  if player_total > MAX
    :player_busted
  elsif dealer_total > MAX
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(player_hand, dealer_hand)
  display_ui("Result", player_hand, dealer_hand)

  result = detect_result(player_hand, dealer_hand)

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
  player_hand = []
  dealer_hand = []

  deal(deck, dealer_hand, 2)
  deal(deck, player_hand, 2)

  player_play(deck, player_hand, dealer_hand.sample)

  dealer_play(deck, dealer_hand, player_hand) unless busted?(player_hand)

  display_result(player_hand, dealer_hand)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One! Goodbye!"
