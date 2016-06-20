# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration
#
# From above you need to calculate
#
# monthly interest rate
# loan duration in months
# monthly payment

require 'pry'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def float?(input)
  Float(input) rescue false
end

def integer?(input)
  integer(input) rescue false
end

def valid_number?(number)
  if number.to_f() <= 0
    false
  else
    float?(number) || integer?(number)
  end
end

loop do
  prompt("Welcome to Mortgage Calculator!")
  prompt("-------------------------------")

  prompt("What is the loan amount?")

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()
    if valid_number?(loan_amount)
      break
    else
      prompt("Please provide valid loand amount")
    end
  end

  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()
    if valid_number?(interest_rate)
      break
    else
      prompt("Provide a correct interest rate")
    end
  end

  prompt("What is the loan duration (in years)?")

  duration_years = ''
  loop do
    duration_years = Kernel.gets().chomp()
    if valid_number?(duration_years)
      break
    else
      prompt("Provide a valid duration in years")
    end
  end

  decimal_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = decimal_interest_rate / 12
  loan_duration_in_months = (duration_years.to_f() * 12).to_int()
  monthly_payment = ((loan_amount.to_f() * decimal_interest_rate)
                    + loan_amount.to_f()) / loan_duration_in_months

  monthly_payment_alternative =
    loan_amount.to_f() * (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**-loan_duration_in_months))

  prompt("Calculating ...")
  sleep(1)
  prompt("Monthly payment for the loand of quantity #{loan_amount}\n
    of interest rate #{interest_rate} is:
    \n--- €#{format('%.2f', monthly_payment)} ---")
  prompt("And some other calculation of your monthly payment is:
    \n--- €#{format('%.2f', monthly_payment_alternative)} ---")

  prompt("Do you want to calculate another loan? Choose (Y) to continue")
  another_loan = Kernel.gets().chomp()
  break unless another_loan.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
