flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# using .select!
flintstones.select!{|element| element == "Barney"}

# faster method using .assoc
flintstones.assoc("Barney")

puts flintstones