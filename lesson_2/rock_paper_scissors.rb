VALID_CHOICES = %w(rock paper scissors spock lizard)

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end

def display_results(user, computer)
  if win?(user, computer)
    prompt("You won!")
  elsif win?(computer, user)
    prompt("Computer won! AI or what ?!")
  else
    prompt("It's a tie")
  end
end

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
  prompt("You chose #{user_choice} and computer chose #{computer_choice}")
  display_results(user_choice, computer_choice)

  prompt("Do you want to play one more time? Choose (Y) for yes.")
  continue_game = Kernel.gets().chomp()
  break unless continue_game.downcase().start_with?('y')
end

prompt("Thank You for playing. Good Bye!")
