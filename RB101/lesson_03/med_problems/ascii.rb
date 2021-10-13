line = "The Flintstones Rock!"
10.times do 
  puts line
  line = line.prepend(" ")
end


# Launchschool way...

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }