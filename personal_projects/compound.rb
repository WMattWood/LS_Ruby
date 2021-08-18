puts "Welcome to the UltraFutures(TM) $$$|FutureMoney Money Maker Calculator|$$$"
puts "How much money are you starting your investment strategy with?"
my_starting_amount = gets.chomp.to_i
puts "How many years are you planning to calculate for?"
my_years = gets.chomp.to_i
puts "How much interest per year do you plan to accumulate? (Enter a number between 1-100)"
my_interest = gets.chomp.to_f * 0.01 + 1
puts "Interest rate of #{((my_interest - 1) * 100).floor}% per annum."
puts "How much money do you want to contribute per year?"
my_contributions = gets.chomp.to_i
puts "Thank you... calculating..."

def compound_interest(starting_amount, years, interest, contributions)
  running_total = starting_amount
  date = 2020
  puts "#{years} years interest calculation with: \n#{starting_amount} initial investment \n#{(interest * 100 - 100).floor(2)}% interest rate \n$#{contributions} annual contributions"
  years.times do
    puts date.to_s + ": " + running_total.to_s 
    running_total = (running_total * interest + contributions).floor(2)
    date += 1
  end
end

#compound_interest(45000, 10, 1.10, 0)
compound_interest(my_starting_amount, my_years, my_interest, my_contributions)
puts "Thank you for using the UltraFutures(TM) $$$|FutureMoney Money Maker Calculator|$$$"