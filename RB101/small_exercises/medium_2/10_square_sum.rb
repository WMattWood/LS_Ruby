def sum_square_difference(n)
  square_sum(n) - sum_square(n)
end

def square_sum(n)
  1.upto(n).reduce(:+) ** 2
end

def sum_square(n)
  squares = 1.upto(n).map { |x| x ** 2}
  squares.sum
end


p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.