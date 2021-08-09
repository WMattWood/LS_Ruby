password = 'bork'

# validation loop
loop do
  puts ">> Please enter your password: "
  response = gets.chomp
  break if response == password
  puts ">> Invalid Password!"
end

# welcome message
puts ">> Welcome!"