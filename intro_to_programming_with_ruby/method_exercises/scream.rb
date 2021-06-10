def scream(words)
    words = words + "!!!!"  # takes argument, modifies it
    puts words              # puts modified argument
end

scream("Yippeee")           # calls scream method on string "Yippeee", which modifies string, puts "Yippeee!!!"

x = "Yowza"                 # assigns a string to variable x
scream(x)                   # calls scream method on variable x, which modifies x, and puts "Yowza!!!"
puts x                      # because scream method did not MUTATE variable x, if we puts x, we still get the original value of "Yowza"