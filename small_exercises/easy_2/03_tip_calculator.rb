def prompt(message)
  puts "=> #{message}"
end

prompt "What is the bill?"
bill = gets.chomp.to_f

prompt "What is the tip percentage?"
percentage = (gets.chomp.to_f / 100)

tip = bill * percentage.round(2)
total = (bill + tip)

prompt "The tip is $#{format('%.2f', tip)}"
prompt "The total is $#{format('%.2f', total)} with a #{format('%.0f', (percentage * 100))}% tip."