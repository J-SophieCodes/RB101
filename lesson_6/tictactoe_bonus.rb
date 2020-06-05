require 'pry'
require 'pry-byebug'

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMP_MARKER = "O"

# Default setting for determining first-move
FIRST_MOVE = { "Player" => false,
               "Computer" => false,
               "Choose" => true }

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

SCORES = { "Player" => 0,
           "Computer" => 0 }

def prompt(msg)
  puts "=> #{msg}"
end

def who_gets_first_move?
  if FIRST_MOVE.key(true) == "Choose"
    prompt "Do you want to go first? (y or n)"
    gets.downcase.start_with?("y") ? "Player" : "Computer"
  else
    FIRST_MOVE.key(true)
  end
end

def display_ui(round, brd)
  system 'clear'
  puts "<< TIC-TAC-TOE >>"
  puts ""
  score_board(round)
  puts ""
  display_board(brd)
  puts ""
end

# rubocop:disable Metrics/AbcSize
def score_board(round)
  padstr = 10
  puts "*" * (padstr * 2 + 1)
  puts "ROUND #{round}".center(padstr * 2 + 1)
  puts "*" * (padstr * 2 + 1)
  puts "PLAYER".center(padstr) + " " + "COMPUTER".center(padstr)
  puts  SCORES["Player"].to_s.center(padstr) + ":" +
        SCORES["Computer"].to_s.center(padstr)
  puts "*" * (padstr * 2 + 1)
end
# rubocop:enable Metrics/AbcSize

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "You are #{PLAYER_MARKER}. Computer is #{COMP_MARKER}."
  puts ""
  puts "1      |2      |3"
  puts "   #{brd[1]}   |   #{brd[2]}   |   #{brd[3]}   "
  puts "       |       |"
  puts "-------+-------+-------"
  puts "4      |5      |6"
  puts "   #{brd[4]}   |   #{brd[5]}   |   #{brd[6]}   "
  puts "       |       |"
  puts "-------+-------+-------"
  puts "7      |8      |9"
  puts "   #{brd[7]}   |   #{brd[8]}   |   #{brd[9]}   "
  puts "       |       |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator=", ", last_sep="or")
  if arr.size == 2
    arr.join(" #{last_sep} ")
  elsif arr.size < 2
    arr.join
  else
    arr.join(separator).insert(-2, "#{last_sep} ")
  end
end

def place_piece!(brd, current_player)
  current_player == "Player" ? player_moves!(brd) : computer_moves!(brd)
end

def player_moves!(brd)
  square = ""
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_moves!(brd)
  if detect_opportunity?(brd)
    brd[strategy(brd, COMP_MARKER)] = COMP_MARKER
  elsif detect_threat?(brd)
    brd[strategy(brd, PLAYER_MARKER)] = COMP_MARKER
  elsif empty_squares(brd).include?(5)
    brd[5] = COMP_MARKER
  else
    brd[random(brd)] = COMP_MARKER
  end
end

def detect_threat?(brd)
  !!strategy(brd, PLAYER_MARKER)
end

def detect_opportunity?(brd)
  !!strategy(brd, COMP_MARKER)
end

def strategy(brd, marker)
  # Select combos that have 1 square unmarked, and 2 squares
  # marked by marker.
  potential_wins =
    WINNING_LINES.select do |line|
      (line.difference(empty_squares(brd)).size == 2) &&
        (brd.values_at(*line).count(marker) == 2)
    end

  # Compile choices
  choices = potential_wins.flatten.intersection(empty_squares(brd))

  choices.sample
end

def random(brd)
  empty_squares(brd).sample
end

def alternate_player(current_player)
  current_player == "Player" ? "Computer" : "Player"
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # want to return true boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMP_MARKER) == 3
      return "Computer"
    end

    # Which is preferred? The solution above, or the code below?
    # if line.all? { |num| brd[num] == PLAYER_MARKER }
    #   return "Player"
    # elsif line.all? { |num| brd[num] == COMP_MARKER }
    #   return "Computer"
    # end
  end
  nil
end

def track_scores(winner)
  SCORES[winner] += 1
end

def calculate_result(brd)
  if someone_won?(brd)
    winner = detect_winner(brd)
    track_scores(winner)
    "#{winner} won!"
  else
    "It's a tie!"
  end
end

def continue?
  prompt "Press any key to continue..."
  !!STDIN.getch
end

def someone_won_5_rounds?
  !!detect_grand_winner
end

def detect_grand_winner
  SCORES.key(5)
end

# Main
# Start game
system 'clear'
prompt "Welcome to Tic-Tac-Toe!\n\n"

current_player = who_gets_first_move?

prompt "RULES:\n
    #{current_player} will make the first move.
    First player to win 5 rounds is the grand winner.\n\n"

continue?

# Game loop
round = 0
loop do
  round += 1
  board = initialize_board

  loop do
    display_ui(round, board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  result = calculate_result(board)

  display_ui(round, board)
  prompt result

  break if someone_won_5_rounds?

  continue?
end

# End game
prompt "#{detect_grand_winner} is the grand winner!"
prompt "Thanks for playing Tic-Tac-Toe! Goodbye!"
