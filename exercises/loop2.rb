def divider
  puts ""
  puts "*******************************************"
  puts ""
end

# 1)
# Write a loop that prints numbers 1-5 and whether the number is even or odd. Use the code below to get started.

count = 1

loop do
  puts "#{count} is odd!" unless count.even?
  puts "#{count} is even!" if count.even?
  break if count >= 5
  count += 1
end

# Expected output:

# 1 is odd!
# 2 is even!
# 3 is odd!
# 4 is even!
# 5 is odd!

divider

# 2)
# Modify the following code so that the loop stops if number is between 0 and 10.
loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end

divider
# 3)
# Using an if/else statement, run a loop that prints "The loop was processed!" one time if process_the_loop equals true.
# Print "The loop wasn't processed!" if process_the_loop equals false.

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end

divider

# 4)
# The code below asks the user "What does 2 + 2 equal?" and uses #gets to retrieve the user's answer.
# Modify the code so "That's correct!" is printed and the loop stops when the user's answer equals 4.
# Print "Wrong answer. Try again!" if the user's answer doesn't equal 4.

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i

#   if answer == 4
#     puts "That's correct!"
#     break
#   end

#   puts "Worng answer. Try again!"
# end

divider

# 5)
# Modify the code below so that the user's input gets added to the numbers array.
# Stop the loop when the array contains 5 numbers.

numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
#   break if numbers.length == 5
# end
# p numbers

divider

# 6)
# Given the array below, use loop to remove and print each name.
# Stop the loop once names doesn't contain any more elements.
# Keep in mind to only use loop, not while, until, etc.

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end

p names

divider

# 7)
# The method below counts from 0 to 4.
# Modify the block so that it prints the current number and stops iterating when the current number equals 2.

5.times do |index|
  puts index
  break if index < 7
end

divider

# 8)
# Using next, modify the code below so that it only prints even numbers.

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

divider

# 9)
# The following code increments number_a and number_b by either 0 or 1.
# loop is used so that the variables can be incremented more than once,
# however, break stops the loop after the first iteration.
# Use next to modify the code so that the loop iterates until either number_a or number_b equals 5.
# Print "5 was reached!" before breaking out of the loop.

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  puts "a #{number_a} and b #{number_b}"
  next unless number_a == 5 || number_b == 5
  puts "5 was reached!"

  break
end

divider
# 10)
# Given the code below, use a while loop to print "Hello!" twice.

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end

