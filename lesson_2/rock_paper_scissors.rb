VALID_CHOICES = %w[rock paper scissors]
def display_results(user, computer)
  if (user == 'rock' && computer == 'scissors') ||
    (user == 'scissors' && computer == 'paper') ||
    (user == 'paper' && computer == 'rock')
    prompt("You won!")
  elsif (computer == 'rock' && user == 'scissors') ||
    (computer == 'scissors' && user == 'paper') ||
    (computer == 'paper' && user == 'rock')
    prompt("Computer won! AI or what ?!")
  else
    prompt("It's a tie")
  end
end

def test_method
  prompt('test message')
end

test_method

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Welcom in Rock, Paper, Scissor game!")

loop do
  user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()
  display_results(user_choice, computer_choice)

  prompt("Do you want to play one more time? Choose (Y) for yes.")
  continue_game = Kernel.gets().chomp()
  break unless continue_game.downcase().start_with?('y')
end

prompt("Thank You for playing. Good Bye!")
