# ask the user fo two numbers
# ask the user for operation to perform
# perform the operation on two numbers
# output the results

def valid_number?(number)
  number.to_i() != 0
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def operation_to_message(operator)
  case operator
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end


prompt("Welcome to calculator! Enter your name:")

name = ''

loop do
  name = Kernel.gets.chomp()
  if name.empty?()
    prompt("Make sure to use valid name.")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do #main loop


  number1 = ''

  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt "Something is wrong with the number1"
    end

  end

  number2 = ''

  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt "Something is wrong with the number2"
    end

  end

  question = <<-MSG
  What is the operation you want to perform?
      1) Add
      2) Subtract
      3) Multiply
      4) Divide
    Choose from 1 to 4...
  MSG
  prompt(question)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Enter the valid number choice from 1 to 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers ...")
  sleep(1)

  result =  case operator
            when '1'
             number1.to_i() + number2.to_i()
            when '2'
             number1.to_i() - number2.to_i()
            when '3'
             result = number1.to_i() * number2.to_i()
            when '4'
             result = number1.to_f() / number2.to_f()
  end

  prompt("The result is #{result}.")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end

prompt("Thank you for using the calculator. Good bye!")
