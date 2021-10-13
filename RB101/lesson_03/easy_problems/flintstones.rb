flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones

# A simpler method for creating an array
flintstones_simple = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones_simple

# Add someone to the array!
flintstones_simple << "Dino"
p flintstones_simple

# Add an item using #concat. Item to be concatenated must be formatted as an array.
flintstones_concat = flintstones.concat(["Dino"])
p flintstones_concat

# Add an item using #push.  Item to be added can be simply formatted as a string
flintstones_push = flintstones.push("Dino")
p flintstones_push

# Add multiple items to the array. #concat cannot be used.  
# However #push can be used because #push returns the array for chaining
flintstones.push("Dino").push("Hoppy")
p flintstones


# IMPORTANT TO NOTE HERE - #push, #concat both MUTATE THE ARRAY.