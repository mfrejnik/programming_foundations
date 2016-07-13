#
# Question 1
# Let's do some "ASCII Art"
# (a stone-age form of nerd artwork from back in the days before computers had video screens).
# For this exercise, write a one-line program that creates the following output 10 times,
# with the subsequent line indented 1 space to the right:
10.times { |n| puts (" " * n) + "The Flintstones Rock!" }

#
# Question 2
# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
p result

#
# Question 3
# The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?
puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

#
# Question 4
# What happens when we modify an array while we are iterating over it?
# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end
# We don't modify collection which we iterate through
# iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array.
# They operate on the original array in real time.

#
# Question 5
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

#
# Question 7
limit = 150

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 10, limit)
puts "result is #{result}"

#
# Question 8
some_title = "creates a string that has each word capitalized"
def titleize(title)
  title.split(" ").map!{ |word| word.capitalize }.join(" ")
end
p titleize(some_title)
#
# Question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.each do |name, details|
  case details["age"]
  when 0..17
    details["age_group"] = "kid"
  when 18..64
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
p munsters
