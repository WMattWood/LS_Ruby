def stringy(size, setting=1)
  numbers = []
  
  if setting == 1
    size.times do |index|
      number = index.even? ? 1 : 0
      numbers << number
    end
  elsif setting == 0
    size.times do |index|
      number = index.even? ? 0 : 1
      numbers << number
    end
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7, 0) == '0101010'