# What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

# What will the following code print? Why? Don't run it until you've attempted to answer.
puts "*******************************"
def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

# What will the following code print? Why? Don't run it until you've attempted to answer.
puts "*******************************"
def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

# What will the following code print? Why? Don't run it until you've attempted to answer.
puts "*******************************"
def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number


