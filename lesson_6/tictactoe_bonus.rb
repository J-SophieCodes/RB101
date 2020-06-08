INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMP_MARKER = "O"

FIRST_MOVE = { "Player" => false,
               "Computer" => false,
               "Choose" => true }

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def valid_integer?(str)
  str.to_i.to_s == str && str.to_i > 0
end

def how_many_wins?
  wins = ""
  loop do
    prompt "Please set the number of wins for championship: "
    wins = gets.chomp

    break if valid_integer?(wins)
    prompt "Sorry, that's not a valid input."
  end

  wins.to_i
end

def who_gets_first_move?
  if FIRST_MOVE.key(true) == "Choose"
    loop do
      prompt "Do you want to go first? (y or n)"
      ans = gets.downcase
      if ans.start_with?("y")
        return "Player"
      elsif ans.start_with?("n")
        return "Computer"
      end
      prompt "Invalid input"
    end
  else
    FIRST_MOVE.key(true)
  end
end

def display_ui(round, scores, brd)
  system 'clear'
  puts "<< TIC-TAC-TOE >>"
  puts ""
  score_board(round, scores)
  puts ""
  display_board(brd)
  puts ""
end

def align_elements(arr, width, separator)
  arr.map { |ele| ele.to_s.center(width) }.join(separator)
end

def score_board(round, scores)
  padstr = 10
  total_width = padstr * 2 + 1
  divider = "*" * total_width
  puts divider
  puts "ROUND #{round}".center(total_width)
  puts divider
  puts align_elements(scores.keys, padstr, " ")
  puts align_elements(scores.values, padstr, ":")
  puts divider
end

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
    square = gets.chomp
    if valid_integer?(square)
      break if empty_squares(brd).include?(square.to_i)
    end
    prompt "Sorry, that's not a valid choice."
  end

  brd[square.to_i] = PLAYER_MARKER
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
  potential_wins =
    WINNING_LINES.select do |line|
      ((line & empty_squares(brd)).size == 1) &&
        (brd.values_at(*line).count(marker) == 2)
    end

  choices = potential_wins.flatten & empty_squares(brd)

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
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return "Player" if three_in_a_row?(brd, line, PLAYER_MARKER)
    return "Computer" if three_in_a_row?(brd, line, COMP_MARKER)
  end
  nil
end

def three_in_a_row?(brd, line, marker)
  brd.values_at(*line).count(marker) == 3
end

def update_scores(scores, winner)
  scores[winner] += 1
end

def continue?
  prompt "Press enter to continue..."
  gets
end

def match_ended?(scores, championship)
  !!detect_champion(scores, championship)
end

def detect_champion(scores, championship)
  scores.key(championship)
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  gets.chomp.downcase.start_with?("y")
end

loop do
  system 'clear'
  prompt "Welcome to Tic-Tac-Toe!\n\n"

  championship = how_many_wins?
  current_player = who_gets_first_move?

  msg = "RULES:\n
        #{current_player} will make the first move.
        First player to win #{championship} round" +
        (championship > 1 ? "s" : "") + " is the champion.\n\n"
  prompt msg

  continue?

  scores = {  "Player" => 0,
              "Computer" => 0 }

  round = 0
  loop do
    round += 1
    board = initialize_board

    loop do
      display_ui(round, scores, board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      winner = detect_winner(board)
      update_scores(scores, winner)
      result = "#{winner} won!"
    else
      result = "It's a tie!"
    end

    display_ui(round, scores, board)
    prompt result

    break if match_ended?(scores, championship)

    continue?
  end

  prompt "#{detect_champion(scores, championship)} is the champion!"
  break unless play_again?
end

prompt "Thanks for playing Tic-Tac-Toe! Goodbye!"
