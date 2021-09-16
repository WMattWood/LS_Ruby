Kernel.puts('Welcome to the mortgage calculator!')

loop do
  Kernel.puts('How much money are you looking to take out as a loan?')
  loan_amount = Kernel.gets().chomp().to_f
  Kernel.puts('What is the Annual Percentage Rate (APR)?')
  apr = Kernel.gets().chomp().to_f
  Kernel.puts('How many years do you plan to take to pay back the loan?')
  loan_duration_in_years = Kernel.gets().chomp().to_f

  # Kernel.puts(loan_amount)
  # Kernel.puts(loan_duration)
  # Kernel.puts("% #{apr}")

  monthly_interest_rate = apr / 12 * 0.01
  loan_period_months = loan_duration_in_years * 12
  monthly_payment = loan_amount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(loan_period_months * -1)))

  Kernel.puts("You will have a monthly interest rate of
  #{(monthly_interest_rate * 100).to_i}%.")
  Kernel.puts("Your total loan duration in months will be
  #{loan_period_months.to_i} months.")
  Kernel.puts("Your monthly payment will be $#{monthly_payment.to_i}.")

  total_payment = loan_period_months.to_i * monthly_payment.to_i
  total_interest = total_payment.to_i - loan_amount.to_i
  
  final_msg = <<-MSG
After #{loan_duration_in_years.to_i} years you will pay back a total of
$#{total_payment}. Of this amount, $#{total_interest} will be interest paid on
the principle amount.
  MSG
  Kernel.puts(final_msg)
  

  Kernel.puts("Would you like to do another calculation? (Y to continue)")
  again = Kernel.gets().chomp().downcase()

  break if again != 'y'
end
