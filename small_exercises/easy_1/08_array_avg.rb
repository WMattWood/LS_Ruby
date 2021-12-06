def average(num_array)
  num_array.sum / num_array.length
end
  
# idiomatic ruby method
def average(numbers)
  sum = numbers.reduce(:+)
  sum / numbers.count
end

def float_avg(numbers)
  numbers = numbers.map {|x| x.to_f}
  sum = numbers.reduce(:+) 
  sum / numbers.count.to_f
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts float_avg([1, 6]) 
puts float_avg([1, 5, 87, 45, 8, 8])
puts float_avg([9, 47, 23, 95, 16, 52])