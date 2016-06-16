# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration
#
# From above you need to calculate
#
# monthly interest rate
# loan duration in months

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt("Do you want to calculate another loan? Choose (Y) to continue")
  another_loan = Kernel.gets().chomp()
  break unless another_loan.downcase().start_with?('y')
end
