require 'pry'
require 'io/console'
HIT = "Hit".freeze
STAY = "Stay".freeze
TOTAL_PLAYER = 21
TOTAL_DEALER = 17
SUITS = { "S" => "Spades",
          "H" => "Hearts",
          "D" => "Diamonds",
          "C" => "Clubs" }.freeze
RANKS = %w(A 2 3 4 5 6 7 8 9 10 J Q K).freeze
PLAYER_NAME = "Player".freeze
DEALER_NAME = "Dealer".freeze
def prompt(msg)
  puts "=> #{msg}"
end

def clean_screen
  system('clear') || system('cls')
end

def total(cards)
  sum = 0

  cards.each do |_suit, rank|
    sum +=
      case rank
      when "A" then 11
      when "J", "Q", "K" then 10
      else rank.to_i
      end
  end

  ace_adjustment(cards, sum)
end

def ace_adjustment(cards, total_points)
  cards.select { |_suit, rank| rank == "A" }.count.times do
    total_points -= 10 if total_points > TOTAL_PLAYER
  end
  total_points
end

def initialize_deck
  stack = []
  SUITS.each_key do |suit|
    RANKS.each { |rank| stack << [suit, rank] }
  end
  stack.shuffle
end

def deal_cards(deck, current_player_cards)
  2.times do
    current_player_cards << deck.delete(deck.last)
  end
end

def hit(deck, current_player_cards)
  current_player_cards << deck.delete(deck.last)
end

def busted?(cards)
  total(cards) > TOTAL_PLAYER
end

def display_cards(cards, player_name)
  prompt "#{player_name} has corresponding cards:"
  cards.each do |card|
    prompt "\t - #{SUITS[card[0]]} of value #{card[1]}"
  end
  prompt "Total value of #{player_name} cards is: #{total(cards)}"
  prompt "================================="
  prompt ""
end

def detect_winner(user_cards, dealer_cards)
  total_user_cards = total(user_cards)
  total_dealer_cards = total(dealer_cards)
  if busted?(dealer_cards)
    return PLAYER_NAME
  elsif busted?(user_cards)
    return DEALER_NAME
  elsif total_dealer_cards < total_user_cards
    return PLAYER_NAME
  elsif total_dealer_cards > total_user_cards
    return DEALER_NAME
  end
  nil
end

def alternate_player(current_player)
  if current_player == PLAYER_NAME
    DEALER_NAME
  else
    PLAYER_NAME
  end
end

def display_winner(winner)
  puts ""
  puts "*********************************"
  if winner
    puts "!!! The winner of this round is: #{winner} !!!"
  else
    puts "!!! It's a tie in this round !!!"
  end
  puts "*********************************"
  puts ""
end

def display_match_winner(scores)
  if scores[:player] == 5
    prompt("You have won the match!")
    prompt("#{scores[:player]} to #{scores[:dealer]}!")
  else
    prompt("Dealer has won the match!")
    prompt("#{scores[:dealer]} to #{scores[:player]}!")
  end
end

def another_game?
  loop do
    answer = gets.chomp.downcase
    if %w(y yes).include?(answer)
      clean_screen
      return true
    end
    return false if %w(n no).include?(answer)
    prompt("Please enter 'y or 'n'.")
  end
end

def count_score(winner, scores)
  if winner == DEALER_NAME
    scores[:dealer] += 1
  else
    scores[:player] += 1
  end
end

def display_round_score(scores)
  prompt("Dealer score is: #{scores[:dealer]}")
  prompt("Your score is:   #{scores[:player]}")
  puts
  prompt("Press any key to continue")
  STDIN.getch
end

def display_welcome_message
  puts "You're a #{PLAYER_NAME}. You play against #{DEALER_NAME}"
  puts "The dealer is a computer and whoever reach 5 points, wins."
  puts "There is no score for a tie added."
end

loop do
  scores = { player: 0, dealer: 0 }
  loop do
    clean_screen
    display_welcome_message
    deck = initialize_deck
    user_cards = []
    dealer_cards = []
    deal_cards(deck, user_cards)
    deal_cards(deck, dealer_cards)

    prompt ""
    prompt "One of the dealer card is:"
    prompt "\t - #{SUITS[dealer_cards[0][0]]} of value #{dealer_cards[0][1]}"
    prompt ""

    # player turn
    answer = nil
    loop do
      display_cards(user_cards, PLAYER_NAME)
      loop do
        prompt "Are you #{HIT} or #{STAY}? Choose (h) or (s) letter."
        answer = gets.chomp.downcase
        break if ['h', 's'].include?(answer)
        prompt "You must choose only either letter 'h' or 's'."
      end
      hit(deck, user_cards) unless answer == 's'
      break if answer == 's' || busted?(user_cards)
    end

    unless busted?(user_cards)
      # dealer turn
      until total(dealer_cards) >= TOTAL_DEALER
        hit(deck, dealer_cards)
      end
    end

    clean_screen
    display_cards(user_cards, PLAYER_NAME)
    display_cards(dealer_cards, DEALER_NAME)
    if busted?(user_cards)
      prompt "!!! #{PLAYER_NAME} is busted !!!"
    elsif busted?(dealer_cards)
      prompt "!!! #{DEALER_NAME} is busted !!!"
    end
    winner = detect_winner(user_cards, dealer_cards)
    display_winner(winner)
    count_score(winner, scores) if winner
    display_round_score(scores)
    break if scores[:player] == 5 || scores[:dealer] == 5
  end
  display_match_winner(scores)
  prompt "Do you want to play again? (y/yes or n/no)"
  break unless another_game?
end
prompt "Thank You for playing #{TOTAL_PLAYER}!"
