def add(first, second)
  first + second
end

def multiply(first, second)
  first * second
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
  