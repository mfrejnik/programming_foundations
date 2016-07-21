require 'pry'
require 'io/console'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
PLAYER_NAME = 'Player'.freeze
COMPUTER_NAME = 'Computer'.freeze
INITIAL_PLAYER = "choose".freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def clean_screen
  system('clear') || system('cls')
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  clean_screen
  puts "You're a #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}"
  puts "You play with computer and whoever reach 5 points, wins."
  puts "There is no score for a tie added."
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
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def init_board
  new_board = {}
  (1..9).each { |n| new_board[n] = INITIAL_MARKER }
  new_board
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def place_piece!(board, current_player)
  if current_player == COMPUTER_NAME
    computer_place_piece!(board)
  else
    player_place_piece!(board)
  end
end

def computer_place_piece!(board)
  square = nil

  # offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, COMPUTER_MARKER)
    break if square
  end

  # defense
  unless square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, PLAYER_MARKER)
      break if square
    end
  end

  square = empty_squares(board).sample unless square

  board[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    return board.select do |k, v|
      line.include?(k) && v == INITIAL_MARKER
    end.keys.first
  end
  nil
end

def player_place_piece!(board)
  choice = ''
  loop do
    prompt "Please make a choice from #{joinor(empty_squares(board))}"
    choice = gets.chomp.to_i
    break if empty_squares(board).include? choice
    prompt "That's not a valid choice"
  end
  board[choice] = PLAYER_MARKER
end

def choose_player(initial_player)
  players = { 1 => "Computer", 2 => "Player" }
  if initial_player == "choose"
    player_choice = ''
    loop do
      prompt "Please choice wcho starts a round:"
      prompt "\t 1 - for Computer"
      prompt "\t 2 - for You"
      player_choice = gets.chomp.to_i
      break if [1, 2].include?(player_choice)
      prompt "Choose only 1 or 2!"
    end
    players[player_choice]
  else
    PLAYER_NAME
  end
end

def alternate_player(current_player)
  if current_player == PLAYER_NAME
    COMPUTER_NAME
  else
    PLAYER_NAME
  end
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return PLAYER_NAME
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return COMPUTER_NAME
    end
  end
  nil
end

def board_is_full?(board)
  empty_squares(board).empty?
end

def count_score(winner, scores)
  if winner == COMPUTER_NAME
    scores[:computer] += 1
  else
    scores[:player] += 1
  end
end

def display_match_winner(scores)
  if scores[:player] == 5
    prompt("You have won the match!")
    prompt("#{scores[:player]} to #{scores[:computer]}!")
  else
    prompt("Computer has won the match!")
    prompt("#{scores[:computer]} to #{scores[:player]}!")
  end
end

def display_round_score(scores)
  prompt("Computer score is: #{scores[:computer]}")
  prompt("Your score is:     #{scores[:player]}")
  puts
  prompt("Press any key to continue")
  STDIN.getch
end

def another_game?
  loop do
    answer = gets.chomp.downcase
    if %w(y yes).include?(answer)
      clean_screen
      break true
    end
    break false if %w(n no).include?(answer)
    prompt("Please enter 'y or 'n'.")
  end
end


loop do
  scores = { player: 0, computer: 0 }
  loop do
    board = init_board
    current_player = choose_player(INITIAL_PLAYER)

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_is_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} has won this round!"
      count_score(winner, scores)
    else
      prompt "It's a tie"
    end
    display_round_score(scores)
    break if scores[:player] == 5 || scores[:computer] == 5
  end

  display_match_winner(scores)
  prompt "Do you want to play again? (y/yes or n/no)"
  break unless another_game?
end

prompt "Thanks for playing Tic Tac Toe! Good bye."
