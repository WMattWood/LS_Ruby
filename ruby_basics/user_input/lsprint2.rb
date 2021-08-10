def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

# answer variable did not need to be instantiated outside of the 
# validation loop in this case, as we did not call it outside of 
# the main validation loop.
# answer = nil

loop do
  puts ">> How many output lines do you want?  Enter a number >= 3  (Q to quit):"
  answer = gets.chomp
  break if answer.downcase == 'q'
  if valid_number?(answer)
    if answer.to_i >= 3
      answer.to_i.times {puts 'Launch School is the best!'}
    else
      puts ">> That's not enough lines."
    end
  else
    puts ">> That's not a valid entry!"
  end 
end

puts ">> See you! Bye bye."