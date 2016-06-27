VALID_CHOICES = %w(rock paper scissors spock lizard)
VALID_CHOICES_ABBR = %w(r p sc sp l)
WIN_OPTIONS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'spock' => %w(rock scissors),
  'lizard' => %w(spock paper)
}

def win?(first, second)
  WIN_OPTIONS[first].include?(second)
end

def display_match_winner(scores)
  if scores[:user] == 5
    prompt("You have won the match!")
  else
    prompt("Computer has won the match!")
  end
end

def display_round_result(user, computer)
  if win?(user, computer)
    prompt("You won this round!")
  elsif win?(computer, user)
    prompt("Computer won this round! AI or what ?!")
  else
    prompt("It's a tie in this round.")
  end
end

def count_score(user, computer, scores)
  if win?(user, computer)
    scores[:user] += 1
  elsif win?(computer, user)
    scores[:computer] += 1
  end
  scores
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Welcome in Rock, Paper, Scissor game!")
prompt("You play with computer and whoever reach 5 points wins.")
prompt("There is no score for a tie added.")

loop do
  scores = { user: 0, computer: 0 }
  while scores[:user] < 5 && scores[:computer] < 5
    user_choice = ''
    loop do
      prompt("Choose one of the option by writing abbreviation:")
      VALID_CHOICES.each_with_index do |choice, idx|
        puts("\t '#{VALID_CHOICES_ABBR[idx]}' for #{choice}")
      end
      user_choice = Kernel.gets().chomp()
      if VALID_CHOICES_ABBR.include?(user_choice)
        user_choice = VALID_CHOICES[VALID_CHOICES_ABBR.index(user_choice).to_i]
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample()
    prompt("You chose #{user_choice} and computer chose #{computer_choice}")
    display_round_result(user_choice, computer_choice)
    scores = count_score(user_choice, computer_choice, scores)
    prompt("Computer score is #{scores[:computer]} and your score is #{scores[:user]}")
  end

  display_match_winner(scores)
  prompt("Do you want to play one more time? Choose (Y) for yes.")
  continue_game = Kernel.gets().chomp()
  break unless continue_game.downcase().start_with?('y')
end

prompt("Thank You for playing. Good Bye!")
