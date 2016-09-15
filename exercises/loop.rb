outer_iterator = 0
loop do
  outer_iterator += 1
  puts 'This is the outer loop.'
  iterator = 0

  loop do
    iterator += 1
    puts 'This is the inner loop.'
    break if iterator >= 1
  end

  break if outer_iterator >= 1
end

puts 'This is outside all loops.'

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer.downcase == 'y'
  puts "Choose only 'y' to break loop"
end

hello_iterator = 0
say_hello = true

while say_hello
  puts 'Hello!'
  hello_iterator += 1
  say_hello = false if hello_iterator == 5
end

numbers = []
while numbers.length < 5
  numbers << rand(100)
  puts numbers[numbers.length - 1]
end

count = 1

until count > 10
  puts count
  count += 1
end

puts "Given the array of several numbers below, use an until loop to print each number."
puts ""
new_numbers = [7, 9, 13, 25, 18]
puts new_numbers.inspect
puts ""
num_length = new_numbers.length
iterator = 0

until num_length == iterator
  puts new_numbers[iterator]
  iterator += 1
end

puts ""
puts "shift solution"
puts ""
numbers = [7, 9, 13, 25, 18]

until numbers.empty?
  puts numbers.shift
end

p numbers

puts ""
puts "The code below shows an example of a for loop. Modify the code so that it only outputs i if i is an odd number."

for i in 1..100
  puts i if i.odd?
end

puts ""
puts "Your friends just showed up! Given the following array of names, use a for loop to greet each friend individually."
friends = ['Sarah', 'John', 'Hannah', 'Dave']
for friend in friends
  puts "Greeting, #{friend}"
end
