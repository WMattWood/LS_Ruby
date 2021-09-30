def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number(num)
  num.to_i.to_s == num
end

prompt('Welcome to the mortgage calculator!')
prompt('-----------------------------------')

loop do
  
  prompt('How much money are you looking to take out as a loan?')
  
  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()

    if loan_amount.empty?() || loan_amount.to_f <= 0
      prompt("Please enter a positive number.")
    # elsif valid_number(loan_amount) == false
    #   prompt("Please enter a valid number.")
    else
      break
    end
    
  end

  prompt('What is the Annual Percentage Rate (APR)?')
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
  
  apr = ''
  loop do
    apr = Kernel.gets().chomp()
    
    if apr.empty?() || apr.to_f <= 0
      prompt("Please enter a positive number.")
    # elsif valid_number(apr) == false
    #   prompt("Please enter a valid number.")
    else
      break
    end
    
  end

  prompt('How many years do you plan to take to pay back the loan?')
  prompt('(Please enter the loan duration in years.)')
  
  loan_years = ''
  loop do
    loan_years = Kernel.gets().chomp()
    
    if loan_years.empty?() || loan_years.to_f <= 0
      prompt("Please enter a positive number.")
    # elsif valid_number(loan_years) == false
    #   prompt("Please enter a valid number.")
    else
      break
    end
    
  end

  
  monthly_rate = apr.to_f / 12 * 0.01
  loan_months = loan_years.to_f * 12
  monthly_payment = loan_amount.to_f *
                    (monthly_rate /
                    (1 - (1 + monthly_rate)**(loan_months * -1)))
  total_payment = loan_months.to_i * monthly_payment.to_i
  total_interest = total_payment.to_i - loan_amount.to_i

  prompt("Your loan's duration will be: #{loan_months.to_i} months")
  prompt("Your monthly payments will be: $#{format('%.2f', monthly_payment)}")
  prompt("Your total amount paid will be: $#{total_payment}")
  prompt("The total interest paid will be: $#{total_interest}")
  prompt("---------------------------------------------------------")
  
  prompt("Would you like to do another calculation? (Y to continue)")
  again = Kernel.gets().chomp().downcase()

  break if again != 'y'
end
