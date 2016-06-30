require('pry')
#
# Question 1
# In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if there is an age present for "Spot".
p ages.key?("Spot")
p ages.include?("Spot")
p ages.member?("Herman")

#
# Question 2
# Add up all of the ages from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_sum = 0
ages.each {|k, v| ages_sum += v }
p ages_sum

p ages.values.inject(:+)

# This uses ages.values to make an array, then uses the inject method
# which is part of the Enumerable module which is included in Array
#
# The strange-looking parameter to inject is simply a variety of the inject method
# which says "apply the + operator to the accumulator and object parameters of inject".

#
# Question 3
# In the ages hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).

ages.keep_if { |_, age| age < 100 }
p ages

#
# Question 4
# Starting with this string:
# Convert the string in the following ways
# (code will be executed on original munsters_description above):

"The munsters are creepy in a good way."
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.capitalize!

"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase!

"the munsters are creepy in a good way."
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.downcase!

"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.upcase!

#
# Question 5
# We have most of the Munster family in our age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

#
# Question 6
# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

#
# Question 7
# See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("dino")
p advice.match("dino")

#
# Question 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"
p flintstones.index { |name| name[0, 2] == "Be" }

#
# Question 9 & 10
# Using array#map!, shorten each of these names to just 3 characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name|  name[0, 3] }
p flintstones
