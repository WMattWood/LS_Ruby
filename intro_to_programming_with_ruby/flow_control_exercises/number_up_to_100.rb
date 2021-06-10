puts "Please enter a number between 0 and 100... so that I may judge it."
number = gets.chomp.to_i
if number > 0 && number < 50
    puts "This number is between 0 and 50."
elsif number > 50 && number <= 100
    puts "This number is between 51 and 100."
elsif number > 100
    puts "Whoa whoa whoa... who said anything about numbers greater than 100?!"
end