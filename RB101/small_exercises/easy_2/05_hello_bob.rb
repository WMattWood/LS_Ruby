def prompt(msg)
  puts "=> #{msg}"
end

prompt "What is your name?" 
name = gets.chomp

if name[-1] == '!'
  puts "HELLO #{name.chop.upcase}, WHY ARE WE YELLING?"
elsif name.upcase == name
  puts "HELLO #{name}, WHY ARE WE YELLING?"
else
  puts "Hello #{name}."
end