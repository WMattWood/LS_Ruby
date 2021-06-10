loop do
  puts "Do you want to do that again? (Yes to continue)"
  answer = gets.chomp
  if answer != 'Yes'
    break
  end
end