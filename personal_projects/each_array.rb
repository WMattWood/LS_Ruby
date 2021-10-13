arr = ["Red", "Yellow", "Blue"]

arr.each { |element| puts "Each element using #each: #{element}" }
arr.each_index { |idx| puts "Each index using #each_index: #{idx}" }
