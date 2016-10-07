# Ruyb Basics Exercises Methods

# Write two methods, one that returns the string "Hello" and one that returns the string "World".
# Then print both strings using #puts, combining them into one sentence.

def divider
  puts ""
  puts "*******************************************"
  puts ""
end

def say_hello
  "Hello"
end

def say_world
  "World"
end

puts "#{say_hello} #{say_world}"

# Write a method named greet that invokes the ubove methods:
# When greet is invoked with #puts, it should output the following:
# Hello World

def greet
  "#{say_hello} #{say_world}"
end

puts greet

# Using the following code, write a method called car that takes two arguments
# and prints a string containing the values of both arguments.

# car('Toyota', 'Corolla')

# Expected output:
# Toyota Corolla

def car(make, model)
  puts "#{make} #{model}"
end

car 'Toyota', 'Corolla'

# The variable below will be randomly assigned as true or false.
# Write a method named time_of_day that, given a boolean as an argument,
# prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false.
# Pass daylight into the method as the argument to determine whether it's day or night.

def time_of_day daylight
  puts daylight ? "It's daytime!" : "It's nighttime!"
end

daylight = [true, false].sample
time_of_day daylight

# Fix the following code so that the names are printed as expected.

# Expected output
# The dog's name is Spot.
# The cat's name is Ginger.

def dog name
  return name
end

def cat(name = 'Ginger')
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat}."

# Write a method that accepts one argument, but doesn't require it.
# The parameter should default to the string "Bob" if no argument is given.
# The method's return value should be the value of the argument.
# The code should output true twice.

def assign_name(name = 'Bob')
  name
end

puts assign_name == 'Bob'
puts assign_name('Kevin') == 'Kevin'

# Write the following methods so that each output is true.
divider

def add(num1, num2)
  num1 + num2
end

def multiply(num1, num2)
  num1 * num2
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

# The variables below are both assigned to arrays. The first one, names, contains a list of names.
# The second one, activities, contains a list of activities.
# Write the methods name and activity so that they each take the appropriate array and return a random value from it.
# Then write the method sentence that combines both values into a sentence and returns it from the method.
# Example output:
# George went walking today!
divider

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

def sentence(name, activity)
  "#{name} went #{activity} today!"
end

puts sentence(name(names), activity(activities))

# Write a method named print_me that prints "I'm printing within the method!" when invoked.
divider

def print_me
  puts "I'm printing within the method!"
end

print_me

# Write a method named print_me that returns "I'm printing the return value!" when using the following code.
divider

def print_me
  "I'm printing the return value!"
end

puts print_me

