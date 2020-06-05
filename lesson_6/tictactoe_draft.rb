# DESCRIPTION
=begin
Tic Tac Toe is a 2 player game played on a 3x3 board. Each 
player takes a turn and marks a square on the board. First 
player to reach 3 squares in a row, including diagonals, wins. 
If all 9 squares are marked and no player has 3 squares in a 
row, then the game is a tie.
=end

# HIGH-LEVEL PSEUDO-CODE
=begin
1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!
=end

# 1. Set up and display the board
def display_board(brd)
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

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num]=" "}
  new_board
end

# 9. Play again!
loop do
  available_choices= [1,2,3,4,5,6,7,8,9]
  board = initialize_board
  display_board(board)

  # 7. If no winner and not tied, keep looping
  loop do
    puts "Your turn. Please pick a square: "

    # 2. Player's turn
    player_choice = nil
    loop do
      player_choice = gets.chomp.to_i
      break if available_choices.include?(player_choice)
      puts "Invalid choice. Please pick an available square: "
    end
    board[player_choice] = 'X'
    available_choices.delete(player_choice)

    # 4-5. Check winner + display board
    display_board(board)
    # Check winner method

    break if available_choices.size == 0

    # 3. Computer's turn
    puts "Computer's turn:"
    computer_choice = available_choices.sample
    board[computer_choice] = 'O'
    available_choices.delete(computer_choice)

    # 4-5. Check winner + display board
    display_board(board)
    # Check winner method

    # 6. Check tie + display board
    break if available_choices.size == 0
  end

  # 8. Play again?
  puts "Play again? "
  break unless gets.chomp.downcase.start_with?("y")
end

# 10. Bye!
puts "Thanks for playing! Good bye!"