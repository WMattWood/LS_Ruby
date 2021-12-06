require "Date"

def prompt(message)
  puts "=> #{message}"
end

prompt "What is your age?"
age = gets.chomp.to_i

prompt "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

time_left = retirement_age - age
retirement_year = DateTime.now.year + time_left

prompt "It's #{DateTime.now.year}. You will retire in #{retirement_year}."
prompt "You have only #{time_left} years of work to go!"