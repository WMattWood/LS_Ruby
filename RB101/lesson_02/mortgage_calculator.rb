def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt('Welcome to the mortgage calculator!')
prompt('-----------------------------------')

loop do
  prompt('How much money are you looking to take out as a loan?')
  loan_amount = Kernel.gets().chomp().to_f
  prompt('What is the Annual Percentage Rate (APR)?')
  apr = Kernel.gets().chomp().to_f
  prompt('How many years do you plan to take to pay back the loan?')
  prompt('(Please enter the loan duration in years.')
  loan_years = Kernel.gets().chomp().to_f

  # prompt(loan_amount)
  # prompt(loan_duration)
  # prompt("% #{apr}")

  monthly_rate = apr / 12 * 0.01
  loan_months = loan_years * 12
  monthly_payment = loan_amount *
                    (monthly_rate /
                    (1 - (1 + monthly_rate)**(loan_months * -1)))
  total_payment = loan_months.to_i * monthly_payment.to_i
  total_interest = total_payment.to_i - loan_amount.to_i                  

  prompt("Your loan's duration will be #{loan_months.to_i} months.")
  prompt("Your monthly payments will be: $#{format('%.2f', monthly_payment)}.")
  prompt("Your total amount paid will be: $#{total_payment}.")
  prompt("Your amount of interest paid will be: $#{total_interest}.")
  prompt("---------------------------------------------------------"
  prompt("Would you like to do another calculation? (Y to continue)")
  again = Kernel.gets().chomp().downcase()

  break if again != 'y'
end
