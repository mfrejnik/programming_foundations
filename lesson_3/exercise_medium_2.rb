require('pry')
#
# Question 1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
# Figure out the total age of just the male members of the family.

males_total_age = 0
munsters.each do |name, details|
  males_total_age += details["age"] if details["gender"] == "male"
end
p males_total_age

#
# Question 2
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Given this family hash, print out the name, age and gender of each family member:
# like this:
# (Name) is a (age) year old (male or female).

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

puts "====================="
#
# Question 3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#How can we refactor this exercise to make the result easier to predict
# and easier for the next programmer to maintain?

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
p not_so_tricky_method(my_string, my_array)
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#
# Question 4
# A quick glance at the docs for the Ruby String class will have you scratching your head over the absence of any "word iterator" methods.
#
# Our natural inclination is to think of the words in a sentence as a collection. We would like to be able to operate on those words the same way we operate on the elements of an array. Where are the String#each_word and the String#map_words methods?
#
# A common idiom used to solve this conundrum is to use the String#split in conjunction with Array#join methods to break our string up and then put it back together again.
#
# Use this technique to break up the following string and put it back together with the words in reverse order:
sentence = "Humpty Dumpty sat on a wall."
sentence.slice!(".")
reverse_sentence = sentence.split.reverse.join(" ")+"."
puts reverse_sentence

#
# Question 5
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)
p new_answer
p answer - 8

#
# Question 6
# One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
p munsters
def mess_with_demographics_on_copy(demo_hash)
  result = {}
  demo_hash.each do |key, value|
    # mutating just 'result' hash
    result[key.to_sym] = value
    result[key.to_sym]["age"] += 42
    result[key.to_sym]["gender"] = "other"
  end
  result
end
# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
p mess_with_demographics_on_copy(munsters)
# Did the family's data get ransacked, or did the mischief only mangle a local copy of the original hash? (why?)

p munsters


# Spot will find himself in the "dog" house for this one. The family's data is all in shambles now.

# Why? Remember that in Ruby, what gets passed in the parameter list is not what it appears. Under the hood, ruby passes the object id of each item rather than the value of the parameter. The method internally stores these object id's in locally scoped (private to the method) variables (named per the method definition's parameter list).

# So Spot's demo_hash starts off pointing to the munsters hash. His program could wind up replacing that with some other object id and then the family's data would be safe.

# In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.

#
# Question 7
# Method calls can take expressions as arguments. Suppose we define a function called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
# What is the result of the following call?
puts rps( rps( rps("rock", "paper"), rps("rock", "scissors") ), "rock" )

#
# Question 8
# Consider these two simple methods:
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
# What would be the output of this code:
p bar(foo)
# careful => foo is a method passed as an argument
# output would be nothing but return of the method bar will be "no"

