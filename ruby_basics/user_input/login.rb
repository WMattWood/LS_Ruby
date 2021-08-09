username = 'admin'
password = '12345'

loop do
  puts ">> Please enter username: "
  username_try = gets.chomp
  puts ">> Please enter password: "
  password_try = gets.chomp
  break if username_try == username && password_try == password
  puts ">> Authorization failed!"
end

puts "Welcome!"