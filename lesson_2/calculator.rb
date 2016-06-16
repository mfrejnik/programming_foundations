# ask the user fo two numbers
# ask the user for operation to perform
# perform the operation on two numbers
# output the results

LANGUAGE = 'es'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(key, lang='en')
  MESSAGES[lang][key]
end

def float?(input)
  Float(input) rescue false
end

def integer?(input)
  integer(input) rescue false
end

def valid_number?(number)
  float?(number) || integer?(number)
end

def prompt(key)
  if messages(key, LANGUAGE)
    message = messages(key, LANGUAGE)
  else
    message = key
  end
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

prompt('welcome')

name = ''

loop do
  name = Kernel.gets.chomp()
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt("#{MESSAGES[LANGUAGE]['hello']} #{name}!")

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

  prompt(:question)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
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

  prompt("#{MESSAGES[LANGUAGE]['the_result']} #{result}.")
  prompt('another_operation')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('thank_you')
