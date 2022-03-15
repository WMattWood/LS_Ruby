def multiply(x, y)
  x * y
end

# when provided two integers as the left and right operands, 
# the * operator returns the product of the two integers
p multiply(5, 4)

# when provided an array as the left hand operand, the * operator
# creates and concatenates 'y' copies of the left hand array together
p multiply([5, 5], 4)