def fibonacci(n)
  return 1 if n == 1
  fibonacci = [0, 1]
  output = 0
  (n-1).times do 
    output = fibonacci[0] + fibonacci[1]
    fibonacci[0] = fibonacci[1]
    fibonacci[1] = output
  end
  output
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(20) #== 6765
p fibonacci(100) #== 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501