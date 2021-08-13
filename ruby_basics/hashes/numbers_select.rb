numbers = {
  high:   100,
  medium: 50,
  low:    10
}

# method
low_numbers = numbers.select {|key, value| value < 25}
puts low_numbers

# alternate method
low_numbers = numbers.select do |key, value| 
                value < 25  
              end
puts low_numbers