def prompt(message)
  puts "=> #{message}"
end

def meters_to_ft(meters)
  meters * 3.28084
end

def square(x, y)
  x * y
end

prompt "Enter the length of the room in meters:"
length = gets.chomp.to_f
prompt "Enter the width of the room in meters:"
width = gets.chomp.to_f

meters_squared = length * width
foot_squared = (meters_to_ft(length) * meters_to_ft(width)).round(2)

prompt "The area of the room is #{meters_squared} square meters (#{foot_squared} square feet)."