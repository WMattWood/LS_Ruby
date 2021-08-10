def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil

loop do
  puts ">> Please enter the numerator"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid input. Only integers are allowed."
end

loop do
  puts ">> Please enter the denominator"
  denominator = gets.chomp
  break if valid_number?(denominator)
  puts "Invalid input. Only integers are allowed."
end

result = numerator \ denominator

puts "#{numerator} \ #{denominator} = #{result}"