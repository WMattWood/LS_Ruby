flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
puts "#{flintstones} <== Original Object"

# Add an item using #concat. Item to be concatenated must be formatted as an array.
flintstones_concat = flintstones.concat(["Dino"])
puts "#{flintstones_concat} <== concat return value"
puts "#{flintstones} <== Original Object"

# Add an item using #push.  Item to be added can be simply formatted as a string
flintstones_push = flintstones.push("Dino")
puts "#{flintstones_push} <== push return value"
puts "#{flintstones} <== Original Object"

puts "### As we can see demonstrated above, calling #concat or #push results in mutation of the original object ###" 
puts "### Even in the context of being used within a reassignment operation. ###"
