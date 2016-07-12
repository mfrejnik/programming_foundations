#
# Question 1
# Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

#
# Question 2
# How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino")
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones

#
# Question 3
# How can we add multiple items to our array? (Dino and Hoppy)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy") # push returns the array so we can chain
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy)) # concat adds an array rather than one item
p flintstones

#
# Question 4
# Shorten this sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
# ...remove everything starting from "house".
advice.slice!("house training your pet dinosaur.")
p advice
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!("Few things in life are as important as ")
p advice
advice = "Few things in life are as important as house training your pet dinosaur."
puts "==========="
# make the return value "Few things in life are as important as ".
# But leave the advice variable as "house training your pet dinosaur.".
p advice.slice!(0, advice.index('house'))
p advice
advice = "Few things in life are as important as house training your pet dinosaur."
puts "==========="
# ...remove everything starting from "house".
p advice.slice!(advice.index('house'), advice.length-1)
p advice

#
# Question 5
# Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
p statement.scan('t').count

#
# Question 6
# Back in the stone age (before CSS) we used spaces to align things on the screen.
# If we had a 40 character wide table of Flintstone family members,
# how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"
p title.center(40)




