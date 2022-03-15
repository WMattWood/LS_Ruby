def prompt(message)
  puts "=> #{message}"
end

def teddy(name="Teddy")
  prompt "Enter your friend's name!"
  answer = gets.chomp
  name = answer unless answer.empty?
  prompt "#{name} is #{rand(20..200)} years old!"
end

teddy