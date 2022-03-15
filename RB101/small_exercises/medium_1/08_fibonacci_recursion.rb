def fibonacci(n)
  return 1 if n <= 2
  x = fibonacci(n-2) + fibonacci(n-1)
  return x
end

# Input: an integer 'n' which decides how many iterations of fibonacci to go
# Output: the number located at 'nth' stage of fibonacci
  # Rules: 
  # - we are operating on the assumption of starting at 1 for the fibonacci sequence.
  # - the solution must use recursion... which means
    # - the method must call itself at least once
    # - the method must have a stopping condition (to prevent infinite loops)
    # - the method must use it's own return value on each successive iteration
# test examples:
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(6) == 8
p fibonacci(7) == 13
p fibonacci(8) == 21
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(40) #== 6765

#Algorithm:
  # - 