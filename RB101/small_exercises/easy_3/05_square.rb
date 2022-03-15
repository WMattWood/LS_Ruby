def multiply(x, y)
  x * y
end

def square(x)
  multiply(x, x)
end

def power(x, n)
  base_array =[]
  (n).times do
    base_array << x
  end
  base_array.reduce(:*)
end

p square(-5)
p power(5, 2)
p power(5, 3)
