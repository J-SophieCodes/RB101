require 'pry'

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMP_MARKER = "O"

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMP_MARKER}."
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

def player_moves!(brd)
  square = ""
  loop do
    prompt "Choose a square #{empty_squares(brd).join(', ')}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_moves!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMP_MARKER
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

    # if line.all? { |num| brd[num] == PLAYER_MARKER }
    #   return "Player"
    # elsif line.all? { |num| brd[num] == COMP_MARKER }
    #   return "Computer"
    # end
  end

  nil
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  gets.chomp.downcase.start_with?("y")
end

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_moves!(board)
    break if someone_won?(board) || board_full?(board)

    computer_moves!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
