require 'pry'
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def clean_screen
  system('clear') || system('cls')
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clean_screen
  puts "You're a #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def init_board
  new_board = {}
  (1..9).each { |n| new_board[n] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def user_place_mark!(board)
  user_choice = ''
  loop do
    prompt "Please make a choice from #{empty_squares(board).join(', ')}"
    user_choice = gets.chomp.to_i
    break if empty_squares(board).include? user_choice
    prompt "That's not a valid choice"
  end
  board[user_choice] = PLAYER_MARKER
end

def computer_place_mark!(board)
  computer_choice = empty_squares(board).sample
  board[computer_choice] = COMPUTER_MARKER
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def board_is_full?(board)
  empty_squares(board).empty?
end

loop do
  board = init_board

  loop do
    display_board(board)
    user_place_mark!(board)
    break if someone_won?(board) || board_is_full?(board)

    computer_place_mark!(board)
    break if someone_won?(board) || board_is_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} has won!"
  else
    prompt "It's a tie"
  end

  prompt "Do you want to play again? (y for yes)"
  another_game = gets.chomp
  break unless another_game.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye."
