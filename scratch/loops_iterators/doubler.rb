# example of recursion - this code doubles a number recursively
# the recursion part happens because we are calling the method from inside of itself

def doubler(start)
  puts start
  if start < 10             # if the argument variable is less than 10...
    doubler(start * 2)      # ...we run the method again but with the argument doubled.
  end
end

puts doubler(2)