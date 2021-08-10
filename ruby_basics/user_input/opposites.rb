loop do
  
  operation_complete = false
  
  puts ">> Please enter a positive or negative integer: "
  answer1 = gets.chomp
  
  puts ">> Please enter a positive or negative integer: "
  answer2 = gets.chomp
  
  if answer1 == '0' || answer2 == '0'
    puts ">> Invalid input.  Only non-zero integers are allowed."
  end
  
  if answer1.to_i * answer2.to_i < 0
    result = (answer1.to_i + answer2.to_i)
    puts ">> #{answer1} + #{answer2} = #{result}"
    operation_complete = true
  else
    puts "Sorry.  One integer must be positive, one must be negative."
  end 
  
  break if operation_complete == true
  
end
