require 'io/console'
VALID_CHOICES = %w(rock paper scissors spock lizard).freeze
VALID_CHOICES_ABBR = %w(r p sc sp l).freeze
WIN_OPTIONS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'spock' => %w(rock scissors),
  'lizard' => %w(spock paper)
}
HORIZONTAL_RULE = "=======================================".freeze

def display_welcome_message
  puts(HORIZONTAL_RULE)
  prompt("Welcome in '#{VALID_CHOICES.map(&:capitalize).join(', ')}' game!")
  prompt("You play with computer and whoever reach 5 points, wins.")
  prompt("There is no score for a tie added.")
  puts(HORIZONTAL_RULE)
  puts
end

def win?(first, second)
  WIN_OPTIONS[first].include?(second)
end

def display_match_winner(scores)
  if scores[:user] == 5
    prompt("You have won the match!")
    prompt("#{scores[:user]} to #{scores[:computer]}!")
  else
    prompt("Computer has won the match!")
    prompt("#{scores[:computer]} to #{scores[:user]}!")
  end
end

def display_user_instruction
  prompt("Choose one of the option by writing abbreviation:")
  VALID_CHOICES.each_with_index do |choice, idx|
    puts("\t '#{VALID_CHOICES_ABBR[idx]}' for #{choice}")
  end
end

def display_round_results(user, computer)
  puts(HORIZONTAL_RULE)
  if win?(user, computer)
    prompt("You won this round!")
  elsif win?(computer, user)
    prompt("Computer won this round! AI or what ?!")
  else
    prompt("It's a tie in this round.")
  end
  puts
  puts(HORIZONTAL_RULE)
end

def count_score(user, computer, scores)
  if win?(user, computer)
    scores[:user] += 1
  elsif win?(computer, user)
    scores[:computer] += 1
  end
  scores
end

def user_choice
  user_choice = loop do
    user_choice = Kernel.gets().chomp().downcase()
    if VALID_CHOICES_ABBR.include?(user_choice)
      user_choice = VALID_CHOICES[VALID_CHOICES_ABBR.index(user_choice).to_i]
      break user_choice
    else
      prompt("That's not a valid choice.")
    end
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clean_screen
  system('clear') || system('cls')
end

def another_game?
  loop do
    answer = Kernel.gets().chomp().downcase()
    if %w(y yes).include?(answer)
      clean_screen
      break true
    end
    break false if %w(n no).include?(answer)
    prompt("Please enter 'y or 'n'.")
  end
end

clean_screen()
display_welcome_message()

loop do
  scores = { user: 0, computer: 0 }
  while scores[:user] < 5 && scores[:computer] < 5
    display_user_instruction()
    user_choice = user_choice()

    computer_choice = VALID_CHOICES.sample()
    puts
    prompt("You chose #{user_choice} and computer chose #{computer_choice}")
    puts
    display_round_results(user_choice, computer_choice)
    scores = count_score(user_choice, computer_choice, scores)
    prompt("Computer score is: #{scores[:computer]}")
    prompt("Your score is:     #{scores[:user]}")
    puts
    prompt("Press any key to continue")
    STDIN.getch
    clean_screen
  end

  display_match_winner(scores)
  prompt("Do you want to play one more time? (y/n).")
  break unless another_game?
end

prompt("Thank You for playing. Good Bye!")
