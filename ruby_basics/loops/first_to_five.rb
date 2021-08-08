number_a = 0
number_b = 0

# using next to exclude/skip the break output
#=begin
loop do 
  number_a += rand(2)
  number_b += rand(2)
  puts "number_a is at #{number_a}"
  puts "number_b is at #{number_b}"
  next if number_a < 5 && number_b < 5
  puts '5 was reached!'
  break
end
#=end

# using if/else to control flow instead of next
=begin
loop do 
  if number_a == 5 || number_b == 5
    puts '5 was reached!'
    break
  else
    number_a += rand(2)
    number_b += rand(2)
    puts "number_a is at #{number_a}"
    puts "number_b is at #{number_b}"
  end
end
=end