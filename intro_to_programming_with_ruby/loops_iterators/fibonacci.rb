# example of recursion - this code finds the number at a the nth 'position' in the classic fibonacci sequence
# we achieve our goal by starting with the position number, and then adding up the numbers below it as we count down to 1.

def fibonacci(number)       # the 'number' parameter is the position in the fibonacci sequence where we wish to find the value.
  if number < 2             # if argument tests as less than 2 - means we have reached the 'bottom' of the sequence...
    number                  # ...which means we can return 'number' and it will correspond to the value at the requested position
  else                                              # if we haven't reached 1 yet, that means we still need to add more numbers
    fibonacci(number - 1) + fibonacci(number - 2)   # so we add the two numbers below our current 'number' value.
  end
end

puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(5)
puts fibonacci(6)

# this is an elegant way of achieving a loop without using a loop explicitly!  
# although it does seem a little too 'clever'... could lead to confusion for future coders.