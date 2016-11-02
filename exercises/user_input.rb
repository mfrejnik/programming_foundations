
# 1)
# Write a program that asks the user to type something in,
# after which your program should simply display what was entered.

def getter_printer
  print ">> Type anything you want: "
  input = gets.chomp
  puts "You typed: '#{input}'"
end

# getter_printer

# 2)
# Write a program that asks the user for their age in years, and then converts that age to months.

def ask_age
  input_age = 0
  loop do
    print "Please provide your age: "
    input_age = gets.chomp.to_i
    break if input_age > 0
    puts "Please provide positive number only"
  end
  age_in_month = input_age * 12
end

# puts "Your age in months equals: #{ask_age}"

# 3)
# Write a program that asks the user whether they want the program to print "something",
# then print it if the user enters y. Otherwise, print nothing.

puts "Do you want this program to print something? Answer (Y) for yes or (N) for no."

input = nil
loop do
  input = gets.chomp.downcase
  break if %w(y n).include?(input)
  puts "Please provide only (Y) or (N) letters"
end

puts "Something" if input == 'y'

# 4)

# In the previous exercise, you wrote a program that asks the user if they want the program to print "something".
# However, this program recognized any input as valid: if you answered anything but y,
# it treated it as an n response, and quit without printing anything.
# Modify your program so it prints an error message for any inputs that aren't y or n, and then try again.
# In addition, your program should allow both Y and N (uppercase) responses;
# case sensitive input is generally a poor user interface choice.
# Whenever possible, accept both uppercase and lowercase inputs.

# 5)

# Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed.
# The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.
# For now, just use #to_i to convert the input value to an Integer,
# and check that result instead of trying to insist on a valid number;
# validation of numeric input is a topic with a fair number of edge conditions that are beyond the scope of this exercise.

def get_number
  num = nil

  loop do
    print"How many output lines do you want? Enter a number >= 3: "
    num = gets.chomp.to_i
    break if num >= 3
    puts "Please provide the number greater or equal 3 only"
  end

  num
end

def line_printer(line, times)
  times.times do
    puts line
  end
end

# line_printer("Launch School is the best!", get_number)

# 6)
# Write a program that displays a welcome message, but only after the user enters the correct password,
# where the password is a string that is defined as a constant in your program.
# Keep asking for the password until the user enters the correct password.

USER_PASSWORD = "aqq123".freeze


loop do
  print "Please enter password: "
  provided_password = gets.chomp
  break if provided_password == USER_PASSWORD
  puts "Password is incorrect. Please try again."
end

puts "Welcome user!"

# 7)

# In the previous exercise, you wrote a program to solicit a password. In this exercise,
# you should modify the program so it also requires a user name.
# The program should solicit both the user name and the password, then validate both,
# and issue a generic error message if one or both are incorrect;
# the error message should not tell the user which item is incorrect.

USER_NAME = "mfrejnik".freeze
USER_PASSWORD = "aqq123".freeze

loop do
  print "Please enter username: "
  username = gets.chomp

  print "Please enter password: "
  password = gets.chomp

  break if password == USER_PASSWORD && username == USER_NAME
  puts "User name or password is incorrect. Please try again."
end

puts "Welcome user!"

# 8)

# Write a program that obtains two Integers from the user,
# then prints the results of dividing the first by the second.
# The second number must not be 0, and both numbers should be validated using this method:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

# This method returns true if the input string can be converted to an Integer
# and back to a string without loss of information, false otherwise.
# It's not a perfect solution in that some inputs that are otherwise valid (such as 003) will fail,
# but it is sufficient for this exercise.
first_num = nil
second_num = nil

loop do
  print "Provide first number: "
  first_num = gets.chomp
  print "Provide second number: "
  second_num = gets.chomp
  break if valid_number?(first_num) && (valid_number?(second_num) &&  second_num.to_i != 0)
  puts "You provided wrong input. Please provide number only (second number needs to be positive)"
end

result = first_num.to_i / second_num.to_i
puts "The result of dividing two numbers is: #{result}"

# 9)
# In an earlier exercise, you wrote a program that prints 'Launch School is the best!'
# repeatedly until a certain number of lines have been printed.

user_choice = nil
loop do
  puts '>> How many output lines do you want? Enter a number >= 3: (Q to quit)'
  user_choice = gets.chomp

  if user_choice.to_i >= 3
    break
  elsif user_choice.downcase == 'q'
    puts "Good Bye"
    break
  end

  puts ">> That's not enough lines."
end

while user_choice.to_i > 0
  puts 'Launch School is the best!'
  user_choice -= 1
end

# 10)
# Write a program that requests two integers from the user, adds them together, and then displays the result.
# Furthermore, insist that one of the integers be positive, and one negative; however,
# the order in which the two integers are entered does not matter.

# Do not check for positive/negative requirement until after both integers are entered,
# and start over if the requirement is not met.

# You may use the following method to validate input integers:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num_1 = nil
num_2 = nil

puts "Provide two numbers where one of which is negative and the ohter positive."
puts "Order doesn't matter."

loop do
  print "Enter number 1: "
  num_1 = gets.chomp

  print "Enter number 2: "
  num_2 = gets.chomp

  unless valid_number?(num_1) && valid_number?(num_2)
    puts "You didn't provide numbers. Try again!"
    next
  end

  num_1 = num_1.to_i
  num_2 = num_2.to_i

  unless num_1 * num_2 < 0
    puts "One of the number needs to be negative and the other positive. Try again!"
    next
  end

  break
end

result = num_1 + num_2
puts "The result of adding 2 provided numbers (#{num_1} and #{num_2}) is: #{result}"

# Launchschool solution
# def read_number
#   loop do
#     puts '>> Please enter a positive or negative integer:'
#     number = gets.chomp
#     return number.to_i if valid_number?(number)
#     puts '>> Invalid input. Only non-zero integers are allowed.'
#   end
# end

# first_number = nil
# second_number = nil

# loop do
#   first_number = read_number
#   second_number = read_number
#   break if first_number * second_number < 0
#   puts '>> Sorry. One integer must be positive, one must be negative.'
#   puts '>> Please start over.'
# end

# sum = first_number + second_number
# puts "#{first_number} + #{second_number} = #{sum}"


