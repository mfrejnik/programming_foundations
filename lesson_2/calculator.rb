# ask the user fo two numbers
# ask the user for operation to perform
# perform the operation on two numbers
# output the results

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def float?(input)
  Float(input) rescue false
end

def integer?(input)
  integer(input) rescue false
end

def valid_number?(number)
  float?(number) || integer?(number)
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

prompt(MESSAGES['welcome'])

name = ''

loop do
  name = Kernel.gets.chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("#{MESSAGES['hello']} #{name}!")

loop do # main loop
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

  prompt(MESSAGES[:question])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_operator'])
    end
  end

  prompt("#{operation_to_message(operator)} #{MESSAGES['two_numbers']}")
  sleep(1)

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  prompt("#{MESSAGES['the_result']} #{result}.")
  prompt(MESSAGES['another_operation'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thank_you'])
