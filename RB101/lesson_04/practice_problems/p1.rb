flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# .each_with_index method
output = {}

flintstones.each_with_index do |name, index|
  output[name] = index
end

p output

# manual looping
output2 = {}
counter = 0

until counter == flintstones.length
  output2[flintstones[counter]] = counter
  counter += 1
end

p output2
