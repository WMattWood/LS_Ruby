# countdown3.rb
# demonstration of a for loop using a 'range'

puts "Please type a number"

x = gets.chomp.to_i

for i in 1..x do
  puts i
end

puts "Done!"