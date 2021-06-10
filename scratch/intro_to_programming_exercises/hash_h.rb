h = {a:1, b:2, c:3, d:4}

h[:b]
puts h

h[:e] = 5
puts h

h.select do |key, value| 
  if value < 3.5 
    h.delete(key) 
  end
end

puts h