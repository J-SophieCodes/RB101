require 'yaml'

MESSAGES = YAML.load_file('twentyone_messages.yml')
LANGUAGE = 'en'

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

def messages(key, lang='en')
  MESSAGES[lang][key]
end

def prompt(key, precede = "", succeed = "")
  message = messages(key, LANGUAGE)
  puts "=> #{precede}#{message}#{succeed}"
end

def clear_screen
  system 'clear'
end

def valid_integer?(str)
  str.to_i.to_s == str && str.to_i > 0
end

def how_many_wins?
  wins = ""
  loop do
    prompt :how_to_win
    wins = gets.chomp

    break if valid_integer?(wins)
    prompt :invalid_number
  end

  wins.to_i
end

def initialize_deck
  deck = []
  SUITS.product(VALUES.keys) do |suit, value|
    deck << { suit: suit, value: value }
  end
  deck.shuffle
end

def display_ui(scoreboard, title, totals, hands)
  clear_screen
  display_scoreboard(scoreboard[:round], scoreboard[:scores])

  puts "\n<< #{messages(title)} >>\n\n"

  puts "Dealer has: #{totals[:dealer]}"
  display_hand(hands[:dealer])

  puts "Player has: #{totals[:player]}"
  display_hand(hands[:player])
end

def align_elements(arr, width, separator)
  arr.map { |ele| ele.to_s.upcase.center(width) }.join(separator)
end

def display_scoreboard(round, scores)
  padstr = 16
  total_width = padstr * 2 + 1
  divider = "*" * total_width
  puts divider
  puts "ROUND #{round}".center(total_width)
  puts divider
  puts align_elements(scores.keys, padstr, " ")
  puts align_elements(scores.values, padstr, ":")
  puts divider
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

def player_play(scoreboard, deck, totals, hands)
  loop do
    display_ui(scoreboard, :player_play, totals, hands)

    input = ""
    loop do
      prompt :hit_or_stay
      input = gets.downcase
      break if input.start_with?("h", "s")
      prompt :invalid_input
    end

    if input.start_with?("h")
      deal(deck, hands[:player], 1)
      update_total(:player, totals, hands)
    end

    break if input.start_with?("s") || busted?(totals[:player])
  end
end

def dealer_play(scoreboard, deck, totals, hands)
  loop do
    display_ui(scoreboard, :dealer_play, totals, hands)
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

def update_total(contender, totals, hands)
  totals[contender] = calculate_max_total(hands[contender])
end

def detect_result(totals)
  if totals[:player] > MAX
    :player_busted
  elsif totals[:dealer] > MAX
    :dealer_busted
  elsif totals[:dealer] < totals[:player]
    :player_wins
  elsif totals[:dealer] > totals[:player]
    :dealer_wins
  else
    :tie
  end
end

def display_result(scoreboard, totals, hands)
  result = detect_result(totals)
  update_scores(scoreboard[:scores], result)

  display_ui(scoreboard, :result, totals, hands)
  prompt result
end

def update_scores(scores, result)
  case result
  when :player_busted, :dealer_wins
    scores[:dealer] += 1
  when :dealer_busted, :player_wins
    scores[:player] += 1
  end
end

def match_ended?(scores, total_wins)
  !!detect_winner(scores, total_wins)
end

def detect_winner(scores, total_wins)
  scores.key(total_wins)
end

def continue?
  prompt :continue
  gets
end

def play_again?
  prompt :play_again
  gets.chomp.downcase.start_with?("y")
end

loop do
  clear_screen
  prompt :welcome

  total_wins = how_many_wins?

  scoreboard = { round: 0,
                 scores: { player: 0,
                           dealer: 0 } }

  loop do
    scoreboard[:round] += 1

    deck = initialize_deck

    hands = { player: [], dealer: [] }
    totals = { player: 0, dealer: 0 }

    deal(deck, hands[:player], 2)
    deal(deck, hands[:dealer], 2)

    hidden_dealer_card = hide_dealer_card(hands)
    update_total(:player, totals, hands)
    update_total(:dealer, totals, hands)

    player_play(scoreboard, deck, totals, hands)

    reveal_dealer_card(hidden_dealer_card, hands)
    update_total(:dealer, totals, hands)

    unless busted?(totals[:player])
      dealer_play(scoreboard, deck, totals, hands)
    end

    display_result(scoreboard, totals, hands)

    break if match_ended?(scoreboard[:scores], total_wins)

    continue?
  end

  winner = detect_winner(scoreboard[:scores], total_wins)
  prompt(:winner, winner.capitalize)

  break unless play_again?
end

prompt :goodbye
