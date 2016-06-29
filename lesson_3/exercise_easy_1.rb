#
# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
p numbers
puts numbers.inspect

#
# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
# what is != and where should you use it?
# put ! before something, like !user_name
# put ! after something, like words.uniq!
# put ? before something
# put ? after something
# put !! before something, like !!user_name

p true != false # not equal operator
p 2+2 == 2+2 ? "equals 4" : "not equal 4" # returns 'equals 4' as it is ternary if else operator
p !!"some string" # changes string into the boolean represantation
p !false # changes into opposite boolean represantation

#
# Question 3
# Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent') # mutate the caller (global substitute = replace all instances)
p advice

#
# Question 4
# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:
numbers = [1, 2, 3, 4, 5]

# What does the follow method calls do (assume we reset numbers to the original array between method calls)?
numbers.delete_at(1)
p numbers # delete at index position
numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # delete the exact value occurance
p numbers

#
# Question 5
# Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.
p (10..100).cover?(42) # returns true if object is between beginning en end of a range

#
# Question 6
# Starting with the string:
famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.
famous_words = "Four score and " + famous_words
p famous_words

famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")
p famous_words

famous_words = "seven years ago..."
famous_words = "Four score and " << famous_words
p famous_words

famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
p famous_words

#
# Question 7
# Fun with gsub:
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

#This gives us a string that looks like a "recursive" method call:
"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
# If we take advantage of Ruby's Kernel#eval method to have it execute this string
# as if it were a "recursive" method call
p eval(how_deep) # Evaluates the Ruby expression(s) in string
# 42

#
# Question 9
# If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:
p flintstones

flintstones.flatten!
p flintstones

#
# Question 10
# Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.
temp_hash = {}
flintstones.each_with_index do |name, idx|
  temp_hash[name] = idx
end
flintstones = temp_hash
p flintstones

