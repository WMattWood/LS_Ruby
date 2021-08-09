answer = nil

loop do
  puts ">> How many output lines do you want?  Enter a number greater than or equal to 3:"
  answer = gets.chomp.to_i
  break if answer >= 3
  puts ">> INVALID ENTRY."
end

answer.times {puts 'Launch School is the best!'}